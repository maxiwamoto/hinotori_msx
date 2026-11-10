; Enhanced Edition: MSX2+ (V9958) continuous horizontal scrolling - core hooks in Bank 03
; (included at the Bank 03 tail; runs with the default core banks 01/02/03 mapped).
;
; Architecture:
;   - HS_BOOT_INIT copies the resident page-3 RAM routines (HS_RESIDENT_BASE) and, on MSX2+,
;     the page-0 RAM module (HS_MODULE_BASE) from Bank 07, and installs JP HS_ISR_TRAMPOLINE
;     at RAM 0038h.
;   - HS_CALL_MODULE switches CPU page 0 to the RAM slot using precomputed slot-register
;     values, calls the module and restores the Main-ROM. Interrupts stay enabled: an IRQ
;     taken while page 0 is RAM is redirected through the resident trampoline to the BIOS.
;   - Camera, column streaming and object shifting run in the module
;     (asm/enhanced/hscroll_module.asm); the VDP coordinate hooks are in the resident image
;     (asm/enhanced/hscroll_resident.asm). Route switching and terrain cleanup, which call
;     game routines that issue hooked VDP commands, run here after the module returns.

; Boot-time setup called from CARTRIDGE_BOOT_INIT after the work-RAM clear. Installs the
; resident hooks unconditionally (MSX2 safe: they pass through while HS_CAM_LO = 0); on MSX2+
; with page-0 RAM, mirrors the Main-ROM header 0000h-003Fh into the RAM page (game routines
; read BIOS_VDP_DR/BIOS_VDP_DW while the module runs), installs the module and sets HSF_READY.
HS_BOOT_INIT:
	CALL	HS_MAP_IMAGE_BANK
	CALL	HS_BANK07_BOOT_INIT
	JR	HS_RESTORE_IMAGE_BANK

; Run the cold-boot language and MSX2+ H. SCROLL menu in Bank 07
HS_RUN_BOOT_MENU:
	CALL	HS_MAP_IMAGE_BANK
	EI
	CALL	HS_BANK07_BOOT_MENU

; Restore Bank 01 at 6000h after reading a Bank 07 image
HS_RESTORE_IMAGE_BANK:
	LD	A,01h
	JR	HS_SET_IMAGE_BANK

; Disable interrupts and map Bank 07 (resident and module images, sprite sets) at 6000h
HS_MAP_IMAGE_BANK:
	DI
	LD	A,07h

HS_SET_IMAGE_BANK:
	LD	(MAPPER_PAGE1),A
	LD	(MAPPER_BANK_PAGE1),A
	RET

; Call page-0 RAM module routine HL (returns the module's AF and BC)
HS_CALL_MODULE:
	PUSH	HL
	JP	HS_RESIDENT_CALL_MODULE	; asm/enhanced/hscroll_resident.asm

; RUN_GAMEPLAY_FRAME vertical-scroll tick replacement: run the original tick wrapped by the
; module's camera, column streamer and object shift, then apply deferred terrain retirement
; and route switching.
HS_TICK:
	LD	A,(HS_FLAGS)
	BIT	HSF_ACTIVE_BIT,A
	JP	Z,TICK_TIME_STOP_TIMER_AND_SCROLL_MAP	; asm/banks/bank00.asm
	LD	HL,HS_MODULE_PRE_TICK
	CALL	HS_CALL_MODULE
	CALL	TICK_TIME_STOP_TIMER_AND_SCROLL_MAP
	LD	HL,HS_MODULE_FRAME
	CALL	HS_CALL_MODULE
	PUSH	AF
	LD	A,C
	LD	(HS_LAST_DELTA),A
	LD	A,B
	OR	A
	CALL	NZ,HS_RETIRE_TERRAIN_MASK
	POP	AF
	CP	FFh
	RET	Z

; Gao entered route A: switch the route-dependent spawn streams, terrain stream and (when it
; differs) the route sprite set. Enemies of the previous route are retired when the
; sprite set changes. Pending waves/mailbox requests are cleared on every route change
; so an outgoing enemy cannot spawn later with missing patterns (base 00h = Gao).
HS_ENTER_ROUTE_A:
	LD	(ROUTE_INDEX),A
	LD	A,01h
	LD	(HORIZ_WRAP_PENDING_FLAG),A
	LD	A,(SPRITE_SET_SELECTOR)
	PUSH	AF
	CALL	COMPUTE_SPRITE_SET_SELECTOR
	LD	(CURRENT_ROUTE_ID),A
	LD	(SPRITE_SET_SELECTOR),A
	LD	HL,LEVEL_ROUTE_STRIP_DEF_PTR_TABLE
	CALL	READ_WORD_FROM_HL_TABLE_A
	LD	(LEVEL_ROUTE_DEF_PTR),HL
	CALL	INIT_ROUTE_TERRAIN_STREAM_CURSOR
	LD	HL,HS_MODULE_RESET_ROUTE_SPAWNS
	CALL	HS_CALL_MODULE
	POP	AF
	CALL	HS_SPRITE_SET_LIST_PTR
	PUSH	HL
	LD	A,(SPRITE_SET_SELECTOR)
	CALL	HS_SPRITE_SET_LIST_PTR
	POP	DE
	OR	A
	SBC	HL,DE
	RET	Z
	LD	HL,GAMEPLAY_OBJECT_TABLE
	LD	B,0Ah
	CALL	HS_DEACTIVATE_ALL
	LD	HL,AUXILIARY_OBJECT_TABLE
	LD	B,08h
	CALL	HS_DEACTIVATE_ALL
	CALL	LOAD_ROUTE_SPRITE_PATTERNS
	JP	UPLOAD_EQUIPPED_WEAPON_SPRITE_PATTERN	; asm/banks/bank00.asm

; Deactivate each of B active 80h-byte object records starting at HL
HS_DEACTIVATE_ALL:
	LD	A,(HL)
	OR	A
	JR	Z,.next
	PUSH	BC
	PUSH	HL
	CALL	DEACTIVATE_OBJECT_HL_AND_SPRITES
	POP	HL
	POP	BC

.next:
	LD	DE,OBJ_REC_SIZE
	ADD	HL,DE
	DJNZ	HS_DEACTIVATE_ALL
	RET

; Retire the terrain slots flagged in A (bit n = slot n at TERRAIN_OBJECT_TABLE + n * 80h),
; restoring any saved 16x16 background from VRAM Page 1 cache back onto Page 0 first.
HS_RETIRE_TERRAIN_MASK:
	LD	HL,TERRAIN_OBJECT_TABLE
	LD	B,08h

.slot:
	RRCA
	JR	NC,.next
	PUSH	AF
	PUSH	BC
	PUSH	HL
	PUSH	HL
	POP	IX
	LD	A,(IX+OBJ_PART0_FLAGS)
	CP	07h
	JR	Z,.defeated
	CP	47h
	JR	NZ,.check_lmmm
	LD	(IX+OBJ_PART0_FLAGS),C7h
	LD	(IX+OBJ_PART1_FLAGS),00h
	LD	(IX+OBJ_PART2_FLAGS),00h
	LD	(IX+OBJ_PART3_FLAGS),00h
	CALL	EXECUTE_PENDING_TERRAIN_VRAM_CMDS
	LD	A,(IX+OBJ_PHASE)
	CP	02h
	JR	NC,.defeated
	JR	.clean

.check_lmmm:
	CP	04h
	JR	NZ,.clean
	BIT	07h,(IX+OBJ_PART_ACTIVE_MASK)
	JR	NZ,.clean
	LD	HL,HS_MODULE_ERASE_PART0
	CALL	HS_CALL_MODULE
	JR	.clean

.defeated:
	CALL	HS_RETIRE_DEFEATED_TERRAIN
	JR	.pop_next

.clean:
	PUSH	IX
	POP	HL
	CALL	CLEAR_TERRAIN_SLOT_AND_CLEAN_PARTS

.pop_next:
	POP	HL
	POP	BC
	POP	AF

.next:
	LD	DE,OBJ_REC_SIZE
	ADD	HL,DE
	DJNZ	.slot
	RET

; A = SPRITE_SET_SELECTOR: HL = its Bank 07 sprite-set resource list pointer
HS_SPRITE_SET_LIST_PTR:
	LD	HL,HS_MODULE_SPRITE_SET_LIST_PTR
	JP	HS_CALL_MODULE

; RUN_GAMEPLAY_FRAME replacement for WRITE_VERTICAL_SCROLL_REGISTER: also latch the V9958
; horizontal scroll registers computed during the previous gameplay frame.
HS_WRITE_SCROLL_REGS:
	CALL	WRITE_VERTICAL_SCROLL_REGISTER

; Write V9958 R#25 (mask), R#26/R#27 (offset) from HS_FLAGS / HS_CAM_LO (MSX2+ only)
HS_WRITE_HSCROLL_REGS:
	LD	A,(HS_FLAGS)
	RRCA
	RET	NC
	AND	01h
	LD	B,00h
	JR	Z,.mask
	LD	B,V9958_R25_MSK

.mask:
	LD	A,B
	LD	(BIOS_RG25SAV),A
	LD	C,V9958_R25_CTRL
	CALL	WRITE_VDP_REG_C_VALUE_B_FAST
	LD	A,(HS_CAM_LO)
	NEG
	AND	07h
	LD	B,A
	LD	C,V9958_R27_HOFS_FINE
	CALL	WRITE_VDP_REG_C_VALUE_B_FAST
	LD	A,(HS_CAM_LO)
	ADD	A,07h
	RRA
	RRCA
	RRCA
	AND	1Fh
	LD	B,A
	LD	C,V9958_R26_HOFS_COARSE
	JP	WRITE_VDP_REG_C_VALUE_B_FAST	; asm/banks/bank00.asm

; Deactivate horizontal camera before INITIALIZE_LEVEL_MAP / INITIALIZE_STAGE_TERRAIN_OBJECTS
HS_PRE_STAGE_INIT:
	CALL	HS_DEACTIVATE_CAMERA
	JP	SET_DEFAULT_UPWARD_SCROLL_DELTA	; asm/banks/bank00.asm

; FINALIZE_ROUTE_MAP_OBJECTS_AND_DISPLAY replacement for WRITE_VERTICAL_SCROLL_REGISTER:
; reset the camera to the loaded route origin and enable it on normal routes outside attract
; mode.
HS_STAGE_INIT:
	CALL	WRITE_VERTICAL_SCROLL_REGISTER
	CALL	HS_DEACTIVATE_CAMERA
	BIT	HSF_READY_BIT,(HL)
	RET	Z
	LD	A,(MAIN_CONTROL_FLAGS)
	RRCA
	JR	C,HS_WRITE_HSCROLL_REGS
	LD	A,(SPRITE_SET_SELECTOR)
	CP	HS_FIRST_BOSS_SELECTOR
	JR	NC,HS_WRITE_HSCROLL_REGS
	LD	HL,HS_MODULE_STAGE_INIT
	CALL	HS_CALL_MODULE
	LD	HL,HS_FLAGS
	SET	HSF_ACTIVE_BIT,(HL)
	JR	HS_WRITE_HSCROLL_REGS

; Clear HSF_ACTIVE_BIT in HS_FLAGS (leaving HL = HS_FLAGS) and zero HS_CAM_LO
HS_DEACTIVATE_CAMERA:
	LD	HL,HS_FLAGS
	RES	HSF_ACTIVE_BIT,(HL)
	XOR	A
	LD	(HS_CAM_LO),A
	RET

; RUN_MAIN_STATE_FRAME hook: leaving the gameplay/popup states (title, stage intro, game over,
; retry, ending) turns the horizontal camera off and resets R#25-R#27.
HS_STATE_GUARD:
	LD	A,(HS_FLAGS)
	BIT	HSF_ACTIVE_BIT,A
	RET	Z
	LD	A,(MAIN_STATE)
	LD	HL,HS_KEEP_STATE_TABLE
	LD	BC,0008h
	CPIR
	RET	Z
	CALL	HS_DEACTIVATE_CAMERA
	JR	HS_WRITE_HSCROLL_REGS

; MainStates that keep the scrolled playfield on screen
HS_KEEP_STATE_TABLE:
	DB	MAIN_STATE_GAMEPLAY,MAIN_STATE_PLAYER_DEATH,MAIN_STATE_PAUSE_PASSWORD,MAIN_STATE_POWER_UP
	DB	MAIN_STATE_STAGE_MAP,MAIN_STATE_COMPASS_MAP,MAIN_STATE_ITEM_INFO,MAIN_STATE_BIRD_MESSAGE

; RUN_GAMEPLAY_FRAME replacement for CHECK_HORIZONTAL_ROUTE_BOUNDARY: skip legacy screen-edge
; route reload when MSX2+ horizontal scrolling is active, while keeping post-wrap timers intact.
HS_CHECK_ROUTE_BOUNDARY:
	LD	A,(HS_FLAGS)
	BIT	HSF_ACTIVE_BIT,A
	JP	Z,CHECK_HORIZONTAL_ROUTE_BOUNDARY	; asm/banks/bank01.asm
	XOR	A
	LD	(SCROLL_DIRECTION_MODE),A
	LD	A,(HORIZ_WRAP_PENDING_FLAG)
	OR	A
	CALL	NZ,RUN_POST_HORIZ_WRAP_HOOK_AND_CLEAR
	LD	A,(GAO_MODE)
	CP	02h
	RET	Z
	LD	A,(GAO_KNOCKBACK_DIR)
	OR	A
	RET	NZ
	LD	HL,POST_WRAP_GRACE_TIMER
	LD	A,(HL)
	OR	A
	RET	Z
	INC	(HL)
	RET

; RUN_GAMEPLAY_FRAME replacement for POLL_TERRAIN_SPAWNS_FOR_FRAME: when MSX2+ horizontal
; scrolling is active, scan the Bank 09 terrain streams of both visible routes whenever a new
; vertical row is entered OR the camera scrolled horizontally.
HS_POLL_TERRAIN_SPAWNS:
	LD	A,(HS_FLAGS)
	BIT	HSF_ACTIVE_BIT,A
	JP	Z,POLL_TERRAIN_SPAWNS_FOR_FRAME	; asm/banks/bank01.asm
	LD	A,(TERRAIN_PARSE_WORK_WORD)
	OR	A
	JP	NZ,POLL_TERRAIN_SPAWNS_FOR_FRAME	; asm/banks/bank01.asm
	LD	A,(SCROLL_DIRECTION_MODE)
	OR	A
	JR	Z,.check_hdelta
	CALL	PLAY_CURRENT_LEVEL_BGM
	JR	.scan_routes

.check_hdelta:
	LD	A,(HS_LAST_DELTA)
	OR	A
	RET	Z

.scan_routes:
	XOR	A
	LD	(HS_SPAWN_PASS),A
	LD	A,(HS_CAM_ROUTE)
	CALL	HS_SCAN_ROUTE_TERRAIN_AT_LRR
	LD	A,(HS_CAM_LO)
	OR	A
	JR	Z,.restore
	LD	A,01h
	LD	(HS_SPAWN_PASS),A
	LD	A,(HS_CAM_ROUTE)
	INC	A
	CP	03h
	JR	C,.pass1
	XOR	A

.pass1:
	CALL	HS_SCAN_ROUTE_TERRAIN_AT_LRR

.restore:
	LD	A,(CURRENT_ROUTE_ID)
	LD	(SPRITE_SET_SELECTOR),A
	JP	INIT_ROUTE_TERRAIN_STREAM_CURSOR	; asm/banks/bank01.asm

; Scan the Bank 09 terrain stream of route A (0..2)
HS_SCAN_ROUTE_TERRAIN_AT_LRR:
	LD	C,A
	LD	A,(LEVEL_NUMBER)
	DEC	A
	LD	B,A
	ADD	A,A
	ADD	A,B
	ADD	A,C
	LD	(SPRITE_SET_SELECTOR),A
	CALL	INIT_ROUTE_TERRAIN_STREAM_CURSOR
	XOR	A
	LD	(TERRAIN_STREAM_ENABLE),A
	LD	BC,(LEVEL_ROUTE_ROW)
	LD	HL,(TERRAIN_STREAM_PTR)
	JP	SCAN_TERRAIN_STREAM_RECORDS_AT_BC	; asm/banks/bank01.asm

; PREPOPULATE_SCREEN_TERRAIN_ROWS hook: reset TERRAIN_STREAM_ENABLE and load HL = (TERRAIN_STREAM_PTR).
HS_PREPOP_SCAN_INIT:
	XOR	A
	LD	(TERRAIN_STREAM_ENABLE),A
	LD	HL,(TERRAIN_STREAM_PTR)
	RET

; SCAN_TERRAIN_STREAM_RECORDS_AT_BC hook: evaluate record (DE, TERRAIN_SCROLL_PHASE) at cursor HL.
; Returns Z to stop scanning, NZ to advance TERRAIN_STREAM_ENABLE and continue.
HS_CHECK_AND_SPAWN_TERRAIN_REC:
	BIT	00h,D
	JR	NZ,.stop
	LD	A,(HS_FLAGS)
	BIT	HSF_ACTIVE_BIT,A
	JR	NZ,.active
	CALL	COMPARE_TERRAIN_ROW_DE_WITH_BC
	JR	C,.cont
	JR	NZ,.stop
	LD	E,FFh
	JR	.check_type

.active:
	LD	A,(LEVEL_ROUTE_ROW)
	SUB	E
	JR	NC,.dist_ok
	ADD	A,HS_ROUTE_ROWS % 0100h

.dist_ok:
	LD	E,A

.check_type:
	LD	A,D
	AND	FCh
	JR	Z,.cont
	PUSH	BC
	PUSH	HL
	LD	C,E
	LD	A,(SPRITE_SET_SELECTOR)
	RRCA
	RRCA
	AND	C0h
	LD	B,A
	LD	A,(TERRAIN_STREAM_ENABLE)
	INC	A
	AND	3Fh
	OR	B
	LD	B,A
	LD	A,C
	INC	A
	JR	Z,.do_spawn
	DEC	A
	CP	1Ah
	JR	NC,.offscreen
	CALL	HS_IS_TERRAIN_TAG_B_ACTIVE_OR_DEFEATED
	JR	Z,.done_rec

.do_spawn:
	CALL	HS_SPAWN_TERRAIN_WITH_DIST_C
	JR	.done_rec

.offscreen:
	CP	1Eh
	JR	C,.done_rec
	LD	HL,HS_DEFEATED_TAGS
	LD	A,B
	LD	B,08h

.prune:
	CP	(HL)
	JR	NZ,.prune_next
	LD	(HL),00h

.prune_next:
	INC	HL
	DJNZ	.prune

.done_rec:
	POP	HL
	POP	BC

.cont:
	OR	01h
	RET

.stop:
	XOR	A
	RET

; Return Z if terrain record tag B is currently active in TERRAIN_OBJECT_TABLE or listed in
; HS_DEFEATED_TAGS; return NZ otherwise. Preserves BC and DE.
HS_IS_TERRAIN_TAG_B_ACTIVE_OR_DEFEATED:
	LD	HL,HS_MODULE_CHECK_TERRAIN_TAG
	JP	HS_CALL_MODULE

; Spawn terrain record (DE, TERRAIN_SCROLL_PHASE), tag (IX+OBJ_Y_FRAC) = B, and when C != FFh
; (active MSX2+ camera) adjust (IX+OBJ_Y) for row distance C and convert (IX+OBJ_X) to screen X.
HS_SPAWN_TERRAIN_WITH_DIST_C:
	PUSH	BC
	LD	IX,0000h
	CALL	DECODE_AND_SPAWN_TERRAIN_RECORD
	POP	BC
	PUSH	IX
	POP	HL
	LD	A,H
	OR	A
	RET	Z
	LD	(IX+OBJ_Y_FRAC),B
	LD	A,C
	INC	A
	RET	Z
	ADD	A,A
	ADD	A,A
	ADD	A,A
	LD	E,A
	LD	A,(VERTICAL_SCROLL_OFFSET)
	AND	07h
	LD	D,A
	LD	A,E
	SUB	D
	LD	HL,VERTICAL_SCROLL_DELTA
	SUB	(HL)
	ADD	A,(IX+OBJ_Y)
	LD	(IX+OBJ_Y),A
	LD	HL,HS_CAM_LO
	LD	A,(IX+OBJ_X)
	SUB	(HL)
	LD	B,A
	LD	A,00h
	RLA
	LD	HL,HS_SPAWN_PASS
	CP	(HL)
	PUSH	IX
	POP	HL
	JP	NZ,CLEAR_TERRAIN_SLOT_AND_CLEAN_PARTS	; asm/banks/bank01.asm
	LD	A,(IX+OBJ_TYPE)
	SUB	0Ch
	CP	04h
	LD	A,B
	JR	NC,.check_wide
	SUB	0Ch
	CP	D9h
	JP	NC,CLEAR_TERRAIN_SLOT_AND_CLEAN_PARTS	; asm/banks/bank01.asm
	JR	.store_x

.check_wide:
	SUB	0Ch
	CP	C9h
	JP	NC,CLEAR_TERRAIN_SLOT_AND_CLEAN_PARTS	; asm/banks/bank01.asm

.store_x:
	LD	(IX+OBJ_X),B
	RET

; SHRINE_STATUE_STATE_HANDLER_02 hook: record the destroyed/consumed terrain object's stream
; tag (IX+OBJ_Y_FRAC) in HS_DEFEATED_TAGS before clearing its slot so it stays destroyed while
; its row remains on screen.
HS_RETIRE_DEFEATED_TERRAIN:
	LD	A,(IX+OBJ_Y_FRAC)
	OR	A
	JR	Z,.clear
	LD	C,A
	LD	HL,HS_DEFEATED_IDX
	INC	(HL)
	LD	A,(HL)
	AND	07h
	OR	HS_DEFEATED_TAGS % 0100h
	LD	L,A
	LD	(HL),C
	PUSH	IX
	POP	HL

.clear:
	JP	CLEAR_TERRAIN_SLOT_AND_CLEAN_PARTS	; asm/banks/bank01.asm

; SPAWN_GROUP_HANDLER_00 replacement for INIT_SPAWN_GROUP_00_QUEUE_ENTRY: unpack the route-local
; X coordinate and convert it to screen X.
HS_INIT_SPAWN_GROUP_00_ENTRY:
	CALL	INIT_SPAWN_GROUP_00_QUEUE_ENTRY
	JR	HS_CONVERT_SPAWNQ_X

; INIT_SPAWN_QUEUE_AND_UNPACK_X_PARAM hook: unpack X=(hi+08h) and convert to screen X
HS_UNPACK_SPAWN_QUEUE_X:
	CALL	COPY_SPAWN_GROUP_DESC_TO_IX
	LD	A,(IX+OBJ_ANIM_TIMER)
	LD	B,A
	AND	F0h
	ADD	A,08h
	LD	(IX+OBJ_X),A
	LD	A,B
	AND	0Fh
	LD	(IX+OBJ_ANIM_TIMER),A

; Convert mobile spawn-queue entry IX from route-local X on ROUTE_INDEX to screen X, or cancel
; the entry ((IX+OBJ_TYPE) = 00h) if it falls outside the visible 08h..F7h screen bounds.
HS_CONVERT_SPAWNQ_X:
	LD	A,(HS_FLAGS)
	BIT	HSF_ACTIVE_BIT,A
	RET	Z
	LD	A,(HS_CAM_LO)
	LD	C,A
	LD	A,(IX+OBJ_X)
	SUB	C
	LD	B,A
	LD	A,(ROUTE_INDEX)
	LD	HL,HS_CAM_ROUTE
	JR	C,.wrapped
	CP	(HL)
	JR	NZ,.cancel
	JR	.check_bounds

.wrapped:
	CP	(HL)
	JR	Z,.cancel

.check_bounds:
	LD	A,B
	CP	08h
	JR	C,.cancel
	CP	F8h
	JR	NC,.cancel
	LD	(IX+OBJ_X),B
	RET

.cancel:
	LD	(IX+OBJ_TYPE),00h
	RET

; UPDATE_STAGE_MAP_BLINKING_MARKER helper: return Gao's route-local X ((GAO_POS_X + HS_CAM_LO)
; & FFh) in A so the F4 Stage Map marker tracks Gao's column within ROUTE_INDEX.
HS_STAGE_MAP_GAO_X:
	LD	A,(HS_CAM_LO)
	LD	C,A
	LD	A,(GAO_POS_X)
	ADD	A,C
	RET

; FILL_TILE_BUFFER_RECT_AT_DE helper: fill B columns at HL with A, wrapping horizontally
; within the same 32-byte row so column 1Fh wraps to column 00h instead of overflowing into E400h.
HS_FILL_TILE_ROW_B:
	LD	(HL),A
	PUSH	AF
	CALL	HS_ADVANCE_TILE_COL_HL
	POP	AF
	DJNZ	HS_FILL_TILE_ROW_B
	RET

; Advance HL by 1 column within its 32-byte row (wrapping bits 4..0 from 1Fh to 00h)
HS_ADVANCE_TILE_COL_HL:
	INC	L
	LD	A,L
	AND	1Fh
	RET	NZ
	LD	A,L
	SUB	20h
	LD	L,A
	RET

; A = screen X of the page-aligned 8-pixel tile containing screen X D. Preserves all other
; registers.
HS_ALIGN_SCREEN_X_D:
	PUSH	HL
	LD	HL,HS_CAM_LO
	LD	A,(HL)
	ADD	A,D
	AND	F8h
	SUB	(HL)
	POP	HL
	RET

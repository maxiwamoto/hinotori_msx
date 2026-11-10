; Enhanced Edition: page-0 RAM module for MSX2+ continuous horizontal scrolling.
; Assembled at HS_MODULE_BASE (0040h) inside the Bank 07 image area, copied to RAM page 0 by
; HS_BOOT_INIT and entered through HS_RESIDENT_CALL_MODULE (page 0 = RAM, interrupts enabled;
; Bank 00 stays visible at 4000h-5FFFh and Bank 03 at A000h-BFFFh). Module code never calls the
; hooked VDP primitives (only the *_RAW entries), so module calls are never nested; game
; routines that may issue hooked VDP commands (terrain cleanup, sprite reloads) are deferred to
; Bank 03 (asm/enhanced/hscroll_core.asm).
;
; World model: the three 32-column routes of a stage form a 96-column (768 px) horizontal
; cylinder. VRAM page 0 and LEVEL_TILE_BUFFER are both 32 columns wide, so world column W
; always lives in page/buffer column W AND 1Fh. HS_WIN_L is the world column held by the
; leftmost loaded page column. Camera movement stops at each 8-pixel boundary; the next
; gameplay tick publishes that alignment in R#26/R#27 before recycling the column under
; the left-edge R#25 MSK mask, then resumes movement in the travel direction.

; Stage/route load: the initial screen holds route-local columns 0..31 of ROUTE_INDEX
HS_MODULE_STAGE_INIT:
	XOR	A
	LD	(HS_DELTA),A
	LD	A,(ROUTE_INDEX)
	LD	(HS_CAM_ROUTE),A
	RRCA
	RRCA
	RRCA
	LD	(HS_WIN_L),A
	LD	A,(LEVEL_NUMBER)
	DEC	A
	LD	B,A
	ADD	A,A
	ADD	A,B
	ADD	A,A
	LD	HL,LEVEL_ROUTE_STRIP_DEF_PTR_TABLE
	CALL	ADD_A_TO_HL
	LD	DE,HS_DEF_PTRS
	LD	BC,0006h
	LDIR
	LD	A,(CHECKPOINT_GAO_X)
	LD	(HS_CHK_X_SHADOW),A
	LD	HL,(CHECKPOINT_ROUTE_ROW)
	LD	(HS_CHK_ROW_SHADOW),HL
	LD	HL,HS_LAST_DELTA
	LD	C,09h	; Helper clears BC+1 bytes: F116h..F11Fh, not KK2 stub at F120h
	CALL	ZERO_RAM_BLOCK_HL_BC
	LD	HL,TERRAIN_OBJECT_TABLE
	LD	B,08h

.cull_edge_terrain:
	LD	A,(HL)
	OR	A
	JR	Z,.cull_next
	PUSH	BC
	PUSH	HL
	CALL	HS_CHECK_TERRAIN_HL_X
	CALL	NC,CLEAR_TERRAIN_SLOT_AND_CLEAN_PARTS
	POP	HL
	POP	BC

.cull_next:
	LD	DE,OBJ_REC_SIZE
	ADD	HL,DE
	DJNZ	.cull_edge_terrain
	RET

; Sample the vertical row-streaming state before the original scroll tick
HS_MODULE_PRE_TICK:
	LD	HL,(LEVEL_ROUTE_ROW)
	LD	(HS_PREV_LRR),HL
	LD	HL,(LEVEL_TILE_WRITE_CURSOR)
	LD	(HS_PREV_CURSOR),HL
	LD	A,(SCROLL_STREAM_PHASE)
	LD	(HS_PREV_PHASE),A
	RET

; Per-frame entry after the original vertical scroll tick. Returns A = route now under Gao when
; it differs from ROUTE_INDEX (else FFh) and B = terrain slots to retire (bit n = slot n).
HS_MODULE_FRAME:
	XOR	A
	LD	(HS_TMP_TERRAIN),A
	CALL	HS_FIX_CHECKPOINT_X
	CALL	HS_MAP_LEVEL_DATA_BANKS
	CALL	HS_REDECODE_NEW_ROW
	CALL	HS_STEP_CAMERA
	CALL	RESTORE_DEFAULT_CORE_BANKS
	CALL	HS_SHIFT_OBJECTS
	LD	A,(HS_TMP_TERRAIN)
	LD	B,A
	LD	A,(HS_DELTA)
	LD	C,A
	LD	HL,HS_CAM_LO
	LD	A,(GAO_POS_X)
	ADD	A,(HL)
	LD	A,(HS_CAM_ROUTE)
	ADC	A,00h
	CP	03h
	JR	C,.route
	SUB	03h

.route:
	LD	HL,ROUTE_INDEX
	CP	(HL)
	RET	NZ
	LD	A,FFh
	RET

; Map Bank 10 (metatile dictionaries) at 6000h and Bank 11 (strip definitions) at 8000h,
; updating the shadows so the VBlank handler restores them correctly.
HS_MAP_LEVEL_DATA_BANKS:
	DI
	LD	A,0Ah
	LD	(MAPPER_PAGE1),A
	LD	(MAPPER_BANK_PAGE1),A
	INC	A
	LD	(MAPPER_PAGE2),A
	LD	(MAPPER_BANK_PAGE2),A
	EI
	RET

; Convert a checkpoint stored this frame from screen X to route-local X (route reloads and
; respawns place Gao at route-local coordinates with the camera at the route origin).
HS_FIX_CHECKPOINT_X:
	LD	A,(CHECKPOINT_GAO_X)
	LD	HL,HS_CHK_X_SHADOW
	CP	(HL)
	JR	NZ,.changed
	LD	HL,(CHECKPOINT_ROUTE_ROW)
	LD	DE,(HS_CHK_ROW_SHADOW)
	OR	A
	SBC	HL,DE
	RET	Z

.changed:
	LD	A,(HS_CAM_LO)
	LD	HL,CHECKPOINT_GAO_X
	ADD	A,(HL)
	LD	(HL),A
	LD	(HS_CHK_X_SHADOW),A
	LD	HL,(CHECKPOINT_ROUTE_ROW)
	LD	(HS_CHK_ROW_SHADOW),HL
	RET

; When the vertical tick decoded a new top row (stream phase 0 -> 1), re-decode it so every
; buffer column holds the world column of the current horizontal window. The streamer blits
; it to VRAM in the following phases.
HS_REDECODE_NEW_ROW:
	LD	A,(SCROLL_STREAM_PHASE)
	CP	01h
	RET	NZ
	LD	A,(HS_PREV_PHASE)
	CP	01h
	RET	Z
	LD	HL,(HS_PREV_LRR)
	LD	(HS_TMP_ROW),HL
	LD	HL,(HS_PREV_CURSOR)
	LD	(HS_TMP_DST),HL
	LD	C,00h

.column:
	LD	A,C
	LD	(HS_TMP_C),A
	CALL	HS_SELECT_ROUTE_FOR_PAGE_COLUMN
	LD	HL,(HS_TMP_ROW)
	CALL	HS_DECODE_TILE
	LD	HL,(HS_TMP_DST)
	LD	(HL),A
	INC	HL
	LD	(HS_TMP_DST),HL
	INC	C
	BIT	05h,C
	JR	Z,.column
	RET

; A = page column 00h..1Fh: select the strip definitions of the route whose world column is
; loaded there (columns left of HS_WIN_L AND 1Fh belong to the next route).
HS_SELECT_ROUTE_FOR_PAGE_COLUMN:
	LD	B,A
	LD	A,(HS_WIN_L)
	AND	1Fh
	LD	E,A
	LD	A,(HS_WIN_L)
	RLCA
	RLCA
	RLCA
	AND	07h
	LD	D,A
	LD	A,B
	CP	E
	LD	A,D
	JR	NC,HS_SELECT_ROUTE_DEFS
	INC	A
	CP	03h
	JR	C,HS_SELECT_ROUTE_DEFS
	XOR	A

; A = route 0..2: HS_TMP_P = strip-definition table of that route
HS_SELECT_ROUTE_DEFS:
	ADD	A,A
	LD	HL,HS_DEF_PTRS
	CALL	ADD_A_TO_HL
	LD	A,(HL)
	INC	HL
	LD	H,(HL)
	LD	L,A
	LD	(HS_TMP_P),HL
	RET

; Decode the 8x8 tile at route row HL (00h..BFh), column HS_TMP_C of the route selected in
; HS_TMP_P. Requires Banks 10/11 at 6000h-9FFFh. Returns A = tile; clobbers HL, DE.
HS_DECODE_TILE:
	LD	A,L
	AND	03h
	XOR	03h
	ADD	A,A
	ADD	A,A
	LD	E,A
	LD	A,(HS_TMP_C)
	AND	03h
	ADD	A,E
	LD	(HS_TMP_SUB),A
	LD	A,L
	RRCA
	RRCA
	AND	3Fh
	CP	HS_NORMAL_STRIP_TOP + 01h
	JR	C,.strip_ok
	XOR	A

.strip_ok:
	LD	E,A
	LD	A,HS_NORMAL_STRIP_TOP
	SUB	E
	LD	L,A
	LD	H,00h
	ADD	HL,HL
	ADD	HL,HL
	ADD	HL,HL
	LD	A,(HS_TMP_C)
	RRCA
	RRCA
	AND	07h
	CALL	ADD_A_TO_HL
	LD	DE,(HS_TMP_P)
	ADD	HL,DE
	LD	L,(HL)
	LD	H,00h
	ADD	HL,HL
	ADD	HL,HL
	ADD	HL,HL
	ADD	HL,HL
	LD	DE,(LEVEL_METATILE_DICT_PTR)
	ADD	HL,DE
	LD	A,(HS_TMP_SUB)
	CALL	ADD_A_TO_HL
	LD	A,(HL)
	RET

; Rewrite page/buffer column (A AND 1Fh) with world column A (00h..5Fh) for all 32 buffer
; rows: decode each tile, store it in LEVEL_TILE_BUFFER and blit it to VRAM page 0.
HS_REWRITE_COLUMN:
	LD	B,A
	AND	1Fh
	LD	(HS_TMP_C),A
	LD	A,B
	RLCA
	RLCA
	RLCA
	AND	07h
	CALL	HS_SELECT_ROUTE_DEFS
	LD	HL,(LEVEL_TILE_WRITE_CURSOR)
	ADD	HL,HL
	ADD	HL,HL
	ADD	HL,HL
	LD	A,H
	AND	1Fh
	LD	(HS_TMP_BCUR),A
	LD	C,00h

.row:
	LD	A,(HS_TMP_BCUR)
	LD	B,A
	LD	A,C
	SUB	B
	AND	1Fh
	JR	NZ,.have_dist
	LD	A,(SCROLL_STREAM_PHASE)
	OR	A
	JR	Z,.have_dist
	LD	A,20h

.have_dist:
	LD	E,A
	LD	D,00h
	LD	HL,(LEVEL_ROUTE_ROW)
	OR	A
	SBC	HL,DE
	JR	NC,.row_ok
	LD	DE,HS_ROUTE_ROWS
	ADD	HL,DE

.row_ok:
	CALL	HS_DECODE_TILE
	LD	B,A
	LD	L,C
	LD	H,00h
	ADD	HL,HL
	ADD	HL,HL
	ADD	HL,HL
	ADD	HL,HL
	ADD	HL,HL
	LD	A,(HS_TMP_C)
	CALL	ADD_A_TO_HL
	LD	DE,LEVEL_TILE_BUFFER
	ADD	HL,DE
	LD	(HL),B
	LD	A,(HS_TMP_C)
	ADD	A,A
	ADD	A,A
	ADD	A,A
	LD	D,A
	LD	A,C
	ADD	A,A
	ADD	A,A
	ADD	A,A
	LD	E,A
	LD	A,B
	CALL	BLIT_CACHED_8X8_TILE_FROM_SPRITE_PAGE
	INC	C
	BIT	05h,C
	JR	Z,.row
	RET

; Follow Gao with a dead zone, moving the camera in 1-pixel steps (at most 4 px per frame).
; Stop at the next tile boundary: only a boundary already latched in R#26/R#27
; hides the whole recycled column behind the left mask. HS_DELTA is the signed move.
HS_STEP_CAMERA:
	XOR	A
	LD	(HS_DELTA),A
	LD	A,(GAO_POS_X)
	CP	HS_DEAD_ZONE_RIGHT
	JR	NC,.right
	CP	HS_DEAD_ZONE_LEFT
	RET	NC
	LD	B,A
	LD	A,HS_DEAD_ZONE_LEFT
	SUB	B
	CALL	HS_CAMERA_STEP_COUNT
	LD	A,(HS_CAM_LO)
	AND	07h
	CALL	HS_LIMIT_STEPS_TO_BOUNDARY

.left_step:
	PUSH	BC
	CALL	HS_CAMERA_STEP_LEFT
	POP	BC
	DJNZ	.left_step
	RET

.right:
	SUB	HS_DEAD_ZONE_RIGHT - 01h
	CALL	HS_CAMERA_STEP_COUNT
	LD	A,(HS_CAM_LO)
	NEG
	AND	07h
	CALL	HS_LIMIT_STEPS_TO_BOUNDARY

.right_step:
	PUSH	BC
	CALL	HS_CAMERA_STEP_RIGHT
	POP	BC
	DJNZ	.right_step
	RET

; A = pixel distance outside the dead zone (>= 1): B = 1-pixel steps (1..HS_MAX_CAMERA_STEPS)
HS_CAMERA_STEP_COUNT:
	CP	HS_MAX_CAMERA_STEPS + 01h
	JR	C,.count
	LD	A,HS_MAX_CAMERA_STEPS

.count:
	LD	B,A
	RET

; A = distance to next tile boundary (0 = already aligned), B = requested steps.
; Return B capped to that distance. At alignment, the full column is already masked.
HS_LIMIT_STEPS_TO_BOUNDARY:
	OR	A
	RET	Z
	CP	B
	RET	NC
	LD	B,A
	RET

; Move the camera 1 px right; on an 8-pixel boundary whose hidden column still holds the
; left-side world column, first load the incoming right-side column there.
HS_CAMERA_STEP_RIGHT:
	LD	A,(HS_CAM_LO)
	AND	07h
	JR	NZ,.move
	CALL	HS_CAMERA_WORLD_COLUMN
	LD	HL,HS_WIN_L
	CP	(HL)
	JR	NZ,.move
	PUSH	AF
	INC	A
	CALL	HS_WRAP_WORLD_COLUMN
	LD	(HS_WIN_L),A
	POP	AF
	ADD	A,HS_ROUTE_COLUMNS
	CALL	HS_WRAP_WORLD_COLUMN
	CALL	HS_REWRITE_COLUMN

.move:
	LD	HL,HS_CAM_LO
	INC	(HL)
	JR	NZ,.moved
	LD	A,(HS_CAM_ROUTE)
	INC	A
	CP	03h
	JR	C,.route
	XOR	A

.route:
	LD	(HS_CAM_ROUTE),A

.moved:
	LD	HL,HS_DELTA
	INC	(HL)
	RET

; Move the camera 1 px left; on an 8-pixel boundary whose hidden column still holds the
; right-side world column, first load the incoming left-side column there.
HS_CAMERA_STEP_LEFT:
	LD	A,(HS_CAM_LO)
	AND	07h
	JR	NZ,.move
	CALL	HS_CAMERA_WORLD_COLUMN
	LD	HL,HS_WIN_L
	CP	(HL)
	JR	Z,.move
	LD	(HS_WIN_L),A
	CALL	HS_REWRITE_COLUMN

.move:
	LD	HL,HS_CAM_LO
	LD	A,(HL)
	SUB	01h
	LD	(HL),A
	JR	NC,.moved
	LD	A,(HS_CAM_ROUTE)
	SUB	01h
	JR	NC,.route
	LD	A,02h

.route:
	LD	(HS_CAM_ROUTE),A

.moved:
	LD	HL,HS_DELTA
	DEC	(HL)
	RET

; A = world tile column at the camera origin (HS_CAM_ROUTE * 32 + HS_CAM_LO / 8)
HS_CAMERA_WORLD_COLUMN:
	LD	A,(HS_CAM_ROUTE)
	RRCA
	RRCA
	RRCA
	LD	B,A
	LD	A,(HS_CAM_LO)
	RRCA
	RRCA
	RRCA
	AND	1Fh
	ADD	A,B
	RET

; Wrap world column A into 00h..5Fh
HS_WRAP_WORLD_COLUMN:
	CP	HS_WORLD_COLUMNS
	RET	C
	SUB	HS_WORLD_COLUMNS
	RET

; Shift every screen-space X by -HS_DELTA and retire records pushed across the page edge
; (gameplay objects are retired by RETIRE_OFFSCREEN_OBJECT_SPRITES during their update).
HS_SHIFT_OBJECTS:
	LD	A,(HS_DELTA)
	OR	A
	RET	Z
	LD	HL,GAO_POS_X
	CALL	HS_SHIFT_BYTE_HL
	LD	HL,GAO_PREV_POS_X_HI
	CALL	HS_SHIFT_BYTE_HL
	LD	HL,0000h
	LD	(HS_TMP_RETIRE),HL
	LD	H,GAMEPLAY_OBJECT_TABLE / 0100h
	LD	DE,OBJ_REC_SIZE
	LD	BC,0A00h + OBJ_X
	CALL	HS_SHIFT_TABLE
	LD	HL,STAGE_OBJ_SPAWN_QUEUE
	LD	DE,SPAWNQ_REC_SIZE
	LD	BC,0A00h + SPAWNQ_X
	CALL	HS_SHIFT_TABLE
	LD	HL,DEACTIVATE_OBJECT_HL_AND_SPRITES
	LD	(HS_TMP_RETIRE),HL
	LD	HL,AUXILIARY_OBJECT_TABLE
	LD	DE,OBJ_REC_SIZE
	LD	BC,0800h + OBJ_X
	CALL	HS_SHIFT_TABLE
	LD	HL,HS_MARK_TERRAIN_RETIRE
	LD	(HS_TMP_RETIRE),HL
	LD	HL,TERRAIN_OBJECT_TABLE
	LD	DE,OBJ_REC_SIZE
	LD	BC,0800h + OBJ_X
	CALL	HS_SHIFT_TABLE
	LD	HL,TERRAIN_OBJECT_TABLE
	LD	B,08h

.terrain_cache:
	LD	A,(HL)
	OR	A
	JR	Z,.next_terrain_cache
	PUSH	BC
	PUSH	HL
	CALL	HS_CHECK_TERRAIN_HL_X
	CALL	NC,HS_MARK_TERRAIN_RETIRE
	POP	HL
	POP	BC
	SET	05h,L
	BIT	06h,(HL)
	JR	Z,.restore_rec_l
	INC	L
	INC	L
	CALL	HS_SHIFT_BYTE_HL

.restore_rec_l:
	LD	A,L
	AND	80h
	LD	L,A

.next_terrain_cache:
	LD	DE,OBJ_REC_SIZE
	ADD	HL,DE
	DJNZ	.terrain_cache
	LD	HL,HS_RETIRE_WEAPON
	LD	(HS_TMP_RETIRE),HL
	LD	HL,LOGICAL_SPRITE_OBJ_TABLE
	LD	DE,LOBJ_REC_SIZE
	LD	BC,0600h + LOBJ_X
	CALL	HS_SHIFT_TABLE
	JP	HS_SHIFT_GROUND_ITEMS

; Ground icons have signed X so their last visible pixels survive the left edge.
; Visible page is X=8..255 (left eight pixels masked); a 16-pixel icon remains
; visible for -7 <= X <= 255. Once fully outside, streamed columns own the old
; pixels: free the cache without restoring stale background into a reused column.
HS_SHIFT_GROUND_ITEMS:
	LD	HL,STAGE_SPAWN_TRACK_TABLE
	LD	B,10h

.slot:
	LD	A,(HL)
	OR	A
	JR	Z,.next
	PUSH	BC
	PUSH	HL
	LD	C,A
	LD	A,L
	ADD	A,GITEM_X
	LD	L,A
	LD	E,(HL)
	INC	L
	INC	L
	LD	D,(HL)
	EX	DE,HL
	PUSH	DE
	LD	A,(HS_DELTA)
	LD	E,A
	ADD	A,A
	SBC	A,A
	LD	D,A
	OR	A
	SBC	HL,DE
	POP	DE
	LD	A,H
	LD	(DE),A
	DEC	DE
	DEC	DE
	LD	A,L
	LD	(DE),A
	LD	A,H
	OR	A
	JR	Z,.keep
	INC	A
	JR	NZ,.retire
	LD	A,L
	CP	F9h
	JR	NC,.keep

.retire:
	POP	HL
	PUSH	HL
	LD	A,C
	CP	02h
	JR	C,.clear
	LD	A,L
	ADD	A,GITEM_CACHE_SLOT
	LD	L,A
	LD	L,(HL)
	LD	H,CBh
	LD	(HL),00h

.clear:
	POP	HL
	LD	(HL),00h
	JR	.pop_count

.keep:
	POP	HL

.pop_count:
	POP	BC

.next:
	LD	DE,GITEM_REC_SIZE
	ADD	HL,DE
	DJNZ	.slot
	RET

; Shift field C of B records starting at HL (stride DE) whose first byte is nonzero, calling
; HS_TMP_RETIRE (if nonzero) with HL = record when the field wraps across the page edge.
HS_SHIFT_TABLE:
	LD	A,(HL)
	OR	A
	JR	Z,.next
	PUSH	BC
	PUSH	DE
	PUSH	HL
	LD	A,L
	ADD	A,C
	LD	L,A
	CALL	HS_SHIFT_BYTE_HL
	POP	HL
	PUSH	HL
	CALL	C,HS_CALL_RETIRE
	POP	HL
	POP	DE
	POP	BC

.next:
	ADD	HL,DE
	DJNZ	HS_SHIFT_TABLE
	RET

; (HL) -= HS_DELTA. Returns carry when the byte wrapped across 00h/FFh. Clobbers A, E.
HS_SHIFT_BYTE_HL:
	LD	A,(HS_DELTA)
	LD	E,A
	LD	A,(HL)
	SUB	E
	LD	(HL),A
	BIT	07h,E
	RET	Z
	CCF
	RET

; Jump to HS_TMP_RETIRE with HL = record (no-op when the handler is 0000h)
HS_CALL_RETIRE:
	LD	DE,(HS_TMP_RETIRE)
	LD	A,D
	OR	E
	RET	Z
	PUSH	DE
	RET

; Defer retirement of terrain slot HL (its cleanup may issue VDP commands) to Bank 03
HS_MARK_TERRAIN_RETIRE:
	LD	A,H
	SUB	TERRAIN_OBJECT_TABLE / 0100h
	ADD	A,A
	BIT	07h,L
	JR	Z,.slot
	INC	A

.slot:
	LD	B,A
	INC	B
	LD	A,01h

.bit:
	DJNZ	.shift
	LD	HL,HS_TMP_TERRAIN
	OR	(HL)
	LD	(HL),A
	RET

.shift:
	ADD	A,A
	JR	.bit

; Retire a Gao weapon projectile pushed off screen (LOBJ_TYPE FFh = free on next pass)
HS_RETIRE_WEAPON:
	LD	(HL),FFh
	RET

; Retire a ground-item icon record pushed off screen and restore its saved 16x16 background
HS_RETIRE_GROUND_ITEM:
	LD	A,(HL)
	CP	04h
	RET	Z
	DEC	A
	JR	Z,.clear_uninit
	LD	(HL),04h
	RET

.clear_uninit:
	LD	(HL),00h
	RET

; Check whether terrain record HL has OBJ_X within safe horizontal bounds for its OBJ_TYPE.
; Returns Carry set when in bounds, Carry clear when out of bounds. Preserves HL.
HS_CHECK_TERRAIN_HL_X:
	LD	C,(HL)
	LD	A,L
	ADD	A,OBJ_X
	LD	L,A
	LD	B,(HL)
	SUB	OBJ_X
	LD	L,A
	LD	A,C
	SUB	0Ch
	CP	04h
	LD	A,B
	JR	NC,.wide
	SUB	0Ch
	CP	D9h
	RET

.wide:
	SUB	0Ch
	CP	C9h
	RET

; Scrolled VDP primitive: translate page-0 X coordinates by HS_CAM_LO and split at the page edge.
; HS_RAW_TARGET selects the raw routine: HMMM (pages in A bits 1-0 source / 3-2 destination),
; LMMM (bits 7-6 source / 5-4 destination) or HMMV (page in D, X in H).
HS_MOD_PRIMITIVE:
	LD	(HS_SPLIT_A_PARAM),A
	PUSH	HL
	PUSH	DE
	LD	HL,(HS_RAW_TARGET)
	LD	(HS_SPLIT_RAW),HL
	LD	DE,FILL_VRAM_RECT_HMMV_RAW
	OR	A
	SBC	HL,DE
	JR	Z,.hmmv
	LD	HL,(HS_RAW_TARGET)
	LD	DE,BLIT_VRAM_RECT_LMMM_RAW
	OR	A
	SBC	HL,DE
	LD	HL,30C0h
	LD	A,04h	; Logical copies preserve odd pixel coordinates
	JR	Z,.masks
	POP	DE
	POP	HL
	CALL	HS_ALIGN_EVEN_WIDTH_B
	CALL	HS_ALIGN_MESSAGE_COPY
	PUSH	HL
	PUSH	DE
	LD	HL,0C03h
	LD	A,0Ch	; Byte copies may need a pixel command after translation

.masks:
	LD	(HS_SPLIT_FLAGS),A
	LD	A,(HS_SPLIT_A_PARAM)
	AND	L
	LD	L,A
	LD	A,(HS_SPLIT_A_PARAM)
	AND	H
	LD	H,A
	LD	(HS_TMP_P),HL
	POP	DE
	POP	HL
	LD	A,(HS_TMP_P)
	OR	A
	CALL	Z,HS_OFFSET_H
	LD	A,(HS_TMP_P + 01h)
	OR	A
	CALL	Z,HS_OFFSET_D
	JR	HS_SELECT_PIXEL_COMMAND

.hmmv:
	POP	DE
	POP	HL
	LD	A,D
	OR	A
	JR	NZ,.hmmv_raw
	LD	A,08h
	LD	(HS_SPLIT_FLAGS),A
	CALL	HS_ALIGN_EVEN_WIDTH_B
	CALL	HS_ALIGN_MESSAGE_COPY
	CALL	HS_OFFSET_H
	JR	HS_SELECT_PIXEL_COMMAND

.hmmv_raw:
	LD	A,(HS_SPLIT_A_PARAM)
	JP	FILL_VRAM_RECT_HMMV_RAW	; asm/banks/bank00.asm

; Ensure byte-aligned HMMM/HMMV width B is even and never turns B=01h into 00h (256 px)
HS_ALIGN_EVEN_WIDTH_B:
	LD	A,B
	DEC	A
	JR	NZ,.even_b
	INC	B
	RET

.even_b:
	RES	00h,B
	RET

; The bird-message camera is frozen. Position the whole window at an even
; page offset (at most one pixel left on screen), including save and restore.
; This avoids slow pixel copies for its large background rectangles.
HS_DRAW_CAMERA_OFFSET:
	LD	A,(MAIN_STATE)
	CP	MAIN_STATE_BIRD_MESSAGE
	LD	A,(HS_CAM_LO)
	RET	NZ
	AND	FEh
	RET

; Preserve the original byte-command rounding for the bird window before
; translation. D is a destination X for copies, a page number for fills.
HS_ALIGN_MESSAGE_COPY:
	LD	A,(MAIN_STATE)
	CP	MAIN_STATE_BIRD_MESSAGE
	RET	NZ
	RES	00h,H
	PUSH	HL
	LD	HL,(HS_RAW_TARGET)
	PUSH	DE
	LD	DE,FILL_VRAM_RECT_HMMV_RAW
	OR	A
	SBC	HL,DE
	POP	DE
	POP	HL
	RET	Z
	RES	00h,D
	RET

; Add the camera offset to page-0 X in H and flag it for page-edge splitting
HS_OFFSET_H:
	CALL	HS_DRAW_CAMERA_OFFSET
	ADD	A,H
	LD	H,A
	LD	A,(HS_SPLIT_FLAGS)
	OR	01h
	LD	(HS_SPLIT_FLAGS),A
	RET

; Add the camera offset to page-0 X in D and flag it for page-edge splitting
HS_OFFSET_D:
	CALL	HS_DRAW_CAMERA_OFFSET
	ADD	A,D
	LD	D,A
	LD	A,(HS_SPLIT_FLAGS)
	OR	02h
	LD	(HS_SPLIT_FLAGS),A
	RET

; Byte commands cannot preserve a rectangle whose translated page X is odd. Use
; pixel IMP copies/fills in that case; rounding would mismatch the saved background
; and the logical terrain/icon draw. Even-aligned rectangles retain HMMM/HMMV.
HS_SELECT_PIXEL_COMMAND:
	LD	A,(HS_SPLIT_FLAGS)
	BIT	03h,A
	JP	Z,HS_SPLIT_BLIT
	BIT	00h,A
	JR	Z,.check_d
	BIT	00h,H
	JR	NZ,.pixel

.check_d:
	BIT	01h,A
	JP	Z,HS_SPLIT_BLIT
	BIT	00h,D
	JP	Z,HS_SPLIT_BLIT

.pixel:
	PUSH	HL
	BIT	02h,A
	LD	HL,HS_FILL_VRAM_RECT_LMMV_RAW
	JR	NZ,.copy
	LD	A,(HS_SPLIT_A_PARAM)
	RLCA
	RLCA
	RLCA
	RLCA
	PUSH	HL
	LD	HL,HS_SPLIT_A_PARAM
	XOR	(HL)
	POP	HL
	JR	Z,.target
	POP	HL
	RES	00h,H	; Mixed-nibble packed fills retain original byte semantics
	JP	HS_SPLIT_BLIT

.copy:
	LD	HL,BLIT_VRAM_RECT_LMMM_RAW
	PUSH	BC
	LD	A,(HS_SPLIT_A_PARAM)
	AND	03h
	RRCA
	RRCA
	LD	B,A
	LD	A,(HS_SPLIT_A_PARAM)
	AND	0Ch
	RLCA
	RLCA
	OR	B
	LD	(HS_SPLIT_A_PARAM),A
	POP	BC

.target:
	LD	(HS_SPLIT_RAW),HL
	POP	HL
	JP	HS_SPLIT_BLIT

; Pixel-precise IMP fill for odd translated X. Same calling convention as HMMV;
; Only uniform packed colors (matching nibbles) use this path. SCREEN 5 takes the
; low nibble. Only called from the already mapped module.
HS_FILL_VRAM_RECT_LMMV_RAW:
	EX	AF,AF'
	CALL	WAIT_FOR_VDP_COMMAND_COMPLETE
	PUSH	BC
	LD	A,(BIOS_VDP_DW)
	INC	A
	LD	C,A
	LD	A,24h
	DI
	OUT	(C),A
	LD	A,91h
	OUT	(C),A
	INC	C
	INC	C
	OUT	(C),H
	XOR	A
	OUT	(C),A
	OUT	(C),L
	OUT	(C),D
	POP	HL
	OUT	(C),H
	CP	H
	JR	NZ,.width
	INC	A

.width:
	OUT	(C),A
	XOR	A
	OUT	(C),L
	CP	L
	JR	NZ,.height
	INC	A

.height:
	OUT	(C),A
	EX	AF,AF'
	AND	0Fh
	OUT	(C),A
	XOR	A
	OUT	(C),A
	LD	A,80h
	OUT	(C),A
	EI
	RET

; Execute the raw VDP command in HS_SPLIT_RAW for the rectangle (HL, DE, BC), splitting it
; wherever a flagged page-0 X coordinate crosses the 256-pixel page edge.
HS_SPLIT_BLIT:
	LD	A,B
	LD	(HS_SPLIT_WIDTH),A
	LD	A,(HS_SPLIT_FLAGS)
	RRCA
	JR	NC,.no_h
	XOR	A
	SUB	H
	CALL	HS_SPLIT_LIMIT

.no_h:
	LD	A,(HS_SPLIT_FLAGS)
	BIT	01h,A
	JR	Z,.no_d
	XOR	A
	SUB	D
	CALL	HS_SPLIT_LIMIT

.no_d:
	LD	A,(HS_SPLIT_WIDTH)
	CP	B
	JR	Z,.last
	PUSH	BC
	PUSH	DE
	PUSH	HL
	LD	B,A
	CALL	.last
	POP	HL
	POP	DE
	POP	BC
	LD	A,(HS_SPLIT_WIDTH)
	ADD	A,H
	LD	H,A
	LD	A,(HS_SPLIT_FLAGS)
	BIT	02h,A
	JR	Z,.no_d_advance
	LD	A,(HS_SPLIT_WIDTH)
	ADD	A,D
	LD	D,A

.no_d_advance:
	LD	A,(HS_SPLIT_WIDTH)
	NEG
	ADD	A,B
	LD	B,A
	JR	HS_SPLIT_BLIT

.last:
	LD	A,(HS_SPLIT_A_PARAM)
	PUSH	HL
	LD	HL,(HS_SPLIT_RAW)
	EX	(SP),HL
	RET

; Clamp HS_SPLIT_WIDTH to the distance A (00h = 256) to the page edge
HS_SPLIT_LIMIT:
	OR	A
	RET	Z
	PUSH	BC
	LD	C,A
	LD	A,(HS_SPLIT_WIDTH)
	OR	A
	JR	Z,.take
	CP	C
	JR	C,.keep
	JR	Z,.keep

.take:
	LD	A,C
	LD	(HS_SPLIT_WIDTH),A

.keep:
	POP	BC
	RET

; Repaint LEVEL_TILE_BUFFER tiles over retiring uncached terrain sub-part 0.
HS_MODULE_ERASE_PART0:
	LD	A,(IX+OBJ_X)
	ADD	A,(IX+OBJ_PART0_DX)
	LD	D,A
	LD	A,(IX+OBJ_Y)
	ADD	A,(IX+OBJ_PART0_DY)
	LD	E,A
	LD	A,(IX+OBJ_PART0_WIDTH)
	RRCA
	RRCA
	RRCA
	AND	1Fh
	INC	A
	LD	B,A
	LD	A,(IX+OBJ_TYPE)
	CP	04h
	JR	NZ,.height
	INC	B

.height:
	LD	A,(IX+OBJ_PART0_HEIGHT)
	RRCA
	RRCA
	RRCA
	AND	1Fh
	INC	A
	LD	C,A
	LD	A,01h
	LD	(SPRITE_SET_BANK_PARAM),A

.row:
	PUSH	BC
	PUSH	DE

.col:
	PUSH	BC
	PUSH	DE
	CALL	MAP_SCREEN_COORDS_TO_TILE_BUFFER
	LD	B,(HL)
	LD	A,L
	ADD	A,A
	ADD	A,A
	ADD	A,A
	POP	DE
	PUSH	DE
	LD	D,A
	LD	A,(VERTICAL_SCROLL_OFFSET)
	ADD	A,E
	AND	F8h
	LD	E,A
	LD	A,B
	CALL	BLIT_CACHED_8X8_TILE_FROM_SPRITE_PAGE
	POP	DE
	POP	BC
	LD	A,D
	ADD	A,08h
	LD	D,A
	DJNZ	.col
	POP	DE
	POP	BC
	LD	A,E
	ADD	A,08h
	LD	E,A
	DEC	C
	JR	NZ,.row
	RET

; Pure RAM lookup, called only while hardware scrolling is active.
; Return Z for active/defeated tag B; preserve BC and DE.
HS_MODULE_CHECK_TERRAIN_TAG:
	PUSH	BC
	PUSH	DE
	LD	C,B
	LD	HL,TERRAIN_OBJECT_TABLE
	LD	DE,OBJ_REC_SIZE - OBJ_Y_FRAC
	LD	B,08h

.chk_slot:
	LD	A,(HL)
	INC	L
	INC	L
	OR	A
	JR	Z,.next_slot
	LD	A,(HL)
	CP	C
	JR	Z,.found

.next_slot:
	ADD	HL,DE
	DJNZ	.chk_slot
	LD	HL,HS_DEFEATED_TAGS
	LD	A,C
	LD	B,08h

.chk_def:
	CP	(HL)
	JR	Z,.found
	INC	HL
	DJNZ	.chk_def
	OR	01h

.found:
	POP	DE
	POP	BC
	RET

; Route transitions only (camera active): discard delayed waves and one-shot requests
; from the outgoing route before its sprite resources can be replaced. Core banks
; remain mapped; CLEAR_STAGE_OBJ_SPAWN_QUEUE only writes RAM and cannot reenter hooks.
HS_MODULE_RESET_ROUTE_SPAWNS:
	XOR	A
	LD	(ACTIVE_ENEMY_OBJ_COUNT),A
	LD	(TERRAIN_STREAM_ENABLE),A
	LD	HL,0000h
	LD	(SPRITE_COL_PATCH_COUNT),HL
	LD	(SPRITE_COL_PATCH_HI),HL
	JP	CLEAR_STAGE_OBJ_SPAWN_QUEUE	; asm/banks/bank01.asm

; A = sprite set selector: return its Bank 07 resource-list pointer in HL.
; Called only during active camera route transitions; restores Bank 01 before return.
HS_MODULE_SPRITE_SET_LIST_PTR:
	LD	C,A
	CALL	HS_MAP_IMAGE_BANK
	LD	A,C
	LD	HL,SPRITE_SET_PTR_TABLE
	CALL	READ_WORD_FROM_HL_TABLE_A
	CALL	HS_RESTORE_IMAGE_BANK
	EI
	RET

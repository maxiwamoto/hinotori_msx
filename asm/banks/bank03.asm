; Original Bank 03 (ROM 06000h-07FFFh): Enemy/boss handlers, Firebird hints, and padding.
; Enhanced also includes horizontal-scroll core hooks and translation fixes at the tail.

	LD	HL,OBJ_TYPE_0A_KINEMATIC_PARAMS
	CALL	COPY_OBJECT_KINEMATIC_PARAMS_HL
	PUSH	IX
	POP	IY
	LD	(IX+OBJ_WORK_2),10h
	LD	(IX+OBJ_LINK_PTR_LO),80h
	PUSH	IX
	POP	HL
	LD	(LINKED_OBJ_PTR_TEMP),HL
	LD	(SHOT_COLL_WORK_WORD),HL
	LD	DE,0050h
	ADD	HL,DE
	LD	B,04h

; Spawn up to four OBJ_TYPE 0Bh trailing body segments and record their slot pointers in the
; head object
OBJ_TYPE_0A_SPAWN_SEGMENTS_LOOP:
	PUSH	BC
	PUSH	HL
	LD	E,(IY+OBJ_Y)
	LD	D,(IY+OBJ_X)
	LD	C,0Bh
	CALL	SPAWN_GAMEPLAY_OBJECT_TYPE_A
	POP	HL
	POP	BC
	LD	A,(BOSS_PROJECTILE_COUNT)
	AND	A
	JR	Z,OBJ_TYPE_0A_FINISH_SEGMENT_CHAIN
	PUSH	IX
	POP	DE
	LD	(HL),E
	INC	L
	LD	(HL),D
	INC	L
	LD	(LINKED_OBJ_PTR_TEMP),DE
	DJNZ	OBJ_TYPE_0A_SPAWN_SEGMENTS_LOOP

; Terminate the OBJ_TYPE 0Ah segment pointer list with FFh and store the final segment
; pointer in OBJ_WORK_0..1
OBJ_TYPE_0A_FINISH_SEGMENT_CHAIN:
	LD	(HL),FFh
	LD	HL,(LINKED_OBJ_PTR_TEMP)
	LD	(IY+OBJ_WORK_0),L
	LD	(IY+OBJ_WORK_1),H
	RET

; 11-byte initial kinematic parameter template for OBJ_TYPE 0Ah chain enemy head (pose 14h,
; timer 40h, X velocity +0480h)
OBJ_TYPE_0A_KINEMATIC_PARAMS:
	DB	00h,00h,80h,04h,01h,00h,00h,00h,00h,14h,40h

; 4-byte bounding-box preset (-19, -11, 24x21) shared by OBJ_TYPE 0Ah chain heads and
; OBJ_TYPE 0Bh body segments
OBJ_TYPE_0A_0B_HITBOX:
	DB	EDh,F5h,18h,15h

; Per-frame update handler for runtime gameplay object type 0Ah
OBJ_UPDATE_TYPE_0A:
	CALL	TICK_OBJ_TYPE_0A_0B_SHOT_TIMER
	LD	A,(IX+OBJ_WORK_2)
	SUB	(IX+OBJ_Y)
	LD	H,00h
	JR	NC,.loc_a06c
	DEC	H

.loc_a06c:
	LD	L,A
	ADD	HL,HL
	ADD	HL,HL
	ADD	HL,HL
	ADD	HL,HL
	LD	(IX+OBJ_ACCEL_Y_LO),L
	LD	(IX+OBJ_ACCEL_Y_HI),H
	LD	A,(IX+OBJ_LINK_PTR_LO)
	SUB	(IX+OBJ_X)
	LD	H,00h
	JR	NC,.loc_a082
	DEC	H

.loc_a082:
	LD	L,A
	LD	(IX+OBJ_ACCEL_X_LO),L
	LD	(IX+OBJ_ACCEL_X_HI),H
	LD	A,(VERTICAL_SCROLL_DELTA)
	AND	A
	RET	Z
	INC	(IX+OBJ_Y)
	INC	(IX+OBJ_WORK_2)
	RET

; Spawn initializer for runtime gameplay object type 0Bh
OBJ_INIT_TYPE_0B:
	LD	HL,OBJ_TYPE_0A_0B_HITBOX
	CALL	SET_OBJECT_HITBOX_FROM_HL
	LD	HL,(LINKED_OBJ_PTR_TEMP)
	LD	(IX+OBJ_WORK_0),L
	LD	(IX+OBJ_WORK_1),H
	XOR	A
	LD	(IX+OBJ_WORK_2),A
	LD	(IX+OBJ_ANIM_TIMER),A
	LD	(IX+OBJ_SPRITE_POSE),14h
	LD	(IX+OBJ_ACTION_TIMER),40h
	LD	HL,(SHOT_COLL_WORK_WORD)
	LD	(IX+OBJ_LINK_PTR_LO),L
	LD	(IX+OBJ_LINK_PTR_HI),H
	PUSH	IX
	POP	HL
	LD	DE,0040h
	ADD	HL,DE
	LD	E,(IX+OBJ_Y)
	LD	D,(IX+OBJ_X)
	LD	B,08h

.loc_a0cb:
	LD	(HL),E
	INC	L
	LD	(HL),D
	INC	L
	DJNZ	.loc_a0cb
	RET

; Per-frame update handler for runtime gameplay object type 0Bh
OBJ_UPDATE_TYPE_0B:
	CALL	TICK_OBJ_TYPE_0A_0B_SHOT_TIMER
	LD	L,(IX+OBJ_WORK_0)
	LD	H,(IX+OBJ_WORK_1)
	INC	L
	INC	L
	INC	L
	LD	E,(HL)
	INC	L
	INC	L
	LD	D,(HL)
	PUSH	IX
	POP	HL
	LD	BC,0040h
	ADD	HL,BC
	LD	A,(IX+OBJ_WORK_2)
	INC	(IX+OBJ_WORK_2)
	AND	07h
	ADD	A,A
	CALL	ADD_A_TO_HL
	LD	A,(HL)
	LD	(IX+OBJ_Y),A
	LD	(HL),E
	INC	L
	LD	A,(HL)
	LD	(IX+OBJ_X),A
	LD	(HL),D
	RET

; Count down the 40h-frame fire timer for OBJ_TYPE 0Ah/0Bh chain segments and fire an aimed
; projectile toward Gao
TICK_OBJ_TYPE_0A_0B_SHOT_TIMER:
	DEC	(IX+OBJ_ACTION_TIMER)
	RET	NZ
	LD	(IX+OBJ_ACTION_TIMER),40h
	JP	SPAWN_DEFAULT_ENEMY_AUX_SHOT	; asm/banks/bank01.asm

; Mobile route spawn-stream group 06h pre-spawn handler
SPAWN_GROUP_HANDLER_06:
	LD	HL,SPAWN_GROUP_06_OBJ_0C_DESC
	JP	INIT_SPAWN_QUEUE_AND_UNPACK_X_PARAM	; asm/banks/bank02.asm

; 6-byte spawn group descriptor used by SPAWN_GROUP_HANDLER_06 to spawn a single OBJ_TYPE
; 0Ch hopper enemy
SPAWN_GROUP_06_OBJ_0C_DESC:
	DB	01h,01h,00h,0Ch,00h,00h

; Spawn initializer for runtime gameplay object type 0Ch
OBJ_INIT_TYPE_0C:
	CALL	INIT_STANDARD_ENEMY_DEFAULTS
	LD	HL,OBJ_TYPE_0C_HITBOX
	CALL	SET_OBJECT_HITBOX_FROM_HL
	LD	(IX+OBJ_ANIM_TIMER),00h
	LD	HL,OBJ_TYPE_0C_KINEMATIC_PARAMS
	JP	COPY_OBJECT_KINEMATIC_PARAMS_HL	; asm/banks/bank01.asm

; 11-byte initial kinematic parameter template for OBJ_TYPE 0Ch cardinal hoppers (Y velocity
; +0100h, pose 16h, timer 10h)
OBJ_TYPE_0C_KINEMATIC_PARAMS:
	DB	00h,01h,00h,00h,00h,00h,00h,00h,00h,16h,10h

; 4-byte bounding-box preset (-19, -11, 24x21) for OBJ_TYPE 0Ch cardinal hopper enemies
OBJ_TYPE_0C_HITBOX:
	DB	EDh,F5h,18h,15h

; Per-frame update handler for runtime gameplay object type 0Ch
OBJ_UPDATE_TYPE_0C:
	CALL	APPLY_VERTICAL_SCROLL_TO_OBJECT_Y
	LD	A,(IX+OBJ_PHASE)
	CALL	INLINE_WORD_DISPATCH

; 7-entry inline DW dispatch table for Object 0Eh behaviour phases
OBJ_TYPE_0E_PHASE_TABLE:
	DW	OBJ0E_PHASE_HANDLER_00	; [00h]
	DW	OBJ0E_PHASE_HANDLER_01	; [01h]
	DW	OBJ0E_PHASE_HANDLER_02	; [02h]
	DW	OBJ0E_PHASE_HANDLER_03	; [03h]
	DW	OBJ0E_PHASE_HANDLER_04	; [04h]
	DW	OBJ0E_PHASE_HANDLER_05	; [05h]
	DW	OBJ0E_PHASE_HANDLER_06	; [06h]

; Enemy Object 0Eh AI phase 06h handler
OBJ0E_PHASE_HANDLER_06:
	DEC	(IX+OBJ_ACTION_TIMER)
	JP	M,.loc_a158
	RET	NZ

.loc_a158:
	LD	A,(GAO_POS_Y)
	SUB	(IX+OBJ_Y)
	JR	NC,.loc_a162
	NEG

.loc_a162:
	LD	C,A
	LD	A,(GAO_POS_X)
	SUB	(IX+OBJ_X)
	JR	NC,.loc_a16d
	NEG

.loc_a16d:
	CP	C
	JR	NC,OBJ_TYPE_0C_TRY_HORIZONTAL_HOP
	JR	OBJ_TYPE_0C_TRY_VERTICAL_HOP

; Enemy Object 0Eh AI phase 00h handler
OBJ0E_PHASE_HANDLER_00:
	DEC	(IX+OBJ_ACTION_TIMER)
	RET	NZ
	INC	(IX+OBJ_PHASE)
	RET

; Enemy Object 0Eh AI phase 01h handler
OBJ0E_PHASE_HANDLER_01:
	LD	A,(GAO_POS_X)
	SUB	(IX+OBJ_X)
	ADD	A,10h
	CP	20h
	JR	C,OBJ_TYPE_0C_TRY_VERTICAL_HOP
	LD	A,(GAO_POS_Y)
	SUB	(IX+OBJ_Y)
	ADD	A,10h
	CP	20h
	RET	NC

; Probe 32 pixels left or right toward Gao and start OBJ_TYPE 0Ch horizontal hop phase 04h
; or 05h if landing tile is clear
OBJ_TYPE_0C_TRY_HORIZONTAL_HOP:
	LD	A,(GAO_POS_X)
	SUB	(IX+OBJ_X)
	JR	C,.loc_a1a4
	LD	HL,2000h
	CALL	PROBE_OBJ_TYPE_0C_HOP_TILE
	RET	C
	LD	C,05h
	JR	START_HOPPER_MOVEMENT_PHASE

.loc_a1a4:
	LD	HL,LEVEL_TILE_BUFFER
	CALL	PROBE_OBJ_TYPE_0C_HOP_TILE
	RET	C
	LD	C,04h
	JR	START_HOPPER_MOVEMENT_PHASE

; Probe 32 pixels up or down toward Gao and start OBJ_TYPE 0Ch vertical hop phase 02h or 03h
; if landing tile is clear
OBJ_TYPE_0C_TRY_VERTICAL_HOP:
	LD	A,(GAO_POS_Y)
	SUB	(IX+OBJ_Y)
	JR	C,.loc_a1c2
	LD	HL,0020h
	CALL	PROBE_OBJ_TYPE_0C_HOP_TILE
	RET	C
	LD	C,03h
	JR	START_HOPPER_MOVEMENT_PHASE

.loc_a1c2:
	LD	HL,00E0h
	CALL	PROBE_OBJ_TYPE_0C_HOP_TILE
	RET	C
	LD	C,02h

; Set OBJ_PHASE to C and clear OBJ_ACTION_TIMER, OBJ_WORK_0, and OBJ_WORK_1 to begin a
; hopper leap phase
START_HOPPER_MOVEMENT_PHASE:
	LD	(IX+OBJ_PHASE),C
	XOR	A
	LD	(IX+OBJ_ACTION_TIMER),A
	LD	(IX+OBJ_WORK_0),A
	LD	(IX+OBJ_WORK_1),A
	RET

; Check tile collision byte at offset (H, L) from object and return carry clear only for
; passable tiles (00h/20h)
PROBE_OBJ_TYPE_0C_HOP_TILE:
	LD	A,(IX+OBJ_Y)
	ADD	A,L
	LD	E,A
	LD	A,(IX+OBJ_X)
	ADD	A,H
	LD	D,A
	CALL	GET_RAW_TILE_COLLISION_BYTE
	CP	00h
	RET	Z
	CP	20h
	RET	Z
	SCF
	RET

; Enemy Object 11h AI phase 07h handler
OBJ11_PHASE_HANDLER_07:
	LD	HL,HOP_ARC_DOWN_8STEP_DY_TABLE
	JR	STEP_SHORT_VERTICAL_HOP_ARC

; Enemy Object 11h AI phase 06h handler
OBJ11_PHASE_HANDLER_06:
	LD	HL,HOP_ARC_UP_8STEP_DY_TABLE

; Advance an 8-frame short vertical hop along the Y-delta table in HL for OBJ_TYPE 0Fh
; phases 06h and 07h
STEP_SHORT_VERTICAL_HOP_ARC:
	LD	C,01h
	LD	A,(IX+OBJ_WORK_0)
	CP	08h
	JR	Z,FINISH_HOP_ARC_TO_LAND_PHASE
	JR	APPLY_SIGNED_HOP_Y_DELTA

; Enemy Object 11h AI phase 02h handler
OBJ11_PHASE_HANDLER_02:
	LD	HL,HOP_ARC_VERT_32STEP_DY_TABLE
	LD	B,20h
	JR	STEP_UPWARD_HOP_ARC

; Enemy Object 0Eh AI phase 02h handler
OBJ0E_PHASE_HANDLER_02:
	LD	HL,HOP_ARC_VERT_22STEP_DY_TABLE
	LD	B,16h

; Advance a B-frame upward hop along the Y-delta table in HL until OBJ_WORK_0 reaches B
STEP_UPWARD_HOP_ARC:
	LD	C,01h
	LD	A,(IX+OBJ_WORK_0)
	CP	B
	JR	Z,FINISH_HOP_ARC_TO_LAND_PHASE
	JR	APPLY_SIGNED_HOP_Y_DELTA

; Enemy Object 11h AI phase 03h handler
OBJ11_PHASE_HANDLER_03:
	LD	HL,HOP_ARC_VERT_32STEP_DY_TABLE
	LD	B,20h
	JR	STEP_DOWNWARD_HOP_ARC

; Enemy Object 0Eh AI phase 03h handler
OBJ0E_PHASE_HANDLER_03:
	LD	HL,HOP_ARC_VERT_22STEP_DY_TABLE
	LD	B,16h

; Advance a B-frame downward hop by reading the upward Y-delta table in HL in reverse and
; negating each step
STEP_DOWNWARD_HOP_ARC:
	LD	C,00h
	LD	A,(IX+OBJ_WORK_0)
	CP	B
	JR	Z,FINISH_HOP_ARC_TO_LAND_PHASE
	SUB	B
	NEG

; Increment hop frame counter, fetch Y delta at HL+A, optionally negate it per C, and add to
; OBJ_Y
APPLY_SIGNED_HOP_Y_DELTA:
	INC	(IX+OBJ_WORK_0)
	CALL	ADD_A_TO_HL
	LD	A,(HL)
	DEC	C
	JR	Z,ADD_A_TO_OBJECT_Y
	NEG

; Add signed vertical arc delta in A directly to the object integer Y coordinate
ADD_A_TO_OBJECT_Y:
	ADD	A,(IX+OBJ_Y)
	LD	(IX+OBJ_Y),A
	RET

; Transition a completed hop into landing cooldown phase 06h with OBJ_WORK_1=01h and a
; 4-frame timer
FINISH_HOP_ARC_TO_LAND_PHASE:
	LD	(IX+OBJ_PHASE),06h
	LD	(IX+OBJ_WORK_1),01h
	LD	(IX+OBJ_ACTION_TIMER),04h
	RET

; Enemy Object 11h AI phase 04h handler
OBJ11_PHASE_HANDLER_04:
	LD	DE,FD00h

; Step OBJ_X by fixed-point delta DE and advance the 32-frame parabolic Y arc for OBJ_TYPE
; 0Fh horizontal leaps
STEP_LONG_HORIZONTAL_HOP_ARC:
	CALL	ADD_DE_TO_OBJECT_X_POS
	LD	C,20h
	LD	HL,HOP_ARC_HORIZ_32STEP_DY_TABLE
	JR	ADVANCE_HORIZONTAL_HOP_Y_TABLE

; Enemy Object 0Eh AI phase 04h handler
OBJ0E_PHASE_HANDLER_04:
	LD	DE,FD80h

; Step OBJ_X by fixed-point delta DE and advance the 22-frame parabolic Y arc for OBJ_TYPE
; 0Ch horizontal hops
STEP_MEDIUM_HORIZONTAL_HOP_ARC:
	CALL	ADD_DE_TO_OBJECT_X_POS
	LD	C,16h
	LD	HL,HOP_ARC_HORIZ_22STEP_DY_TABLE

; Advance horizontal hop frame index up to limit C and apply the current parabolic Y-delta
; byte from HL
ADVANCE_HORIZONTAL_HOP_Y_TABLE:
	LD	A,(IX+OBJ_WORK_0)
	INC	(IX+OBJ_WORK_0)
	CP	C
	JR	Z,FINISH_HOP_ARC_TO_LAND_PHASE
	CALL	ADD_A_TO_HL
	LD	A,(HL)
	JR	ADD_A_TO_OBJECT_Y

; Enemy Object 11h AI phase 08h handler
OBJ11_PHASE_HANDLER_08:
	DEC	(IX+OBJ_X)

; Advance the 8-frame parabolic Y arc for OBJ_TYPE 0Fh 1-pixel/frame short horizontal hops
STEP_SHORT_HORIZONTAL_HOP_ARC:
	LD	C,08h
	LD	HL,HOP_ARC_HORIZ_8STEP_DY_TABLE
	JR	ADVANCE_HORIZONTAL_HOP_Y_TABLE

; Enemy Object 11h AI phase 09h handler
OBJ11_PHASE_HANDLER_09:
	INC	(IX+OBJ_X)
	JR	STEP_SHORT_HORIZONTAL_HOP_ARC

; Enemy Object 11h AI phase 05h handler
OBJ11_PHASE_HANDLER_05:
	LD	DE,0300h
	JR	STEP_LONG_HORIZONTAL_HOP_ARC

; Enemy Object 0Eh AI phase 05h handler
OBJ0E_PHASE_HANDLER_05:
	LD	DE,0280h
	JR	STEP_MEDIUM_HORIZONTAL_HOP_ARC

; 22-byte signed parabolic Y-delta table used during OBJ_TYPE 0Ch left and right hops
HOP_ARC_HORIZ_22STEP_DY_TABLE:
	DB	F7h,FBh,FCh,FCh,FEh,FEh,FEh,FEh,FFh,FFh,00h,00h,01h,01h,02h,02h
	DB	02h,02h,04h,04h,05h,09h

; 32-byte signed parabolic Y-delta table used during OBJ_TYPE 0Fh long left and right leaps
HOP_ARC_HORIZ_32STEP_DY_TABLE:
	DB	FAh,FCh,FDh,FDh,FEh,FDh,FEh,FEh,FEh,FFh,FFh,FFh,FFh,00h,FFh,00h
	DB	00h,01h,00h,01h,01h,01h,01h,02h,02h,02h,03h,02h,03h,03h,04h,06h

; 22-byte signed Y-delta table summing to -32 pixels for OBJ_TYPE 0Ch upward and reversed
; downward hops
HOP_ARC_VERT_22STEP_DY_TABLE:
	DB	F8h,FAh,FBh,FCh,FEh,FEh,FEh,FEh,FEh,FEh,FEh,FEh,FFh,FFh,FFh,FFh
	DB	FFh,00h,01h,02h,02h,02h

; 32-byte signed Y-delta table summing to -96 pixels for OBJ_TYPE 0Fh long upward and
; reversed downward leaps
HOP_ARC_VERT_32STEP_DY_TABLE:
	DB	F8h,F9h,F9h,FAh,FAh,FAh,FBh,FBh,FBh,FBh,FBh,FBh,FCh,FCh,FCh,FCh
	DB	FCh,FDh,FDh,FDh,FDh,FDh,FDh,FEh,FFh,00h,01h,02h,02h,03h,03h,04h

; 8-byte signed parabolic Y-delta table used during OBJ_TYPE 0Fh short left and right hops
HOP_ARC_HORIZ_8STEP_DY_TABLE:
	DB	FCh,FEh,FFh,00h,00h,01h,02h,04h

; 8-byte signed Y-delta table used during OBJ_TYPE 0Fh short upward hops (phase 06h)
HOP_ARC_UP_8STEP_DY_TABLE:
	DB	FAh,FBh,FBh,FDh,FEh,00h,03h,03h

; 8-byte signed Y-delta table used during OBJ_TYPE 0Fh short downward hops (phase 07h)
HOP_ARC_DOWN_8STEP_DY_TABLE:
	DB	FDh,FDh,00h,02h,03h,05h,05h,06h

; Mobile route spawn-stream group 07h pre-spawn handler
SPAWN_GROUP_HANDLER_07:
	LD	HL,SPAWN_GROUP_07_OBJ_0D_DESC
	JP	INIT_SPAWN_QUEUE_AND_UNPACK_X_PARAM	; asm/banks/bank02.asm

; 6-byte spawn group descriptor used by SPAWN_GROUP_HANDLER_07 to spawn an OBJ_TYPE 0Dh
; emerging dasher enemy
SPAWN_GROUP_07_OBJ_0D_DESC:
	DB	01h,01h,00h,0Dh,20h,00h

; Spawn initializer for runtime gameplay object type 0Dh
OBJ_INIT_TYPE_0D:
	LD	BC,2020h
	CALL	DESPAWN_IF_WITHIN_BC_OF_GAO
	LD	HL,OBJ_TYPE_0D_HITBOX
	CALL	SET_OBJECT_HITBOX_FROM_HL
	LD	(IX+OBJ_SPRITE_POSE),19h
	LD	(IX+OBJ_ACTION_TIMER),08h
	LD	DE,0000h
	LD	(IX+OBJ_WORK_0),D
	CALL	STEP_OBJECT_XY_BY_VELOCITY
	JP	SET_OBJECT_VEL_X_FROM_DE	; asm/banks/bank01.asm

; 4-byte 16x16 bounding-box preset (-15, -8, 16x16) for OBJ_TYPE 0Dh emerging dasher enemies
OBJ_TYPE_0D_HITBOX:
	DB	EDh,F5h,18h,15h

; Per-frame update handler for runtime gameplay object type 0Dh
OBJ_UPDATE_TYPE_0D:
	LD	A,(IX+OBJ_PHASE)
	DEC	A
	JR	Z,.loc_a36f
	RET	P
	LD	(IX+OBJ_COLLISION_CLASS),03h
	CALL	APPLY_VERTICAL_SCROLL_TO_OBJECT_Y
	DEC	(IX+OBJ_ACTION_TIMER)
	RET	NZ
	BIT	00h,(IX+OBJ_WORK_0)
	JR	NZ,.loc_a362
	INC	(IX+OBJ_WORK_0)
	LD	BC,1808h
	JR	.loc_a368

.loc_a362:
	INC	(IX+OBJ_PHASE)
	LD	BC,1710h

.loc_a368:
	LD	(IX+OBJ_SPRITE_POSE),B
	LD	(IX+OBJ_ACTION_TIMER),C
	RET

.loc_a36f:
	LD	(IX+OBJ_COLLISION_CLASS),00h
	CALL	APPLY_VERTICAL_SCROLL_TO_OBJECT_Y
	DEC	(IX+OBJ_ACTION_TIMER)
	RET	NZ
	INC	(IX+OBJ_PHASE)
	LD	A,A0h
	JP	AIM_OBJECT_VELOCITY_TOWARD_GAO	; asm/banks/bank01.asm

; Spawn initializer for runtime gameplay object type 0Eh
OBJ_INIT_TYPE_0E:
	LD	HL,OBJ_TYPE_0E_HITBOX
	CALL	SET_OBJECT_HITBOX_FROM_HL
	BIT	07h,(IX+OBJ_X)
	LD	A,00h
	JR	Z,.loc_a391
	INC	A

.loc_a391:
	LD	(IX+OBJ_WORK_0),A
	LD	B,30h
	CALL	RELOAD_RANDOM_ENEMY_SHOT_TIMER
	LD	HL,OBJ_TYPE_0E_KINEMATIC_PARAMS
	JP	COPY_OBJECT_KINEMATIC_PARAMS_HL	; asm/banks/bank01.asm

; 11-byte initial kinematic parameter template for OBJ_TYPE 0Eh looping flyers (Y velocity
; -0200h, pose 32h, timer 38h)
OBJ_TYPE_0E_KINEMATIC_PARAMS:
	DB	00h,FCh,00h,00h,00h,00h,00h,00h,00h,1Ah,20h

; 4-byte 16x16 bounding-box preset (-15, -8, 16x16) for OBJ_TYPE 0Eh looping flyer enemies
OBJ_TYPE_0E_HITBOX:
	DB	EDh,F5h,18h,15h

; Per-frame update handler for runtime gameplay object type 0Eh
OBJ_UPDATE_TYPE_0E:
	LD	BC,1A08h
	CALL	TOGGLE_OBJECT_TWO_FRAME_POSE
	LD	B,30h
	CALL	TICK_ENEMY_SHOT_TIMER_AND_FIRE
	LD	A,(IX+OBJ_PHASE)
	DEC	A
	JR	Z,.loc_a3ea
	RET	P
	DEC	(IX+OBJ_ACTION_TIMER)
	RET	NZ
	INC	(IX+OBJ_PHASE)
	LD	(IX+OBJ_ANIM_TIMER),00h
	LD	(IX+OBJ_ACTION_TIMER),30h
	LD	(IX+OBJ_WORK_1),80h
	LD	A,(IX+OBJ_Y)
	LD	(IX+OBJ_LINK_PTR_LO),A
	BIT	00h,(IX+OBJ_WORK_0)
	LD	A,40h
	JR	Z,.loc_a3e3
	LD	A,C0h

.loc_a3e3:
	ADD	A,(IX+OBJ_X)
	LD	(IX+OBJ_LINK_PTR_HI),A
	RET

.loc_a3ea:
	CALL	SET_OBJ_TYPE_0E_CIRCULAR_VELOCITY
	LD	A,(FRAME_COUNTER)
	AND	03h
	RET	NZ
	DEC	(IX+OBJ_ACTION_TIMER)
	RET	NZ
	INC	(IX+OBJ_PHASE)
	LD	(IX+OBJ_ANIM_TIMER),01h
	LD	DE,0000h
	CALL	SET_OBJECT_VEL_X_FROM_DE
	LD	DE,FC00h
	JP	STEP_OBJECT_XY_BY_VELOCITY	; asm/banks/bank01.asm

; Compute 8.8 fixed-point circular X and Y velocities from 6-bit angle A for OBJ_TYPE 0Eh
; loop motion
SET_OBJ_TYPE_0E_CIRCULAR_VELOCITY:
	LD	A,04h
	ADD	A,(IX+OBJ_WORK_1)
	LD	(IX+OBJ_WORK_1),A
	CALL	CALC_6BIT_ANGLE_SINE_DE
	ADD	A,(IX+OBJ_LINK_PTR_LO)
	LD	(IX+OBJ_Y),A
	BIT	00h,(IX+OBJ_WORK_0)
	LD	A,40h
	JR	Z,.loc_a425
	LD	A,C0h

.loc_a425:
	ADD	A,(IX+OBJ_WORK_1)
	CALL	CALC_6BIT_ANGLE_SINE_DE
	ADD	A,(IX+OBJ_LINK_PTR_HI)
	LD	(IX+OBJ_X),A
	RET

; Evaluate a signed 16-bit sine value in DE from 6-bit angle A by folding quadrants across
; QUARTER_WAVE_SINE_64_LUT
CALC_6BIT_ANGLE_SINE_DE:
	LD	C,A
	BIT	06h,A
	JR	Z,.loc_a438
	CPL

.loc_a438:
	AND	3Fh
	LD	HL,QUARTER_WAVE_SINE_64_LUT
	CALL	ADD_A_TO_HL
	LD	A,(HL)
	SRL	A
	SRL	A
	BIT	07h,C
	RET	Z
	NEG
	RET

; Mobile route spawn-stream group 08h pre-spawn handler
SPAWN_GROUP_HANDLER_08:
	LD	HL,SPAWN_GROUP_08_OBJ_0F_DESC
	JP	INIT_SPAWN_QUEUE_AND_UNPACK_X_PARAM	; asm/banks/bank02.asm

; 6-byte spawn group descriptor used by SPAWN_GROUP_HANDLER_08 to spawn an OBJ_TYPE 0Fh
; perch-leaping enemy
SPAWN_GROUP_08_OBJ_0F_DESC:
	DB	01h,01h,00h,0Fh,00h,00h

; Spawn initializer for runtime gameplay object type 0Fh
OBJ_INIT_TYPE_0F:
	CALL	INIT_STANDARD_ENEMY_DEFAULTS
	LD	HL,OBJ_TYPE_0F_HITBOX
	CALL	SET_OBJECT_HITBOX_FROM_HL
	CALL	RELOAD_OBJ_TYPE_0F_SHOT_TIMER
	LD	HL,OBJ_TYPE_0F_KINEMATIC_PARAMS
	JP	COPY_OBJECT_KINEMATIC_PARAMS_HL	; asm/banks/bank01.asm

; Reload OBJ_TYPE 0Fh rank-scaled projectile countdown timer in OBJ_BURST_CNT from
; COLLECTED_PIECE_FLAGS
RELOAD_OBJ_TYPE_0F_SHOT_TIMER:
	LD	A,(COLLECTED_PIECE_FLAGS)
	SRL	A
	SUB	17h
	NEG
	LD	(IX+OBJ_BURST_CNT),A
	RET

; 11-byte initial kinematic parameter template for OBJ_TYPE 0Fh perch leapers (Y velocity
; +0100h, pose 1Ch, timer 14h)
OBJ_TYPE_0F_KINEMATIC_PARAMS:
	DB	00h,01h,00h,00h,00h,00h,00h,00h,00h,1Ch,14h

; 4-byte bounding-box preset (-35, -11, 40x21) for OBJ_TYPE 0Fh perch-leaping enemies
OBJ_TYPE_0F_HITBOX:
	DB	DDh,F5h,28h,15h

; Per-frame update handler for runtime gameplay object type 0Fh
OBJ_UPDATE_TYPE_0F:
	CALL	TICK_OBJ_TYPE_0F_SHOT_TIMER
	CALL	UPDATE_OBJ_TYPE_0F_SPRITE_POSE
	CALL	UPDATE_OBJ_TYPE_0F_LEAP_COLLISION
	LD	HL,CHECK_OBJ_TYPE_0F_LEAP_LANDED
	LD	A,(IX+OBJ_PHASE)
	CP	02h
	JR	C,.loc_a499
	PUSH	HL

.loc_a499:
	CALL	INLINE_WORD_DISPATCH

; 10-entry inline DW dispatch table for Object 11h behaviour phases
OBJ_TYPE_11_PHASE_TABLE:
	DW	OBJ0E_PHASE_HANDLER_00	; [00h]
	DW	OBJ11_PHASE_HANDLER_01	; [01h]
	DW	OBJ11_PHASE_HANDLER_02	; [02h]
	DW	OBJ11_PHASE_HANDLER_03	; [03h]
	DW	OBJ11_PHASE_HANDLER_04	; [04h]
	DW	OBJ11_PHASE_HANDLER_05	; [05h]
	DW	OBJ11_PHASE_HANDLER_06	; [06h]
	DW	OBJ11_PHASE_HANDLER_07	; [07h]
	DW	OBJ11_PHASE_HANDLER_08	; [08h]
	DW	OBJ11_PHASE_HANDLER_09	; [09h]

; Disable contact damage against Gao during mid-air window of OBJ_TYPE 0Fh long leaps and
; restore collision on landing
UPDATE_OBJ_TYPE_0F_LEAP_COLLISION:
	LD	A,(IX+OBJ_PHASE)
	SUB	02h
	CP	04h
	JR	NC,.loc_a4c7
	LD	A,(IX+OBJ_WORK_0)
	SUB	04h
	CP	18h
	JR	NC,.loc_a4c7
	SET	00h,(IX+OBJ_COLLISION_CLASS)
	RET

.loc_a4c7:
	XOR	A
	LD	(IX+OBJ_COLLISION_CLASS),A
	RET

; Set OBJ_TYPE 0Fh sprite pose to perched (1Ch) in idle phases 00h..01h or airborne (1Dh)
; during leap phases
UPDATE_OBJ_TYPE_0F_SPRITE_POSE:
	LD	C,1Ch
	LD	A,(IX+OBJ_PHASE)
	CP	02h
	JR	C,.loc_a4d7
	LD	C,1Dh

.loc_a4d7:
	LD	(IX+OBJ_SPRITE_POSE),C
	RET

; Decrement OBJ_TYPE 0Fh active shot timer, fire an auxiliary projectile with proximity
; check on expiry, and reload timer
TICK_OBJ_TYPE_0F_SHOT_TIMER:
	LD	A,(IX+OBJ_PHASE)
	RET	Z
	DEC	(IX+OBJ_BURST_CNT)
	RET	NZ
	PUSH	IX
	CALL	SPAWN_AUX_SHOT_WITH_PROXIMITY_CHK
	POP	IX
	JP	RELOAD_OBJ_TYPE_0F_SHOT_TIMER

; Reset OBJ_TYPE 0Fh to perched wait phase 00h with a 4-frame timer once OBJ_WORK_1 signals
; leap completion
CHECK_OBJ_TYPE_0F_LEAP_LANDED:
	LD	A,(IX+OBJ_WORK_1)
	AND	A
	RET	Z
	LD	(IX+OBJ_PHASE),00h
	LD	(IX+OBJ_ACTION_TIMER),04h
	RET

; Enemy Object 11h AI phase 01h handler
OBJ11_PHASE_HANDLER_01:
	LD	BC,0000h
	LD	A,(GAO_POS_Y)
	SUB	(IX+OBJ_Y)
	JR	NC,.loc_a508
	NEG

.loc_a508:
	LD	E,A
	LD	A,(GAO_POS_X)
	SUB	(IX+OBJ_X)
	JR	NC,.loc_a513
	NEG

.loc_a513:
	CP	E
	JR	C,.loc_a520
	CALL	OBJ_TYPE_0F_TRY_HORIZONTAL_LEAP
	RET	NC
	CALL	OBJ_TYPE_0F_TRY_VERTICAL_LEAP
	RET	NC
	JR	OBJ_TYPE_0F_TRY_RANDOM_LEAP

.loc_a520:
	CALL	OBJ_TYPE_0F_TRY_VERTICAL_LEAP
	RET	NC
	CALL	OBJ_TYPE_0F_TRY_HORIZONTAL_LEAP
	RET	NC
	JR	OBJ_TYPE_0F_TRY_RANDOM_LEAP

; Test right or left perch landing tiles and initiate the matching OBJ_TYPE 0Fh horizontal
; leap phase if found
OBJ_TYPE_0F_TRY_HORIZONTAL_LEAP:
	LD	A,(GAO_POS_X)
	CP	(IX+OBJ_Y)
	JR	C,.loc_a53c
	LD	A,03h
	CALL	PROBE_OBJ_TYPE_0F_PERCH_DISTANCES
	RET	C
	LD	C,05h
	JR	OBJ_TYPE_0F_BEGIN_SELECTED_LEAP

.loc_a53c:
	LD	A,02h
	CALL	PROBE_OBJ_TYPE_0F_PERCH_DISTANCES
	RET	C
	LD	C,04h
	JR	OBJ_TYPE_0F_BEGIN_SELECTED_LEAP

; Test downward or upward perch landing tiles and initiate the matching OBJ_TYPE 0Fh
; vertical leap phase if found
OBJ_TYPE_0F_TRY_VERTICAL_LEAP:
	LD	A,(GAO_POS_Y)
	CP	(IX+OBJ_Y)
	JR	C,.loc_a558
	LD	A,01h
	CALL	PROBE_OBJ_TYPE_0F_PERCH_DISTANCES
	RET	C
	LD	C,03h
	JR	OBJ_TYPE_0F_BEGIN_SELECTED_LEAP

.loc_a558:
	XOR	A
	CALL	PROBE_OBJ_TYPE_0F_PERCH_DISTANCES
	RET	C
	LD	C,02h

; Combine directional base phase C with long/short offset A, start OBJ_TYPE 0Fh leap phase,
; and return carry clear
OBJ_TYPE_0F_BEGIN_SELECTED_LEAP:
	ADD	A,C
	LD	C,A
	CALL	START_HOPPER_MOVEMENT_PHASE
	XOR	A
	RET

; Probe all four cardinal directions in a pseudo-random permutation for a valid perch tile,
; or pause 8 frames if blocked
OBJ_TYPE_0F_TRY_RANDOM_LEAP:
	LD	A,R
	AND	0Ch
	LD	HL,OBJ_TYPE_0F_DIR_PERMUTATION_TABLE
	CALL	ADD_A_TO_HL
	LD	B,04h

.loc_a572:
	PUSH	HL
	PUSH	BC
	LD	A,(HL)
	CALL	PROBE_OBJ_TYPE_0F_PERCH_DISTANCES
	POP	BC
	POP	HL
	JR	NC,.loc_a588
	INC	HL
	DJNZ	.loc_a572
	LD	(IX+OBJ_PHASE),00h
	LD	(IX+OBJ_ACTION_TIMER),08h
	RET

.loc_a588:
	LD	C,(HL)
	INC	C
	INC	C
	JR	OBJ_TYPE_0F_BEGIN_SELECTED_LEAP

; 16-byte table of four 4-direction search permutations indexed via R & 0Ch for OBJ_TYPE 0Fh
; fallback leaps
OBJ_TYPE_0F_DIR_PERMUTATION_TABLE:
	DB	00h,01h,02h,03h,03h,01h,02h,00h,01h,03h,00h,02h,02h,00h,03h,01h

; Probe direction A for a perch tile (28h) at 96 pixels (returning A=00h) and then 16 pixels
; (returning A=04h)
PROBE_OBJ_TYPE_0F_PERCH_DISTANCES:
	LD	(SHARED_WORK_BUFFER),A
	LD	C,60h
	CALL	CHECK_PERCH_TILE_AT_DIR_DIST
	LD	A,00h
	RET	NC
	LD	A,(SHARED_WORK_BUFFER)
	LD	C,10h
	CALL	CHECK_PERCH_TILE_AT_DIR_DIST
	LD	A,04h
	RET

; Offset object coordinates by distance C in cardinal direction A and return carry clear
; only if target tile type is 28h
CHECK_PERCH_TILE_AT_DIR_DIST:
	CALL	OFFSET_OBJECT_COORDS_BY_DIR_DIST
	RET	C
	CALL	GET_RAW_TILE_COLLISION_BYTE
	CP	28h
	RET	Z
	SCF
	RET

; Compute target coordinates (D=X, E=Y) stepped by distance C in cardinal direction A (0=up,
; 1=down, 2=left, 3=right)
OFFSET_OBJECT_COORDS_BY_DIR_DIST:
	LD	E,(IX+OBJ_Y)
	LD	D,(IX+OBJ_X)
	DEC	A
	JR	Z,.loc_a5d2
	DEC	A
	JR	Z,.loc_a5d9
	DEC	A
	JR	Z,.loc_a5dd
	LD	A,E
	SUB	C
	LD	E,A
	RET

.loc_a5d2:
	LD	A,E
	ADD	A,C
	LD	E,A
	CP	D0h
	CCF
	RET

.loc_a5d9:
	LD	A,D
	SUB	C
	LD	D,A
	RET

.loc_a5dd:
	LD	A,D
	ADD	A,C
	LD	D,A
	RET

; Mobile route spawn-stream group 09h pre-spawn handler
SPAWN_GROUP_HANDLER_09:
	LD	A,(IX+OBJ_ANIM_TIMER)
	LD	D,A
	LD	E,00h
	LD	B,04h

.loc_a5e9:
	PUSH	BC
	PUSH	DE
	LD	C,10h
	CALL	SPAWN_GAMEPLAY_OBJECT_TYPE_A
	POP	DE
	LD	A,D
	ADD	A,10h
	LD	D,A
	POP	BC
	DJNZ	.loc_a5e9
	RET

; Spawn initializer for runtime gameplay object type 08h
OBJ_INIT_TYPE_08:
	RET

; Per-frame update handler for runtime gameplay object type 08h
OBJ_UPDATE_TYPE_08:
	RET

; Spawn initializer for runtime gameplay object type 10h
OBJ_INIT_TYPE_10:
	LD	HL,OBJ_TYPE_10_HITBOX
	CALL	SET_INTANGIBLE_OBJECT_HITBOX_HL
	LD	(IX+OBJ_ANIM_TIMER),00h
	IF	HINOTORI_ENHANCED = 00h
	LD	A,(IX+OBJ_EXTENT_Y)
	ENDIF
	LD	(IX+OBJ_EXTENT_Y),00h

; Reset an OBJ_TYPE 10h pop-up turret to its retracted intangible state (pose 21h, collision
; class 03h, timer 1Eh)
RESET_OBJ_TYPE_10_HIDDEN_STATE:
	XOR	A
	LD	(IX+OBJ_SPRITE_POSE),21h
	LD	(IX+OBJ_COLLISION_MODE),A
	LD	(IX+OBJ_WORK_0),01h
	LD	(IX+OBJ_PART0_SPRITE_LO),A
	LD	(IX+OBJ_PART1_DX),A
	LD	(IX+OBJ_COLLISION_CLASS),03h
	LD	(IX+OBJ_ACTION_TIMER),1Eh
	RET

; 4-byte bounding-box preset (-19, -11, 24x21) for OBJ_TYPE 10h pop-up turret enemies
OBJ_TYPE_10_HITBOX:
	DB	EDh,F5h,18h,15h

; Per-frame update handler for runtime gameplay object type 10h
OBJ_UPDATE_TYPE_10:
	CALL	APPLY_VERTICAL_SCROLL_TO_OBJECT_Y
	LD	A,(IX+OBJ_PHASE)
	DEC	A
	JR	Z,.loc_a64d
	DEC	A
	JR	Z,.loc_a665
	DEC	A
	JR	Z,.loc_a677
	JP	P,.loc_a68a
	DEC	(IX+OBJ_ACTION_TIMER)
	RET	NZ
	LD	(IX+OBJ_COLLISION_MODE),01h
	LD	(IX+OBJ_ACTION_TIMER),04h
	INC	(IX+OBJ_PHASE)
	RET

.loc_a64d:
	DEC	(IX+OBJ_ACTION_TIMER)
	RET	NZ
	LD	(IX+OBJ_COLLISION_CLASS),00h
	CALL	APPLY_OBJ_TYPE_10_POPUP_POSE
	INC	(IX+OBJ_WORK_0)
	LD	A,(IX+OBJ_WORK_0)
	CP	04h
	RET	C
	INC	(IX+OBJ_PHASE)
	RET

.loc_a665:
	DEC	(IX+OBJ_ACTION_TIMER)
	RET	NZ
	INC	(IX+OBJ_PHASE)
	LD	(IX+OBJ_ACTION_TIMER),08h
	LD	(IX+OBJ_WORK_0),02h
	JP	SPAWN_DEFAULT_ENEMY_AUX_SHOT	; asm/banks/bank01.asm

.loc_a677:
	DEC	(IX+OBJ_ACTION_TIMER)
	RET	NZ
	CALL	APPLY_OBJ_TYPE_10_POPUP_POSE
	DEC	(IX+OBJ_WORK_0)
	RET	P
	LD	(IX+OBJ_COLLISION_CLASS),03h
	INC	(IX+OBJ_PHASE)
	RET

.loc_a68a:
	DEC	(IX+OBJ_ACTION_TIMER)
	RET	NZ
	CALL	RESET_OBJ_TYPE_10_HIDDEN_STATE
	LD	(IX+OBJ_PHASE),00h
	RET

; Load OBJ_TYPE 10h current pop-up/retract animation pose from OBJ_WORK_0 and set a 4-frame
; step timer
APPLY_OBJ_TYPE_10_POPUP_POSE:
	LD	HL,OBJ_TYPE_10_POPUP_POSE_TABLE
	LD	A,(IX+OBJ_WORK_0)
	CALL	ADD_A_TO_HL
	LD	A,(HL)
	LD	(IX+OBJ_SPRITE_POSE),A
	LD	(IX+OBJ_ACTION_TIMER),04h
	RET

; 4-byte sprite pose table (21h..1Eh) stepping OBJ_TYPE 10h between retracted and fully
; emerged turret frames
OBJ_TYPE_10_POPUP_POSE_TABLE:
	DB	21h,20h,1Fh,1Eh

; Mobile route spawn-stream group 0Ah pre-spawn handler
SPAWN_GROUP_HANDLER_0A:
	LD	HL,SPAWN_GROUP_0A_OBJ_11_DESC
	JP	INIT_SPAWN_QUEUE_AND_UNPACK_X_PARAM	; asm/banks/bank02.asm

; 6-byte spawn group descriptor used by SPAWN_GROUP_HANDLER_0A to spawn an OBJ_TYPE 11h
; cardinal crawler enemy
SPAWN_GROUP_0A_OBJ_11_DESC:
	DB	01h,01h,00h,11h,00h,00h

; Spawn initializer for runtime gameplay object type 11h
OBJ_INIT_TYPE_11:
	CALL	INIT_STANDARD_ENEMY_DEFAULTS
	LD	HL,OBJ_TYPE_11_HITBOX
	CALL	SET_OBJECT_HITBOX_FROM_HL
	LD	HL,OBJ_TYPE_11_KINEMATIC_PARAMS
	CALL	COPY_OBJECT_KINEMATIC_PARAMS_HL
	LD	(IX+OBJ_ANIM_TIMER),01h
	LD	B,20h
	JP	RELOAD_RANDOM_ENEMY_SHOT_TIMER	; asm/banks/bank01.asm

; 11-byte initial kinematic parameter template for OBJ_TYPE 11h cardinal crawlers (Y
; velocity +0180h, pose 22h, timer 10h)
OBJ_TYPE_11_KINEMATIC_PARAMS:
	DB	80h,01h,00h,00h,00h,00h,00h,00h,00h,22h,10h

; 4-byte bounding-box preset (-19, -11, 24x21) for OBJ_TYPE 11h cardinal crawler enemies
OBJ_TYPE_11_HITBOX:
	DB	EDh,F5h,18h,15h

; Per-frame update handler for runtime gameplay object type 11h
OBJ_UPDATE_TYPE_11:
	LD	BC,2208h
	CALL	TOGGLE_OBJECT_TWO_FRAME_POSE
	CALL	TICK_OBJ_TYPE_11_SHOT_COOLDOWN
	XOR	A
	CP	(IX+OBJ_ANIM_TIMER)
	JR	Z,.loc_a6f3
	CP	(IX+OBJ_VEL_Y_HI)
	JR	NZ,.loc_a6f6

.loc_a6f3:
	CALL	APPLY_VERTICAL_SCROLL_TO_OBJECT_Y

.loc_a6f6:
	LD	A,(IX+OBJ_PHASE)
	CALL	INLINE_WORD_DISPATCH

; 3-entry inline DW dispatch table for Object 13h behaviour phases
OBJ_TYPE_13_PHASE_TABLE:
	DW	OBJ13_PHASE_HANDLER_00	; [00h]
	DW	OBJ13_PHASE_HANDLER_01	; [01h]
	DW	OBJ13_PHASE_HANDLER_02	; [02h]

; Enemy Object 13h AI phase 00h handler
OBJ13_PHASE_HANDLER_00:
	DEC	(IX+OBJ_ACTION_TIMER)
	RET	NZ
	LD	(IX+OBJ_ACTION_TIMER),20h
	LD	(IX+OBJ_ATTACK_WAVE_IDX),00h
	JR	ADVANCE_OBJ_TYPE_11_PHASE

; Enemy Object 13h AI phase 01h handler
OBJ13_PHASE_HANDLER_01:
	LD	(IX+OBJ_ANIM_TIMER),00h
	LD	(IX+OBJ_ACTION_TIMER),20h
	CALL	SELECT_OBJ_TYPE_11_CRAWL_DIR
	JR	ADVANCE_OBJ_TYPE_11_PHASE

; Increment OBJ_PHASE for OBJ_TYPE 11h to advance to the next crawler state
ADVANCE_OBJ_TYPE_11_PHASE:
	INC	(IX+OBJ_PHASE)
	RET

; Decrement OBJ_PHASE from movement phase 02h back to direction-selection phase 01h for
; OBJ_TYPE 11h
REWIND_OBJ_TYPE_11_TO_TURN_PHASE:
	DEC	(IX+OBJ_PHASE)
	RET
	IF	HINOTORI_ENHANCED = 00h

; Unreferenced helper resetting (IX+OBJ_PHASE) to 00h
UNUSED_RESET_OBJ_PHASE_ZERO:
	XOR	A
	LD	(IX+OBJ_PHASE),A
	RET
	ENDIF

; Advance OBJ_TYPE 11h 2-bit turn-selection counter in OBJ_ATTACK_WAVE_IDX modulo 4
STEP_OBJ_TYPE_11_TURN_CYCLE:
	LD	A,(IX+OBJ_ATTACK_WAVE_IDX)
	INC	A
	AND	03h
	LD	(IX+OBJ_ATTACK_WAVE_IDX),A
	RET

; Decrement OBJ_TYPE 11h shot cooldown and fire a default auxiliary projectile toward Gao
; when it expires
TICK_OBJ_TYPE_11_SHOT_COOLDOWN:
	DEC	(IX+OBJ_SHOT_COOLDOWN)
	RET	NZ
	LD	B,30h
	CALL	RELOAD_RANDOM_ENEMY_SHOT_TIMER
	JP	SPAWN_DEFAULT_ENEMY_AUX_SHOT	; asm/banks/bank01.asm

; Enemy Object 13h AI phase 02h handler
OBJ13_PHASE_HANDLER_02:
	CALL	PROBE_OBJ_TYPE_11_WALL_AHEAD
	JR	C,REWIND_OBJ_TYPE_11_TO_TURN_PHASE
	DEC	(IX+OBJ_ACTION_TIMER)
	JR	Z,REWIND_OBJ_TYPE_11_TO_TURN_PHASE
	RET

; Choose OBJ_TYPE 11h next cardinal velocity vector, steering toward Gao every fourth turn
; and pseudo-randomly otherwise
SELECT_OBJ_TYPE_11_CRAWL_DIR:
	CALL	STEP_OBJ_TYPE_11_TURN_CYCLE
	LD	A,(IX+OBJ_ATTACK_WAVE_IDX)
	OR	A
	JR	NZ,DISPATCH_OBJ_TYPE_11_RANDOM_DIR
	CALL	OBJ14_PHASE_HANDLER_07
	RET	NZ
	CALL	OBJ14_PHASE_HANDLER_06
	RET	NZ
	JR	OBJ14_PHASE_HANDLER_07

; Enemy Object 14h AI phase 07h handler
OBJ14_PHASE_HANDLER_07:
	CALL	COMPARE_GAO_X_WITH_OBJECT_X
	RET	Z
	JR	NC,.loc_a76a
	CALL	OBJ14_PHASE_HANDLER_02
	OR	01h
	RET

.loc_a76a:
	CALL	OBJ14_PHASE_HANDLER_00
	OR	01h
	RET

; Enemy Object 14h AI phase 06h handler
OBJ14_PHASE_HANDLER_06:
	CALL	COMPARE_GAO_Y_WITH_OBJECT_Y
	RET	Z
	JR	NC,.loc_a77c
	CALL	OBJ14_PHASE_HANDLER_05
	OR	01h
	RET

.loc_a77c:
	CALL	OBJ14_PHASE_HANDLER_04
	OR	01h
	RET

; Select a pseudo-random 3-bit index and dispatch through OBJ_TYPE 11h 8-entry cardinal
; direction table
DISPATCH_OBJ_TYPE_11_RANDOM_DIR:
	CALL	NEXT_PSEUDO_RANDOM_BYTE
	AND	07h
	CALL	INLINE_WORD_DISPATCH

; 8-entry inline DW dispatch table for Object 14h behaviour phases
OBJ_TYPE_14_PHASE_TABLE:
	DW	OBJ14_PHASE_HANDLER_00	; [00h]
	DW	OBJ14_PHASE_HANDLER_00	; [01h]
	DW	OBJ14_PHASE_HANDLER_02	; [02h]
	DW	OBJ14_PHASE_HANDLER_02	; [03h]
	DW	OBJ14_PHASE_HANDLER_04	; [04h]
	DW	OBJ14_PHASE_HANDLER_05	; [05h]
	DW	OBJ14_PHASE_HANDLER_06	; [06h]
	DW	OBJ14_PHASE_HANDLER_07	; [07h]

; Enemy Object 14h AI phase 05h handler
OBJ14_PHASE_HANDLER_05:
	LD	HL,OBJ_TYPE_11_VEL_UP_VECTOR
	JR	LOAD_OBJ_TYPE_11_CARDINAL_VEL

; Enemy Object 14h AI phase 04h handler
OBJ14_PHASE_HANDLER_04:
	LD	HL,OBJ_TYPE_11_VEL_DOWN_VECTOR
	JR	LOAD_OBJ_TYPE_11_CARDINAL_VEL

; Enemy Object 14h AI phase 00h handler
OBJ14_PHASE_HANDLER_00:
	LD	HL,OBJ_TYPE_11_VEL_RIGHT_VECTOR
	JR	LOAD_OBJ_TYPE_11_CARDINAL_VEL

; Enemy Object 14h AI phase 02h handler
OBJ14_PHASE_HANDLER_02:
	LD	HL,OBJ_TYPE_11_VEL_LEFT_VECTOR

; Load 16-bit X and Y velocities from the 4-byte cardinal vector at HL into OBJ_VEL_X and
; OBJ_VEL_Y
LOAD_OBJ_TYPE_11_CARDINAL_VEL:
	LD	E,(HL)
	INC	HL
	LD	D,(HL)
	INC	HL
	PUSH	HL
	CALL	SET_OBJECT_VEL_X_FROM_DE
	POP	HL
	LD	E,(HL)
	INC	HL
	LD	D,(HL)
	JP	STEP_OBJECT_XY_BY_VELOCITY	; asm/banks/bank01.asm

; 4-byte cardinal velocity vector (VEL_X=0000h, VEL_Y=-0200h) moving OBJ_TYPE 11h upward at
; 2 pixels/frame
OBJ_TYPE_11_VEL_UP_VECTOR:
	DB	00h,00h,00h,FEh

; 4-byte cardinal velocity vector (VEL_X=0000h, VEL_Y=+0200h) moving OBJ_TYPE 11h downward
; at 2 pixels/frame
OBJ_TYPE_11_VEL_DOWN_VECTOR:
	DB	00h,00h,00h,02h

; 4-byte cardinal velocity vector (VEL_X=+0200h, VEL_Y=0000h) moving OBJ_TYPE 11h right at 2
; pixels/frame
OBJ_TYPE_11_VEL_RIGHT_VECTOR:
	DB	00h,02h,00h,00h

; 4-byte cardinal velocity vector (VEL_X=-0200h, VEL_Y=0000h) moving OBJ_TYPE 11h left at 2
; pixels/frame
OBJ_TYPE_11_VEL_LEFT_VECTOR:
	DB	00h,FEh,00h,00h

; Test both leading corner offsets ahead of OBJ_TYPE 11h for solid terrain collision and
; clear OBJ_ANIM_TIMER if blocked
PROBE_OBJ_TYPE_11_WALL_AHEAD:
	LD	(IX+OBJ_ANIM_TIMER),01h
	LD	B,08h
	LD	A,(IX+OBJ_VEL_Y_HI)
	ADD	A,B
	LD	L,A
	LD	A,(IX+OBJ_VEL_X_HI)
	ADD	A,B
	LD	H,A
	LD	E,(IX+OBJ_Y)
	LD	D,(IX+OBJ_X)
	ADD	HL,DE
	PUSH	DE
	EX	DE,HL
	CALL	GET_TILE_COLLISION_LOW_CLASS
	POP	DE
	JR	C,.loc_a7fc
	LD	B,F8h
	LD	A,(IX+OBJ_VEL_Y_HI)
	ADD	A,B
	LD	L,A
	LD	A,(IX+OBJ_VEL_X_HI)
	ADD	A,B
	LD	H,A
	ADD	HL,DE
	EX	DE,HL
	CALL	GET_TILE_COLLISION_LOW_CLASS
	RET	NC

.loc_a7fc:
	XOR	A
	LD	(IX+OBJ_ANIM_TIMER),A
	SCF
	RET

; Spawn initializer for runtime gameplay object type 12h
OBJ_INIT_TYPE_12:
	CALL	INIT_FLYER_HITBOX_AND_SPAWN_X
	LD	A,80h
	CALL	AIM_OBJECT_VELOCITY_TOWARD_GAO
	LD	(IX+OBJ_ACCEL_ENABLE),00h
	LD	(IX+OBJ_SPRITE_POSE),24h
	RET

; Per-frame update handler for runtime gameplay object type 12h
OBJ_UPDATE_TYPE_12:
	LD	BC,2404h
	CALL	TOGGLE_OBJECT_TWO_FRAME_POSE
	JP	TICK_FLYER_HIGH_RANK_SHOT_TIMER

; Spawn initializer for runtime gameplay object type 14h
OBJ_INIT_TYPE_14:
	LD	HL,OBJ_TYPE_14_KINEMATIC_PARAMS
	CALL	INIT_FLYER_KINEMATICS_AND_SPAWN_X
	LD	A,(IX+OBJ_X)
	SRA	A
	LD	(IX+OBJ_X),A
	CP	80h
	LD	DE,0220h
	JR	NC,.loc_a834
	LD	DE,FDE0h

.loc_a834:
	JP	SET_OBJECT_VEL_X_FROM_DE	; asm/banks/bank01.asm

; 11-byte initial kinematic parameter template for OBJ_TYPE 14h zig-zagging flyers (Y
; velocity -0180h, pose 28h)
OBJ_TYPE_14_KINEMATIC_PARAMS:
	DB	80h,FEh,00h,00h,00h,00h,00h,00h,00h,28h,00h

; Per-frame update handler for runtime gameplay object type 14h
OBJ_UPDATE_TYPE_14:
	LD	A,(SND_CH0_SOUND_ID)
	OR	A
	JR	Z,.loc_a852
	LD	A,(SND_CH3_SOUND_ID)
	LD	B,A
	LD	A,0Fh
	CP	B
	CALL	NZ,QUEUE_SOUND_COMMAND_IF_UNLOCKED

.loc_a852:
	LD	BC,2804h
	CALL	TOGGLE_OBJECT_TWO_FRAME_POSE
	CALL	TICK_FLYER_HIGH_RANK_SHOT_TIMER
	CALL	CHECK_OBJ_TYPE_14_X_BOUNDS
	RET	NC
	LD	E,(IX+OBJ_VEL_X_LO)
	LD	D,(IX+OBJ_VEL_X_HI)
	CALL	NEGATE_DE_WORD
	JP	SET_OBJECT_VEL_X_FROM_DE	; asm/banks/bank01.asm

; Return carry set when OBJ_TYPE 14h reaches horizontal bounce limits X < 20h (moving left)
; or X >= E0h (moving right)
CHECK_OBJ_TYPE_14_X_BOUNDS:
	LD	A,(IX+OBJ_X)
	BIT	07h,(IX+OBJ_VEL_X_HI)
	JR	Z,.loc_a877
	CP	20h
	RET

.loc_a877:
	CP	E0h
	CCF
	RET

; At difficulty rank 0Ch or higher, decrement OBJ_WORK_0 for OBJ_TYPE 12h/14h flyers and
; fire an auxiliary shot on expiry
TICK_FLYER_HIGH_RANK_SHOT_TIMER:
	LD	A,(COLLECTED_PIECE_FLAGS)
	CP	0Ch
	RET	C
	DEC	(IX+OBJ_WORK_0)
	RET	NZ
	CALL	RELOAD_FLYER_REPEAT_SHOT_TIMER
	JP	SPAWN_AUX_SHOT_WITH_PROXIMITY_CHK	; asm/banks/bank01.asm

; Load base delay 30h and compute the next rank-scaled projectile timer in OBJ_WORK_0 for
; OBJ_TYPE 12h/14h flyers
RELOAD_FLYER_REPEAT_SHOT_TIMER:
	LD	C,30h

; Compute a randomized difficulty-scaled countdown from base C (clamped to at least 06h) and
; store it in OBJ_WORK_0
CALC_RANK_SCALED_FLYER_TIMER:
	LD	A,R
	AND	07h
	ADD	A,C
	LD	C,A
	LD	A,(COLLECTED_PIECE_FLAGS)
	ADD	A,A
	SUB	C
	NEG
	LD	C,A
	CP	06h
	JP	P,.loc_a8a2
	LD	C,06h

.loc_a8a2:
	LD	(IX+OBJ_WORK_0),C
	RET

; Copy kinematic parameters from HL and run shared hitbox, shot timer, and 4-column X-spawn
; setup for OBJ_TYPE 14h
INIT_FLYER_KINEMATICS_AND_SPAWN_X:
	CALL	COPY_OBJECT_KINEMATIC_PARAMS_HL

; Initialize initial shot delay, bounding box, and cycled 4-column spawn X coordinate for
; OBJ_TYPE 12h/14h flyers
INIT_FLYER_HITBOX_AND_SPAWN_X:
	LD	C,10h
	CALL	CALC_RANK_SCALED_FLYER_TIMER
	LD	HL,OBJ_TYPE_12_14_HITBOX
	CALL	SET_OBJECT_HITBOX_FROM_HL

; Spawn aimed enemy projectile from parent object IX toward Gao
SPAWN_ENEMY_PROJECTILE_TOWARD_GAO:
	LD	HL,WAVE_VARIANT_COUNTER_C
	INC	(HL)
	LD	A,(HL)
	AND	03h
	LD	HL,FLYER_SPAWN_X_COLUMN_TABLE
	CALL	ADD_A_TO_HL
	LD	A,(HL)
	LD	(IX+OBJ_X),A
	JP	INIT_STANDARD_ENEMY_DEFAULTS	; asm/banks/bank01.asm

; 4-byte bounding-box preset (-19, -11, 24x21) shared by OBJ_TYPE 12h and OBJ_TYPE 14h flyer
; enemies
OBJ_TYPE_12_14_HITBOX:
	DB	EDh,F5h,18h,15h

; 4-byte horizontal spawn column table (30h, 50h, B0h, D0h) cycled by WAVE_VARIANT_COUNTER_C
; for OBJ_TYPE 12h/14h
FLYER_SPAWN_X_COLUMN_TABLE:
	DB	30h,50h,B0h,D0h

; Spawn initializer for runtime gameplay object type 13h
OBJ_INIT_TYPE_13:
	CALL	INIT_STANDARD_ENEMY_DEFAULTS
	LD	HL,OBJ_TYPE_13_HITBOX
	CALL	SET_OBJECT_HITBOX_FROM_HL
	LD	(IX+OBJ_SPRITE_POSE),26h
	LD	HL,WAVE_VARIANT_COUNTER_B
	INC	(HL)
	LD	A,(HL)
	AND	03h
	ADD	A,A
	LD	HL,OBJ_TYPE_13_WAYPOINT_PARAM_TABLE
	CALL	ADD_A_TO_HL
	LD	A,(HL)
	LD	(IX+OBJ_ACTION_TIMER),A
	INC	HL
	LD	C,(HL)
	INC	HL
	LD	B,(HL)
	LD	A,90h
	JP	AIM_OBJECT_VELOCITY_AT_TARGET_BC	; asm/banks/bank01.asm

; 12-byte table of initial action timers and target (Y, X) waypoint coordinates indexed by
; WAVE_VARIANT_COUNTER_B for OBJ_TYPE 13h
OBJ_TYPE_13_WAYPOINT_PARAM_TABLE:
	DB	18h,50h,30h,28h,70h,D0h,18h,50h,D0h,28h,70h,30h

; 4-byte bounding-box preset (-19, -11, 24x21) for OBJ_TYPE 13h waypoint-swooping flyer
; enemies
OBJ_TYPE_13_HITBOX:
	DB	EDh,F5h,18h,15h

; Per-frame update handler for runtime gameplay object type 13h
OBJ_UPDATE_TYPE_13:
	LD	A,(IX+OBJ_PHASE)
	DEC	A
	RET	Z
	DEC	(IX+OBJ_ACTION_TIMER)
	RET	NZ
	INC	(IX+OBJ_PHASE)
	LD	A,90h
	JP	AIM_OBJECT_VELOCITY_TOWARD_GAO	; asm/banks/bank01.asm

; Mobile route spawn-stream group 0Bh pre-spawn handler
SPAWN_GROUP_HANDLER_0B:
	LD	HL,SPAWN_GROUP_0B_OBJ_15_DESC
	JP	INIT_SPAWN_QUEUE_AND_UNPACK_X_PARAM	; asm/banks/bank02.asm

; 6-byte spawn group descriptor used by SPAWN_GROUP_HANDLER_0B to spawn an OBJ_TYPE 15h
; ambush dasher
SPAWN_GROUP_0B_OBJ_15_DESC:
	DB	01h,01h,00h,15h,00h,00h

; Spawn initializer for runtime gameplay object type 15h
OBJ_INIT_TYPE_15:
	LD	HL,OBJ_TYPE_15_HITBOX
	CALL	SET_OBJECT_HITBOX_FROM_HL
	LD	(IX+OBJ_ANIM_TIMER),00h
	LD	HL,OBJ_TYPE_15_KINEMATIC_PARAMS
	JP	COPY_OBJECT_KINEMATIC_PARAMS_HL	; asm/banks/bank01.asm

; 11-byte initial kinematic parameter template for OBJ_TYPE 15h ambush dashers (X velocity
; +0400h, pose 2Ah, timer 10h)
OBJ_TYPE_15_KINEMATIC_PARAMS:
	DB	00h,00h,00h,04h,00h,00h,00h,00h,00h,2Ah,10h

; 4-byte 16x16 bounding-box preset (-15, -8, 16x16) for OBJ_TYPE 15h ambush dasher enemies
OBJ_TYPE_15_HITBOX:
	DB	F1h,F8h,10h,10h

; Per-frame update handler for runtime gameplay object type 15h
OBJ_UPDATE_TYPE_15:
	CALL	PLAY_ARMOR_RICOCHET_SFX_ON_HIT
	CALL	APPLY_VERTICAL_SCROLL_TO_OBJECT_Y
	LD	A,(IX+OBJ_PHASE)
	DEC	A
	JR	Z,.loc_a962
	DEC	A
	JR	Z,.loc_a97e
	RET	P
	CALL	GET_ABS_GAO_TO_OBJECT_DY
	CP	30h
	RET	NC
	INC	(IX+OBJ_PHASE)
	LD	(IX+OBJ_ACTION_TIMER),10h
	RET

.loc_a962:
	CALL	APPLY_OBJ_TYPE_15_X_TREMOR
	CALL	GET_ABS_GAO_TO_OBJECT_DY
	CP	10h
	RET	NC
	CALL	GET_ABS_GAO_TO_OBJECT_DX
	CP	40h
	RET	NC
	INC	(IX+OBJ_PHASE)
	INC	(IX+OBJ_ANIM_TIMER)
	CALL	COMPARE_GAO_X_WITH_OBJECT_X
	RET	NC
	JP	NEGATE_OBJECT_VEL_X	; asm/banks/bank01.asm

.loc_a97e:
	LD	BC,2A04h
	CALL	TOGGLE_OBJECT_TWO_FRAME_POSE
	DEC	(IX+OBJ_ACTION_TIMER)
	RET	NZ
	INC	(IX+OBJ_PHASE)
	DEC	(IX+OBJ_ANIM_TIMER)
	RET

; Oscillate OBJ_TYPE 15h X coordinate by +/-1 pixel using bit 1 of FRAME_COUNTER during its
; pre-dash telegraph
APPLY_OBJ_TYPE_15_X_TREMOR:
	LD	A,(FRAME_COUNTER)
	AND	02h
	LD	A,01h
	JR	Z,.loc_a99a
	NEG

.loc_a99a:
	ADD	A,(IX+OBJ_X)
	LD	(IX+OBJ_X),A
	RET

; Spawn up to three OBJ_TYPE 16h flying turtle/guardian homing chasers around Gao (called from
; Bank 01 SPAWN_ENEMY16_IF_PRESENT_ON_ROUTE on Stage 2 Routes 1 & 2).
;
; Formation & why 1 vs 3 chasers survive frame 1 (unsigned 8-bit Y wrap vs CP E3h cull):
;   - Offsets in OBJ_TYPE_16_TRIO_SPAWN_OFFSETS place Chasers #1 & #2 at E = GAO_POS_Y + B0h
;     (80 px above Gao) and Chaser #3 at E = GAO_POS_Y + 00h (same Y height as Gao).
;   - Horizontal offset |dX| (10h, 50h, 60h) is added when GAO_POS_X < 80h (left border wrap,
;     Gao at X=0Eh) or negated when GAO_POS_X >= 80h (right border wrap, Gao at X=F2h), so the
;     trio always materializes inward toward screen center.
;   - Because RETIRE_OFFSCREEN_OBJECT_SPRITES despawns any object with unsigned OBJ_Y >= E3h
;     (and retail gameplay uses the full 256x212 screen with no top HUD):
;       * GAO_POS_Y >= 50h (80..211 px): all 3 land in 00h..93h and swoop in together.
;       * GAO_POS_Y = 33h..4Fh (51..79 px): GAO_POS_Y + B0h wraps into E3h..FFh, so Chasers
;         #1 & #2 are culled on frame 1 and ONLY Chaser #3 (at Gao's height) appears.
;       * GAO_POS_Y <= 32h (0..50 px, near top edge): GAO_POS_Y + B0h wraps to B0h..E2h near
;         the bottom of the screen, so Chasers #1 & #2 ambush upward from below!
SPAWN_OBJ_TYPE_16_TRIO_AROUND_GAO:
	LD	BC,0316h
	LD	HL,OBJ_TYPE_16_TRIO_SPAWN_OFFSETS

.loc_a9a7:
	PUSH	BC
	LD	A,(GAO_POS_Y)
	ADD	A,(HL)
	LD	E,A
	INC	HL
	LD	A,(GAO_POS_X)
	LD	B,A
	CP	80h
	LD	A,(HL)
	JR	C,.loc_a9b9
	NEG

.loc_a9b9:
	ADD	A,B
	LD	D,A
	PUSH	HL
	CALL	SPAWN_GAMEPLAY_OBJECT_TYPE_A
	POP	HL
	INC	HL
	POP	BC
	DJNZ	.loc_a9a7
	RET

; Three (dY, |dX|) spawn offset pairs relative to Gao: (-80, +-16), (-80, +-80), (0, +-96)
OBJ_TYPE_16_TRIO_SPAWN_OFFSETS:
	DB	B0h,10h,B0h,50h,00h,60h

; Spawn initializer for OBJ_TYPE 16h (Stage 2 flying turtle/guardian): 1 HP, 100 pts, 24x21
; hitbox, initial pose 2Ch (clay/tan palette OBJECT_POSE_COLOR_ENTRY_20), and locked straight-
; line homing velocity at speed 90h toward Gao's position at spawn (flies freely over terrain)
OBJ_INIT_TYPE_16:
	LD	HL,OBJ_TYPE_16_HITBOX
	CALL	SET_OBJECT_HITBOX_FROM_HL
	LD	(IX+OBJ_SPRITE_POSE),2Ch
	LD	A,90h
	JP	AIM_OBJECT_VELOCITY_TOWARD_GAO	; asm/banks/bank01.asm

; 4-byte bounding-box preset (-19, -11, 24x21) for OBJ_TYPE 16h homing chaser enemies
OBJ_TYPE_16_HITBOX:
	DB	EDh,F5h,18h,15h

; Per-frame update for OBJ_TYPE 16h: toggle poses 2Ch/2Dh every 4 ticks while flying along its
; initial homing vector until killed (1 HP) or leaving 07h..F7h / 00h..E2h screen bounds
OBJ_UPDATE_TYPE_16:
	LD	BC,2C04h
	JP	TOGGLE_OBJECT_TWO_FRAME_POSE	; asm/banks/bank01.asm

; Mobile route spawn-stream group 0Ch pre-spawn handler
SPAWN_GROUP_HANDLER_0C:
	CALL	SPAWN_GROUP_HANDLER_06
	LD	(IX+OBJ_Y),17h
	RET

; Spawn initializer for runtime gameplay object type 17h
OBJ_INIT_TYPE_17:
	XOR	A
	LD	(IX+OBJ_COLLISION_MODE),A
	LD	(IX+OBJ_LINK_PTR_LO),A
	LD	(IX+OBJ_STEP_INDEX),A
	CALL	OBJ_INIT_TYPE_0C
	LD	(IX+OBJ_COLLISION_CLASS),03h
	RET

; Per-frame update handler for runtime gameplay object type 17h
OBJ_UPDATE_TYPE_17:
	CALL	APPLY_VERTICAL_SCROLL_TO_OBJECT_Y
	LD	A,(IX+OBJ_PHASE)
	CALL	INLINE_WORD_DISPATCH

; 7-entry inline DW dispatch table for Object 19h behaviour phases
OBJ_TYPE_19_PHASE_TABLE:
	DW	OBJ0E_PHASE_HANDLER_00	; [00h]
	DW	OBJ19_PHASE_HANDLER_01	; [01h]
	DW	OBJ0E_PHASE_HANDLER_02	; [02h]
	DW	OBJ0E_PHASE_HANDLER_03	; [03h]
	DW	OBJ0E_PHASE_HANDLER_04	; [04h]
	DW	OBJ0E_PHASE_HANDLER_05	; [05h]
	DW	OBJ0E_PHASE_HANDLER_06	; [06h]

; Enemy Object 19h AI phase 01h handler
OBJ19_PHASE_HANDLER_01:
	LD	A,(IX+OBJ_LINK_PTR_LO)
	AND	A
	JR	NZ,.loc_aa3e
	CALL	OBJ0E_PHASE_HANDLER_01
	LD	A,(IX+OBJ_PHASE)
	CP	01h
	RET	Z
	LD	A,(IX+OBJ_STEP_INDEX)
	AND	A
	RET	NZ
	LD	A,(IX+OBJ_PHASE)
	LD	(IX+OBJ_LINK_PTR_HI),A
	LD	(IX+OBJ_PHASE),01h
	INC	(IX+OBJ_LINK_PTR_LO)
	LD	(IX+OBJ_SUB_TIMER),10h
	INC	(IX+OBJ_STEP_INDEX)
	RET

.loc_aa3e:
	LD	A,(FRAME_COUNTER)
	AND	01h
	LD	(IX+OBJ_COLLISION_MODE),A
	DEC	(IX+OBJ_SUB_TIMER)
	RET	NZ
	LD	(IX+OBJ_COLLISION_MODE),01h
	LD	(IX+OBJ_COLLISION_CLASS),00h
	LD	A,(IX+OBJ_LINK_PTR_HI)
	LD	(IX+OBJ_PHASE),A
	RET

; Mobile route spawn-stream group 0Dh pre-spawn handler
SPAWN_GROUP_HANDLER_0D:
	CALL	SPAWN_GROUP_HANDLER_02
	LD	(IX+OBJ_Y),18h
	RET

; Mobile route spawn-stream group 0Eh pre-spawn handler
SPAWN_GROUP_HANDLER_0E:
	LD	HL,SPAWN_GROUP_0E_OBJ_19_DESC
	CALL	COPY_SPAWN_GROUP_DESC_TO_IX
	LD	A,(GAO_POS_X)
	CP	80h
	LD	B,40h
	JR	NC,.loc_aa72
	LD	B,C0h

.loc_aa72:
	LD	(IX+OBJ_X),B
	RET

; 6-byte spawn group descriptor used by SPAWN_GROUP_HANDLER_0E/0F to spawn OBJ_TYPE 19h or
; 1Ah enemies
SPAWN_GROUP_0E_OBJ_19_DESC:
	DB	01h,01h,00h,19h,00h,00h

; Mobile route spawn-stream group 0Fh pre-spawn handler
SPAWN_GROUP_HANDLER_0F:
	CALL	SPAWN_GROUP_HANDLER_0E
	LD	(IX+OBJ_Y),1Ah
	RET

; Spawn initializer for runtime gameplay object type 18h
OBJ_INIT_TYPE_18:
	CALL	INIT_STANDARD_ENEMY_DEFAULTS
	LD	(IX+OBJ_LINK_PTR_LO),00h
	LD	HL,OBJ_TYPE_18_KINEMATIC_PARAMS
	CALL	INIT_OBJ_TYPE_18_19_1A_COMMON
	LD	A,(COLLECTED_PIECE_FLAGS)
	LD	B,A
	LD	A,15h
	SUB	B
	LD	(IX+OBJ_LINK_PTR_HI),A
	LD	(IX+OBJ_WORK_2),A
	RET

; 11-byte initial kinematic parameter template for OBJ_TYPE 18h gravity-affected walkers (Y
; accel +0040h, pose 56h)
OBJ_TYPE_18_KINEMATIC_PARAMS:
	DB	00h,00h,00h,00h,01h,40h,00h,00h,00h,56h,00h

; Spawn initializer for runtime gameplay object type 19h
OBJ_INIT_TYPE_19:
	LD	(IX+OBJ_LINK_PTR_LO),01h
	LD	HL,OBJ_TYPE_19_KINEMATIC_PARAMS

; Apply kinematic parameters from HL, set the 40x21 hitbox, and initialize rank-scaled
; attack timers for OBJ_TYPE 18h..1Ah
INIT_OBJ_TYPE_18_19_1A_COMMON:
	CALL	COPY_OBJECT_KINEMATIC_PARAMS_HL
	LD	HL,OBJ_TYPE_18_19_1A_HITBOX
	CALL	SET_OBJECT_HITBOX_FROM_HL
	LD	A,(COLLECTED_PIECE_FLAGS)
	LD	B,A
	LD	A,1Ah
	SUB	B
	LD	(IX+OBJ_LINK_PTR_HI),A
	LD	(IX+OBJ_WORK_2),A
	LD	A,B
	SRL	A
	SRL	A
	LD	B,A
	LD	A,09h
	SUB	B
	LD	(IX+OBJ_WORK_1),A
	LD	(IX+OBJ_WORK_0),A
	RET

; 11-byte initial kinematic parameter template for OBJ_TYPE 19h jumping shooters (Y accel
; +0040h, pose 58h)
OBJ_TYPE_19_KINEMATIC_PARAMS:
	DB	00h,00h,00h,00h,01h,40h,00h,00h,00h,58h,00h

; 4-byte bounding-box preset (-35, -11, 40x21) shared by OBJ_TYPE 18h, 19h, and 1Ah enemies
OBJ_TYPE_18_19_1A_HITBOX:
	DB	DDh,F5h,28h,15h

; Spawn initializer for runtime gameplay object type 1Ah
OBJ_INIT_TYPE_1A:
	LD	(IX+OBJ_LINK_PTR_LO),02h
	LD	HL,OBJ_TYPE_1A_KINEMATIC_PARAMS
	CALL	INIT_OBJ_TYPE_18_19_1A_COMMON
	BIT	07h,(IX+OBJ_X)
	RET	Z
	JP	NEGATE_OBJECT_VEL_X	; asm/banks/bank01.asm

; 11-byte initial kinematic parameter template for OBJ_TYPE 1Ah diagonal flyers (Y velocity
; +0300h, X velocity +0400h, pose 5Ah)
OBJ_TYPE_1A_KINEMATIC_PARAMS:
	DB	00h,03h,00h,04h,00h,00h,00h,00h,00h,5Ah,00h

; Per-frame update handler for runtime gameplay object type 18h
OBJ_UPDATE_TYPE_18:
	CALL	UPDATE_OBJ_TYPE_18_19_HORIZ_MOVE
	CALL	PREPARE_OBJ_TYPE_18_1A_DISPATCH
	CALL	INLINE_WORD_DISPATCH

; 3-entry inline DW dispatch table for Object 1Ah behaviour phases
OBJ_TYPE_1A_PHASE_TABLE:
	DW	OBJ1A_PHASE_HANDLER_00	; [00h]
	DW	OBJ1A_PHASE_HANDLER_01	; [01h]
	DW	OBJ1A_PHASE_HANDLER_02	; [02h]

; Enemy Object 1Ah AI phase 00h handler
OBJ1A_PHASE_HANDLER_00:
	CALL	ANIMATE_OBJ_TYPE_18_19_WALK
	DEC	(IX+OBJ_WORK_0)
	RET	NZ
	CALL	NEGATE_OBJECT_ACCEL_Y
	LD	A,(IX+OBJ_WORK_1)
	LD	(IX+OBJ_WORK_0),A
	JR	ADVANCE_OBJ_TYPE_1A_PHASE

; Enemy Object 1Ah AI phase 01h handler
OBJ1A_PHASE_HANDLER_01:
	CALL	ANIMATE_OBJ_TYPE_18_19_WALK
	DEC	(IX+OBJ_WORK_0)
	RET	NZ
	LD	(IX+OBJ_WORK_0),30h
	XOR	A
	LD	(IX+OBJ_ANIM_TIMER),A
	LD	(IX+OBJ_ACCEL_ENABLE),A
	CALL	NEGATE_OBJECT_ACCEL_Y
	JR	ADVANCE_OBJ_TYPE_1A_PHASE

; Enemy Object 1Ah AI phase 02h handler
OBJ1A_PHASE_HANDLER_02:
	CALL	TICK_OBJ_TYPE_18_19_1A_ATTACK
	DEC	(IX+OBJ_WORK_0)
	RET	NZ
	LD	A,01h
	LD	(IX+OBJ_ANIM_TIMER),A
	LD	(IX+OBJ_ACCEL_ENABLE),A
	LD	A,(IX+OBJ_WORK_1)
	LD	(IX+OBJ_WORK_0),A
	CALL	STEER_OBJ_TYPE_19_LEAP_X
	LD	(IX+OBJ_PHASE),00h
	RET

; Per-frame update handler for runtime gameplay object type 1Ah
OBJ_UPDATE_TYPE_1A:
	CALL	UPDATE_OBJ_TYPE_18_19_HORIZ_MOVE
	CALL	PREPARE_OBJ_TYPE_18_1A_DISPATCH
	CALL	INLINE_WORD_DISPATCH

; 4-entry inline DW dispatch table for boss/shrine stone reward actions
SACRED_STONE_DROP_ACTION_TABLE:
	DW	STONE_DROP_ACTION_HANDLER_00	; [00h]
	DW	STONE_DROP_ACTION_HANDLER_01	; [01h]
	DW	STONE_DROP_ACTION_HANDLER_02	; [02h]
	DW	STONE_DROP_ACTION_HANDLER_03	; [03h]

; Sacred stone drop / pedestal reward action 00h handler
STONE_DROP_ACTION_HANDLER_00:
	LD	BC,5A08h
	CALL	TOGGLE_OBJECT_TWO_FRAME_POSE
	CALL	COMPARE_GAO_Y_WITH_OBJECT_Y
	RET	C
	CALL	GET_ABS_GAO_TO_OBJECT_DX
	CP	08h
	RET	NC
	LD	(IX+OBJ_ANIM_TIMER),00h
	LD	(IX+OBJ_WORK_0),30h

; Increment OBJ_PHASE to advance OBJ_TYPE 1Ah to its next swoop, hover, or climb phase
ADVANCE_OBJ_TYPE_1A_PHASE:
	INC	(IX+OBJ_PHASE)
	RET

; Sacred stone drop / pedestal reward action 01h handler
STONE_DROP_ACTION_HANDLER_01:
	CALL	TICK_OBJ_TYPE_18_19_1A_ATTACK
	DEC	(IX+OBJ_WORK_0)
	RET	NZ
	CALL	NEGATE_OBJECT_VEL_Y
	LD	(IX+OBJ_ANIM_TIMER),01h
	JR	ADVANCE_OBJ_TYPE_1A_PHASE

; Sacred stone drop / pedestal reward action 02h handler
STONE_DROP_ACTION_HANDLER_02:
	LD	BC,5A08h
	CALL	TOGGLE_OBJECT_TWO_FRAME_POSE
	CALL	PROBE_CEILING_AT_16PX_ABOVE
	RET	NC
	CALL	COMPARE_GAO_Y_WITH_OBJECT_Y
	JR	NC,.loc_abb2
	LD	DE,0000h
	CALL	SET_OBJECT_VEL_X_FROM_DE
	LD	DE,0300h
	CALL	STEP_OBJECT_XY_BY_VELOCITY
	JR	ADVANCE_OBJ_TYPE_1A_PHASE

.loc_abb2:
	LD	A,80h
	CALL	AIM_OBJECT_VELOCITY_TOWARD_GAO
	JR	ADVANCE_OBJ_TYPE_1A_PHASE

; Sacred stone drop / pedestal reward action 03h handler
STONE_DROP_ACTION_HANDLER_03:
	LD	BC,5A08h
	JP	TOGGLE_OBJECT_TWO_FRAME_POSE	; asm/banks/bank01.asm

; Step the 2-frame walk/hop animation for OBJ_TYPE 18h (base pose 56h) or OBJ_TYPE 19h (base
; pose 58h) every 8 frames
ANIMATE_OBJ_TYPE_18_19_WALK:
	LD	A,(IX+OBJ_LINK_PTR_LO)
	AND	A
	LD	B,56h
	JR	Z,.loc_abc9
	LD	B,58h

.loc_abc9:
	LD	C,08h
	JP	TOGGLE_OBJECT_TWO_FRAME_POSE	; asm/banks/bank01.asm

; Apply vertical scroll offset to OBJ_Y and load OBJ_PHASE into A prior to inline phase
; table dispatch
PREPARE_OBJ_TYPE_18_1A_DISPATCH:
	CALL	APPLY_VERTICAL_SCROLL_TO_OBJECT_Y
	LD	A,(IX+OBJ_PHASE)
	RET

; Count down OBJ_WORK_2 and either spawn an OBJ_TYPE 30h projectile (for 18h) or fire an
; aimed auxiliary shot (for 19h/1Ah)
TICK_OBJ_TYPE_18_19_1A_ATTACK:
	DEC	(IX+OBJ_WORK_2)
	RET	NZ
	LD	A,(IX+OBJ_LINK_PTR_HI)
	LD	(IX+OBJ_WORK_2),A
	LD	A,(IX+OBJ_LINK_PTR_LO)
	AND	A
	JP	NZ,SPAWN_DEFAULT_ENEMY_AUX_SHOT	; asm/banks/bank01.asm
	LD	D,(IX+OBJ_X)
	LD	E,(IX+OBJ_Y)
	LD	C,30h
	PUSH	IX
	CALL	SPAWN_GAMEPLAY_OBJECT_TYPE_A
	POP	IX
	RET

; Set OBJ_TYPE 19h horizontal leap speed to 0400h toward Gao when Gao is not above the enemy
STEER_OBJ_TYPE_19_LEAP_X:
	LD	A,(IX+OBJ_LINK_PTR_LO)
	OR	A
	RET	Z
	CALL	COMPARE_GAO_Y_WITH_OBJECT_Y
	RET	C
	LD	DE,0400h

; Orient 16-bit speed DE toward Gao X coordinate and store the signed result in OBJ_VEL_X
SET_VEL_X_MAGNITUDE_TOWARD_GAO:
	CALL	COMPARE_GAO_X_WITH_OBJECT_X
	CALL	C,NEGATE_DE_WORD
	JP	SET_OBJECT_VEL_X_FROM_DE	; asm/banks/bank01.asm

; Reverse horizontal velocity on wall contact and steer OBJ_TYPE 18h at 0100h toward Gao
; when unblocked
UPDATE_OBJ_TYPE_18_19_HORIZ_MOVE:
	CALL	PROBE_LEADING_WALL_AT_8PX
	CALL	C,NEGATE_OBJECT_VEL_X
	LD	A,(IX+OBJ_LINK_PTR_LO)
	AND	A
	RET	NZ
	CALL	GET_ABS_GAO_TO_OBJECT_DX
	AND	A
	LD	DE,0000h
	JR	Z,SET_VEL_X_MAGNITUDE_TOWARD_GAO
	CALL	PROBE_LEADING_WALL_AT_8PX
	LD	DE,0000h
	JR	C,SET_VEL_X_MAGNITUDE_TOWARD_GAO
	LD	DE,0100h
	JR	SET_VEL_X_MAGNITUDE_TOWARD_GAO

; Test low-class tile collision 8 pixels ahead of the object along its current X velocity
; sign
PROBE_LEADING_WALL_AT_8PX:
	BIT	07h,(IX+OBJ_VEL_X_HI)
	LD	A,08h
	JR	Z,.loc_ac36
	NEG

.loc_ac36:
	ADD	A,(IX+OBJ_X)
	LD	D,A
	LD	E,(IX+OBJ_Y)
	CALL	GET_TILE_COLLISION_LOW_CLASS
	RET

; Test low-class tile collision 16 pixels above the object (Y - 10h) during OBJ_TYPE 1Ah
; upward climb
PROBE_CEILING_AT_16PX_ABOVE:
	LD	D,(IX+OBJ_X)
	LD	A,F0h
	ADD	A,(IX+OBJ_Y)
	LD	E,A
	CALL	GET_TILE_COLLISION_LOW_CLASS
	RET

; Spawn initializer for runtime gameplay object type 2Fh
OBJ_INIT_TYPE_2F:
	LD	HL,OBJ_TYPE_2F_EMPTY_HITBOX
	CALL	SET_OBJECT_HITBOX_FROM_HL
	LD	HL,OBJ_TYPE_2F_KINEMATIC_PARAMS
	CALL	COPY_OBJECT_KINEMATIC_PARAMS_HL
	LD	HL,000Ah
	JP	ADD_HL_TO_PLAYER_SCORE_BCD	; asm/banks/bank00.asm

; 11-byte initial kinematic parameter template for OBJ_TYPE 2Fh floating score popups (Y
; velocity -0100h, pose 51h, timer 08h)
OBJ_TYPE_2F_KINEMATIC_PARAMS:
	DB	00h,FFh,00h,00h,00h,00h,00h,00h,00h,51h,08h

; 4-byte zeroed bounding-box preset disabling hitbox extent for OBJ_TYPE 2Fh score popup
; sprites
OBJ_TYPE_2F_EMPTY_HITBOX:
	DB	00h,00h,00h,00h

; Per-frame update handler for runtime gameplay object type 2Fh
OBJ_UPDATE_TYPE_2F:
	LD	A,(IX+OBJ_PHASE)
	DEC	A
	JR	Z,.loc_ac85
	DEC	(IX+OBJ_ACTION_TIMER)
	RET	NZ
	INC	(IX+OBJ_PHASE)
	LD	(IX+OBJ_ANIM_TIMER),00h
	LD	(IX+OBJ_ACTION_TIMER),18h
	RET

.loc_ac85:
	CALL	APPLY_VERTICAL_SCROLL_TO_OBJECT_Y
	DEC	(IX+OBJ_ACTION_TIMER)
	RET	NZ
	JP	DEACTIVATE_OBJECT_IX_AND_SPRITES	; asm/banks/bank01.asm

; Spawn initializer for runtime gameplay object type 2Dh
OBJ_INIT_TYPE_2D:
	LD	A,(CHEAT_FEATHERS_X10)
	OR	A
	JR	Z,.loc_ac99
	LD	(IX+OBJ_TYPE),2Dh

.loc_ac99:
	LD	HL,OBJ_TYPE_2D_2E_HITBOX
	CALL	SET_OBJECT_HITBOX_FROM_HL
	LD	(IX+OBJ_WORK_0),00h
	LD	(IX+OBJ_COLLISION_CLASS),01h
	LD	A,(IX+OBJ_TYPE)
	CP	2Dh
	LD	HL,000Ah
	JR	Z,.loc_acb4
	LD	HL,0001h

.loc_acb4:
	CALL	ADD_HL_TO_PLAYER_SCORE_BCD
	LD	HL,OBJ_TYPE_2D_2E_KINEMATIC_PARAMS
	CALL	COPY_OBJECT_KINEMATIC_PARAMS_HL
	LD	A,(IX+OBJ_X)
	CP	80h
	RET	C
	JP	NEGATE_OBJECT_VEL_X	; asm/banks/bank01.asm

; 11-byte initial kinematic parameter template for OBJ_TYPE 2Dh/2Eh swaying feather pickups
; (Y velocity +0080h, pose 4Fh)
OBJ_TYPE_2D_2E_KINEMATIC_PARAMS:
	DB	80h,00h,FFh,05h,01h,00h,00h,40h,00h,4Fh,01h

; 4-byte 16x16 bounding-box preset (-15, -8, 16x16) for OBJ_TYPE 2Dh and 2Eh feather pickups
OBJ_TYPE_2D_2E_HITBOX:
	DB	F1h,F8h,10h,10h

; Per-frame update handler for runtime gameplay object type 2Dh
OBJ_UPDATE_TYPE_2D:
	LD	A,(IX+OBJ_TYPE)
	CP	2Dh
	LD	B,04h
	LD	DE,OBJ_TYPE_2D_ANIM_COLOR_DATA
	CALL	Z,ADVANCE_CYCLIC_OBJECT_ANIMATION
	CALL	COUNT_TRIGGER_PRESS_ON_FEATHER
	CALL	UPDATE_FEATHER_SWAY_MOTION
	LD	A,(GAO_MODE)
	CP	02h
	RET	Z
	JR	CHECK_FEATHER_PICKUP_COLLECTION

; 1-byte cyclic animation table entry (0Ch) passed to ADVANCE_CYCLIC_OBJECT_ANIMATION for
; large OBJ_TYPE 2Dh feather pickups
OBJ_TYPE_2D_ANIM_COLOR_DATA:
	DB	0Ch

; Increment OBJ_WORK_0 on an OBJ_TYPE 2Dh/2Eh feather pickup whenever fire-button edge bit 4
; is set in PRESSED_INPUT_BITS
COUNT_TRIGGER_PRESS_ON_FEATHER:
	LD	A,(PRESSED_INPUT_BITS)
	AND	10h
	RET	Z
	INC	(IX+OBJ_WORK_0)
	RET

; Test Gao overlap with an OBJ_TYPE 2Dh/2Eh feather, award 10 or 1 feathers up to 200 (C8h),
; queue SFX 20h/1Fh, and despawn
CHECK_FEATHER_PICKUP_COLLECTION:
	LD	A,(GAO_RENDER_X)
	SUB	(IX+OBJ_X)
	ADD	A,0Ch
	CP	18h
	RET	NC
	LD	A,(GAO_RENDER_Y)
	ADD	A,08h
	SUB	(IX+OBJ_Y)
	CP	20h
	RET	NC
	LD	A,(IX+OBJ_TYPE)
	CP	2Dh
	LD	A,01h
	JR	NZ,.loc_ad1c
	LD	A,0Ah

.loc_ad1c:
	LD	HL,FEATHER_ORB_COUNT
	ADD	A,(HL)
	LD	D,C8h
	CP	D
	JR	C,.loc_ad26
	LD	A,D

.loc_ad26:
	LD	(HL),A
	LD	A,(IX+OBJ_TYPE)
	CP	2Dh
	LD	A,20h
	JR	Z,.loc_ad32
	LD	A,1Fh

.loc_ad32:
	CALL	QUEUE_SOUND_COMMAND_IF_UNLOCKED
	JP	DEACTIVATE_OBJECT_IX_AND_SPRITES	; asm/banks/bank01.asm

; Apply horizontal centering drift to OBJ_TYPE 2Dh/2Eh feathers and negate X acceleration
; when |OBJ_VEL_X| exceeds 0600h
UPDATE_FEATHER_SWAY_MOTION:
	CALL	DRIFT_FEATHER_X_TOWARD_CENTER
	LD	A,(IX+OBJ_X)
	LD	(IX+OBJ_ITEM_SUBTYPE),A
	LD	C,(IX+OBJ_VEL_X_LO)
	LD	B,(IX+OBJ_VEL_X_HI)
	LD	A,B
	OR	A
	JP	P,.loc_ad53
	LD	A,C
	CPL
	LD	C,A
	LD	A,B
	CPL
	LD	B,A
	INC	BC

.loc_ad53:
	LD	HL,0600h
	SBC	HL,BC
	RET	NC
	JP	NEGATE_OBJECT_ACCEL_X	; asm/banks/bank01.asm

; Nudge the feather 8.8 fixed-point X coordinate toward screen center X=80h by (80h - OBJ_X)
; / 16 pixels
DRIFT_FEATHER_X_TOWARD_CENTER:
	LD	A,80h
	SUB	(IX+OBJ_X)
	LD	L,A
	RLCA
	SBC	A,A
	LD	H,A
	LD	D,(IX+OBJ_X)
	LD	E,(IX+OBJ_X_FRAC)
	ADD	HL,HL
	ADD	HL,HL
	ADD	HL,HL
	ADD	HL,HL
	ADD	HL,DE
	LD	(IX+OBJ_X),H
	LD	(IX+OBJ_X_FRAC),L
	RET

; Spawn initializer for runtime gameplay object type 2Ah
OBJ_INIT_TYPE_2A:
	LD	HL,OBJ_TYPE_2A_HITBOX
	CALL	SET_OBJECT_HITBOX_FROM_HL
	LD	(IX+OBJ_ANIM_TIMER),00h
	LD	(IX+OBJ_SPRITE_POSE),4Dh
	LD	(IX+OBJ_ACTION_TIMER),08h
	RET

; 4-byte 16x16 bounding-box preset (-15, -8, 16x16) for OBJ_TYPE 2Ah destructible enemy
; projectiles
OBJ_TYPE_2A_HITBOX:
	DB	F1h,F8h,10h,10h

; Per-frame update handler for runtime gameplay object type 2Ah
OBJ_UPDATE_TYPE_2A:
	CALL	CHECK_DESTRUCTIBLE_SHOT_HIT
	LD	BC,4D01h
	CALL	TOGGLE_OBJECT_TWO_FRAME_POSE
	LD	A,(IX+OBJ_PHASE)
	DEC	A
	RET	Z
	CALL	APPLY_VERTICAL_SCROLL_TO_OBJECT_Y
	DEC	(IX+OBJ_ACTION_TIMER)
	RET	NZ
	INC	(IX+OBJ_PHASE)
	INC	(IX+OBJ_ANIM_TIMER)
	LD	A,60h
	JP	AIM_OBJECT_VELOCITY_TOWARD_GAO	; asm/banks/bank01.asm

; Spawn initializer for runtime gameplay object type 2Bh
OBJ_INIT_TYPE_2B:
	LD	HL,OBJ_TYPE_2B_HITBOX
	CALL	SET_OBJECT_HITBOX_FROM_HL
	LD	(IX+OBJ_SPRITE_POSE),3Ch
	LD	A,58h
	JP	AIM_OBJECT_VELOCITY_TOWARD_GAO	; asm/banks/bank01.asm

; 4-byte 7x7 bounding-box preset (-10, -3, 7x7) for OBJ_TYPE 2Bh small destructible
; projectiles
OBJ_TYPE_2B_HITBOX:
	DB	F6h,FDh,07h,07h

; Per-frame update handler for runtime gameplay object type 2Bh
OBJ_UPDATE_TYPE_2B:
	JP	CHECK_DESTRUCTIBLE_SHOT_HIT

; Spawn initializer for runtime gameplay object type 30h
OBJ_INIT_TYPE_30:
	LD	BC,2810h
	CALL	DESPAWN_IF_WITHIN_BC_OF_GAO
	LD	HL,OBJ_TYPE_30_HITBOX
	CALL	SET_OBJECT_HITBOX_FROM_HL
	LD	A,(LEVEL_NUMBER)
	CP	05h
	JR	NZ,.loc_addb
	LD	(IX+OBJ_PART0_SPRITE_LO),0Fh

.loc_addb:
	JP	KINEMATIC_MODE_HANDLER_03	; asm/banks/bank01.asm

; 4-byte 16x16 bounding-box preset (-15, -8, 16x16) for OBJ_TYPE 30h destructible walker
; projectiles
OBJ_TYPE_30_HITBOX:
	DB	F1h,F8h,10h,10h

; Per-frame update handler for runtime gameplay object type 30h
OBJ_UPDATE_TYPE_30:
	JP	CHECK_DESTRUCTIBLE_SHOT_HIT

; Dispatch per-level boss controller via BOSS_ENCOUNTER_HANDLER_TABLE when in a boss arena
DISPATCH_ACTIVE_BOSS_ENCOUNTER:
	CALL	CHECK_BOSS_ROUTE_MESSAGE_EVENT
	LD	A,(BOSS_ENCOUNTER_ACTIVE)
	DEC	A
	RET	M
	CALL	INLINE_WORD_DISPATCH

; 6-entry inline DW dispatch table for Bosses 1..6 arena controllers
BOSS_ENCOUNTER_HANDLER_TABLE:
	DW	UPDATE_BOSS_1_CONTROLLER	; [00h]
	DW	UPDATE_BOSS_2_CONTROLLER	; [01h]
	DW	UPDATE_BOSS_3_CONTROLLER	; [02h]
	DW	UPDATE_BOSS_4_CONTROLLER	; [03h]
	DW	UPDATE_BOSS_5_CONTROLLER	; [04h]
	DW	UPDATE_BOSS_6_CONTROLLER	; [05h]

; Process weapon hits on a sprite-based boss, trigger hit-flash colors and SFX 30h/31h, and
; mark BOSS_COMPLETION_FLAG=01h when HP reaches zero
PROCESS_BOSS_HIT_AND_DEFEAT:
	LD	A,(IX+OBJ_PART0_SPRITE_LO)
	CP	8Ch
	LD	DE,OBJECT_POSE_COLOR_PTR_TABLE - 02h
	CALL	Z,LOAD_DEFAULT_OBJECT_SPRITE_COLORS
	LD	A,(GAO_MODE)
	CP	02h
	JR	NZ,.loc_ae12
	LD	(IX+OBJ_HIT_REACTION),00h

.loc_ae12:
	LD	A,(IX+OBJ_HIT_REACTION)
	AND	0Bh
	RET	Z
	LD	A,(SPRITE_SET_SELECTOR)
	CP	17h
	LD	A,30h
	JR	NZ,.loc_ae23
	LD	A,31h

.loc_ae23:
	CALL	QUEUE_SOUND_COMMAND_IF_UNLOCKED
	LD	DE,BOSS_HIT_FLASH_COLOR_TABLE
	CALL	SET_OBJECT_SPRITE_PART_COLORS_DE
	CALL	APPLY_DAMAGE_BITS_TO_OBJECT_HP
	RET	NC
	LD	L,(IX+OBJ_Y)
	LD	H,(IX+OBJ_X)
	LD	(BOSS_ORIGIN_COORD_WORD),HL
	XOR	A
	LD	(IX+OBJ_BOSS_HIT_FLAG),A
	INC	A
	LD	(BOSS_COMPLETION_FLAG),A
	LD	A,(BOSS_DROP_COLLECT_CNT)
	INC	A
	LD	(BOSS_DROP_COLLECT_CNT),A
	RET

; 12-byte sprite attribute color table filled with color 0Ch applied when a boss takes
; damage
BOSS_HIT_FLASH_COLOR_TABLE:
	DB	0Ch,0Ch,0Ch,0Ch,0Ch,0Ch,0Ch,0Ch,0Ch,0Ch,0Ch,0Ch

; Check OBJ_HIT_REACTION on a destructible projectile, apply damage to HP, and despawn with
; SFX 11h when destroyed
CHECK_DESTRUCTIBLE_SHOT_HIT:
	LD	A,(IX+OBJ_HIT_REACTION)
	AND	A
	RET	Z
	CALL	APPLY_DAMAGE_BITS_TO_OBJECT_HP
	RET	NC
	LD	A,11h
	CALL	QUEUE_SOUND_COMMAND_IF_UNLOCKED
	JP	DEACTIVATE_OBJECT_IX_AND_SPRITES	; asm/banks/bank01.asm

; Count down BOSS_PHASE_TIMER after Boss 1..5 defeat, clear boss encounter locks, and resume
; stage BGM 43h
FINISH_BOSS_ENCOUNTER_AND_BGM:
	LD	HL,BOSS_PHASE_TIMER
	DEC	(HL)
	RET	NZ
	XOR	A
	LD	(BOSS_ENCOUNTER_ACTIVE),A
	LD	(BOSS_SUBPHASE_A),A
	LD	(BOSS_SUBPHASE_B),A
	LD	HL,GAMEPLAY_EVENT_FLAGS
	RES	00h,(HL)
	LD	A,43h
	JP	QUEUE_SOUND_COMMAND_IF_UNLOCKED	; asm/banks/bank00.asm

; Spawn defeated Boss 1..5 Group 3 square Kanji Stone drop (Items 1Ch..20h: 天 空 水 明 充,
; unlocking Stages 1..5 T03 walk-through barrier gates) at BOSS_ORIGIN_COORD_WORD if uncollected
SPAWN_LEVEL_BOSS_SACRED_ORB:
	LD	A,(LEVEL_NUMBER)
	LD	HL,BOSS_ORB_ITEM_INDEX_TABLE - 01h
	CALL	ADD_A_TO_HL
	LD	A,(HL)
	LD	B,A
	ADD	A,A
	ADD	A,A
	LD	HL,INV_STAGE6_STONE_GRP2	; INV_SQUARE_STONES_GRP3 - 04h (1-based base for B = 1..5)
	CALL	ADD_A_TO_HL
	LD	A,(HL)
	AND	A
	RET	NZ
	LD	A,1Bh
	ADD	A,B
	LD	DE,(BOSS_ORIGIN_COORD_WORD)
	JP	SPAWN_ITEM_DROP_OR_FALLBACK_AT_DE	; asm/banks/bank01.asm

; 1-based Group 3 Kanji Stone indices dropped by Bosses 1..5 (1Bh+B -> 20h=充, 1Ch=天, 1Dh=空, 1Eh=水, 1Fh=明)
BOSS_ORB_ITEM_INDEX_TABLE:
	DB	05h,01h,02h,03h,04h

; Count down boss intro materialization timer, blink sprite visibility while invulnerable,
; and advance OBJ_PHASE when ready
STEP_BOSS_INTRO_BLINK_TIMER:
	LD	(IX+OBJ_ANIM_TIMER),00h
	DEC	(IX+OBJ_ACTION_TIMER)
	JR	Z,.loc_aec7
	LD	A,(IX+OBJ_ACTION_TIMER)
	CP	38h
	JR	NC,.loc_aec2
	LD	A,(FRAME_COUNTER)
	AND	02h
	LD	C,00h
	JR	Z,.loc_aebe
	INC	C

.loc_aebe:
	LD	A,01h
	JR	.loc_aecd

.loc_aec2:
	LD	A,01h
	LD	C,A
	JR	.loc_aecd

.loc_aec7:
	INC	(IX+OBJ_PHASE)
	XOR	A
	LD	C,01h

.loc_aecd:
	LD	(IX+OBJ_COLLISION_MODE),C
	LD	(BOSS_INVULN_OR_FLASH),A
	XOR	01h
	RET

; Adjust respawned boss starting HP in OBJ_HIT_POINTS using prior encounter HP saved in
; BOSS_SUBPHASE_A and BOSS_SUBPHASE_B
RESTORE_PARTIAL_BOSS_HP_ON_RETRY:
	LD	A,(BOSS_SUBPHASE_A)
	AND	A
	RET	Z
	LD	B,A
	LD	A,(BOSS_SUBPHASE_B)
	AND	A
	JR	NZ,.loc_aee5
	LD	A,(IX+OBJ_HIT_POINTS)

.loc_aee5:
	ADD	A,B
	SRL	A
	LD	(IX+OBJ_HIT_POINTS),A
	LD	A,B
	LD	(BOSS_SUBPHASE_B),A
	RET

; Record the boss remaining hit points from OBJ_HIT_POINTS into BOSS_SUBPHASE_A
SAVE_CURRENT_BOSS_HP_STATE:
	LD	A,(IX+OBJ_HIT_POINTS)
	LD	(BOSS_SUBPHASE_A),A
	RET

; Clear active gameplay objects, spawn B OBJ_TYPE 2Ch explosions around
; BOSS_ORIGIN_COORD_WORD from offset table HL, and set BOSS_PHASE_TIMER=3Ch
SPAWN_BOSS_DEFEAT_EXPLOSIONS:
	PUSH	HL
	PUSH	BC
	CALL	CLEAR_ALL_GAMEPLAY_OBJECTS
	POP	BC
	POP	HL
	LD	C,2Ch

.loc_af00:
	LD	A,(BOSS_ORIGIN_COORD_WORD)
	LD	E,(HL)
	INC	HL
	ADD	A,E
	LD	E,A
	LD	A,(BOSS_ORIGIN_Y)
	LD	D,(HL)
	INC	HL
	ADD	A,D
	LD	D,A
	PUSH	HL
	PUSH	BC
	CALL	SPAWN_GAMEPLAY_OBJECT_TYPE_A
	POP	BC
	POP	HL
	DJNZ	.loc_af00
	LD	A,3Ch
	LD	(BOSS_PHASE_TIMER),A
	RET

; Spawn initializer for runtime gameplay object type 34h
OBJ_INIT_TYPE_34:
	LD	HL,BOSS3_BODY_SHIELD_HITBOX
	JR	INIT_BOSS_BODY_SHIELD_HITBOX

; Spawn initializer for runtime gameplay object type 35h
OBJ_INIT_TYPE_35:
	LD	HL,BOSS2_BODY_SHIELD_HITBOX
	JR	INIT_BOSS_BODY_SHIELD_HITBOX

; Spawn initializer for runtime gameplay object type 36h
OBJ_INIT_TYPE_36:
	LD	HL,BOSS4_BODY_SHIELD_HITBOX
	JR	INIT_BOSS_BODY_SHIELD_HITBOX

; Spawn initializer for runtime gameplay object type 37h
OBJ_INIT_TYPE_37:
	LD	HL,BOSS5_BODY_SHIELD_HITBOX
	JR	INIT_BOSS_BODY_SHIELD_HITBOX

; Spawn initializer for runtime gameplay object type 38h
OBJ_INIT_TYPE_38:
	LD	HL,BOSS6_BODY_SHIELD_HITBOX
	JR	INIT_BOSS_BODY_SHIELD_HITBOX

; Spawn initializer for runtime gameplay object type 39h
OBJ_INIT_TYPE_39:
	LD	HL,BOSS1_BODY_SHIELD_HITBOX

; Initialize a boss outer body-shield helper object (OBJ_TYPE 34h..39h) with pose 37h and
; intangible hitbox HL
INIT_BOSS_BODY_SHIELD_HITBOX:
	LD	(IX+OBJ_ANIM_TIMER),00h
	LD	(IX+OBJ_SPRITE_POSE),37h
	JP	SET_INTANGIBLE_OBJECT_HITBOX_HL	; asm/banks/bank01.asm

; 4-byte 32x32 outer body-shield bounding box (-31, -16, 32x32) for Boss 1 helper OBJ_TYPE
; 39h
BOSS1_BODY_SHIELD_HITBOX:
	DB	E1h,F0h,20h,20h

; 4-byte 32x19 outer body-shield bounding box (-31, -9, 32x19) for Boss 3 helper OBJ_TYPE
; 34h
BOSS3_BODY_SHIELD_HITBOX:
	DB	E1h,F7h,20h,13h

; 4-byte 32x24 outer body-shield bounding box (-31, -12, 32x24) for Boss 2 helper OBJ_TYPE
; 35h
BOSS2_BODY_SHIELD_HITBOX:
	DB	E1h,F4h,20h,18h

; 4-byte 48x28 outer body-shield bounding box (-47, -12, 48x28) for Boss 4 helper OBJ_TYPE
; 36h
BOSS4_BODY_SHIELD_HITBOX:
	DB	D1h,F4h,30h,1Ch

; 4-byte 48x32 outer body-shield bounding box (-47, -16, 48x32) for Boss 5 helper OBJ_TYPE
; 37h
BOSS5_BODY_SHIELD_HITBOX:
	DB	D1h,F0h,30h,20h

; 4-byte 48x32 outer body-shield bounding box (-47, -16, 48x32) for Boss 6 helper OBJ_TYPE
; 38h
BOSS6_BODY_SHIELD_HITBOX:
	DB	D1h,F0h,30h,20h

; Initialize boss encounter state and arena locks
ENTER_BOSS_OR_SPECIAL_ENCOUNTER:
	LD	HL,GAMEPLAY_OBJECT_TABLE
	LD	B,0Ah

.loc_af61:
	LD	A,(HL)
	AND	A
	JR	Z,.loc_af73
	CP	1Bh
	JR	NC,.loc_af73
	PUSH	BC
	PUSH	HL
	PUSH	HL
	POP	IX
	CALL	CONVERT_OBJECT_TO_EXPLOSION_2C
	POP	HL
	POP	BC

.loc_af73:
	LD	DE,0080h
	ADD	HL,DE
	DJNZ	.loc_af61
	RET

; Deactivate all ten slots in GAMEPLAY_OBJECT_TABLE and release their SAT entries before
; spawning boss defeat explosions
CLEAR_ALL_GAMEPLAY_OBJECTS:
	LD	HL,GAMEPLAY_OBJECT_TABLE
	LD	B,0Ah

.loc_af7f:
	LD	A,(HL)
	AND	A
	JR	Z,.loc_af8a
	PUSH	BC
	PUSH	HL
	CALL	DEACTIVATE_OBJECT_HL_AND_SPRITES
	POP	HL
	POP	BC

.loc_af8a:
	LD	DE,0080h
	ADD	HL,DE
	DJNZ	.loc_af7f
	RET

; Spawn the left and right OBJ_TYPE 21h boss-intro convergence sparks
SPAWN_BOSS_INTRO_SPARK_PAIR:
	LD	HL,BOSS_INTRO_LEFT_SPARK_DESC
	CALL	SPAWN_OBJECT_FROM_3BYTE_DESC
	LD	HL,BOSS_INTRO_RIGHT_SPARK_DESC

; Read object type C and coordinates (D=X, E=Y) from 3-byte descriptor HL and spawn the
; gameplay object
SPAWN_OBJECT_FROM_3BYTE_DESC:
	LD	C,(HL)
	INC	HL
	LD	D,(HL)
	INC	HL
	LD	E,(HL)
	JP	SPAWN_GAMEPLAY_OBJECT_TYPE_A	; asm/banks/bank01.asm

; 3-byte spawn descriptor (type 21h at X=06h, Y=5Dh) for the left boss-intro convergence
; spark
BOSS_INTRO_LEFT_SPARK_DESC:
	DB	21h,06h,5Dh

; 3-byte spawn descriptor (type 21h at X=FAh, Y=03h) for the right boss-intro convergence
; spark
BOSS_INTRO_RIGHT_SPARK_DESC:
	DB	21h,FAh,03h

; Spawn initializer for runtime gameplay object type 21h
OBJ_INIT_TYPE_21:
	LD	HL,OBJ_TYPE_21_KINEMATIC_PARAMS
	CALL	COPY_OBJECT_KINEMATIC_PARAMS_HL
	XOR	A
	LD	(IX+OBJ_EXTENT_X),A
	BIT	07h,(IX+OBJ_X)
	RET	Z
	LD	(IX+OBJ_EXTENT_X),06h
	CALL	NEGATE_OBJECT_VEL_Y
	CALL	NEGATE_OBJECT_VEL_X
	JP	NEGATE_OBJECT_ACCEL_Y	; asm/banks/bank01.asm

; 11-byte initial kinematic parameter template for OBJ_TYPE 21h boss-intro convergence
; sparks (pose 4Bh, timer 07h)
OBJ_TYPE_21_KINEMATIC_PARAMS:
	DB	00h,F0h,00h,F0h,01h,C8h,00h,00h,00h,4Bh,07h

; Per-frame update handler for runtime gameplay object type 21h
OBJ_UPDATE_TYPE_21:
	LD	BC,4B04h
	CALL	TOGGLE_OBJECT_TWO_FRAME_POSE
	LD	B,(IX+OBJ_PHASE)
	DJNZ	.loc_b002
	DEC	(IX+OBJ_ACTION_TIMER)
	JR	NZ,.loc_afe2
	JP	DEACTIVATE_OBJECT_IX_AND_SPRITES	; asm/banks/bank01.asm

.loc_afe2:
	LD	A,(IX+OBJ_EXTENT_X)
	ADD	A,A
	LD	HL,OBJ_TYPE_21_ORBIT_COORD_TABLE
	CALL	ADD_A_TO_HL
	LD	A,(IX+OBJ_EXTENT_X)
	INC	A
	CP	0Ch
	JR	C,.loc_aff5
	XOR	A

.loc_aff5:
	LD	(IX+OBJ_EXTENT_X),A
	LD	A,(HL)
	LD	(IX+OBJ_Y),A
	INC	HL
	LD	A,(HL)
	LD	(IX+OBJ_X),A
	RET

.loc_b002:
	DEC	(IX+OBJ_ACTION_TIMER)
	RET	NZ
	XOR	A
	LD	(IX+OBJ_ANIM_TIMER),A
	LD	(IX+OBJ_ACCEL_ENABLE),A
	LD	(IX+OBJ_ACTION_TIMER),38h
	INC	(IX+OBJ_PHASE)
	RET

; 24-byte table of twelve (Y, X) ring coordinates around (80h, 30h) stepped by OBJ_TYPE 21h
; sparks during boss materialization
OBJ_TYPE_21_ORBIT_COORD_TABLE:
	DB	11h,77h,19h,69h,27h,61h,37h,61h,46h,69h,4Eh,77h,4Eh,88h,49h,97h
	DB	37h,9Fh,27h,9Fh,19h,97h,11h,88h

; Check boss route entry conditions and trigger Firebird hint dialogue if required stone/orb
; is missing
CHECK_BOSS_ROUTE_MESSAGE_EVENT:
	LD	A,(BOSS_ENCOUNTER_ACTIVE)
	AND	A
	RET	NZ
	LD	A,(SPRITE_SET_SELECTOR)
	SUB	12h
	RET	C
	LD	HL,0023h
	LD	BC,(LEVEL_ROUTE_ROW)
	AND	A
	SBC	HL,BC
	RET	NZ
	LD	A,(BOSS_COMPLETION_FLAG)
	AND	A
	RET	NZ
	LD	A,(LEVEL_NUMBER)
	CP	06h
	JR	NZ,.loc_b060
	LD	HL,INV_SUPERBALL_SLOTS_BASE
	LD	B,05h
	XOR	A

.loc_b055:
	CP	(HL)
	JR	Z,TRIGGER_LEVEL_SIX_BIRD_MESSAGE
	LD	DE,0004h
	ADD	HL,DE
	DJNZ	.loc_b055
	LD	A,06h

.loc_b060:
	LD	HL,GAMEPLAY_EVENT_FLAGS
	SET	00h,(HL)
	LD	L,A
	LD	H,00h
	LD	(BOSS_ENCOUNTER_ACTIVE),HL
	XOR	A
	LD	(BOSS_COMPLETION_FLAG),A
	RET

; Trigger Level 6 final Firebird guidance message
TRIGGER_LEVEL_SIX_BIRD_MESSAGE:
	LD	A,01h
	LD	(BOSS_COMPLETION_FLAG),A
	LD	A,28h
	LD	(GAMEPLAY_MSG_SELECTOR),A
	LD	A,12h
	JP	SET_MAIN_STATE_AND_RESET_SUBSTATE	; asm/banks/bank00.asm

; Boss 1 encounter state machine and attack pattern controller
UPDATE_BOSS_1_CONTROLLER:
	LD	A,(BOSS_STATE_PHASE)
	DEC	A
	JR	Z,BOSS1_CHECK_DEFEAT_AND_REWARD
	JP	P,FINISH_BOSS_ENCOUNTER_AND_BGM
	LD	C,39h
	LD	DE,8030h
	CALL	SPAWN_GAMEPLAY_OBJECT_TYPE_A
	LD	C,1Bh
	LD	DE,8030h
	CALL	SPAWN_GAMEPLAY_OBJECT_TYPE_A

; Increment BOSS_STATE_PHASE to advance the active boss encounter controller to its next
; state
ADVANCE_BOSS_CONTROLLER_PHASE:
	LD	HL,BOSS_STATE_PHASE
	INC	(HL)
	RET

; Poll BOSS_COMPLETION_FLAG for Boss 1 defeat, spawn sacred orb and six explosions, set
; DEFEATED_BOSS_MASK bit 0, award score, and play fanfare 4Fh
BOSS1_CHECK_DEFEAT_AND_REWARD:
	LD	A,(BOSS_COMPLETION_FLAG)
	AND	A
	RET	Z
	CALL	SPAWN_LEVEL_BOSS_SACRED_ORB
	LD	HL,DEFEATED_BOSS_MASK
	SET	00h,(HL)
	LD	HL,0064h
	CALL	ADD_HL_TO_PLAYER_SCORE_BCD
	LD	A,4Fh
	CALL	QUEUE_SOUND_COMMAND_IF_UNLOCKED
	LD	B,06h
	LD	HL,BOSS1_DEFEAT_EXPLOSION_OFFSETS
	CALL	SPAWN_BOSS_DEFEAT_EXPLOSIONS
	JR	ADVANCE_BOSS_CONTROLLER_PHASE

; 12-byte table of six (dY, dX) explosion offsets spawned around Boss 1 on defeat
BOSS1_DEFEAT_EXPLOSION_OFFSETS:
	DB	00h,00h,F7h,F5h,F6h,01h,F8h,0Bh,F0h,FBh,EEh,05h

; Spawn initializer for runtime gameplay object type 1Bh
OBJ_INIT_TYPE_1B:
	LD	HL,BOSS1_WEAKPOINT_HITBOX
	CALL	SET_INTANGIBLE_OBJECT_HITBOX_HL
	LD	HL,BOSS1_KINEMATIC_PARAMS
	CALL	COPY_OBJECT_KINEMATIC_PARAMS_HL
	CALL	RESTORE_PARTIAL_BOSS_HP_ON_RETRY
	XOR	A
	LD	(IX+OBJ_EXTENT_X),A
	LD	(IX+OBJ_WORK_2),A
	LD	(IX+OBJ_BOSS_HIT_FLAG),01h
	JP	SPAWN_BOSS_INTRO_SPARK_PAIR

; 11-byte initial kinematic parameter template for Boss 1 (OBJ_TYPE 1Bh, X velocity +0800h,
; pose 2Eh, intro timer 40h)
BOSS1_KINEMATIC_PARAMS:
	DB	00h,00h,00h,08h,00h,00h,00h,00h,00h,2Eh,40h

; 4-byte 32x25 damageable weak-point bounding box (-31, -10, 32x25) for Boss 1 (OBJ_TYPE
; 1Bh)
BOSS1_WEAKPOINT_HITBOX:
	DB	E1h,F6h,20h,19h

; Per-frame update handler for runtime gameplay object type 1Bh
OBJ_UPDATE_TYPE_1B:
	CALL	PROCESS_BOSS_HIT_AND_DEFEAT
	LD	A,(BOSS_COMPLETION_FLAG)
	AND	A
	RET	NZ
	CALL	SAVE_CURRENT_BOSS_HP_STATE
	LD	A,(IX+OBJ_PHASE)
	CALL	INLINE_WORD_DISPATCH

; 5-entry inline DW dispatch table for Boss 1 phases
BOSS_1_PHASE_DISPATCH_TABLE:
	DW	BOSS1_PHASE_HANDLER_00	; [00h]
	DW	BOSS1_PHASE_HANDLER_01	; [01h]
	DW	BOSS1_PHASE_HANDLER_02	; [02h]
	DW	BOSS1_PHASE_HANDLER_03	; [03h]
	DW	BOSS1_PHASE_HANDLER_04	; [04h]

; Boss 1 behaviour phase 00h handler
BOSS1_PHASE_HANDLER_00:
	CALL	STEP_BOSS_INTRO_BLINK_TIMER
	RET	Z
	LD	(IX+OBJ_ANIM_TIMER),01h
	LD	(IX+OBJ_ACTION_TIMER),09h
	LD	(IX+OBJ_COLLISION_CLASS),00h
	RET

; Boss 1 behaviour phase 01h handler
BOSS1_PHASE_HANDLER_01:
	LD	BC,2E08h
	CALL	TOGGLE_OBJECT_TWO_FRAME_POSE
	LD	A,(IX+OBJ_VEL_X_HI)
	AND	A
	JR	Z,.loc_b14e
	BIT	00h,(IX+OBJ_WORK_2)
	JR	NZ,.loc_b14e
	LD	A,(GAO_POS_X)
	SUB	(IX+OBJ_X)
	ADD	A,04h
	CP	08h
	JR	C,.loc_b187
	LD	A,(IX+OBJ_X)
	ADD	A,34h
	CP	68h
	JR	NC,.loc_b14e
	LD	(IX+OBJ_ACTION_TIMER),01h

.loc_b14e:
	DEC	(IX+OBJ_ACTION_TIMER)
	RET	NZ
	LD	A,(IX+OBJ_Y)
	CP	48h
	LD	C,01h
	JR	C,.loc_b15d
	LD	C,02h

.loc_b15d:
	LD	A,(IX+OBJ_X)
	CP	60h
	JR	C,.loc_b166
	SET	03h,C

.loc_b166:
	CP	A0h
	JR	NC,.loc_b16c
	SET	02h,C

.loc_b16c:
	LD	(IX+OBJ_EXTENT_X),C
	CALL	NEXT_PSEUDO_RANDOM_BYTE
	AND	03h
	JP	Z,BOSS1_SELECT_NEXT_DASH_VECTOR
	LD	(IX+OBJ_VEL_X_HI),00h
	LD	(IX+OBJ_VEL_Y_HI),00h

.loc_b17f:
	LD	(IX+OBJ_WORK_1),08h
	INC	(IX+OBJ_PHASE)
	RET

.loc_b187:
	LD	(IX+OBJ_PHASE),03h
	LD	(IX+OBJ_ANIM_TIMER),00h
	JR	.loc_b17f

; Boss 1 behaviour phase 02h handler
BOSS1_PHASE_HANDLER_02:
	DEC	(IX+OBJ_WORK_1)
	LD	A,(IX+OBJ_WORK_1)
	CP	06h
	JR	Z,BOSS1_FIRE_PROJECTILE_24
	RET	NC
	AND	A
	RET	NZ
	LD	(IX+OBJ_ACTION_TIMER),02h
	INC	(IX+OBJ_PHASE)
	RET

; Set Boss 1 attack pose 30h, queue SFX 29h, and spawn an OBJ_TYPE 24h downward curving
; projectile
BOSS1_FIRE_PROJECTILE_24:
	LD	(IX+OBJ_SPRITE_POSE),30h
	LD	A,(SND_CH0_SOUND_ID)
	OR	A
	JR	Z,.loc_b1b5
	LD	A,29h
	CALL	QUEUE_SOUND_COMMAND_IF_UNLOCKED

.loc_b1b5:
	LD	C,24h
	LD	E,(IX+OBJ_Y)
	LD	D,(IX+OBJ_X)
	JP	SPAWN_GAMEPLAY_OBJECT_TYPE_A	; asm/banks/bank01.asm

; Boss 1 behaviour phase 03h handler
BOSS1_PHASE_HANDLER_03:
	LD	BC,2E08h
	CALL	TOGGLE_OBJECT_TWO_FRAME_POSE
	LD	A,(IX+OBJ_ACTION_TIMER)
	CP	1Ah
	JR	NC,BOSS1_SELECT_NEXT_DASH_VECTOR
	BIT	02h,A
	LD	A,04h
	JR	NZ,.loc_b1d5
	NEG

.loc_b1d5:
	LD	(IX+OBJ_VEL_X_HI),A
	INC	(IX+OBJ_ACTION_TIMER)
	RET

; Choose an in-bounds cardinal dash direction for Boss 1, load its velocity and 9-frame
; duration, and return to phase 01h
BOSS1_SELECT_NEXT_DASH_VECTOR:
	LD	(IX+OBJ_WORK_2),00h
	CALL	NEXT_PSEUDO_RANDOM_BYTE
	AND	01h
	JR	Z,.loc_b209
	CALL	NEXT_PSEUDO_RANDOM_BYTE
	LD	C,03h
	AND	01h
	JR	Z,.loc_b1f2
	LD	C,0Ch

.loc_b1f2:
	LD	A,(IX+OBJ_EXTENT_X)
	AND	C
	CP	0Ch
	JR	C,.loc_b222
	PUSH	AF
	CALL	NEXT_PSEUDO_RANDOM_BYTE
	AND	01h
	LD	C,08h
	JR	Z,.loc_b206
	LD	C,04h

.loc_b206:
	POP	AF
	JR	.loc_b219

.loc_b209:
	LD	A,(GAO_POS_X)
	LD	C,(IX+OBJ_X)
	CP	C
	LD	C,04h
	JR	NC,.loc_b216
	LD	C,08h

.loc_b216:
	LD	A,(IX+OBJ_EXTENT_X)

.loc_b219:
	AND	C
	AND	A
	JR	NZ,.loc_b222
	LD	A,(IX+OBJ_EXTENT_X)
	AND	03h

.loc_b222:
	BIT	00h,A
	LD	HL,BOSS1_DASH_DOWN_PARAMS
	JR	NZ,.loc_b23a
	BIT	01h,A
	LD	HL,BOSS1_DASH_UP_PARAMS
	JR	NZ,.loc_b23a
	BIT	02h,A
	LD	HL,BOSS1_DASH_RIGHT_PARAMS
	JR	NZ,.loc_b23a
	LD	HL,BOSS1_DASH_LEFT_PARAMS

.loc_b23a:
	LD	A,(HL)
	LD	(IX+OBJ_VEL_Y_HI),A
	INC	HL
	LD	A,(HL)
	LD	(IX+OBJ_VEL_X_HI),A
	INC	HL
	LD	A,(HL)
	LD	(IX+OBJ_ACTION_TIMER),A
	LD	(IX+OBJ_PHASE),01h
	RET

; 3-byte dash parameter triple (VEL_Y_HI=+6, VEL_X_HI=0, timer=9) moving Boss 1 downward
BOSS1_DASH_DOWN_PARAMS:
	DB	06h,00h,09h

; 3-byte dash parameter triple (VEL_Y_HI=-6, VEL_X_HI=0, timer=9) moving Boss 1 upward
BOSS1_DASH_UP_PARAMS:
	DB	FAh,00h,09h

; 3-byte dash parameter triple (VEL_Y_HI=0, VEL_X_HI=+8, timer=9) moving Boss 1 right
BOSS1_DASH_RIGHT_PARAMS:
	DB	00h,08h,09h

; 3-byte dash parameter triple (VEL_Y_HI=0, VEL_X_HI=-8, timer=9) moving Boss 1 left
BOSS1_DASH_LEFT_PARAMS:
	DB	00h,F8h,09h

; Boss 1 behaviour phase 04h handler
BOSS1_PHASE_HANDLER_04:
	DEC	(IX+OBJ_WORK_1)
	LD	A,(IX+OBJ_WORK_1)
	CP	06h
	JP	Z,BOSS1_FIRE_PROJECTILE_24
	RET	NC
	AND	A
	RET	NZ
	INC	(IX+OBJ_WORK_2)
	INC	(IX+OBJ_ANIM_TIMER)
	LD	(IX+OBJ_PHASE),01h
	RET

; Spawn initializer for runtime gameplay object type 24h
OBJ_INIT_TYPE_24:
	LD	HL,OBJ_TYPE_24_HITBOX
	CALL	SET_OBJECT_HITBOX_FROM_HL
	LD	HL,OBJ_TYPE_24_KINEMATIC_PARAMS
	CALL	COPY_OBJECT_KINEMATIC_PARAMS_HL
	LD	A,(GAO_POS_X)
	LD	C,(IX+OBJ_X)
	SUB	C
	LD	B,00h
	JR	NC,.loc_b28c
	NEG
	INC	B

.loc_b28c:
	CP	20h
	JR	C,.loc_b292
	LD	A,20h

.loc_b292:
	LD	(IX+OBJ_ACCEL_X_LO),A
	BIT	00h,B
	RET	Z
	JP	NEGATE_OBJECT_ACCEL_X	; asm/banks/bank01.asm

; 11-byte initial kinematic parameter template for Boss 1 projectile OBJ_TYPE 24h (Y
; velocity +0500h, accel enabled, pose 3Eh)
OBJ_TYPE_24_KINEMATIC_PARAMS:
	DB	00h,05h,00h,00h,01h,00h,00h,00h,00h,3Eh,00h

; 4-byte 26x16 bounding-box preset (-26, -8, 26x16) for Boss 1 projectile OBJ_TYPE 24h
OBJ_TYPE_24_HITBOX:
	DB	E6h,F8h,1Ah,10h

; Per-frame update handler for runtime gameplay object type 24h
OBJ_UPDATE_TYPE_24:
	JP	CHECK_DESTRUCTIBLE_SHOT_HIT

; Boss 3 encounter state machine and attack pattern controller
UPDATE_BOSS_3_CONTROLLER:
	LD	A,(BOSS_STATE_PHASE)
	DEC	A
	JR	Z,.loc_b2c9
	JP	P,FINISH_BOSS_ENCOUNTER_AND_BGM
	LD	C,34h
	LD	DE,8030h
	CALL	SPAWN_GAMEPLAY_OBJECT_TYPE_A
	LD	C,1Ch
	LD	DE,8030h
	CALL	SPAWN_GAMEPLAY_OBJECT_TYPE_A
	JP	ADVANCE_BOSS_CONTROLLER_PHASE

.loc_b2c9:
	LD	A,(BOSS_COMPLETION_FLAG)
	AND	A
	RET	Z
	CALL	SPAWN_LEVEL_BOSS_SACRED_ORB
	LD	HL,DEFEATED_BOSS_MASK
	SET	02h,(HL)
	LD	HL,0064h
	CALL	ADD_HL_TO_PLAYER_SCORE_BCD
	LD	A,4Fh
	CALL	QUEUE_SOUND_COMMAND_IF_UNLOCKED
	LD	B,06h
	LD	HL,BOSS3_DEFEAT_EXPLOSION_OFFSETS
	CALL	SPAWN_BOSS_DEFEAT_EXPLOSIONS
	JP	ADVANCE_BOSS_CONTROLLER_PHASE

; 12-byte table of six (dY, dX) explosion offsets spawned around Boss 3 on defeat
BOSS3_DEFEAT_EXPLOSION_OFFSETS:
	DB	01h,FDh,FDh,05h,F9h,FAh,F7h,00h,F5h,06h,EFh,FFh

; Spawn initializer for runtime gameplay object type 1Ch
OBJ_INIT_TYPE_1C:
	LD	HL,BOSS3_WEAKPOINT_HITBOX
	CALL	SET_INTANGIBLE_OBJECT_HITBOX_HL
	LD	HL,BOSS3_KINEMATIC_PARAMS
	CALL	COPY_OBJECT_KINEMATIC_PARAMS_HL
	CALL	RESTORE_PARTIAL_BOSS_HP_ON_RETRY
	LD	(IX+OBJ_WORK_0),00h
	LD	(IX+OBJ_EXTENT_X),34h
	LD	(IX+OBJ_BOSS_HIT_FLAG),01h
	JP	SPAWN_BOSS_INTRO_SPARK_PAIR

; 11-byte initial kinematic parameter template for Boss 3 (OBJ_TYPE 1Ch, X velocity +0400h,
; pose 31h, intro timer 40h)
BOSS3_KINEMATIC_PARAMS:
	DB	00h,00h,00h,04h,00h,00h,00h,00h,00h,31h,40h

; 4-byte 7x17 damageable weak-point bounding box (-8, -8, 7x17) for Boss 3 (OBJ_TYPE 1Ch)
BOSS3_WEAKPOINT_HITBOX:
	DB	F8h,F8h,07h,11h

; Per-frame update handler for runtime gameplay object type 1Ch
OBJ_UPDATE_TYPE_1C:
	CALL	PROCESS_BOSS_HIT_AND_DEFEAT
	LD	A,(BOSS_COMPLETION_FLAG)
	AND	A
	RET	NZ
	CALL	SAVE_CURRENT_BOSS_HP_STATE
	LD	B,(IX+OBJ_PHASE)
	DJNZ	BOSS3_HANDLE_INTRO_OR_VOLLEY
	DEC	(IX+OBJ_EXTENT_X)
	JR	Z,.loc_b384
	LD	A,(IX+OBJ_WORK_0)
	BIT	00h,A
	LD	A,(IX+OBJ_ACTION_TIMER)
	LD	E,A
	LD	D,00h
	JR	NZ,.loc_b34d
	LD	HL,BOSS3_WAVE_Y_OFFSET_TABLE
	ADD	HL,DE
	JR	.loc_b352

.loc_b34d:
	LD	HL,BOSS3_WAVE_Y_OFFSET_TABLE_END
	SBC	HL,DE

.loc_b352:
	LD	A,(HL)
	ADD	A,30h
	LD	(IX+OBJ_Y),A
	LD	A,(IX+OBJ_X)
	ADD	A,2Bh
	CP	56h
	JR	NC,.loc_b36f
	LD	A,(IX+OBJ_WORK_1)
	AND	A
	JR	NZ,.loc_b373
	INC	(IX+OBJ_WORK_1)
	CALL	NEGATE_OBJECT_VEL_X
	JR	.loc_b373

.loc_b36f:
	LD	(IX+OBJ_WORK_1),00h

.loc_b373:
	INC	(IX+OBJ_ACTION_TIMER)
	LD	A,(IX+OBJ_ACTION_TIMER)
	CP	0Eh
	RET	C
	LD	(IX+OBJ_ACTION_TIMER),00h
	INC	(IX+OBJ_WORK_0)
	RET

.loc_b384:
	XOR	A
	INC	(IX+OBJ_PHASE)
	LD	(IX+OBJ_ANIM_TIMER),A
	LD	(IX+OBJ_SPRITE_POSE),32h
	RET

; 13-byte leading portion of Boss 3 14-step vertical wave Y-offset curve (F9h..2Fh relative
; to Y=30h), scanned forward on even half-waves
BOSS3_WAVE_Y_OFFSET_TABLE:
	DB	F9h,FBh,FEh,02h,07h,0Dh,14h,1Bh,21h,26h,2Ah,2Dh,2Fh

; Terminal 14th byte (30h) of Boss 3 vertical wave Y-offset curve, addressed backward via
; SBC HL,DE on odd half-waves
BOSS3_WAVE_Y_OFFSET_TABLE_END:
	DB	30h

; Handle Boss 3 Phase 2 projectile volley (spawning OBJ_TYPE 29h every 16 frames) or Phase 0
; intro materialization
BOSS3_HANDLE_INTRO_OR_VOLLEY:
	DJNZ	.loc_b3cd
	LD	A,(IX+OBJ_EXTENT_X)
	AND	0Fh
	LD	D,(IX+OBJ_X)
	LD	E,(IX+OBJ_Y)
	LD	C,29h
	PUSH	IX
	CALL	Z,SPAWN_GAMEPLAY_OBJECT_TYPE_A
	POP	IX
	INC	(IX+OBJ_EXTENT_X)
	LD	A,(IX+OBJ_EXTENT_X)
	CP	40h
	RET	C
	DEC	(IX+OBJ_PHASE)
	LD	(IX+OBJ_ANIM_TIMER),01h
	LD	(IX+OBJ_SPRITE_POSE),31h
	LD	(IX+OBJ_EXTENT_X),34h
	RET

.loc_b3cd:
	CALL	STEP_BOSS_INTRO_BLINK_TIMER
	RET	Z
	LD	(IX+OBJ_COLLISION_CLASS),00h
	LD	(IX+OBJ_ANIM_TIMER),01h
	RET

; Spawn initializer for runtime gameplay object type 29h
OBJ_INIT_TYPE_29:
	LD	A,(SND_CH0_SOUND_ID)
	OR	A
	JR	Z,.loc_b3e5
	LD	A,2Ah
	CALL	QUEUE_SOUND_COMMAND_IF_UNLOCKED

.loc_b3e5:
	LD	HL,OBJ_TYPE_29_HITBOX
	CALL	SET_OBJECT_HITBOX_FROM_HL
	LD	HL,OBJ_TYPE_29_KINEMATIC_PARAMS
	CALL	COPY_OBJECT_KINEMATIC_PARAMS_HL
	LD	A,(GAO_POS_X)
	LD	C,(IX+OBJ_X)
	CP	C
	LD	(IX+OBJ_EXTENT_X),00h
	RET	C
	LD	(IX+OBJ_EXTENT_X),01h
	CALL	NEGATE_OBJECT_VEL_X
	JP	NEGATE_OBJECT_ACCEL_X	; asm/banks/bank01.asm

; 11-byte initial kinematic parameter template for Boss 3 swaying projectile OBJ_TYPE 29h (Y
; velocity +0100h, X accel +0050h, pose 41h)
OBJ_TYPE_29_KINEMATIC_PARAMS:
	DB	00h,01h,00h,FCh,01h,00h,00h,50h,00h,41h,17h

; 4-byte 16x16 bounding-box preset (-15, -8, 16x16) for Boss 3 swaying projectile OBJ_TYPE
; 29h
OBJ_TYPE_29_HITBOX:
	DB	F1h,F8h,10h,10h

; Per-frame update handler for runtime gameplay object type 29h
OBJ_UPDATE_TYPE_29:
	CALL	CHECK_DESTRUCTIBLE_SHOT_HIT
	DEC	(IX+OBJ_ACTION_TIMER)
	RET	NZ
	LD	A,(IX+OBJ_EXTENT_X)
	AND	A
	LD	A,(GAO_POS_X)
	LD	C,(IX+OBJ_X)
	JR	Z,.loc_b435
	CP	C
	LD	A,15h
	JR	C,.loc_b430
	LD	A,19h

.loc_b430:
	LD	(IX+OBJ_ACTION_TIMER),A
	JR	.loc_b43f

.loc_b435:
	CP	C
	LD	A,19h
	JR	C,.loc_b43c
	LD	A,15h

.loc_b43c:
	LD	(IX+OBJ_ACTION_TIMER),A

.loc_b43f:
	CALL	APPLY_OBJECT_XY_ACCELERATION
	JP	NEGATE_OBJECT_ACCEL_X	; asm/banks/bank01.asm

; Boss 2 encounter state machine and attack pattern controller
UPDATE_BOSS_2_CONTROLLER:
	LD	A,(BOSS_STATE_PHASE)
	DEC	A
	JR	Z,.loc_b461
	JP	P,FINISH_BOSS_ENCOUNTER_AND_BGM
	LD	C,35h
	LD	DE,8030h
	CALL	SPAWN_GAMEPLAY_OBJECT_TYPE_A
	LD	C,1Dh
	LD	DE,8030h
	CALL	SPAWN_GAMEPLAY_OBJECT_TYPE_A
	JP	ADVANCE_BOSS_CONTROLLER_PHASE

.loc_b461:
	LD	A,(BOSS_COMPLETION_FLAG)
	AND	A
	RET	Z
	CALL	SPAWN_LEVEL_BOSS_SACRED_ORB
	LD	HL,DEFEATED_BOSS_MASK
	SET	01h,(HL)
	LD	HL,0064h
	CALL	ADD_HL_TO_PLAYER_SCORE_BCD
	LD	A,4Fh
	CALL	QUEUE_SOUND_COMMAND_IF_UNLOCKED
	LD	HL,BOSS2_DEFEAT_EXPLOSION_OFFSETS
	LD	B,06h
	CALL	SPAWN_BOSS_DEFEAT_EXPLOSIONS
	JP	ADVANCE_BOSS_CONTROLLER_PHASE

; 12-byte table of six (dY, dX) explosion offsets spawned around Boss 2 on defeat
BOSS2_DEFEAT_EXPLOSION_OFFSETS:
	DB	00h,FAh,FEh,06h,F6h,FFh,F0h,F5h,F1h,0Ah,EDh,02h

; Spawn initializer for runtime gameplay object type 1Dh
OBJ_INIT_TYPE_1D:
	LD	HL,BOSS2_WEAKPOINT_HITBOX
	CALL	SET_INTANGIBLE_OBJECT_HITBOX_HL
	CALL	RESTORE_PARTIAL_BOSS_HP_ON_RETRY
	LD	(IX+OBJ_ACTION_TIMER),40h
	LD	(IX+OBJ_SPRITE_POSE),34h
	LD	(IX+OBJ_BOSS_HIT_FLAG),01h
	LD	A,(GAO_POS_X)
	SUB	(IX+OBJ_X)
	LD	DE,0300h
	JR	NC,.loc_b4b3
	LD	DE,FD00h

.loc_b4b3:
	CALL	SET_OBJECT_VEL_X_FROM_DE
	LD	DE,0000h
	CALL	STEP_OBJECT_XY_BY_VELOCITY
	JP	SPAWN_BOSS_INTRO_SPARK_PAIR

; 4-byte 11x18 damageable weak-point bounding box (-20, -9, 11x18) for Boss 2 (OBJ_TYPE 1Dh)
BOSS2_WEAKPOINT_HITBOX:
	DB	ECh,F7h,0Bh,12h

; Per-frame update handler for runtime gameplay object type 1Dh
OBJ_UPDATE_TYPE_1D:
	CALL	PROCESS_BOSS_HIT_AND_DEFEAT
	LD	A,(BOSS_COMPLETION_FLAG)
	AND	A
	RET	NZ
	CALL	SAVE_CURRENT_BOSS_HP_STATE
	LD	A,(IX+OBJ_PHASE)
	DEC	A
	JR	Z,.loc_b4ef
	JP	P,.loc_b515
	CALL	STEP_BOSS_INTRO_BLINK_TIMER
	RET	Z
	LD	(IX+OBJ_ANIM_TIMER),01h
	LD	(IX+OBJ_ACTION_TIMER),40h
	XOR	A
	LD	(IX+OBJ_EXTENT_X),A
	LD	(IX+OBJ_WORK_0),20h
	LD	(IX+OBJ_COLLISION_CLASS),A
	RET

.loc_b4ef:
	LD	BC,3308h
	CALL	TOGGLE_OBJECT_TWO_FRAME_POSE
	CALL	UPDATE_BOSS2_ATTACK_SUBCYCLE
	DEC	(IX+OBJ_ACTION_TIMER)
	JR	NZ,.loc_b50b
	CALL	NEGATE_OBJECT_VEL_X
	CALL	NEXT_PSEUDO_RANDOM_BYTE
	AND	0Fh
	ADD	A,A
	ADD	A,40h
	LD	(IX+OBJ_ACTION_TIMER),A

.loc_b50b:
	LD	BC,DA26h
	LD	DE,0300h
	CALL	BOUNCE_OBJECT_VEL_X_BETWEEN_C_B
	RET

.loc_b515:
	DEC	(IX+OBJ_ACTION_TIMER)
	RET	NZ
	DEC	(IX+OBJ_PHASE)
	LD	(IX+OBJ_ANIM_TIMER),01h
	LD	(IX+OBJ_ACTION_TIMER),40h
	LD	(IX+OBJ_EXTENT_X),00h
	CALL	NEXT_PSEUDO_RANDOM_BYTE
	AND	0Fh
	ADD	A,A
	ADD	A,20h
	LD	(IX+OBJ_WORK_0),A
	RET

; Step Boss 2 3-substate attack cycle: cooldown, 4-shot downward OBJ_TYPE 22h volley (SFX
; 1Ch), and OBJ_TYPE 23h bomb lob (SFX 1Dh)
UPDATE_BOSS2_ATTACK_SUBCYCLE:
	LD	A,(IX+OBJ_EXTENT_X)
	DEC	A
	JR	Z,.loc_b549
	JP	P,.loc_b56c
	DEC	(IX+OBJ_WORK_0)
	RET	NZ
	LD	(IX+OBJ_WORK_0),1Fh

.loc_b545:
	INC	(IX+OBJ_EXTENT_X)
	RET

.loc_b549:
	LD	A,(IX+OBJ_WORK_0)
	AND	07h
	JR	NZ,.loc_b562
	LD	C,22h
	CALL	SPAWN_BOSS2_PROJECTILE_TYPE_C
	JR	Z,.loc_b562
	LD	A,(SND_CH0_SOUND_ID)
	OR	A
	JR	Z,.loc_b562
	LD	A,1Ch
	CALL	QUEUE_SOUND_COMMAND_IF_UNLOCKED

.loc_b562:
	DEC	(IX+OBJ_WORK_0)
	RET	NZ
	LD	(IX+OBJ_WORK_0),20h
	JR	.loc_b545

.loc_b56c:
	DEC	(IX+OBJ_WORK_0)
	RET	NZ
	INC	(IX+OBJ_PHASE)
	LD	(IX+OBJ_ANIM_TIMER),00h
	LD	(IX+OBJ_ACTION_TIMER),08h
	CALL	SET_BOSS2_THROW_FACING_POSE
	LD	C,23h
	CALL	SPAWN_BOSS2_PROJECTILE_TYPE_C
	RET	Z
	LD	A,(SND_CH0_SOUND_ID)
	OR	A
	RET	Z
	LD	A,1Dh
	JP	QUEUE_SOUND_COMMAND_IF_UNLOCKED	; asm/banks/bank00.asm

; Spawn Boss 2 projectile type C at Boss 2 coordinates and return NZ if object allocation
; succeeded
SPAWN_BOSS2_PROJECTILE_TYPE_C:
	LD	D,(IX+OBJ_X)
	LD	E,(IX+OBJ_Y)
	PUSH	IX
	CALL	SPAWN_GAMEPLAY_OBJECT_TYPE_A
	POP	IX
	LD	A,(BOSS_PROJECTILE_COUNT)
	AND	A
	RET

; Set Boss 2 bomb-throwing sprite pose to 35h (facing right) or 36h (facing left) toward Gao
SET_BOSS2_THROW_FACING_POSE:
	CALL	COMPARE_GAO_X_WITH_OBJECT_X
	LD	B,35h
	JR	NC,.loc_b5a8
	INC	B

.loc_b5a8:
	LD	(IX+OBJ_SPRITE_POSE),B
	RET

; Spawn initializer for runtime gameplay object type 22h
OBJ_INIT_TYPE_22:
	LD	HL,OBJ_TYPE_22_HITBOX
	CALL	SET_OBJECT_HITBOX_FROM_HL
	LD	(IX+OBJ_SPRITE_POSE),3Fh
	LD	DE,0500h
	CALL	STEP_OBJECT_XY_BY_VELOCITY
	LD	DE,0000h
	JP	SET_OBJECT_VEL_X_FROM_DE	; asm/banks/bank01.asm

; 4-byte 16x16 bounding-box preset (-15, -8, 16x16) for Boss 2 downward projectile OBJ_TYPE
; 22h
OBJ_TYPE_22_HITBOX:
	DB	F1h,F8h,10h,10h

; Spawn initializer for runtime gameplay object type 23h
OBJ_INIT_TYPE_23:
	LD	HL,OBJ_TYPE_23_HITBOX
	CALL	SET_OBJECT_HITBOX_FROM_HL
	LD	HL,OBJ_TYPE_23_KINEMATIC_PARAMS
	CALL	COPY_OBJECT_KINEMATIC_PARAMS_HL
	CALL	COMPARE_GAO_X_WITH_OBJECT_X
	LD	A,(IX+OBJ_X)
	LD	B,10h
	JR	NC,.loc_b5de
	LD	B,F0h

.loc_b5de:
	ADD	A,B
	LD	(IX+OBJ_X),A
	BIT	07h,B
	RET	Z
	CALL	NEGATE_OBJECT_VEL_X
	JP	NEGATE_OBJECT_ACCEL_X	; asm/banks/bank01.asm

; 11-byte initial kinematic parameter template for Boss 2 lobbed shrapnel bomb OBJ_TYPE 23h
; (pose 40h, flight timer 28h)
OBJ_TYPE_23_KINEMATIC_PARAMS:
	DB	00h,02h,99h,01h,01h,00h,00h,EDh,FFh,40h,28h

; 4-byte 16x16 bounding-box preset (-15, -8, 16x16) for Boss 2 lobbed shrapnel bomb OBJ_TYPE
; 23h
OBJ_TYPE_23_HITBOX:
	DB	F1h,F8h,10h,10h

; Per-frame update handler for runtime gameplay object type 22h
OBJ_UPDATE_TYPE_22:
	JP	CHECK_DESTRUCTIBLE_SHOT_HIT

; Per-frame update handler for runtime gameplay object type 23h
OBJ_UPDATE_TYPE_23:
	LD	A,(IX+OBJ_HIT_REACTION)
	AND	A
	LD	(IX+OBJ_HIT_REACTION),00h
	JR	NZ,SPAWN_BOSS_DEFEAT_EXPLOSION_BURST
	LD	A,(IX+OBJ_PHASE)
	DEC	A
	JR	Z,.loc_b61d
	DEC	(IX+OBJ_ACTION_TIMER)
	RET	NZ
	INC	(IX+OBJ_PHASE)
	LD	(IX+OBJ_ANIM_TIMER),00h
	LD	(IX+OBJ_ACTION_TIMER),3Ch
	RET

.loc_b61d:
	DEC	(IX+OBJ_ACTION_TIMER)
	RET	NZ
	LD	(IX+OBJ_ACTION_TIMER),0Ah

; Spawn multi-part explosion visual effect across defeated boss
SPAWN_BOSS_DEFEAT_EXPLOSION_BURST:
	LD	HL,AUXILIARY_OBJECT_TABLE
	LD	DE,0080h
	LD	BC,0804h
	XOR	A

.loc_b62f:
	CP	(HL)
	JR	NZ,.loc_b635
	DEC	C
	JR	Z,.loc_b639

.loc_b635:
	ADD	HL,DE
	DJNZ	.loc_b62f
	RET

.loc_b639:
	LD	A,01h
	LD	(SPECIAL_SPAWN_ACTIVE),A
	CALL	DEACTIVATE_OBJECT_IX_AND_SPRITES
	LD	B,08h
	LD	HL,BOMB_8WAY_SHRAPNEL_VEL_TABLE

.loc_b646:
	PUSH	BC
	LD	A,C
	LD	E,(HL)
	INC	HL
	LD	D,(HL)
	INC	HL
	LD	C,(HL)
	INC	HL
	LD	B,(HL)
	PUSH	HL
	LD	H,B
	LD	L,C
	LD	B,(IX+OBJ_X)
	LD	C,(IX+OBJ_Y)
	LD	A,03h
	CALL	SPAWN_CUSTOM_AUX_PROJECTILE_A
	POP	HL
	POP	BC
	INC	HL
	DJNZ	.loc_b646
	XOR	A
	LD	(SPECIAL_SPAWN_ACTIVE),A
	LD	A,(SND_CH0_SOUND_ID)
	OR	A
	RET	Z
	LD	A,1Eh
	JP	QUEUE_SOUND_COMMAND_IF_UNLOCKED	; asm/banks/bank00.asm

; 32-byte table of eight 8.8 fixed-point (VEL_X, VEL_Y) octagonal burst vectors spawned when
; OBJ_TYPE 23h or 07h detonates
BOMB_8WAY_SHRAPNEL_VEL_TABLE:
	DB	00h,00h,00h,05h,00h,00h,00h,FBh,00h,05h,00h,00h,00h,FBh,00h,00h
	DB	8Bh,03h,8Bh,03h,8Bh,03h,75h,FCh,75h,FCh,8Bh,03h,75h,FCh,75h,FCh

; Boss 4 encounter state machine and attack pattern controller
UPDATE_BOSS_4_CONTROLLER:
	LD	A,(BOSS_STATE_PHASE)
	DEC	A
	JR	Z,.loc_b6ac
	JP	P,FINISH_BOSS_ENCOUNTER_AND_BGM
	LD	C,36h
	LD	DE,8046h
	CALL	SPAWN_GAMEPLAY_OBJECT_TYPE_A
	LD	C,1Eh
	LD	DE,8046h
	CALL	SPAWN_GAMEPLAY_OBJECT_TYPE_A
	JP	ADVANCE_BOSS_CONTROLLER_PHASE

.loc_b6ac:
	LD	A,(BOSS_COMPLETION_FLAG)
	AND	A
	RET	Z
	CALL	SPAWN_LEVEL_BOSS_SACRED_ORB
	LD	HL,DEFEATED_BOSS_MASK
	SET	03h,(HL)
	LD	HL,0064h
	CALL	ADD_HL_TO_PLAYER_SCORE_BCD
	LD	A,4Fh
	CALL	QUEUE_SOUND_COMMAND_IF_UNLOCKED
	LD	HL,BOSS4_5_DEFEAT_EXPLOSION_OFFSETS
	LD	B,08h
	CALL	SPAWN_BOSS_DEFEAT_EXPLOSIONS
	LD	A,08h
	LD	DE,4404h
	CALL	WRITE_PALETTE_ENTRY_TO_VDP
	JP	ADVANCE_BOSS_CONTROLLER_PHASE

; 16-byte table of eight (dY, dX) explosion offsets shared by Boss 4 and Boss 5 defeat
; sequences
BOSS4_5_DEFEAT_EXPLOSION_OFFSETS:
	DB	02h,03h,FBh,F8h,F5h,FFh,EFh,09h,E9h,F7h,EBh,01h,E2h,04h,DEh,F9h

; Spawn initializer for runtime gameplay object type 1Eh
OBJ_INIT_TYPE_1E:
	LD	HL,BOSS4_WEAKPOINT_HITBOX
	CALL	SET_INTANGIBLE_OBJECT_HITBOX_HL
	CALL	RESTORE_PARTIAL_BOSS_HP_ON_RETRY
	XOR	A
	LD	(IX+OBJ_ANIM_TIMER),A
	LD	(IX+OBJ_SPRITE_POSE),37h
	LD	(IX+OBJ_ACTION_TIMER),40h
	LD	(IX+OBJ_EXTENT_X),A
	INC	A
	LD	(IX+OBJ_BOSS_HIT_FLAG),A
	LD	(BOSS_INVULN_OR_FLASH),A
	CALL	SAVE_BOSS4_BG_RECT_TO_VRAM
	JP	SPAWN_BOSS_INTRO_SPARK_PAIR

; 4-byte 12x18 damageable weak-point bounding box (-45, -7, 12x18) for Boss 4 (OBJ_TYPE 1Eh)
BOSS4_WEAKPOINT_HITBOX:
	DB	D3h,F9h,0Ch,12h

; Per-frame update handler for runtime gameplay object type 1Eh
OBJ_UPDATE_TYPE_1E:
	CALL	UPDATE_BOSS4_HIT_FLASH_PALETTE
	CALL	PROCESS_BOSS_HIT_AND_DEFEAT
	LD	A,(BOSS_COMPLETION_FLAG)
	AND	A
	JR	Z,.loc_b71f
	IF	HINOTORI_ENHANCED
	LD	(IX+OBJ_HIT_REACTION),00h
	CALL	UPDATE_BOSS4_HIT_FLASH_PALETTE
	ENDIF
	CALL	RESTORE_BOSS4_BG_RECT_FROM_VRAM

.loc_b71f:
	CALL	SAVE_CURRENT_BOSS_HP_STATE
	LD	A,(IX+OBJ_PHASE)
	CALL	INLINE_WORD_DISPATCH

; 5-entry inline DW dispatch table for Boss 4 phases
BOSS_4_PHASE_DISPATCH_TABLE:
	DW	BOSS4_PHASE_HANDLER_00	; [00h]
	DW	BOSS4_PHASE_HANDLER_01	; [01h]
	DW	BOSS4_PHASE_HANDLER_02	; [02h]
	DW	BOSS4_PHASE_HANDLER_03	; [03h]
	DW	BOSS4_PHASE_HANDLER_04	; [04h]

; Boss 4 behaviour phase 00h handler
BOSS4_PHASE_HANDLER_00:
	DEC	(IX+OBJ_ACTION_TIMER)
	JR	Z,.loc_b741
	BIT	01h,(IX+OBJ_ACTION_TIMER)
	JP	NZ,RESTORE_BOSS4_BG_RECT_FROM_VRAM
	JP	BLIT_BOSS4_GRAPHIC_TO_VRAM

.loc_b741:
	INC	(IX+OBJ_PHASE)
	LD	(IX+OBJ_ACTION_TIMER),18h
	XOR	A
	LD	(IX+OBJ_COLLISION_CLASS),A
	LD	(BOSS_INVULN_OR_FLASH),A
	JP	BLIT_BOSS4_GRAPHIC_TO_VRAM

; Boss 4 behaviour phase 01h handler
BOSS4_PHASE_HANDLER_01:
	DEC	(IX+OBJ_ACTION_TIMER)
	RET	NZ
	INC	(IX+OBJ_PHASE)
	LD	(IX+OBJ_ACTION_TIMER),18h
	JP	BOSS4_FIRE_7WAY_FAN_VOLLEY

; Boss 4 behaviour phase 02h handler
BOSS4_PHASE_HANDLER_02:
	DEC	(IX+OBJ_ACTION_TIMER)
	RET	NZ
	INC	(IX+OBJ_PHASE)
	LD	(IX+OBJ_ACTION_TIMER),30h
	LD	(IX+OBJ_COLLISION_CLASS),03h
	LD	A,01h
	LD	(BOSS_INVULN_OR_FLASH),A
	JR	RESTORE_BOSS4_BG_RECT_FROM_VRAM

; Boss 4 behaviour phase 03h handler
BOSS4_PHASE_HANDLER_03:
	DEC	(IX+OBJ_ACTION_TIMER)
	RET	NZ
	INC	(IX+OBJ_PHASE)
	INC	(IX+OBJ_EXTENT_X)
	LD	A,(IX+OBJ_EXTENT_X)
	CP	09h
	JR	C,.loc_b78b
	LD	(IX+OBJ_EXTENT_X),00h

.loc_b78b:
	ADD	A,A
	LD	HL,BOSS4_PART_OFFSET_PAIR_TABLE - 02h
	CALL	ADD_A_TO_HL
	LD	A,(HL)
	LD	(IX+OBJ_X),A
	INC	HL
	LD	A,(HL)
	LD	(IX+OBJ_Y),A
	JP	SAVE_BOSS4_BG_RECT_TO_VRAM

; Nine 2-byte (X, Y) part position pairs for Boss 4 (accessed 1-based via B79Eh - 02h)
BOSS4_PART_OFFSET_PAIR_TABLE:
	DB	C0h,42h,90h,59h,40h,4Fh
	DB	60h,3Ch,B0h,50h,70h,38h
	DB	A0h,45h,50h,5Dh,80h,46h

; Boss 4 behaviour phase 04h handler
BOSS4_PHASE_HANDLER_04:
	LD	(IX+OBJ_PHASE),01h
	LD	(IX+OBJ_ACTION_TIMER),18h
	XOR	A
	LD	(IX+OBJ_COLLISION_CLASS),A
	LD	(BOSS_INVULN_OR_FLASH),A
	JR	BLIT_BOSS4_GRAPHIC_TO_VRAM

; Save the 32x48 background VRAM rectangle beneath Boss 4 target position into off-screen
; VRAM buffer (E0h, 40h / Page 3 E0h, 60h)
SAVE_BOSS4_BG_RECT_TO_VRAM:
	LD	A,(IX+OBJ_X)
	SUB	10h
	LD	H,A
	LD	A,(VERTICAL_SCROLL_OFFSET)
	ADD	A,(IX+OBJ_Y)
	SUB	2Fh
	LD	L,A
	IF	HINOTORI_ENHANCED
	LD	DE,VRAM_PAGE3_BOSS4_BG_SAVE
	LD	BC,2030h
	LD	A,0Ch
	ELSE
	LD	DE,E040h
	LD	BC,2030h
	LD	A,04h
	ENDIF
	JP	COPY_VRAM_RECT_HMMM_WRAP_SRC_Y	; asm/banks/bank00.asm

; Restore the saved 32x48 background VRAM rectangle from (E0h, 40h / Page 3 E0h, 60h) to erase Boss 4 blitted
; graphic
RESTORE_BOSS4_BG_RECT_FROM_VRAM:
	LD	A,(IX+OBJ_X)
	SUB	10h
	LD	D,A
	LD	A,(VERTICAL_SCROLL_OFFSET)
	ADD	A,(IX+OBJ_Y)
	SUB	2Fh
	LD	E,A
	IF	HINOTORI_ENHANCED
	LD	HL,VRAM_PAGE3_BOSS4_BG_SAVE
	LD	BC,2030h
	LD	A,03h
	ELSE
	LD	HL,VRAM_PAGE1_BOSS4_BG_SAVE
	LD	BC,2030h
	LD	A,01h
	ENDIF
	JP	COPY_TILE_RECT_BETWEEN_VRAM_PAGES	; asm/banks/bank00.asm

; Blit Boss 4 32x48 off-screen VRAM graphic from Page 1 (E0h, B0h) onto the active display
; page with transparency (its top 32x16 rows share cells 2Eh..2Fh of item-icon row Y=B0h)
BLIT_BOSS4_GRAPHIC_TO_VRAM:
	LD	A,(IX+OBJ_X)
	SUB	10h
	LD	D,A
	LD	A,(VERTICAL_SCROLL_OFFSET)
	ADD	A,(IX+OBJ_Y)
	SUB	2Fh
	LD	E,A
	LD	HL,VRAM_PAGE1_BOSS4_GFX
	LD	BC,2030h
	LD	A,48h
	JP	BLIT_VRAM_RECT_LMMM_WRAP_DEST_Y	; asm/banks/bank00.asm

; Spawn seven OBJ_TYPE 25h fan projectiles indexed by BOSS_ATTACK_PATTERN_IDX (7..1) from
; Boss 4 and queue SFX 1Dh
BOSS4_FIRE_7WAY_FAN_VOLLEY:
	LD	BC,0725h
	LD	D,(IX+OBJ_X)
	LD	E,(IX+OBJ_Y)

.loc_b818:
	LD	A,B
	LD	(BOSS_ATTACK_PATTERN_IDX),A
	PUSH	BC
	PUSH	DE
	PUSH	IX
	CALL	SPAWN_GAMEPLAY_OBJECT_TYPE_A
	POP	IX
	POP	DE
	POP	BC
	DJNZ	.loc_b818
	LD	A,(SND_CH0_SOUND_ID)
	OR	A
	RET	Z
	LD	A,1Dh
	JP	QUEUE_SOUND_COMMAND_IF_UNLOCKED	; asm/banks/bank00.asm

; Apply Boss 4 normal V9938 palette entries 6..9 or white hit-flash palette entries
; according to OBJ_HIT_REACTION
UPDATE_BOSS4_HIT_FLASH_PALETTE:
	IF	HINOTORI_ENHANCED
	CALL	ENHANCED_BOSS4_FLASH_TEST
	ELSE
	LD	A,(IX+OBJ_HIT_REACTION)
	AND	0Bh
	ENDIF
	LD	HL,BOSS4_NORMAL_PALETTE_LIST
	JR	Z,.loc_b840
	LD	HL,BOSS4_WHITE_HIT_PALETTE_LIST

.loc_b840:
	JP	APPLY_PALETTE_COMMAND_LIST	; asm/banks/bank00.asm

; FFh-terminated normal V9938 palette list for Boss 4 colors 6..9
BOSS4_NORMAL_PALETTE_LIST:
	DB	06h,63h,05h
	DB	07h,31h,02h
	DB	08h,42h,02h
	DB	09h,42h,03h
	DB	FFh

; FFh-terminated V9938 palette command list setting Boss 4 colors 06h..09h to bright white
; (RGB 7,7,7) on hit
BOSS4_WHITE_HIT_PALETTE_LIST:
	DB	06h,77h,07h
	DB	07h,77h,07h
	DB	08h,77h,07h
	DB	09h,77h,07h
	DB	FFh

; Spawn initializer for runtime gameplay object type 25h
OBJ_INIT_TYPE_25:
	LD	HL,OBJ_TYPE_25_HITBOX
	CALL	SET_OBJECT_HITBOX_FROM_HL
	LD	(IX+OBJ_SPRITE_POSE),42h
	LD	HL,BOSS4_FAN_VELOCITY_TABLE - 04h
	LD	A,(BOSS_ATTACK_PATTERN_IDX)
	ADD	A,A
	ADD	A,A
	CALL	ADD_A_TO_HL
	LD	E,(HL)
	INC	HL
	LD	D,(HL)
	CALL	SET_OBJECT_VEL_X_FROM_DE
	INC	HL
	LD	E,(HL)
	INC	HL
	LD	D,(HL)
	CALL	COMPARE_GAO_Y_WITH_OBJECT_Y
	CALL	C,NEGATE_DE_WORD
	JP	STEP_OBJECT_XY_BY_VELOCITY	; asm/banks/bank01.asm

; Seven 4-byte signed 8.8 (VX, VY) projectile velocity pairs for Boss 4 (accessed 1-based
; via B885h - 04h)
BOSS4_FAN_VELOCITY_TABLE:
	DB	00h,05h,00h,00h
	DB	53h,04h,80h,02h
	DB	80h,02h,53h,04h
	DB	00h,00h,00h,05h
	DB	80h,FDh,53h,04h
	DB	ADh,FBh,80h,02h
	DB	00h,FBh,00h,00h

; 4-byte 16x16 bounding-box preset (-15, -8, 16x16) for Boss 4 fan projectile OBJ_TYPE 25h
OBJ_TYPE_25_HITBOX:
	DB	F1h,F8h,10h,10h

; Per-frame update handler for runtime gameplay object type 25h
OBJ_UPDATE_TYPE_25:
	JP	CHECK_DESTRUCTIBLE_SHOT_HIT

; Boss 5 encounter state machine and attack pattern controller
UPDATE_BOSS_5_CONTROLLER:
	LD	A,(BOSS_STATE_PHASE)
	DEC	A
	JR	Z,.loc_b8c4
	JP	P,FINISH_BOSS_ENCOUNTER_AND_BGM
	LD	C,37h
	LD	DE,8046h
	CALL	SPAWN_GAMEPLAY_OBJECT_TYPE_A
	LD	C,1Fh
	LD	DE,8046h
	CALL	SPAWN_GAMEPLAY_OBJECT_TYPE_A
	JP	ADVANCE_BOSS_CONTROLLER_PHASE

.loc_b8c4:
	LD	A,(BOSS_COMPLETION_FLAG)
	AND	A
	RET	Z
	CALL	SPAWN_LEVEL_BOSS_SACRED_ORB
	LD	HL,DEFEATED_BOSS_MASK
	SET	04h,(HL)
	LD	HL,0064h
	CALL	ADD_HL_TO_PLAYER_SCORE_BCD
	LD	A,4Fh
	CALL	QUEUE_SOUND_COMMAND_IF_UNLOCKED
	LD	B,08h
	LD	HL,BOSS4_5_DEFEAT_EXPLOSION_OFFSETS
	CALL	SPAWN_BOSS_DEFEAT_EXPLOSIONS
	JP	ADVANCE_BOSS_CONTROLLER_PHASE

; Spawn initializer for runtime gameplay object type 1Fh
OBJ_INIT_TYPE_1F:
	LD	HL,BOSS5_WEAKPOINT_HITBOX
	CALL	SET_INTANGIBLE_OBJECT_HITBOX_HL
	CALL	RESTORE_PARTIAL_BOSS_HP_ON_RETRY
	LD	(IX+OBJ_SPRITE_POSE),38h
	LD	(IX+OBJ_ACTION_TIMER),40h
	LD	(IX+OBJ_WORK_1),05h
	LD	(IX+OBJ_BOSS_HIT_FLAG),01h
	JP	SPAWN_BOSS_INTRO_SPARK_PAIR

; 4-byte 15x18 damageable weak-point bounding box (-44, -9, 15x18) for Boss 5 (OBJ_TYPE 1Fh)
BOSS5_WEAKPOINT_HITBOX:
	DB	D4h,F7h,0Fh,12h

; Per-frame update handler for runtime gameplay object type 1Fh
OBJ_UPDATE_TYPE_1F:
	CALL	PROCESS_BOSS_HIT_AND_DEFEAT
	LD	A,(BOSS_COMPLETION_FLAG)
	AND	A
	RET	NZ
	CALL	SAVE_CURRENT_BOSS_HP_STATE
	LD	BC,3810h
	CALL	TOGGLE_OBJECT_TWO_FRAME_POSE
	LD	A,(IX+OBJ_PHASE)
	CALL	INLINE_WORD_DISPATCH

; 7-entry inline DW dispatch table for Boss 5 phases
BOSS_5_PHASE_DISPATCH_TABLE:
	DW	BOSS5_PHASE_HANDLER_00	; [00h]
	DW	BOSS5_PHASE_HANDLER_01	; [01h]
	DW	BOSS5_PHASE_HANDLER_02	; [02h]
	DW	BOSS5_PHASE_HANDLER_03	; [03h]
	DW	BOSS5_PHASE_HANDLER_04	; [04h]
	DW	BOSS5_PHASE_HANDLER_05	; [05h]
	DW	BOSS5_PHASE_HANDLER_06	; [06h]

; Boss 5 behaviour phase 00h handler
BOSS5_PHASE_HANDLER_00:
	CALL	STEP_BOSS_INTRO_BLINK_TIMER
	RET	Z
	XOR	A
	LD	(IX+OBJ_COLLISION_CLASS),A
	INC	A
	LD	(IX+OBJ_ANIM_TIMER),A
	LD	(IX+OBJ_ACTION_TIMER),A
	LD	(IX+OBJ_WORK_0),A
	RET

; Boss 5 behaviour phase 01h handler
BOSS5_PHASE_HANDLER_01:
	DEC	(IX+OBJ_ACTION_TIMER)
	RET	NZ
	LD	A,(IX+OBJ_WORK_1)
	AND	A
	LD	A,01h
	LD	(IX+OBJ_ACTION_TIMER),04h
	JP	Z,BOSS5_ENTER_DASH_PHASE_06
	CALL	GET_ABS_GAO_TO_OBJECT_DX
	CP	10h
	JR	C,.loc_b965
	CALL	GET_ABS_GAO_TO_OBJECT_DY
	CP	50h
	LD	A,01h
	LD	(IX+OBJ_ACTION_TIMER),04h
	JP	NC,BOSS5_ENTER_DASH_PHASE_06

.loc_b965:
	CALL	COMPARE_GAO_X_WITH_OBJECT_X
	LD	A,02h
	JR	C,.loc_b96d
	INC	A

.loc_b96d:
	JP	BOSS5_START_12FRAME_DASH

; Boss 5 behaviour phase 02h handler
BOSS5_PHASE_HANDLER_02:
	DEC	(IX+OBJ_ACTION_TIMER)
	RET	NZ
	LD	A,(IX+OBJ_WORK_1)
	AND	A
	LD	A,06h
	JP	Z,BOSS5_START_12FRAME_DASH
	CALL	GET_ABS_GAO_TO_OBJECT_DY
	CP	50h
	LD	A,04h
	JP	NC,BOSS5_START_12FRAME_DASH
	CP	30h
	LD	A,05h
	JR	C,.loc_b98e
	INC	A

.loc_b98e:
	JP	BOSS5_START_12FRAME_DASH

; Boss 5 behaviour phase 03h handler
BOSS5_PHASE_HANDLER_03:
	DEC	(IX+OBJ_ACTION_TIMER)
	RET	NZ
	LD	A,(IX+OBJ_WORK_1)
	AND	A
	LD	A,09h
	JP	Z,BOSS5_START_12FRAME_DASH
	CALL	GET_ABS_GAO_TO_OBJECT_DX
	CP	10h
	JR	C,.loc_b9bc
	CALL	GET_ABS_GAO_TO_OBJECT_DY
	CP	50h
	LD	A,07h
	LD	(IX+OBJ_ACTION_TIMER),04h
	JR	NC,BOSS5_ENTER_DASH_PHASE_06
	CP	30h
	LD	A,08h
	LD	(IX+OBJ_ACTION_TIMER),04h
	JR	NC,BOSS5_ENTER_DASH_PHASE_06

.loc_b9bc:
	CALL	COMPARE_GAO_X_WITH_OBJECT_X
	LD	A,09h
	JR	C,.loc_b9c4
	INC	A

.loc_b9c4:
	JR	BOSS5_START_12FRAME_DASH

; Boss 5 behaviour phase 04h handler
BOSS5_PHASE_HANDLER_04:
	DEC	(IX+OBJ_ACTION_TIMER)
	RET	NZ
	LD	A,(IX+OBJ_WORK_1)
	AND	A
	LD	A,0Dh
	JR	Z,BOSS5_START_12FRAME_DASH
	CALL	GET_ABS_GAO_TO_OBJECT_DY
	CP	50h
	LD	A,0Bh
	JR	NC,BOSS5_START_12FRAME_DASH
	CP	30h
	LD	A,0Ch
	JR	C,.loc_b9e2
	INC	A

.loc_b9e2:
	JR	BOSS5_START_12FRAME_DASH

; Boss 5 behaviour phase 05h handler
BOSS5_PHASE_HANDLER_05:
	DEC	(IX+OBJ_ACTION_TIMER)
	RET	NZ
	LD	A,(IX+OBJ_WORK_1)
	AND	A
	LD	A,0Eh
	LD	(IX+OBJ_ACTION_TIMER),04h
	JR	Z,BOSS5_ENTER_DASH_PHASE_06
	CALL	GET_ABS_GAO_TO_OBJECT_DX
	CP	10h
	JR	C,.loc_ba08
	CALL	GET_ABS_GAO_TO_OBJECT_DY
	CP	30h
	LD	A,0Eh
	LD	(IX+OBJ_ACTION_TIMER),04h
	JR	NC,BOSS5_ENTER_DASH_PHASE_06

.loc_ba08:
	CALL	COMPARE_GAO_X_WITH_OBJECT_X
	LD	A,0Fh
	JR	C,BOSS5_START_12FRAME_DASH
	INC	A

; Set a 12-frame movement duration in OBJ_ACTION_TIMER and enter Boss 5 dash phase 06h
BOSS5_START_12FRAME_DASH:
	LD	(IX+OBJ_ACTION_TIMER),0Ch

; Switch Boss 5 into active dash phase 06h with animation enabled and load the selected
; transition entry
BOSS5_ENTER_DASH_PHASE_06:
	LD	(IX+OBJ_PHASE),06h
	LD	(IX+OBJ_ANIM_TIMER),01h
	JR	BOSS5_APPLY_DASH_TRANSITION

; Boss 5 behaviour phase 06h handler
BOSS5_PHASE_HANDLER_06:
	DEC	(IX+OBJ_ACTION_TIMER)
	RET	NZ
	LD	A,(IX+OBJ_WORK_1)
	AND	A
	JR	NZ,.loc_ba2c
	LD	(IX+OBJ_WORK_1),06h

.loc_ba2c:
	DEC	(IX+OBJ_WORK_1)
	LD	(IX+OBJ_ANIM_TIMER),00h
	LD	(IX+OBJ_ACTION_TIMER),0Ah
	LD	A,(IX+OBJ_EXTENT_X)
	LD	(IX+OBJ_PHASE),A
	DEC	(IX+OBJ_WORK_0)
	RET	NZ
	LD	(IX+OBJ_WORK_0),05h
	JP	BOSS5_FIRE_5WAY_SPREAD_VOLLEY

; Look up Boss 5 next waypoint phase and 8-direction dash velocity vector from transition
; index A
BOSS5_APPLY_DASH_TRANSITION:
	ADD	A,A
	LD	HL,BOSS5_PHASE_PARAM_PAIR_TABLE - 02h
	CALL	ADD_A_TO_HL
	LD	A,(HL)
	LD	(IX+OBJ_EXTENT_X),A
	INC	HL
	LD	A,(HL)
	ADD	A,A
	ADD	A,A
	LD	HL,BOSS5_DASH_VELOCITY_TABLE
	CALL	ADD_A_TO_HL
	LD	E,(HL)
	INC	HL
	LD	D,(HL)
	CALL	SET_OBJECT_VEL_X_FROM_DE
	INC	HL
	LD	E,(HL)
	INC	HL
	LD	D,(HL)
	JP	STEP_OBJECT_XY_BY_VELOCITY	; asm/banks/bank01.asm

; Sixteen 2-byte (next_phase, velocity_idx) step pairs for Boss 5 (accessed 1-based via
; BA6Ah - 02h)
BOSS5_PHASE_PARAM_PAIR_TABLE:
	DB	03h,04h,02h,05h,04h,03h,05h,03h
	DB	01h,01h,03h,02h,05h,04h,01h,00h
	DB	02h,06h,04h,02h,05h,05h,01h,07h
	DB	03h,06h,03h,00h,02h,07h,04h,01h

; 32-byte table of eight 8.8 fixed-point (VEL_X, VEL_Y) dash velocity vectors indexed by
; BOSS5_PHASE_PARAM_PAIR_TABLE
BOSS5_DASH_VELOCITY_TABLE:
	DB	00h,00h,00h,FAh,00h,06h,00h,FEh
	DB	00h,06h,00h,00h,00h,06h,00h,02h
	DB	00h,00h,00h,06h,00h,FAh,00h,02h
	DB	00h,FAh,00h,00h,00h,FAh,00h,FEh

; Spawn five OBJ_TYPE 26h rebounding spread projectiles indexed by BOSS_ATTACK_PATTERN_IDX
; (5..1) from Boss 5 and queue SFX 1Dh
BOSS5_FIRE_5WAY_SPREAD_VOLLEY:
	LD	BC,0526h
	LD	D,(IX+OBJ_X)
	LD	E,(IX+OBJ_Y)

.loc_bab3:
	LD	A,B
	LD	(BOSS_ATTACK_PATTERN_IDX),A
	PUSH	BC
	PUSH	DE
	CALL	SPAWN_GAMEPLAY_OBJECT_TYPE_A
	POP	DE
	POP	BC
	DJNZ	.loc_bab3
	LD	A,(SND_CH0_SOUND_ID)
	OR	A
	RET	Z
	LD	A,1Dh
	JP	QUEUE_SOUND_COMMAND_IF_UNLOCKED	; asm/banks/bank00.asm

; Spawn initializer for runtime gameplay object type 26h
OBJ_INIT_TYPE_26:
	LD	HL,OBJ_TYPE_26_HITBOX
	CALL	SET_OBJECT_HITBOX_FROM_HL
	LD	(IX+OBJ_SPRITE_POSE),43h
	LD	A,(BOSS_ATTACK_PATTERN_IDX)
	LD	DE,OBJ_TYPE_26_SPREAD_VEL_X_TABLE
	CALL	READ_WORD_FROM_DE_TABLE_A
	CALL	SET_OBJECT_VEL_X_FROM_DE
	LD	DE,0400h
	JP	STEP_OBJECT_XY_BY_VELOCITY	; asm/banks/bank01.asm

; 4-byte 16x16 bounding-box preset (-15, -8, 16x16, overlapping first two bytes at BAE8h)
; for Boss 5 projectile OBJ_TYPE 26h
OBJ_TYPE_26_HITBOX:
	DB	F1h,F8h

; 1-based 6-word table whose entry 0 supplies the 16x16 size of OBJ_TYPE_26_HITBOX and
; entries 1..5 supply 8.8 X velocities for Boss 5 spread
OBJ_TYPE_26_SPREAD_VEL_X_TABLE:
	DB	10h,10h,B6h,01h,4Ah,FEh,94h,FCh,00h,00h,6Ch,03h

; Per-frame update handler for runtime gameplay object type 26h
OBJ_UPDATE_TYPE_26:
	CALL	CHECK_DESTRUCTIBLE_SHOT_HIT
	LD	BC,4304h
	CALL	TOGGLE_OBJECT_TWO_FRAME_POSE
	LD	A,(IX+OBJ_ANIM_CYCLE_CNT)
	AND	03h
	JR	NZ,.loc_bb14
	LD	A,(SND_CH0_SOUND_ID)
	OR	A
	JR	Z,.loc_bb14
	LD	A,(SND_CH3_SOUND_ID)
	LD	B,A
	LD	A,2Bh
	CP	B
	CALL	NZ,QUEUE_SOUND_COMMAND_IF_UNLOCKED

.loc_bb14:
	LD	A,(IX+OBJ_PHASE)
	DEC	A
	RET	Z
	LD	A,(IX+OBJ_Y)
	CP	CFh
	RET	C
	INC	(IX+OBJ_PHASE)
	LD	DE,0000h
	CALL	SET_OBJECT_VEL_X_FROM_DE
	LD	DE,FC00h
	JP	STEP_OBJECT_XY_BY_VELOCITY	; asm/banks/bank01.asm

; Boss 6 final encounter state machine and attack pattern controller
UPDATE_BOSS_6_CONTROLLER:
	LD	A,(BOSS_STATE_PHASE)
	DEC	A
	JR	Z,.loc_bb4a
	JP	P,BOSS6_WAIT_AND_ENTER_ENDING
	LD	C,38h
	LD	DE,8046h
	CALL	SPAWN_GAMEPLAY_OBJECT_TYPE_A
	LD	C,20h
	LD	DE,8046h
	CALL	SPAWN_GAMEPLAY_OBJECT_TYPE_A
	JP	ADVANCE_BOSS_CONTROLLER_PHASE

.loc_bb4a:
	LD	A,(BOSS_COMPLETION_FLAG)
	AND	A
	RET	Z
	LD	HL,0064h
	CALL	ADD_HL_TO_PLAYER_SCORE_BCD
	LD	A,52h
	CALL	QUEUE_SOUND_COMMAND_IF_UNLOCKED
	LD	HL,BOSS6_DEFEAT_EXPLOSION_OFFSETS
	LD	B,0Ah
	CALL	SPAWN_BOSS_DEFEAT_EXPLOSIONS
	JP	ADVANCE_BOSS_CONTROLLER_PHASE

; 20-byte table of ten (dY, dX) explosion offsets spawned around final Boss 6 on defeat
BOSS6_DEFEAT_EXPLOSION_OFFSETS:
	DB	01h,F8h,FFh,0Ah,FCh,02h,F6h,FBh,F1h,08h,EDh,F9h,ECh,02h,E3h,00h
	DB	E1h,09h,DFh,F7h

; Count down BOSS_PHASE_TIMER after Boss 6 defeat, clear BOSS_ENCOUNTER_ACTIVE, and switch
; MAIN_STATE to ending sequence 0Ch
BOSS6_WAIT_AND_ENTER_ENDING:
	LD	HL,BOSS_PHASE_TIMER
	DEC	(HL)
	RET	NZ
	XOR	A
	LD	(BOSS_ENCOUNTER_ACTIVE),A
	LD	A,0Ch
	JP	SET_MAIN_STATE_AND_RESET_SUBSTATE	; asm/banks/bank00.asm

; Spawn initializer for runtime gameplay object type 20h
OBJ_INIT_TYPE_20:
	LD	HL,BOSS6_WEAKPOINT_HITBOX
	CALL	SET_INTANGIBLE_OBJECT_HITBOX_HL
	LD	HL,BOSS6_KINEMATIC_PARAMS
	CALL	COPY_OBJECT_KINEMATIC_PARAMS_HL
	CALL	RESTORE_PARTIAL_BOSS_HP_ON_RETRY
	LD	(IX+OBJ_EXTENT_X),50h
	LD	(IX+OBJ_WORK_0),20h
	LD	(IX+OBJ_BOSS_HIT_FLAG),01h
	JP	SPAWN_BOSS_INTRO_SPARK_PAIR

; 11-byte initial kinematic parameter template for final Boss 6 (OBJ_TYPE 20h, X velocity
; +0300h, pose 3Ah, intro timer 40h)
BOSS6_KINEMATIC_PARAMS:
	DB	00h,00h,00h,03h,00h,00h,00h,00h,00h,3Ah,40h

; 4-byte 14x11 damageable weak-point bounding box (-43, -6, 14x11) for final Boss 6
; (OBJ_TYPE 20h)
BOSS6_WEAKPOINT_HITBOX:
	DB	D5h,FAh,0Eh,0Bh

; Per-frame update handler for runtime gameplay object type 20h
OBJ_UPDATE_TYPE_20:
	CALL	PROCESS_BOSS_HIT_AND_DEFEAT
	LD	A,(BOSS_COMPLETION_FLAG)
	AND	A
	RET	NZ
	CALL	SAVE_CURRENT_BOSS_HP_STATE
	LD	A,(IX+OBJ_PHASE)
	DEC	A
	JR	Z,.loc_bbdd
	DEC	A
	JP	Z,.loc_bc18
	JP	P,.loc_bc32
	CALL	STEP_BOSS_INTRO_BLINK_TIMER
	RET	Z
	LD	(IX+OBJ_ANIM_TIMER),01h
	LD	(IX+OBJ_ACTION_TIMER),70h
	LD	(IX+OBJ_COLLISION_CLASS),00h
	RET

.loc_bbdd:
	LD	BC,3A08h
	CALL	TOGGLE_OBJECT_TWO_FRAME_POSE
	LD	BC,D030h
	LD	DE,0300h
	CALL	BOUNCE_OBJECT_VEL_X_BETWEEN_C_B
	CALL	TICK_BOSS6_PROJECTILE_VOLLEY
	LD	A,(FRAME_COUNTER)
	AND	01h
	RET	NZ
	DEC	(IX+OBJ_EXTENT_X)
	JR	NZ,.loc_bc01
	LD	(IX+OBJ_EXTENT_X),50h
	JP	NEGATE_OBJECT_VEL_X	; asm/banks/bank01.asm

.loc_bc01:
	DEC	(IX+OBJ_ACTION_TIMER)
	RET	NZ
	INC	(IX+OBJ_PHASE)
	LD	(IX+OBJ_ACTION_TIMER),28h
	LD	DE,0000h
	CALL	SET_OBJECT_VEL_X_FROM_DE
	LD	DE,0300h
	JP	STEP_OBJECT_XY_BY_VELOCITY	; asm/banks/bank01.asm

.loc_bc18:
	LD	BC,3A08h
	CALL	TOGGLE_OBJECT_TWO_FRAME_POSE
	CALL	TICK_BOSS6_PROJECTILE_VOLLEY
	DEC	(IX+OBJ_ACTION_TIMER)
	RET	NZ
	INC	(IX+OBJ_PHASE)
	LD	(IX+OBJ_ACTION_TIMER),28h
	LD	DE,FD00h
	JP	STEP_OBJECT_XY_BY_VELOCITY	; asm/banks/bank01.asm

.loc_bc32:
	LD	BC,3A08h
	CALL	TOGGLE_OBJECT_TWO_FRAME_POSE
	CALL	TICK_BOSS6_PROJECTILE_VOLLEY
	DEC	(IX+OBJ_ACTION_TIMER)
	RET	NZ
	LD	(IX+OBJ_PHASE),01h
	CALL	NEXT_PSEUDO_RANDOM_BYTE
	AND	1Fh
	ADD	A,70h
	LD	(IX+OBJ_ACTION_TIMER),A
	LD	(IX+OBJ_EXTENT_X),50h
	LD	DE,0300h
	CALL	SET_OBJECT_VEL_X_FROM_DE
	LD	DE,0000h
	JP	STEP_OBJECT_XY_BY_VELOCITY	; asm/banks/bank01.asm

; Every 20h frames, spawn one downward OBJ_TYPE 27h shot and two paired OBJ_TYPE 28h
; waypoint shots from Boss 6 and queue SFX 19h
TICK_BOSS6_PROJECTILE_VOLLEY:
	DEC	(IX+OBJ_WORK_0)
	RET	NZ
	LD	(IX+OBJ_WORK_0),20h
	LD	D,(IX+OBJ_X)
	LD	E,(IX+OBJ_Y)
	LD	C,27h
	PUSH	DE
	CALL	SPAWN_GAMEPLAY_OBJECT_TYPE_A
	POP	DE
	LD	BC,0228h

.loc_bc75:
	PUSH	DE
	PUSH	BC
	CALL	SPAWN_GAMEPLAY_OBJECT_WITH_PARAM_B
	POP	BC
	POP	DE
	DJNZ	.loc_bc75
	LD	HL,BOSS_ATTACK_PATTERN_IDX
	INC	(HL)
	LD	A,(SND_CH0_SOUND_ID)
	OR	A
	RET	Z
	LD	A,19h
	JP	QUEUE_SOUND_COMMAND_IF_UNLOCKED	; asm/banks/bank00.asm

; Spawn initializer for runtime gameplay object type 27h
OBJ_INIT_TYPE_27:
	LD	HL,OBJ_TYPE_27_28_HITBOX
	CALL	SET_OBJECT_HITBOX_FROM_HL
	LD	(IX+OBJ_SPRITE_POSE),45h
	LD	DE,0000h
	CALL	SET_OBJECT_VEL_X_FROM_DE
	LD	DE,0400h
	JP	STEP_OBJECT_XY_BY_VELOCITY	; asm/banks/bank01.asm

; 4-byte 16x16 bounding-box preset (-15, -8, 16x16) shared by Boss 6 projectiles OBJ_TYPE
; 27h and OBJ_TYPE 28h
OBJ_TYPE_27_28_HITBOX:
	DB	F1h,F8h,10h,10h

; Per-frame update handler for runtime gameplay object type 27h
OBJ_UPDATE_TYPE_27:
	CALL	CHECK_DESTRUCTIBLE_SHOT_HIT
	LD	BC,4504h
	JP	TOGGLE_OBJECT_TWO_FRAME_POSE	; asm/banks/bank01.asm

; Spawn initializer for runtime gameplay object type 28h
OBJ_INIT_TYPE_28:
	LD	HL,OBJ_TYPE_27_28_HITBOX
	CALL	SET_OBJECT_HITBOX_FROM_HL
	LD	(IX+OBJ_SPRITE_POSE),45h
	LD	HL,OBJ_TYPE_28_WAYPOINT_PARAM_TABLE
	LD	A,(BOSS_ATTACK_PATTERN_IDX)
	AND	03h
	ADD	A,A
	ADD	A,A
	CALL	ADD_A_TO_HL
	LD	A,(HL)
	LD	(IX+OBJ_ACTION_TIMER),A
	INC	HL
	LD	C,(HL)
	BIT	00h,(IX+OBJ_EXTENT_Y)
	LD	(IX+OBJ_EXTENT_Y),00h
	INC	HL
	JR	Z,.loc_bcd8
	INC	HL

.loc_bcd8:
	LD	B,(HL)
	LD	A,B0h
	JP	AIM_OBJECT_VELOCITY_AT_TARGET_BC	; asm/banks/bank01.asm

; 16-byte table of four (timer, target_Y, left_X=30h, right_X=D0h) waypoint records for Boss
; 6 paired projectiles OBJ_TYPE 28h
OBJ_TYPE_28_WAYPOINT_PARAM_TABLE:
	DB	10h,50h,30h,D0h,10h,70h,30h,D0h,20h,C0h,30h,D0h,20h,B0h,30h,D0h

; Per-frame update handler for runtime gameplay object type 28h
OBJ_UPDATE_TYPE_28:
	CALL	CHECK_DESTRUCTIBLE_SHOT_HIT
	LD	BC,4504h
	CALL	TOGGLE_OBJECT_TWO_FRAME_POSE
	LD	A,(IX+OBJ_PHASE)
	DEC	A
	RET	Z
	DEC	(IX+OBJ_ACTION_TIMER)
	RET	NZ
	INC	(IX+OBJ_PHASE)
	LD	A,B0h
	JP	AIM_OBJECT_VELOCITY_TOWARD_GAO	; asm/banks/bank01.asm

; Stream-activation initializer for terrain mechanism type 06h
TERRAIN_INIT_TYPE_06:
	CALL	SYNC_COMPOSITE_TERRAIN_SUBPARTS
	LD	A,(IX+OBJ_PHASE)
	DEC	A
	JR	Z,.loc_bd40
	JP	P,.loc_bd78
	LD	DE,0101h
	LD	HL,0001h
	LD	A,(IX+OBJ_SLOT0_SAT_ATTR)
	CALL	DECODE_AND_CLEAR_TERRAIN_HIT_MASK
	NEG
	ADD	A,(IX+OBJ_TERRAIN_DELTA)
	LD	(IX+OBJ_TERRAIN_DELTA),A
	RET	NC
	LD	(IX+OBJ_PART_ACTIVE_MASK),A0h
	LD	(IX+OBJ_PHASE),01h
	LD	(IX+OBJ_SLOT0_AUX),01h
	LD	A,13h
	CALL	QUEUE_SOUND_COMMAND_IF_UNLOCKED
	LD	HL,000Ah
	JP	ADD_HL_TO_PLAYER_SCORE_BCD	; asm/banks/bank00.asm

.loc_bd40:
	LD	A,(IX+OBJ_PART1_DY)
	OR	A
	LD	A,(IX+OBJ_Y)
	JR	Z,.loc_bd59
	JP	P,.loc_bd53
	SUB	40h
	CP	98h
	RET	NC
	JR	.loc_bd5c

.loc_bd53:
	DEC	A
	CP	D8h
	RET	NC
	JR	.loc_bd5c

.loc_bd59:
	CP	D8h
	RET	NC

.loc_bd5c:
	LD	A,(IX+OBJ_Y)
	ADD	A,(IX+OBJ_PART1_DY)
	ADD	A,18h
	CP	C0h
	RET	NC
	SET	07h,(IX+OBJ_PART1_FLAGS)
	SET	07h,(IX+OBJ_PART3_FLAGS)
	LD	(IX+OBJ_PHASE),02h
	SET	00h,(IX+OBJ_SLOT1_FLAGS)
	RET

.loc_bd78:
	LD	A,(IX+OBJ_SLOT0_SAT_ATTR)
	AND	04h
	RET	Z
	LD	A,(GAO_MODE)
	CP	01h
	RET	Z
	CP	02h
	RET	Z
	LD	A,(IX+OBJ_Y)
	ADD	A,(IX+OBJ_PART1_DY)
	LD	C,A
	SUB	20h
	CP	A0h
	RET	NC
	LD	A,(IX+OBJ_X)
	ADD	A,(IX+OBJ_PART1_DX)
	ADD	A,08h
	LD	(GAO_POS_X),A
	LD	A,C
	ADD	A,08h
	LD	(GAO_POS_Y),A
	LD	(IX+OBJ_SLOT0_SAT_ATTR),00h
	LD	A,02h
	LD	(INV_INVINCIBLE_AURA_TIMER),A
	LD	A,27h
	CALL	QUEUE_SOUND_COMMAND_IF_UNLOCKED
	JP	SHRINE_STATUE_STATE_HANDLER_02	; asm/banks/bank01.asm

; Per-frame update handler for terrain mechanism type 06h
TERRAIN_UPDATE_TYPE_06:
	CALL	RETIRE_COMPOSITE_TERRAIN_OBJECT
	LD	(IX+OBJ_TERRAIN_DELTA),01h
	LD	DE,BOSS_6_VRAM_BLIT_CMD_LIST
	CALL	INIT_COMPOSITE_TERRAIN_BASE_SLOT
	LD	DE,BOSS_6_VRAM_BLIT_CMD_LIST
	CALL	ATTACH_COMPOSITE_TERRAIN_SUBSLOT
	LD	DE,BOSS_6_VRAM_BLIT_CMD_LIST
	CALL	ATTACH_COMPOSITE_TERRAIN_SUBSLOT
	LD	DE,BOSS_6_VRAM_BLIT_CMD_LIST
	CALL	ATTACH_COMPOSITE_TERRAIN_SUBSLOT
	LD	(IX+OBJ_PART2_SPRITE_HI),60h
	LD	(IX+OBJ_PART2_SPRITE_LO),90h
	LD	(IX+OBJ_PART3_SPRITE_HI),70h
	LD	(IX+OBJ_PART3_SPRITE_LO),90h
	CALL	FINALIZE_COMPOSITE_TERRAIN_CHAIN
	LD	DE,TERRAIN_TYPE_06_ALT_SLOT_DESC
	CALL	INIT_COMPOSITE_TERRAIN_ALT_SLOT
	CALL	FINALIZE_COMPOSITE_TERRAIN_CHAIN
	LD	A,(TERRAIN_SCROLL_PHASE)
	LD	C,A
	AND	F8h
	LD	(IX+OBJ_X),A
	XOR	C
	AND	03h
	XOR	01h
	LD	C,A
	LD	A,40h
	RR	C
	JR	C,$ + 03h	; Original Konami off-by-one branch (38h 01h, lands on 44h inside NEG)
	NEG
	RR	C
	JR	C,.loc_be13
	ADD	A,(IX+OBJ_PART1_DY)
	LD	(IX+OBJ_PART1_DY),A
	JR	.loc_be19

.loc_be13:
	ADD	A,(IX+OBJ_PART1_DX)
	LD	(IX+OBJ_PART1_DX),A

.loc_be19:
	LD	A,(IX+OBJ_PART1_DX)
	LD	(IX+OBJ_PART3_DX),A
	LD	A,(IX+OBJ_PART1_DY)
	LD	(IX+OBJ_PART3_DY),A
	LD	(IX+OBJ_PART2_SPRITE_HI),60h
	LD	(IX+OBJ_PART2_SPRITE_LO),90h
	LD	(IX+OBJ_PART3_SPRITE_HI),70h
	LD	(IX+OBJ_PART3_SPRITE_LO),90h
	RET

; 13-byte VDP rectangle blit descriptor at end of Boss 6 code (BE36h-BE42h)
BOSS_6_VRAM_BLIT_CMD_LIST:
	DB	04h,00h,00h,10h,10h,B0h,70h

; 6-byte 16x16 alternate collision sub-slot descriptor for the Terrain Type 06 teleporter
TERRAIN_TYPE_06_ALT_SLOT_DESC:
	DB	80h,00h,00h,10h,10h,00h

; 445 bytes of unused FFh padding filling the remainder of Physical Bank 03 (BE43h-BFFFh)
	IF	HINOTORI_ENHANCED

	INCLUDE	"asm/enhanced/hscroll_core.asm"
	INCLUDE	"asm/enhanced/translation_fixes.asm"
	ENDIF

BANK03_TAIL_PADDING_FF:
	DS	C000h - $,FFh

	DEPHASE

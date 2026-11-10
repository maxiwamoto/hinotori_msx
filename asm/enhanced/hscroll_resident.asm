; Enhanced Edition: resident page-3 RAM routines for MSX2+ horizontal scrolling.
; Assembled at HS_RESIDENT_BASE (F2D7h) inside the Bank 07 image area and copied to RAM by
; HS_BOOT_INIT. Must stay callable with any ROM banks mapped and with CPU page 0 holding either
; the Main-ROM or the RAM module.
;
; Coordinate convention: page-0 X coordinates passed to the VDP command primitives are screen
; X coordinates. While the camera is scrolled (HS_CAM_LO <> 0) the primitive hooks hand the
; command to the page-0 module, which adds HS_CAM_LO to every page-0 X and splits rectangles at
; the 256-pixel page edge. Tile streamers already working in page coordinates use *_RAW.

; RST 38h redirect while page 0 holds the RAM module: run the Main-ROM interrupt handler with
; the Main-ROM restored, then switch page 0 back to RAM.
HS_ISR_TRAMPOLINE:
	PUSH	AF
	CALL	HS_SELECT_PAGE0_ROM
	POP	AF
	CALL	BIOS_KEYINT
	DI
	PUSH	AF
	CALL	HS_SELECT_PAGE0_RAM
	POP	AF
	EI
	RET

; Map the Main-ROM into CPU page 0 (precomputed slot values). Clobbers A; interrupts must be
; disabled. HS_SUB_ROM is the secondary-slot state saved by the current module call.
HS_SELECT_PAGE0_ROM:
	LD	A,(HS_SUB_EXPANDED)
	OR	A
	JR	Z,.primary
	LD	A,(HS_SUB_ROM)
	LD	(SUBSLOT_REG),A

.primary:
	LD	A,(HS_A8_ROM)
	OUT	(PPI_SLOT_PORT),A
	RET

; Map the RAM slot into CPU page 0 (precomputed slot values). Clobbers A; interrupts must be
; disabled.
HS_SELECT_PAGE0_RAM:
	LD	A,(HS_SUB_EXPANDED)
	OR	A
	JR	Z,.primary
	LD	A,(HS_SUB_RAM)
	LD	(SUBSLOT_REG),A

.primary:
	LD	A,(HS_A8_RAM)
	OUT	(PPI_SLOT_PORT),A
	RET

; Call page-0 module routine HL with page 0 switched to RAM; the caller's HL is on the stack and
; is passed through together with AF, BC and DE. AF and BC are returned to the caller. Must not
; be nested (module code never calls the hooked VDP primitives).
HS_RESIDENT_CALL_MODULE:
	LD	(HS_MOD_TARGET),HL
	POP	HL
	PUSH	AF
	DI
	LD	A,(SUBSLOT_REG)
	CPL
	LD	(HS_SUB_ROM),A	; Preserve an interrupted BIOS inter-slot call, not the boot value
	CALL	HS_SELECT_PAGE0_RAM
	POP	AF
	EI
	CALL	.target
	PUSH	AF
	DI
	CALL	HS_SELECT_PAGE0_ROM
	POP	AF
	EI
	RET

.target:
	PUSH	HL
	LD	HL,(HS_MOD_TARGET)
	EX	(SP),HL
	RET

; COPY_VRAM_RECT_HMMM entry (A = pages, HL = source, DE = destination, BC = size)
HS_HMMM_HOOK:
	PUSH	HL
	LD	HL,COPY_VRAM_RECT_HMMM_RAW
	JR	HS_PRIMITIVE_HOOK

; BLIT_VRAM_RECT_LMMM entry (A = pages/logical op, HL = source, DE = destination, BC = size)
HS_LMMM_HOOK:
	PUSH	HL
	LD	HL,BLIT_VRAM_RECT_LMMM_RAW
	JR	HS_PRIMITIVE_HOOK

; FILL_VRAM_RECT_HMMV entry (A = fill byte, H = X, L = Y, D = page, BC = size)
HS_HMMV_HOOK:
	PUSH	HL
	LD	HL,FILL_VRAM_RECT_HMMV_RAW

; HL = raw primitive, caller HL on the stack: run the raw primitive directly when unscrolled,
; else let HS_MOD_PRIMITIVE translate and split the page-0 coordinates.
HS_PRIMITIVE_HOOK:
	EX	AF,AF'
	LD	A,(HS_CAM_LO)
	OR	A
	JR	Z,.raw
	EX	AF,AF'
	LD	(HS_RAW_TARGET),HL
	LD	HL,HS_MOD_PRIMITIVE
	JR	HS_RESIDENT_CALL_MODULE

.raw:
	EX	AF,AF'
	EX	(SP),HL
	RET

; Screen pixel (D=X, E=Y) to LEVEL_TILE_BUFFER address in HL, including both scroll axes.
; Replaces MAP_SCREEN_COORDS_TO_TILE_BUFFER. Clobbers A, DE.
HS_MAP_SCREEN_COORDS:
	LD	A,(VERTICAL_SCROLL_OFFSET)
	ADD	A,E
	RRCA
	RRCA
	RRCA
	AND	1Fh
	LD	H,A
	LD	A,(HS_CAM_LO)
	ADD	A,D
	JR	HS_PACK_COORDS_SHIFT

; A = Y, D = un-scrolled X: HL = E000h + ((Y >> 3) << 5) + (X >> 3)
HS_PACK_SCROLLED_COORDS:
	RRCA
	RRCA
	RRCA
	AND	1Fh
	LD	H,A
	LD	A,D

HS_PACK_COORDS_SHIFT:
	SRL	H
	RRA
	SRL	H
	RRA
	SRL	H
	RRA
	LD	L,A
	LD	DE,LEVEL_TILE_BUFFER
	ADD	HL,DE
	RET

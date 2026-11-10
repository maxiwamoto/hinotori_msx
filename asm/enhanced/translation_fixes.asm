; Gameplay fixes from BiFi's FBIRDFIX.IPS, applied to both Enhanced languages.
; Suppress the white Boss 4 flash on its lethal hit, so the dropped tablet keeps
; its normal palette. Preserve the patch's acquired-tablet and weapon thresholds.
ENHANCED_BOSS4_FLASH_TEST:
	LD	A,(IX+OBJ_HIT_REACTION)
	AND	0Bh
	RET	Z
	LD	A,(INV_SQUARE_STONES_GRP3 + 08h)
	OR	A
	RET	NZ
	LD	A,(GAO_WEAPON_FORM)
	LD	HL,ENHANCED_BOSS4_LETHAL_HIT_THRESHOLDS
	CALL	ADD_A_TO_HL
	LD	A,(IX+OBJ_HIT_POINTS)
	SUB	(HL)
	RET	Z
	JR	C,.lethal
	RET

.lethal:
	XOR	A
	RET

ENHANCED_BOSS4_LETHAL_HIT_THRESHOLDS:
	DB	01h,02h,02h,02h,02h,03h,02h

; Restore the title rectangle saved before the Game Master menu opens.
ENHANCED_RESTORE_COMPANION_TITLE:
	LD	A,01h
	JR	ENHANCED_COPY_COMPANION_TITLE_RECT

; Only row 0 opens the menu over the title; nested settings screens must not
; replace the saved title with the menu itself.
ENHANCED_SAVE_TITLE_AND_OPEN_MENU:
	LD	A,(CHEAT_MENU_CURSOR_ROW)
	OR	A
	JP	NZ,COMPANION_CHEAT_MENU_ENTRY	; asm/banks/bank00.asm
	LD	A,04h
	CALL	ENHANCED_COPY_COMPANION_TITLE_RECT
	JP	COMPANION_CHEAT_MENU_ENTRY	; asm/banks/bank00.asm

ENHANCED_COPY_COMPANION_TITLE_RECT:
	LD	BC,C038h
	LD	DE,2098h
	LD	HL,2098h
	JP	COPY_VRAM_RECT_HMMM	; asm/banks/bank00.asm

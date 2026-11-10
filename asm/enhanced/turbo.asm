; Automatic turbo detection at boot.
; Bank 07 is mapped by HS_BOOT_INIT; BIOS page 0 and a valid RAM stack are visible.
; Runs before VDP/audio setup and scroll-module installation. Caller repeats DI.
ENHANCED_BOOT_TURBO_ON:
	LD	A,(BIOS_MSXVER)
	CP	03h
	JR	NZ,.panasonic
	LD	A,81h	; R800 ROM mode and turbo indicator
	JP	BIOS_CHGCPU	; asm/core/constants.asm

.panasonic:
	LD	BC,0840h
	OUT	(C),B
	IN	A,(C)
	CPL
	CP	B
	JR	NZ,.expert
	XOR	A	; Panasonic FX/WX/WSX: clear bit 0 to enable turbo
	OUT	(41h),A
	RET

.expert:
	LD	HL,(EXPERT_TURBO_BIOS_SIGNATURE)
	LD	DE,B6DBh
	OR	A
	SBC	HL,DE
	RET	NZ
	LD	A,80h
	OUT	(B6h),A
	RET

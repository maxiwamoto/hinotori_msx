; Hi no Tori: Houou-hen (Konami RC-747, 1987)
; Unified symbolic Z80 disassembly for MSX2 (128 KiB / 16 x 8 KiB Konami mapper)
; Entry wrappers select Main, A1, archival A2, or Enhanced.
; HINOTORI_A2 reproduces the one-byte music-loop alteration to the Main layout.
; All targets share these banks; Enhanced-only modules are included conditionally.
; Numeric ROM/CPU addresses in historical comments describe Main/A1 unless marked otherwise.
; Enhanced relocates code/data: use its matching .sym file for current addresses.
; Bank filenames follow original physical boundaries; core source segments 00..03
; assemble continuously and need not end on 8 KiB boundaries in Enhanced.

	INCLUDE	"asm/core/assembler.asm"
	INCLUDE	"asm/core/constants.asm"
	INCLUDE	"asm/core/record_layout.asm"
	INCLUDE	"asm/core/ram_layout.asm"

	ORG	0000h

	INCLUDE	"asm/banks/bank00.asm"
	INCLUDE	"asm/banks/bank01.asm"
	INCLUDE	"asm/banks/bank02.asm"
	INCLUDE	"asm/banks/bank03.asm"
	INCLUDE	"asm/banks/bank04.asm"
	INCLUDE	"asm/banks/bank05.asm"
	INCLUDE	"asm/banks/bank06.asm"
	INCLUDE	"asm/banks/bank07.asm"
	INCLUDE	"asm/banks/bank08.asm"
	INCLUDE	"asm/banks/bank09.asm"
	INCLUDE	"asm/banks/bank10.asm"
	INCLUDE	"asm/banks/bank11.asm"
	INCLUDE	"asm/banks/bank12.asm"
	INCLUDE	"asm/banks/bank13.asm"
	INCLUDE	"asm/banks/bank14.asm"
	INCLUDE	"asm/banks/bank15.asm"

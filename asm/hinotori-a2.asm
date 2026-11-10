; Hi no Tori: Houou-hen (Konami RC-747, 1987) - Archived alternate dump (J) [a2]
; Main-based preservation target: reproduces the incorrect BGM 40h loop pointer.
; Build: tniasm.exe compat asm\hinotori-a2.asm build\roms\hinotori-a2.rom

HINOTORI_A1:        EQU	00h
HINOTORI_A2:        EQU	01h
HINOTORI_ENHANCED:  EQU	00h

	INCLUDE	"asm/hinotori.asm"

; Hi no Tori: Houou-hen (Konami RC-747, 1987) - Enhanced Edition
; A1-based build with runtime Japanese/English selection, cached graphics, automatic
; turbo, MSX2+/turbo R horizontal scrolling, and translation gameplay fixes.
; Restores the cut Stage 2 Enemy 16 ambush and reclaims selected unused code/data.
; Main/A1 retain their original bytes. See README.md for the Enhanced feature summary.
; Build: tniasm.exe compat asm\hinotori-enhanced.asm build\roms\hinotori-enhanced.rom

HINOTORI_A1:        EQU	01h
HINOTORI_A2:        EQU	00h
HINOTORI_ENHANCED:  EQU	01h

	INCLUDE	"asm/hinotori.asm"

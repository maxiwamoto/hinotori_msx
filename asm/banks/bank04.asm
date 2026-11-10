; Physical Bank 04 (ROM 08000h-09FFFh): Stage/UI graphics upload descriptors and Stage 1/5/2 tile patterns
	PHASE	6000h

; 8-entry DW pointer table indexed by LevelIndex (C482h, 0..7; entries 6 and 7 both point to
; 61B3h for boss stages) at Bank 00 54C0h.
STAGE_GFX_DESCRIPTOR_PTR_TABLE:
	DW	STAGE1_GFX_DESCRIPTOR	; [00h]
	DW	STAGE2_GFX_DESCRIPTOR	; [01h]
	DW	STAGE3_GFX_DESCRIPTOR	; [02h]
	DW	STAGE4_GFX_DESCRIPTOR	; [03h]
	DW	STAGE5_GFX_DESCRIPTOR	; [04h]
	DW	STAGE6_GFX_DESCRIPTOR	; [05h]
	DW	BOSS_STAGE_GFX_DESCRIPTOR	; [06h]
	DW	BOSS_STAGE_GFX_DESCRIPTOR	; [07h]

; Companion 8-entry DW pointer table immediately following 6000h; all 8 entries point to the
; 1-byte 00h null descriptor at 63F8h (unused/no-op secondary stage descriptor table).
STAGE_COMPANION_NULL_GFX_PTR_TABLE:
	DW	COMPANION_NULL_GFX_DESCRIPTOR	; [00h]
	DW	COMPANION_NULL_GFX_DESCRIPTOR	; [01h]
	DW	COMPANION_NULL_GFX_DESCRIPTOR	; [02h]
	DW	COMPANION_NULL_GFX_DESCRIPTOR	; [03h]
	DW	COMPANION_NULL_GFX_DESCRIPTOR	; [04h]
	DW	COMPANION_NULL_GFX_DESCRIPTOR	; [05h]
	DW	COMPANION_NULL_GFX_DESCRIPTOR	; [06h]
	DW	COMPANION_NULL_GFX_DESCRIPTOR	; [07h]

; Stage 1 (LevelIndex=0) VRAM 8000h tileset & collision-attribute descriptor; pointed to by
; StageGfxDescriptorPtrTable[0].
STAGE1_GFX_DESCRIPTOR:
	DB	FDh,12h,34h,56h,9Fh	; Unpack 8 color nibbles to TILE_COLOR_NIBBLE_LUT
	IF	HINOTORI_ENHANCED
	DB	1Dh,01h,00h
	DW	GAMEPLAY_OBJECT_TABLE + 0000h
	DB	C4h
	DB	14h,1Eh,00h
	DW	GAMEPLAY_OBJECT_TABLE + 0000h
	DB	E4h
	DB	2Eh,32h,05h
	DW	GAMEPLAY_OBJECT_TABLE + 02B8h
	DB	C4h
	DB	23h,60h,05h
	DW	GAMEPLAY_OBJECT_TABLE + 02B8h
	DB	E4h
	DB	0Bh,83h,00h
	DW	GAMEPLAY_OBJECT_TABLE + 0708h
	DB	C4h
	DB	07h,8Eh,00h
	DW	GAMEPLAY_OBJECT_TABLE + 0810h
	DB	C4h
	DB	0Ah,95h,00h
	DW	GAMEPLAY_OBJECT_TABLE + 08B8h
	DB	C4h
	DB	06h,9Fh,00h
	DW	GAMEPLAY_OBJECT_TABLE + 09A8h
	DB	C4h
	DB	0Bh,A5h,00h
	DW	GAMEPLAY_OBJECT_TABLE + 0708h
	DB	E4h
	DB	07h,B0h,00h
	DW	GAMEPLAY_OBJECT_TABLE + 0810h
	DB	E4h
	DB	05h,B7h,28h
	DW	GAMEPLAY_OBJECT_TABLE + 0A38h
	DB	C4h
	DB	04h,BCh,28h
	DW	GAMEPLAY_OBJECT_TABLE + 0A38h
	DB	E4h
	DB	06h,F0h,05h
	DW	GAMEPLAY_OBJECT_TABLE + 0AB0h
	DB	04h
	ELSE
	DB	1Dh,01h,00h	; 29 tiles -> dst 01h, attr 00h
	DW	6478h	; Bank 04 3bpp source
	DB	C4h
	DB	14h,1Eh,00h	; 20 tiles -> dst 1Eh, attr 00h
	DW	6478h	; Bank 04 3bpp mirrored source
	DB	E4h
	DB	2Eh,32h,05h	; 46 tiles -> dst 32h, attr 05h
	DW	6730h	; Bank 04 3bpp source
	DB	C4h
	DB	23h,60h,05h	; 35 tiles -> dst 60h, attr 05h
	DW	6730h	; Bank 04 3bpp mirrored source
	DB	E4h
	DB	0Bh,83h,00h	; 11 tiles -> dst 83h, attr 00h
	DW	6B80h	; Bank 04 3bpp source
	DB	C4h
	DB	07h,8Eh,00h	; 7 tiles -> dst 8Eh, attr 00h
	DW	6C88h	; Bank 04 3bpp source
	DB	C4h
	DB	0Ah,95h,00h	; 10 tiles -> dst 95h, attr 00h
	DW	6D30h	; Bank 04 3bpp source
	DB	C4h
	DB	06h,9Fh,00h	; 6 tiles -> dst 9Fh, attr 00h
	DW	6E20h	; Bank 04 3bpp source
	DB	C4h
	DB	0Bh,A5h,00h	; 11 tiles -> dst A5h, attr 00h
	DW	6B80h	; Bank 04 3bpp mirrored source
	DB	E4h
	DB	07h,B0h,00h	; 7 tiles -> dst B0h, attr 00h
	DW	6C88h	; Bank 04 3bpp mirrored source
	DB	E4h
	DB	05h,B7h,28h	; 5 tiles -> dst B7h, attr 28h
	DW	6EB0h	; Bank 04 3bpp source
	DB	C4h
	DB	04h,BCh,28h	; 4 tiles -> dst BCh, attr 28h
	DW	6EB0h	; Bank 04 3bpp mirrored source
	DB	E4h
	DB	06h,F0h,05h	; 6 tiles -> dst F0h, attr 05h
	DW	6F28h	; Bank 04 raw-4bpp source
	DB	04h
	ENDIF
	DB	00h	; End of descriptor

; Stage 2 (LevelIndex=1) VRAM 8000h tileset & collision-attribute descriptor; pointed to by
; StageGfxDescriptorPtrTable[1].
STAGE2_GFX_DESCRIPTOR:
	IF	HINOTORI_ENHANCED
	DB	23h,01h,20h
	DW	GAMEPLAY_OBJECT_TABLE + 0000h
	DB	04h
	DB	01h,28h,20h
	DW	GAMEPLAY_OBJECT_TABLE + 0000h
	DB	24h
	DB	FFh,2Fh
	DB	15h,2Fh,20h
	DW	GAMEPLAY_OBJECT_TABLE + 0460h
	DB	44h
	DB	FFh,21h
	DB	0Ch,44h,20h
	DW	GAMEPLAY_OBJECT_TABLE + 0508h
	DB	44h
	DB	30h,50h,05h
	DW	GAMEPLAY_OBJECT_TABLE + 0568h
	DB	04h
	DB	13h,80h,05h
	DW	GAMEPLAY_OBJECT_TABLE + 0B68h
	DB	04h
	DB	02h,93h,20h
	DW	GAMEPLAY_OBJECT_TABLE + 0DC8h
	DB	04h
	DB	1Fh,A0h,05h
	DW	GAMEPLAY_OBJECT_TABLE + 0568h
	DB	24h
	DB	04h,F0h,05h
	DW	GAMEPLAY_OBJECT_TABLE + 0E08h
	DB	04h
	ELSE
	DB	23h,01h,20h	; 35 tiles -> dst 01h, attr 20h
	DW	7C28h	; Bank 04 raw-4bpp source
	DB	04h
	DB	01h,28h,20h	; 1 tiles -> dst 28h, attr 20h
	DW	7C28h	; Bank 04 raw-4bpp mirrored source
	DB	24h
	DB	FFh,2Fh	; Unpack 2 color nibbles to TILE_COLOR_NIBBLE_LUT
	DB	15h,2Fh,20h	; 21 tiles -> dst 2Fh, attr 20h
	DW	8088h	; Bank 04 1bpp source
	DB	44h
	DB	FFh,21h	; Unpack 2 color nibbles to TILE_COLOR_NIBBLE_LUT
	DB	0Ch,44h,20h	; 12 tiles -> dst 44h, attr 20h
	DW	8130h	; Bank 04 1bpp source
	DB	44h
	DB	30h,50h,05h	; 48 tiles -> dst 50h, attr 05h
	DW	8190h	; Bank 04 raw-4bpp source
	DB	04h
	DB	13h,80h,05h	; 19 tiles -> dst 80h, attr 05h
	DW	8790h	; Bank 04 raw-4bpp source
	DB	04h
	DB	02h,93h,20h	; 2 tiles -> dst 93h, attr 20h
	DW	89F0h	; Bank 04 raw-4bpp source
	DB	04h
	DB	1Fh,A0h,05h	; 31 tiles -> dst A0h, attr 05h
	DW	8190h	; Bank 04 raw-4bpp mirrored source
	DB	24h
	DB	04h,F0h,05h	; 4 tiles -> dst F0h, attr 05h
	DW	8A30h	; Bank 04 raw-4bpp source
	DB	04h
	ENDIF
	DB	FEh,89h,CFh	; Unpack 4 color nibbles to TILE_COLOR_NIBBLE_LUT
	DB	07h,CDh,20h	; 7 tiles -> dst CDh, attr 20h
	DW	B157h	; Bank 10 2bpp source
	DB	8Ah
	DB	03h,D4h,20h	; 3 tiles -> dst D4h, attr 20h
	DW	B1C7h	; Bank 10 2bpp source
	DB	8Ah
	DB	03h,D7h,20h	; 3 tiles -> dst D7h, attr 20h
	DW	B1C7h	; Bank 10 2bpp mirrored source
	DB	AAh
	DB	03h,E9h,20h	; 3 tiles -> dst E9h, attr 20h
	DW	B2E7h	; Bank 10 2bpp source
	DB	8Ah
	DB	00h	; End of descriptor

; Stage 3 (LevelIndex=2) VRAM 8000h tileset & collision-attribute descriptor; pointed to by
; StageGfxDescriptorPtrTable[2].
STAGE3_GFX_DESCRIPTOR:
	DB	FDh,12h,34h,56h,7Fh	; Unpack 8 color nibbles to TILE_COLOR_NIBBLE_LUT
	IF	HINOTORI_ENHANCED
	DB	29h,01h,05h
	DW	GAMEPLAY_OBJECT_TABLE + 0000h
	DB	C4h
	DB	1Fh,30h,05h
	DW	GAMEPLAY_OBJECT_TABLE + 0000h
	DB	E4h
	DB	0Ch,50h,28h
	DW	GAMEPLAY_OBJECT_TABLE + 03D8h
	DB	C4h
	DB	0Ah,5Ch,28h
	DW	GAMEPLAY_OBJECT_TABLE + 03D8h
	DB	E4h
	DB	20h,66h,00h
	DW	GAMEPLAY_OBJECT_TABLE + 04F8h
	DB	C4h
	DB	18h,88h,00h
	DW	GAMEPLAY_OBJECT_TABLE + 07F8h
	DB	C4h
	DB	18h,A4h,00h
	DW	GAMEPLAY_OBJECT_TABLE + 07F8h
	DB	E4h
	DB	06h,F0h,05h
	DW	GAMEPLAY_OBJECT_TABLE + 0A38h
	DB	04h
	ELSE
	DB	29h,01h,05h	; 41 tiles -> dst 01h, attr 05h
	DW	8AB0h	; Bank 04 3bpp source
	DB	C4h
	DB	1Fh,30h,05h	; 31 tiles -> dst 30h, attr 05h
	DW	8AB0h	; Bank 04 3bpp mirrored source
	DB	E4h
	DB	0Ch,50h,28h	; 12 tiles -> dst 50h, attr 28h
	DW	8E88h	; Bank 04 3bpp source
	DB	C4h
	DB	0Ah,5Ch,28h	; 10 tiles -> dst 5Ch, attr 28h
	DW	8E88h	; Bank 04 3bpp mirrored source
	DB	E4h
	DB	20h,66h,00h	; 32 tiles -> dst 66h, attr 00h
	DW	8FA8h	; Bank 04 3bpp source
	DB	C4h
	DB	18h,88h,00h	; 24 tiles -> dst 88h, attr 00h
	DW	92A8h	; Bank 04 3bpp source
	DB	C4h
	DB	18h,A4h,00h	; 24 tiles -> dst A4h, attr 00h
	DW	92A8h	; Bank 04 3bpp mirrored source
	DB	E4h
	DB	06h,F0h,05h	; 6 tiles -> dst F0h, attr 05h
	DW	94E8h	; Bank 04 raw-4bpp source
	DB	04h
	ENDIF
	DB	00h	; End of descriptor

; Stage 4 (LevelIndex=3) VRAM 8000h tileset & collision-attribute descriptor; pointed to by
; StageGfxDescriptorPtrTable[3].
STAGE4_GFX_DESCRIPTOR:
	DB	FEh,34h,5Fh	; Unpack 4 color nibbles to TILE_COLOR_NIBBLE_LUT
	DB	24h,49h,05h	; 36 tiles -> dst 49h, attr 05h
	DW	AB37h	; Bank 10 2bpp source
	DB	8Ah
	DB	1Fh,71h,05h	; 31 tiles -> dst 71h, attr 05h
	DW	ADD7h	; Bank 10 2bpp source
	DB	8Ah
	DB	1Fh,94h,05h	; 31 tiles -> dst 94h, attr 05h
	DW	ADD7h	; Bank 10 2bpp mirrored source
	DB	AAh
	DB	FDh,12h,34h,56h,7Fh	; Unpack 8 color nibbles to TILE_COLOR_NIBBLE_LUT
	DB	13h,01h,00h	; 19 tiles -> dst 01h, attr 00h
	DW	A477h	; Bank 10 3bpp source
	DB	CAh
	DB	13h,14h,00h	; 19 tiles -> dst 14h, attr 00h
	DW	A63Fh	; Bank 10 3bpp source
	DB	CAh
	DB	22h,27h,05h	; 34 tiles -> dst 27h, attr 05h
	DW	A807h	; Bank 10 3bpp source
	DB	CAh
	DB	04h,6Dh,05h	; 4 tiles -> dst 6Dh, attr 05h
	DW	AD77h	; Bank 10 3bpp source
	DB	CAh
	DB	04h,90h,05h	; 4 tiles -> dst 90h, attr 05h
	DW	AD77h	; Bank 10 3bpp mirrored source
	DB	EAh
	DB	06h,F0h,05h	; 6 tiles -> dst F0h, attr 05h
	DW	AFC7h	; Bank 10 raw-4bpp source
	DB	0Ah
	DB	00h	; End of descriptor

; Stage 5 (LevelIndex=4) VRAM 8000h tileset & collision-attribute descriptor; pointed to by
; StageGfxDescriptorPtrTable[4].
STAGE5_GFX_DESCRIPTOR:
	DB	FDh,12h,34h,58h,9Fh	; Unpack 8 color nibbles to TILE_COLOR_NIBBLE_LUT
	IF	HINOTORI_ENHANCED
	DB	13h,03h,00h
	DW	GAMEPLAY_OBJECT_TABLE + 0040h
	DB	C4h
	DB	1Eh,20h,00h
	DW	GAMEPLAY_OBJECT_TABLE + 0208h
	DB	C4h
	DB	20h,40h,05h
	DW	GAMEPLAY_OBJECT_TABLE + 04D8h
	DB	C4h
	DB	27h,60h,05h
	DW	GAMEPLAY_OBJECT_TABLE + 07D8h
	DB	C4h
	DB	06h,F0h,05h
	DW	GAMEPLAY_OBJECT_TABLE + 0B80h
	DB	04h
	DB	02h,01h,00h
	DW	GAMEPLAY_OBJECT_TABLE + 0000h
	DB	04h
	ELSE
	DB	13h,03h,00h	; 19 tiles -> dst 03h, attr 00h
	DW	7028h	; Bank 04 3bpp source
	DB	C4h
	DB	1Eh,20h,00h	; 30 tiles -> dst 20h, attr 00h
	DW	71F0h	; Bank 04 3bpp source
	DB	C4h
	DB	20h,40h,05h	; 32 tiles -> dst 40h, attr 05h
	DW	74C0h	; Bank 04 3bpp source
	DB	C4h
	DB	27h,60h,05h	; 39 tiles -> dst 60h, attr 05h
	DW	77C0h	; Bank 04 3bpp source
	DB	C4h
	DB	06h,F0h,05h	; 6 tiles -> dst F0h, attr 05h
	DW	7B68h	; Bank 04 raw-4bpp source
	DB	04h
	DB	02h,01h,00h	; 2 tiles -> dst 01h, attr 00h
	DW	6FE8h	; Bank 04 raw-4bpp source
	DB	04h
	ENDIF
	DB	00h	; End of descriptor

; Stage 6 (LevelIndex=5) VRAM 8000h tileset & collision-attribute descriptor; pointed to by
; StageGfxDescriptorPtrTable[5].
STAGE6_GFX_DESCRIPTOR:
	DB	FDh,12h,34h,58h,CFh	; Unpack 8 color nibbles to TILE_COLOR_NIBBLE_LUT
	IF	HINOTORI_ENHANCED
	DB	36h,01h,05h
	DW	GAMEPLAY_OBJECT_TABLE + 0000h
	DB	C4h
	DB	34h,37h,05h
	DW	GAMEPLAY_OBJECT_TABLE + 0030h
	DB	E4h
	DB	01h,23h,00h
	DW	GAMEPLAY_OBJECT_TABLE + 0330h
	DB	C4h
	DB	03h,26h,00h
	DW	GAMEPLAY_OBJECT_TABLE + 0378h
	DB	C4h
	DB	01h,57h,00h
	DW	GAMEPLAY_OBJECT_TABLE + 0330h
	DB	E4h
	DB	03h,5Ah,00h
	DW	GAMEPLAY_OBJECT_TABLE + 0378h
	DB	E4h
	DB	0Dh,70h,00h
	DW	GAMEPLAY_OBJECT_TABLE + 0510h
	DB	C4h
	DB	0Ah,7Dh,00h
	DW	GAMEPLAY_OBJECT_TABLE + 0558h
	DB	E4h
	DB	FFh,3Fh
	DB	15h,90h,00h
	DW	GAMEPLAY_OBJECT_TABLE + 0648h
	DB	44h
	DB	06h,A5h,00h
	DW	GAMEPLAY_OBJECT_TABLE + 06C0h
	DB	64h
	DB	06h,F0h,05h
	DW	GAMEPLAY_OBJECT_TABLE + 06F0h
	DB	04h
	ELSE
	DB	36h,01h,05h	; 54 tiles -> dst 01h, attr 05h
	DW	95A8h	; Bank 04 3bpp source
	DB	C4h
	DB	34h,37h,05h	; 52 tiles -> dst 37h, attr 05h
	DW	95D8h	; Bank 04 3bpp mirrored source
	DB	E4h
	DB	01h,23h,00h	; 1 tiles -> dst 23h, attr 00h
	DW	98D8h	; Bank 04 3bpp source
	DB	C4h
	DB	03h,26h,00h	; 3 tiles -> dst 26h, attr 00h
	DW	9920h	; Bank 04 3bpp source
	DB	C4h
	DB	01h,57h,00h	; 1 tiles -> dst 57h, attr 00h
	DW	98D8h	; Bank 04 3bpp mirrored source
	DB	E4h
	DB	03h,5Ah,00h	; 3 tiles -> dst 5Ah, attr 00h
	DW	9920h	; Bank 04 3bpp mirrored source
	DB	E4h
	DB	0Dh,70h,00h	; 13 tiles -> dst 70h, attr 00h
	DW	9AB8h	; Bank 04 3bpp source
	DB	C4h
	DB	0Ah,7Dh,00h	; 10 tiles -> dst 7Dh, attr 00h
	DW	9B00h	; Bank 04 3bpp mirrored source
	DB	E4h
	DB	FFh,3Fh	; Unpack 2 color nibbles to TILE_COLOR_NIBBLE_LUT
	DB	15h,90h,00h	; 21 tiles -> dst 90h, attr 00h
	DW	9BF0h	; Bank 04 1bpp source
	DB	44h
	DB	06h,A5h,00h	; 6 tiles -> dst A5h, attr 00h
	DW	9C68h	; Bank 04 1bpp mirrored source
	DB	64h
	DB	06h,F0h,05h	; 6 tiles -> dst F0h, attr 05h
	DW	9C98h	; Bank 04 raw-4bpp source
	DB	04h
	ENDIF
	DB	00h	; End of descriptor

; Shared Boss Stages (LevelIndex=6,7) VRAM 8000h tileset & collision-attribute descriptor;
; pointed to by StageGfxDescriptorPtrTable[6..7].
BOSS_STAGE_GFX_DESCRIPTOR:
	DB	FDh,01h,23h,45h,CFh	; Unpack 8 color nibbles to TILE_COLOR_NIBBLE_LUT
	DB	19h,01h,05h	; 25 tiles -> dst 01h, attr 05h
	DW	B337h	; Bank 10 3bpp source
	DB	CAh
	DB	0Ah,20h,00h	; 10 tiles -> dst 20h, attr 00h
	DW	B58Fh	; Bank 10 3bpp source
	DB	CAh
	DB	04h,2Ah,00h	; 4 tiles -> dst 2Ah, attr 00h
	DW	B61Fh	; Bank 10 3bpp mirrored source
	DB	EAh
	DB	FEh,02h,4Fh	; Unpack 4 color nibbles to TILE_COLOR_NIBBLE_LUT
	DB	19h,30h,00h	; 25 tiles -> dst 30h, attr 00h
	DW	B67Fh	; Bank 10 2bpp source
	DB	8Ah
	DB	FEh,08h,CFh	; Unpack 4 color nibbles to TILE_COLOR_NIBBLE_LUT
	DB	0Dh,51h,05h	; 13 tiles -> dst 51h, attr 05h
	DW	B80Fh	; Bank 10 2bpp source
	DB	8Ah
	DB	12h,5Eh,05h	; 18 tiles -> dst 5Eh, attr 05h
	DW	B8DFh	; Bank 10 raw-4bpp source
	DB	0Ah
	DB	03h,70h,05h	; 3 tiles -> dst 70h, attr 05h
	DW	BA3Fh	; Bank 10 raw-4bpp mirrored source
	DB	2Ah
	DB	00h	; End of descriptor

; Common offscreen VRAM Page 1 (A000h, Y=40h..67h) composite statue/gate/rubble tile cache
; descriptor, executed from Bank 00 LOAD_ALL_STAGE_TILESETS_AND_ATTRS (54A2h).
COMMON_PAGE_A000_GFX_DESCRIPTOR:
	DB	FDh,03h,56h,9Ch,EFh	; Unpack 8 color nibbles to TILE_COLOR_NIBBLE_LUT
	DB	02h,00h,00h	; 2 tiles -> dst 00h, attr 00h
	DW	8B83h	; Bank 13 3bpp source
	DB	CDh
	DB	04h,02h,00h	; 4 tiles -> dst 02h, attr 00h
	DW	8A7Bh	; Bank 13 3bpp source
	DB	CDh
	DB	04h,20h,00h	; 4 tiles -> dst 20h, attr 00h
	DW	8ADBh	; Bank 13 3bpp source
	DB	CDh
	DB	04h,24h,00h	; 4 tiles -> dst 24h, attr 00h
	DW	8ADBh	; Bank 13 3bpp source
	DB	CDh
	DB	02h,25h,00h	; 2 tiles -> dst 25h, attr 00h
	DW	8B3Bh	; Bank 13 3bpp source
	DB	CDh
	DB	04h,40h,00h	; 4 tiles -> dst 40h, attr 00h
	DW	8B6Bh	; Bank 13 3bpp source
	DB	CDh
	DB	04h,44h,00h	; 4 tiles -> dst 44h, attr 00h
	DW	8B6Bh	; Bank 13 3bpp source
	DB	CDh
	DB	02h,45h,00h	; 2 tiles -> dst 45h, attr 00h
	DW	8BCBh	; Bank 13 3bpp source
	DB	CDh
	DB	04h,60h,00h	; 4 tiles -> dst 60h, attr 00h
	DW	8BFBh	; Bank 13 3bpp source
	DB	CDh
	DB	04h,64h,00h	; 4 tiles -> dst 64h, attr 00h
	DW	8BFBh	; Bank 13 3bpp source
	DB	CDh
	DB	02h,65h,00h	; 2 tiles -> dst 65h, attr 00h
	DW	8C5Bh	; Bank 13 3bpp source
	DB	CDh
	DB	08h,80h,00h	; 8 tiles -> dst 80h, attr 00h
	DW	8C8Bh	; Bank 13 3bpp source
	DB	CDh
	DB	FDh,01h,23h,69h,EFh	; Unpack 8 color nibbles to TILE_COLOR_NIBBLE_LUT
	DB	06h,0Ah,00h	; 6 tiles -> dst 0Ah, attr 00h
	DW	9F9Bh	; Bank 04 3bpp source
	DB	C4h
	DB	06h,2Ah,00h	; 6 tiles -> dst 2Ah, attr 00h
	DW	A02Bh	; Bank 04 3bpp source
	DB	C4h
	DB	FDh,01h,23h,ADh,EFh	; Unpack 8 color nibbles to TILE_COLOR_NIBBLE_LUT
	DB	06h,10h,00h	; 6 tiles -> dst 10h, attr 00h
	DW	9F9Bh	; Bank 04 3bpp source
	DB	C4h
	DB	06h,30h,00h	; 6 tiles -> dst 30h, attr 00h
	DW	A02Bh	; Bank 04 3bpp source
	DB	C4h
	DB	02h,08h,00h	; 2 tiles -> dst 08h, attr 00h
	DW	9E9Bh	; Bank 04 raw-4bpp source
	DB	04h
	DB	02h,28h,00h	; 2 tiles -> dst 28h, attr 00h
	DW	9EDBh	; Bank 04 raw-4bpp source
	DB	04h
	DB	02h,48h,00h	; 2 tiles -> dst 48h, attr 00h
	DW	9F1Bh	; Bank 04 raw-4bpp source
	DB	04h
	DB	02h,68h,00h	; 2 tiles -> dst 68h, attr 00h
	DW	9F5Bh	; Bank 04 raw-4bpp source
	DB	04h
	DB	00h	; End of descriptor

; Shared normal-stage (LevelIndex 0..5) common item/hazard tileset descriptor targeting VRAM
; 8000h (dst=C0h..EFh), executed from Bank 00 54AFh.
COMMON_NORMAL_STAGE_GFX_DESCRIPTOR:
	DB	FEh,89h,CFh	; Unpack 4 color nibbles to TILE_COLOR_NIBBLE_LUT
	DB	0Dh,C0h,05h	; 13 tiles -> dst C0h, attr 05h
	DW	B087h	; Bank 10 2bpp source
	DB	8Ah
	DB	07h,CDh,00h	; 7 tiles -> dst CDh, attr 00h
	DW	B157h	; Bank 10 2bpp source
	DB	8Ah
	DB	03h,D4h,00h	; 3 tiles -> dst D4h, attr 00h
	DW	B1C7h	; Bank 10 2bpp source
	DB	8Ah
	DB	03h,D7h,00h	; 3 tiles -> dst D7h, attr 00h
	DW	B1C7h	; Bank 10 2bpp mirrored source
	DB	AAh
	DB	0Fh,DAh,05h	; 15 tiles -> dst DAh, attr 05h
	DW	B1F7h	; Bank 10 2bpp source
	DB	8Ah
	DB	03h,E9h,00h	; 3 tiles -> dst E9h, attr 00h
	DW	B2E7h	; Bank 10 2bpp source
	DB	8Ah
	DB	02h,ECh,05h	; 2 tiles -> dst ECh, attr 05h
	DW	B317h	; Bank 10 2bpp source
	DB	8Ah
	DB	02h,EEh,05h	; 2 tiles -> dst EEh, attr 05h
	DW	B317h	; Bank 10 2bpp mirrored source
	DB	AAh
	DB	00h	; End of descriptor

; F5 Compass screen graphics descriptor targeting VRAM 8000h, executed from Bank 02 8449h;
; loads compass graphics from Bank 09 (AD48h-B017h) and 1bpp kanji masks from Bank 13
; (7DCBh, 7ECBh).
COMPASS_SCREEN_GFX_DESCRIPTOR:
	DB	FEh,07h,BFh	; Unpack 4 color nibbles to TILE_COLOR_NIBBLE_LUT
	DB	0Eh,01h,00h	; 14 tiles -> dst 01h, attr 00h
	DW	AD48h	; Bank 07 2bpp source
	DB	87h
	DB	07h,0Fh,00h	; 7 tiles -> dst 0Fh, attr 00h
	DW	ADB8h	; Bank 07 2bpp mirrored source
	DB	A7h
	DB	FEh,07h,EFh	; Unpack 4 color nibbles to TILE_COLOR_NIBBLE_LUT
	DB	1Fh,16h,00h	; 31 tiles -> dst 16h, attr 00h
	DW	AE28h	; Bank 07 2bpp source
	DB	87h
	DB	0Ah,35h,00h	; 10 tiles -> dst 35h, attr 00h
	DW	AF78h	; Bank 07 2bpp mirrored source
	DB	A7h
	DB	FFh,7Fh	; Unpack 2 color nibbles to TILE_COLOR_NIBBLE_LUT
	DB	0Ch,40h,00h	; 12 tiles -> dst 40h, attr 00h
	DW	7DCBh	; Bank 13 1bpp source
	DB	4Dh
	DB	0Dh,50h,00h	; 13 tiles -> dst 50h, attr 00h
	DW	7ECBh	; Bank 13 1bpp source
	DB	4Dh
	DB	00h	; End of descriptor

; F4 Stage Map screen graphics descriptor targeting VRAM 8000h, executed from Bank 02 82DBh;
; loads 1bpp/2bpp map graphics from Bank 09 (B0F0h-B657h).
STAGE_MAP_SCREEN_GFX_DESCRIPTOR:
	DB	FFh,F9h	; Unpack 2 color nibbles to TILE_COLOR_NIBBLE_LUT
	DB	01h,01h,00h	; 1 tiles -> dst 01h, attr 00h
	DW	B0F0h	; Bank 07 1bpp source
	DB	47h
	DB	3Eh,02h,00h	; 62 tiles -> dst 02h, attr 00h
	DW	B0F8h	; Bank 07 1bpp source
	DB	47h
	DB	3Eh,40h,00h	; 62 tiles -> dst 40h, attr 00h
	DW	B2E8h	; Bank 07 1bpp source
	DB	47h
	DB	0Ah,80h,00h	; 10 tiles -> dst 80h, attr 00h
	DW	B0F8h	; Bank 07 1bpp mirrored source
	DB	67h
	DB	FEh,F1h,9Eh	; Unpack 4 color nibbles to TILE_COLOR_NIBBLE_LUT
	DB	07h,90h,00h	; 7 tiles -> dst 90h, attr 00h
	DW	B4D8h	; Bank 07 2bpp source
	DB	87h
	DB	FEh,F1h,9Ah	; Unpack 4 color nibbles to TILE_COLOR_NIBBLE_LUT
	DB	06h,97h,00h	; 6 tiles -> dst 97h, attr 00h
	DW	B548h	; Bank 07 2bpp source
	DB	87h
	DB	FEh,F1h,9Ch	; Unpack 4 color nibbles to TILE_COLOR_NIBBLE_LUT
	DB	05h,9Dh,00h	; 5 tiles -> dst 9Dh, attr 00h
	DW	B5A8h	; Bank 07 2bpp source
	DB	87h
	DB	FEh,F1h,9Dh	; Unpack 4 color nibbles to TILE_COLOR_NIBBLE_LUT
	DB	06h,A2h,00h	; 6 tiles -> dst A2h, attr 00h
	DW	B5F8h	; Bank 07 2bpp source
	DB	87h
	DB	FFh,09h	; Unpack 2 color nibbles to TILE_COLOR_NIBBLE_LUT
	DB	01h,A8h,00h	; 1 tiles -> dst A8h, attr 00h
	DW	B0F8h	; Bank 07 1bpp source
	DB	47h
	DB	01h,A9h,00h	; 1 tiles -> dst A9h, attr 00h
	DW	B140h	; Bank 07 1bpp source
	DB	47h
	DB	01h,AAh,00h	; 1 tiles -> dst AAh, attr 00h
	DW	B100h	; Bank 07 1bpp mirrored source
	DB	67h
	DB	01h,ABh,00h	; 1 tiles -> dst ABh, attr 00h
	DW	B118h	; Bank 07 1bpp mirrored source
	DB	67h
	DB	00h	; End of descriptor

; Unreferenced 1-byte 00h empty descriptor / alignment pad byte immediately between
; 62D2h-632Ah (Stage Map descriptor) and 632Ch-6370h (Ending Scene 2 descriptor).
UNREFERENCED_NULL_DESCRIPTOR_632B:
	DB	00h	; End of descriptor

; Ending Scene 2 graphics descriptor targeting VRAM 8000h, executed via Bank 00 559Ah
; (called from Bank 06 AD9Dh); loads 1bpp/2bpp ending tiles from Bank 11 (9B20h-9FFFh) and
; Bank 12 (A000h-A41Fh).
ENDING_SCENE2_GFX_DESCRIPTOR:
	DB	FFh,6Dh	; Unpack 2 color nibbles to TILE_COLOR_NIBBLE_LUT
	DB	2Ah,01h,00h	; 42 tiles -> dst 01h, attr 00h
	DW	9B20h	; Bank 10 1bpp source
	DB	4Ah
	DB	FEh,01h,6Dh	; Unpack 4 color nibbles to TILE_COLOR_NIBBLE_LUT
	DB	30h,2Bh,00h	; 48 tiles -> dst 2Bh, attr 00h
	DW	9C70h	; Bank 10 2bpp source
	DB	8Ah
	DB	1Dh,5Bh,00h	; 29 tiles -> dst 5Bh, attr 00h
	DW	9F70h	; Bank 10 2bpp source
	DB	8Ah
	DB	FEh,01h,AEh	; Unpack 4 color nibbles to TILE_COLOR_NIBBLE_LUT
	DB	16h,78h,00h	; 22 tiles -> dst 78h, attr 00h
	DW	A140h	; Bank 10 2bpp source
	DB	8Ah
	DB	FEh,06h,DEh	; Unpack 4 color nibbles to TILE_COLOR_NIBBLE_LUT
	DB	0Eh,8Eh,00h	; 14 tiles -> dst 8Eh, attr 00h
	DW	A2A0h	; Bank 10 2bpp source
	DB	8Ah
	DB	FEh,06h,AEh	; Unpack 4 color nibbles to TILE_COLOR_NIBBLE_LUT
	DB	01h,9Ch,00h	; 1 tiles -> dst 9Ch, attr 00h
	DW	A380h	; Bank 10 2bpp source
	DB	8Ah
	DB	FEh,06h,AEh	; Unpack 4 color nibbles to TILE_COLOR_NIBBLE_LUT
	DB	06h,9Dh,00h	; 6 tiles -> dst 9Dh, attr 00h
	DW	A390h	; Bank 10 2bpp source
	DB	8Ah
	DB	FEh,0Ah,DEh	; Unpack 4 color nibbles to TILE_COLOR_NIBBLE_LUT
	DB	03h,A3h,00h	; 3 tiles -> dst A3h, attr 00h
	DW	A3F0h	; Bank 10 2bpp source
	DB	8Ah
	DB	00h	; End of descriptor

; Ending Scene 1 graphics descriptor targeting VRAM 8000h, executed via Bank 00 5592h
; (called from Bank 06 AD42h); loads 2bpp ending tiles from Bank 14 (81ABh-8A7Ah).
ENDING_SCENE1_GFX_DESCRIPTOR:
	DB	FEh,04h,8Ch	; Unpack 4 color nibbles to TILE_COLOR_NIBBLE_LUT
	DB	16h,01h,00h	; 22 tiles -> dst 01h, attr 00h
	DW	81ABh	; Bank 13 2bpp source
	DB	8Dh
	DB	FEh,01h,23h	; Unpack 4 color nibbles to TILE_COLOR_NIBBLE_LUT
	DB	3Dh,17h,00h	; 61 tiles -> dst 17h, attr 00h
	DW	830Bh	; Bank 13 2bpp source
	DB	8Dh
	DB	3Ah,54h,00h	; 58 tiles -> dst 54h, attr 00h
	DW	86DBh	; Bank 13 2bpp source
	DB	8Dh
	DB	00h	; End of descriptor

; Bird/tablet message-box border frame graphics descriptor targeting VRAM 8000h, executed
; via Bank 00 558Ah (called from Bank 06 BB71h); loads 2bpp frame tiles from Bank 08
; (95D0h-9A2Fh).
BIRD_MESSAGE_FRAME_GFX_DESCRIPTOR:
	DB	FEh,07h,BCh	; Unpack 4 color nibbles to TILE_COLOR_NIBBLE_LUT
	DB	30h,01h,00h	; 48 tiles -> dst 01h, attr 00h
	DW	95D0h	; Bank 07 2bpp source
	DB	87h
	DB	15h,30h,00h	; 21 tiles -> dst 30h, attr 00h
	DW	98C0h	; Bank 07 2bpp source
	DB	87h
	DB	FEh,0Dh,BCh	; Unpack 4 color nibbles to TILE_COLOR_NIBBLE_LUT
	DB	02h,45h,00h	; 2 tiles -> dst 45h, attr 00h
	DW	9A10h	; Bank 07 2bpp source
	DB	87h
	DB	00h	; End of descriptor

; Shared 6+20 kanji bank & stone/inventory UI graphics descriptor targeting VRAM C800h
; (C4B2h=C8h), executed via Bank 00 5582h; loads 1bpp kanji/UI masks from Bank 13/14
; (1BD4Bh-1C14Ah) and raw-4bpp stone bases from Bank 08/09 (11A30h-121AFh).
SHARED_KANJI_AND_STONE_UI_GFX_DESCRIPTOR:
	DB	FFh,0Ch	; Unpack 2 color nibbles to TILE_COLOR_NIBBLE_LUT
	DB	0Dh,00h,00h	; 13 tiles -> dst 00h, attr 00h
	DW	7D4Bh	; Bank 13 1bpp source
	DB	4Dh
	DB	FFh,0Dh	; Unpack 2 color nibbles to TILE_COLOR_NIBBLE_LUT
	DB	11h,0Ch,00h	; 17 tiles -> dst 0Ch, attr 00h
	DW	7DABh	; Bank 13 1bpp source
	DB	4Dh
	DB	FFh,0Ch	; Unpack 2 color nibbles to TILE_COLOR_NIBBLE_LUT
	DB	11h,1Ch,00h	; 17 tiles -> dst 1Ch, attr 00h
	DW	7E2Bh	; Bank 13 1bpp source
	DB	4Dh
	DB	FFh,0Dh	; Unpack 2 color nibbles to TILE_COLOR_NIBBLE_LUT
	DB	11h,2Ch,00h	; 17 tiles -> dst 2Ch, attr 00h
	DW	7EABh	; Bank 13 1bpp source
	DB	4Dh
	DB	FFh,0Ch	; Unpack 2 color nibbles to TILE_COLOR_NIBBLE_LUT
	DB	05h,3Ch,00h	; 5 tiles -> dst 3Ch, attr 00h
	DW	7F2Bh	; Bank 13 1bpp source
	DB	4Dh
	DB	FFh,0Dh	; Unpack 2 color nibbles to TILE_COLOR_NIBBLE_LUT
	DB	19h,40h,00h	; 25 tiles -> dst 40h, attr 00h
	DW	7F4Bh	; Bank 13 1bpp source
	DB	4Dh
	DB	FFh,0Ch	; Unpack 2 color nibbles to TILE_COLOR_NIBBLE_LUT
	DB	09h,58h,00h	; 9 tiles -> dst 58h, attr 00h
	DW	800Bh	; Bank 13 1bpp source
	DB	4Dh
	DB	FFh,0Dh	; Unpack 2 color nibbles to TILE_COLOR_NIBBLE_LUT
	DB	19h,60h,00h	; 25 tiles -> dst 60h, attr 00h
	DW	804Bh	; Bank 13 1bpp source
	DB	4Dh
	DB	FFh,0Ch	; Unpack 2 color nibbles to TILE_COLOR_NIBBLE_LUT
	DB	08h,78h,00h	; 8 tiles -> dst 78h, attr 00h
	DW	810Bh	; Bank 13 1bpp source
	DB	4Dh
	DB	20h,80h,00h	; 32 tiles -> dst 80h, attr 00h
	DW	9A30h	; Bank 07 raw-4bpp source
	DB	07h
	DB	20h,A0h,00h	; 32 tiles -> dst A0h, attr 00h
	DW	9DB0h	; Bank 07 raw-4bpp source
	DB	07h
	DB	00h	; End of descriptor

; 1-byte 00h empty graphics descriptor targeted by all 8 entries of
; StageCompanionNullGfxPtrTable (6010h-601Fh).
COMPANION_NULL_GFX_DESCRIPTOR:
	DB	00h	; End of descriptor

; Common gameplay graphics descriptor targeting VRAM C000h (C4B2h=C0h), executed from Bank
; 00 5485h; loads six 4-tile 3bpp blocks from Bank 12 (BB1Fh-BD5Eh).
COMMON_PAGE_C000_GFX_DESCRIPTOR:
	DB	FDh,06h,78h,9Fh,00h	; Unpack 8 color nibbles to TILE_COLOR_NIBBLE_LUT
	DB	04h,1Ch,00h	; 4 tiles -> dst 1Ch, attr 00h
	DW	BB1Fh	; Bank 10 3bpp source
	DB	CAh
	DB	04h,3Ch,00h	; 4 tiles -> dst 3Ch, attr 00h
	DW	BB7Fh	; Bank 10 3bpp source
	DB	CAh
	DB	04h,5Ch,00h	; 4 tiles -> dst 5Ch, attr 00h
	DW	BBDFh	; Bank 10 3bpp source
	DB	CAh
	DB	04h,7Ch,00h	; 4 tiles -> dst 7Ch, attr 00h
	DW	BC3Fh	; Bank 10 3bpp source
	DB	CAh
	DB	04h,9Ch,00h	; 4 tiles -> dst 9Ch, attr 00h
	DW	BC9Fh	; Bank 10 3bpp source
	DB	CAh
	DB	04h,BCh,00h	; 4 tiles -> dst BCh, attr 00h
	DW	BCFFh	; Bank 10 3bpp source
	DB	CAh
	DB	00h	; End of descriptor

; Common gameplay graphics descriptor targeting VRAM 0000h (C4B2h=00h), executed from Bank
; 00 548Dh; loads two 2-tile raw-4bpp blocks from Bank 12 (BD5Fh-BDDEh).
COMMON_PAGE0000_GFX_DESCRIPTOR:
	DB	02h,1Ah,00h	; 2 tiles -> dst 1Ah, attr 00h
	DW	BD5Fh	; Bank 10 raw-4bpp source
	DB	0Ah
	DB	02h,3Ah,00h	; 2 tiles -> dst 3Ah, attr 00h
	DW	BD9Fh	; Bank 10 raw-4bpp source
	DB	0Ah
	DB	00h	; End of descriptor

; Common gameplay graphics descriptor targeting VRAM 4000h (C4B2h=40h, when C483h != 3),
; executed from Bank 00 5495h; loads three 3-tile raw-4bpp blocks from Bank 12
; (BDDFh-BEFEh).
COMMON_PAGE4000_GFX_DESCRIPTOR:
	DB	03h,1Dh,00h	; 3 tiles -> dst 1Dh, attr 00h
	DW	BDDFh	; Bank 10 raw-4bpp source
	DB	0Ah
	DB	03h,3Dh,00h	; 3 tiles -> dst 3Dh, attr 00h
	DW	BE3Fh	; Bank 10 raw-4bpp source
	DB	0Ah
	DB	03h,5Dh,00h	; 3 tiles -> dst 5Dh, attr 00h
	DW	BE9Fh	; Bank 10 raw-4bpp source
	DB	0Ah
	DB	00h	; End of descriptor

; Title screen Firebird Phase 1 1bpp graphics descriptor targeting VRAM 8000h
; (dst=01h..B6h), executed from Bank 00 5A84h; loads 182 1bpp tiles from Bank 13
; (6368h-6917h).
TITLE_FIREBIRD_PHASE1_GFX_DESCRIPTOR:
	DB	FFh,0Ch	; Unpack 2 color nibbles to TILE_COLOR_NIBBLE_LUT
	IF	HINOTORI_ENHANCED
	DB	40h,01h,00h
	DW	GAMEPLAY_OBJECT_TABLE + 0000h
	DB	4Dh
	DB	40h,41h,00h
	DW	GAMEPLAY_OBJECT_TABLE + 0200h
	DB	4Dh
	DB	36h,81h,00h
	DW	GAMEPLAY_OBJECT_TABLE + 0400h
	DB	4Dh
	ELSE
	DB	40h,01h,00h	; 64 tiles -> dst 01h, attr 00h
	DW	6368h	; Bank 13 1bpp source
	DB	4Dh
	DB	40h,41h,00h	; 64 tiles -> dst 41h, attr 00h
	DW	6568h	; Bank 13 1bpp source
	DB	4Dh
	DB	36h,81h,00h	; 54 tiles -> dst 81h, attr 00h
	DW	6768h	; Bank 13 1bpp source
	DB	4Dh
	ENDIF
	DB	00h	; End of descriptor

; Title screen Firebird Phase 2 2bpp graphics descriptor targeting VRAM 8000h
; (dst=01h..71h), executed from Bank 00 5A9Bh; loads 113 2bpp tiles from Bank 13
; (6960h-706Fh).
TITLE_FIREBIRD_PHASE2_GFX_DESCRIPTOR:
	DB	FEh,07h,CFh	; Unpack 4 color nibbles to TILE_COLOR_NIBBLE_LUT
	IF	HINOTORI_ENHANCED
	DB	40h,01h,00h
	DW	GAMEPLAY_OBJECT_TABLE + 05B0h
	DB	8Dh
	DB	31h,41h,00h
	DW	GAMEPLAY_OBJECT_TABLE + 09B0h
	DB	8Dh
	ELSE
	DB	40h,01h,00h	; 64 tiles -> dst 01h, attr 00h
	DW	6960h	; Bank 13 2bpp source
	DB	8Dh
	DB	31h,41h,00h	; 49 tiles -> dst 41h, attr 00h
	DW	6D60h	; Bank 13 2bpp source
	DB	8Dh
	ENDIF
	DB	00h	; End of descriptor

; Title & Ending Kadokawa Shoten / Tezuka Production publisher emblem 2bpp graphics
; descriptor targeting VRAM 8000h (dst=01h..4Bh), executed from Bank 00 5AB2h and Bank 06
; AE69h; loads 75 2bpp tiles from Bank 13 (7150h-75FFh).
PUBLISHER_LOGO_CREDITS_GFX_DESCRIPTOR:
	DB	FEh,07h,CFh	; Unpack 4 color nibbles to TILE_COLOR_NIBBLE_LUT
	DB	40h,01h,00h	; 64 tiles -> dst 01h, attr 00h
	DW	PUBLISHER_LOGO_CREDITS_TILES_2BPP	; Bank 13 2bpp source
	DB	8Dh
	DB	0Bh,41h,00h	; 11 tiles -> dst 41h, attr 00h
	DW	PUBLISHER_LOGO_CREDITS_TILES_2BPP + 0400h	; Bank 13 2bpp source
	DB	8Dh
	DB	00h	; End of descriptor

	IF	HINOTORI_ENHANCED

; CBS v5.2 Format 0 compressed Stage 1 tileset (2,928B raw -> 2,072B compressed)
STAGE1_TILES_CBS:
	DB	2Bh,FFh,00h,FAh,91h,01h,01h,D4h,E8h,F6h,28h,F9h,4Ch,FEh,02h,02h
	DB	F8h,FAh,78h,D0h,CDh,DFh,60h,40h,0Ah,30h,20h,1Ch,10h,10h,B2h,B3h
	DB	BFh,C0h,80h,59h,D1h,ADh,EFh,31h,21h,B2h,58h,20h,E3h,A4h,60h,20h
	DB	40h,8Ch,FFh,04h,04h,15h,48h,86h,BFh,CCh,88h,BDh,C6h,84h,87h,82h
	DB	82h,CBh,C4h,D0h,50h,1Fh,18h,A2h,0Fh,09h,71h,07h,05h,BFh,C3h,83h
	DB	FFh,65h,FDh,33h,11h,03h,03h,04h,74h,FFh,A2h,FBh,65h,85h,FEh,FAh
	DB	0Fh,8Eh,8Eh,34h,28h,18h,31h,DFh,D8h,F1h,A0h,0Fh,09h,42h,C7h,87h
	DB	46h,28h,F8h,B8h,50h,E0h,60h,A0h,D8h,D0h,14h,8Ch,88h,FDh,06h,04h
	DB	AFh,70h,00h,26h,70h,70h,64h,FDh,05h,06h,E0h,3Bh,8Eh,04h,DFh,33h
	DB	13h,A1h,38h,CDh,45h,6Bh,03h,08h,FBh,0Bh,0Ch,BBh,CBh,0Dh,FBh,DBh
	DB	DDh,FDh,1Dh,1Eh,EFh,2Fh,3Fh,82h,FBh,35h,DFh,5Fh,65h,20h,8Ah,6Bh
	DB	BFh,BFh,CBh,D7h,D2h,0Bh,97h,14h,7Eh,6Eh,32h,38h,38h,D2h,92h,AFh
	DB	71h,01h,FEh,72h,73h,63h,FBh,1Ch,22h,C1h,1Dh,1Dh,64h,20h,FEh,42h
	DB	03h,FEh,62h,43h,EDh,35h,26h,FDh,15h,16h,7Ch,D1h,96h,A3h,03h,00h
	DB	FDh,03h,01h,FDh,02h,12h,16h,FDh,01h,02h,F6h,06h,09h,F5h,1Fh,01h
	DB	EFh,18h,84h,CFh,30h,56h,20h,ACh,4Fh,B2h,E1h,FAh,A4h,FCh,ACh,03h
	DB	DBh,FDh,04h,FDh,0Fh,34h,64h,E7h,A7h,8Ch,EFh,13h,03h,EFh,14h,04h
	DB	E2h,34h,60h,7Fh,8Fh,F5h,35h,36h,70h,A5h,58h,E0h,25h,36h,CCh,0Fh
	DB	0Ch,F1h,E6h,E4h,76h,E6h,A0h,07h,06h,FEh,06h,2Fh,ECh,2Ch,FFh,C0h
	DB	C0h,DFh,D6h,F4h,56h,20h,40h,40h,D7h,28h,68h,EFh,3Ch,52h,D1h,BFh
	DB	77h,A5h,80h,6Ah,92h,E7h,08h,08h,F7h,10h,10h,42h,08h,9Fh,20h,20h
	DB	DFh,68h,F9h,55h,FDh,78h,23h,88h,2Bh,FBh,B9h,40h,7Fh,28h,9Dh,57h
	DB	9Fh,70h,61h,22h,E3h,1Ch,1Ch,05h,7Ah,7Ah,3Dh,04h,04h,11h,0Fh,B3h
	DB	30h,30h,F7h,FBh,A1h,1Ch,68h,D9h,F9h,4Fh,EBh,BFh,A0h,EDh,1Fh,04h
	DB	F7h,09h,42h,F6h,09h,42h,D7h,39h,39h,FFh,F8h,FBh,9Ch,BFh,FDh,91h
	DB	D3h,2Ch,FBh,ACh,59h,04h,10h,34h,AFh,80h,F1h,50h,F7h,F8h,00h,B6h
	DB	FAh,11h,7Ch,C7h,D1h,C6h,42h,42h,C4h,44h,88h,AEh,B0h,80h,BEh,E6h
	DB	01h,77h,CFh,06h,57h,D7h,6Fh,E3h,EBh,B7h,ADh,FDh,23h,75h,FDh,73h
	DB	AFh,AFh,DCh,77h,F7h,4Eh,FAh,FFh,78h,ECh,EFh,50h,FBh,FFh,89h,BDh
	DB	BFh,DDh,3Eh,FEh,3Fh,7Ah,FAh,47h,DDh,FDh,96h,BDh,FDh,BEh,FBh,3Bh
	DB	0Ch,ABh,7Bh,91h,E1h,1Bh,1Dh,41h,A1h,FDh,3Eh,2Fh,AFh,7Fh,EFh,F5h
	DB	04h,09h,DFh,EBh,EFh,F3h,80h,ACh,97h,C0h,7Fh,77h,B3h,67h,67h,DFh
	DB	C2h,FAh,87h,BEh,F2h,9Bh,BFh,F0h,FEh,9Dh,9Dh,FEh,FBh,FBh,4Ch,FBh
	DB	B4h,EDh,DBh,DBh,BDh,BDh,BDh,7Eh,AFh,EFh,3Fh,6Fh,7Eh,75h,5Fh,DFh
	DB	A0h,78h,BEh,BFh,CAh,FBh,A5h,D6h,BFh,DBh,97h,E9h,E7h,FDh,FFh,FCh
	DB	FFh,FFh,5Ah,ADh,29h,5Bh,F5h,0Ah,BFh,B9h,C5h,E3h,64h,EBh,0Dh,A2h
	DB	F9h,EAh,FFh,D0h,CEh,41h,A5h,C6h,83h,FBh,87h,B3h,B1h,4Fh,20h,DEh
	DB	A0h,A7h,66h,FFh,F9h,FDh,B5h,5Dh,FBh,BEh,60h,B0h,E5h,CBh,EFh,DFh
	DB	2Eh,FEh,27h,76h,FEh,77h,10h,FBh,A0h,10h,6Ah,FCh,EBh,EBh,9Dh,BBh
	DB	FBh,1Dh,7Dh,FDh,D5h,B7h,FFh,E2h,B0h,DFh,E5h,64h,A1h,BEh,BEh,D9h
	DB	7Bh,7Fh,B2h,FFh,7Fh,42h,E7h,5Fh,69h,9Eh,22h,1Fh,6Fh,E0h,C9h,40h
	DB	D0h,FBh,5Eh,A1h,5Fh,9Bh,6Fh,1Bh,C1h,6Bh,7Dh,F7h,F7h,FBh,D5h,FBh
	DB	7Ah,ADh,75h,FDh,34h,3Dh,7Fh,7Fh,B7h,D1h,46h,6Fh,01h,8Fh,CAh,E2h
	DB	74h,A1h,E6h,28h,FDh,50h,5Bh,A3h,57h,F5h,FBh,BEh,0Ah,BEh,FEh,FBh
	DB	FBh,51h,F5h,D5h,FBh,F7h,A1h,E1h,F6h,5Ah,CEh,C5h,AFh,14h,67h,20h
	DB	9Dh,B7h,EFh,FFh,6Ah,8Ah,33h,E1h,64h,58h,44h,E9h,A1h,8Fh,DFh,98h
	DB	BBh,4Ah,32h,D2h,E0h,49h,6Fh,EFh,57h,C6h,FEh,83h,95h,A9h,DEh,DAh
	DB	40h,D7h,0Dh,5Fh,FCh,E6h,EAh,FBh,65h,BFh,4Eh,60h,C6h,51h,9Dh,3Dh
	DB	59h,00h,61h,B0h,50h,71h,0Ah,5Ah,73h,FBh,BDh,14h,63h,28h,FAh,50h
	DB	F6h,A9h,A8h,0Dh,42h,FDh,B5h,ECh,FBh,EDh,D7h,EFh,49h,3Ah,F0h,7Fh
	DB	03h,85h,D3h,61h,A0h,FBh,34h,60h,EFh,F0h,A0h,EEh,F2h,61h,ECh,D7h
	DB	C0h,A2h,E1h,C2h,75h,ADh,BDh,68h,A5h,56h,35h,CDh,ACh,23h,DBh,FBh
	DB	11h,3Bh,7Dh,7Dh,B6h,52h,AEh,00h,28h,D7h,0Fh,23h,14h,53h,FBh,83h
	DB	59h,5Ah,B2h,FBh,7Dh,14h,B9h,28h,7Bh,56h,E7h,3Bh,8Eh,F6h,41h,A9h
	DB	D9h,BBh,BBh,CCh,DFh,04h,64h,9Ch,7Fh,10h,95h,EAh,92h,70h,ABh,E4h
	DB	ACh,15h,5Eh,A9h,3Bh,5Fh,8Bh,41h,B3h,ADh,37h,11h,0Ah,77h,EFh,14h
	DB	DFh,33h,0Dh,7Bh,3Fh,BEh,46h,40h,7Eh,46h,03h,CFh,4Fh,FFh,93h,93h
	DB	FFh,2Dh,2Dh,B2h,08h,F1h,85h,FFh,68h,DCh,FBh,2Dh,56h,CDh,B2h,D6h
	DB	40h,26h,B5h,5Fh,5Fh,0Fh,E3h,3Dh,0Ch,60h,A1h,6Ah,FEh,EFh,6Fh,77h
	DB	DEh,DEh,EFh,BEh,BEh,41h,67h,D6h,DDh,DDh,EEh,D2h,A1h,FCh,11h,EBh
	DB	ADh,42h,7Dh,8Fh,FEh,C5h,51h,75h,9Dh,90h,3Ah,50h,BEh,59h,FBh,68h
	DB	DAh,DFh,DCh,E4h,FFh,F8h,F8h,4Eh,F0h,50h,70h,C6h,1Ah,3Fh,3Fh,FFh
	DB	0Bh,0Bh,FFh,05h,05h,16h,92h,A5h,B1h,69h,07h,FAh,A1h,FDh,0Dh,0Eh
	DB	3Dh,3Eh,CBh,47h,F3h,B9h,BFh,F9h,DDh,DFh,2Dh,95h,BFh,0Eh,4Ah,75h
	DB	26h,12h,E3h,59h,CCh,FFh,84h,DEh,FFh,8Eh,A8h,41h,B7h,B7h,CCh,BAh
	DB	42h,26h,79h,94h,71h,61h,91h,89h,F8h,F6h,F7h,CEh,CBh,C2h,B5h,FDh
	DB	B3h,EFh,ADh,19h,5Bh,43h,36h,40h,12h,90h,BCh,28h,DCh,3Ch,FFh,3Ch
	DB	69h,FBh,46h,EDh,42h,91h,36h,B9h,FEh,47h,78h,FCh,FCh,7Bh,77h,A5h
	DB	30h,B7h,B7h,A9h,EFh,EBh,23h,04h,E3h,CCh,CFh,FCh,56h,9Fh,71h,B0h
	DB	39h,E9h,FCh,32h,3Fh,7Fh,8Fh,5Fh,11h,0Bh,05h,8Dh,6Eh,7Fh,CAh,6Bh
	DB	FFh,2Ah,13h,29h,12h,01h,0Dh,BCh,CAh,FBh,CCh,1Dh,12h,10h,F6h,F6h
	DB	79h,F9h,F9h,ABh,F5h,13h,E3h,EFh,B8h,41h,C3h,E9h,57h,3Dh,BFh,5Dh
	DB	09h,42h,89h,87h,87h,87h,9Fh,83h,06h,E7h,E7h,F9h,ECh,BCh,3Fh,3Bh
	DB	8Fh,8Fh,FAh,3Fh,38h,ECh,2Fh,10h,FBh,7Fh,09h,BCh,3Fh,5Ch,10h,2Eh
	DB	85h,B0h,34h,ACh,2Fh,5Ch,95h,F9h,4Dh,C0h,25h,39h,10h,D7h,28h,3Ah
	DB	FAh,26h,77h,FEh,60h,7Bh,4Fh,81h,6Dh,F7h,D1h,4Eh,F7h,C2h,B6h,7Fh
	DB	26h,DCh,3Fh,14h,BFh,E0h,00h,7Fh,E0h,20h,FAh,A4h,67h,ACh,58h,0Bh
	DB	0Bh,B0h,B9h,E6h,20h,FDh,C2h,C0h,FEh,81h,80h,D7h,10h,28h,BBh,78h
	DB	24h,F7h,5Eh,40h,E9h,A0h,26h,FCh,DFh,1Ch,AEh,EFh,B2h,D4h,21h,C9h
	DB	8Ah,13h,35h,3Fh,56h,1Ah,71h,90h,0Eh,CAh,07h,07h,48h,07h,D7h,17h
	DB	2Fh,BBh,7Bh,27h,F7h,5Fh,41h,E2h,A0h,FFh,08h,84h,FFh,CAh,23h,84h
	DB	21h,BCh,26h,F7h,3Fh,33h,FBh,0Fh,09h,D0h,90h,9Ah,37h,3Eh,DEh,1Bh
	DB	6Eh,FEh,67h,F5h,3Dh,36h,D2h,CAh,D0h,9Ch,9Ch,FFh,1Fh,DFh,3Bh,FFh
	DB	0Ch,8Ch,D9h,39h,16h,FDh,3Fh,21h,E7h,5Dh,00h,9Ch,D7h,D7h,EFh,23h
	DB	A7h,A7h,F7h,0Dh,23h,5Ah,15h,B1h,E4h,40h,50h,FFh,A6h,A1h,FFh,D4h
	DB	FFh,3Ch,2Ch,50h,DFh,B5h,A1h,FFh,3Ah,FFh,66h,55h,E9h,4Dh,E3h,F9h
	DB	43h,35h,29h,84h,C8h,EDh,FDh,EEh,61h,77h,F9h,35h,FFh,21h,1Fh,B5h
	DB	8Ah,C5h,0Fh,2Bh,09h,0Bh,17h,D7h,2Fh,3Bh,FBh,27h,D7h,DFh,C1h,BAh
	DB	B0h,42h,BFh,3Fh,F0h,30h,2Fh,E0h,20h,42h,C0h,40h,55h,C1h,41h,73h
	DB	D2h,52h,97h,94h,94h,A6h,A4h,A4h,ADh,A9h,FEh,02h,FCh,6Bh,EAh,6Ah
	DB	57h,D4h,54h,3Bh,F8h,38h,15h,F0h,10h,23h,E3h,23h,37h,E6h,26h,3Fh
	DB	E9h,A0h,D0h,5Fh,ADh,4Fh,FBh,09h,7Fh,18h,DBh,80h,80h,B5h,A4h,A4h
	DB	AEh,A8h,A8h,27h,E0h,20h,29h,A1h,22h,5Ah,30h,BFh,10h,C1h,A1h,0Eh
	DB	FEh,0Eh,03h,98h,C5h,13h,9Ah,43h,01h,1Ah,FBh,02h,D3h,FAh,07h,FCh
	DB	04h,24h,D1h,09h,F8h,08h,08h,F9h,09h,13h,F2h,12h,17h,F4h,14h,0Bh
	DB	F8h,08h,0Fh,AFh,19h,9Bh,E8h,4Eh,2Fh,E8h,28h,35h,9Ch,48h,F7h,4Fh
	DB	02h,E2h,22h,22h,11h,11h,10h,12h,13h,10h,0Fh,0Fh,0Fh,13h,1Fh,13h
	DB	E3h,BEh,FDh,6Dh,24h,5Fh,D5h,60h,6Fh,F0h,5Dh,1Bh,63h,95h,D0h,10h
	DB	ABh,0Ah,FFh,FBh,ADh,40h,C1h,E3h,80h,AFh,90h,C0h,40h,35h,70h,B0h
	DB	67h,60h,D8h,EFh,FCh,A0h,98h,70h,38h,DEh,C1h,20h,3Fh,ADh,47h,E7h
	DB	F8h,E0h,DFh,C8h,A8h,8Fh,B4h,44h,BFh,E0h,20h,63h,C2h,5Ch,5Eh,DFh
	DB	66h,DFh,F1h,81h,12h,40h,98h,D8h,DBh,2Ch,9Ah,81h,DBh,3Ch,14h,C3h
	DB	3Ch,49h,F3h,CCh,C0h,F7h,28h,20h,C4h,E6h,32h,9Fh,60h,F0h,22h,F0h
	DB	FFh,31h,E3h,E5h,4Bh,40h,C0h,E8h,FBh,E3h,C0h,47h,80h,B0h,81h,26h
	DB	70h,7Fh,B0h,60h,67h,D8h,55h,19h,A0h,0Ah,CDh,38h,15h,FCh,18h,6Dh
	DB	CEh,3Ah,38h,79h,E3h,5Eh,E4h,DCh,DFh,B4h,8Eh,BFh,4Ah,D7h,0Eh,3Eh
	DB	62h,E3h,7Ch,40h,A8h,D7h,D2h,A9h,AEh,1Ah,0Eh,7Ch,F4h,CBh,FAh,F0h
	DB	66h,E7h,5Eh,ADh,D2h,B2h,B9h,FFh,39h,FDh,FDh,85h,D6h,83h,20h,C5h
	DB	FFh,E0h,74h,9Bh,6Ah,4Ch,7Eh,40h,C8h,76h,1Bh,FFh,1Bh,C6h,C1h,9Ah
	DB	20h,94h,55h,35h,CBh,8Eh,83h,D3h,D7h,FBh,90h,7Ah,A5h,7Ah,0Ch,0Ch
	DB	C0h,D1h,E8h,72h,9Bh,50h,2Ch,ACh,E2h,FFh,19h,32h,F2h,32h,08h,BBh
	DB	53h,04h,91h,2Dh,5Ah,42h,40h,C0h,AAh,18h,E6h,52h,C1h,33h,0Dh,11h
	DB	31h,11h,11h,0Eh,0Ah,0Eh,10h,51h,10h,B5h,06h,19h,EAh,A1h,DCh,4Bh
	DB	31h,FEh,D0h,07h,9Dh,8Ch,8Fh,8Ch,DBh,87h,5Eh,8Dh,30h,63h,B3h,8Fh
	DB	08h,A4h,FFh,00h,85h,30h,0Ah,F0h,0Fh,A7h,DBh,D0h,9Dh,FBh,18h,FEh
	DB	5Dh,0Ah,0Ah,E9h,29h,29h,65h,25h,25h,B5h,95h,95h,16h,B0h,0Ah,7Fh
	DB	8Ch,49h,E9h,7Fh,50h,50h,E0h,06h,B9h,6Ah,26h,FDh,02h,06h,F6h,09h
	DB	15h,BAh,5Fh,41h,50h,56h,04h,DFh,ABh,01h,35h,42h,02h,8Eh,03h,F5h
	DB	C3h,EFh,02h,58h,16h,34h,9Fh,FEh,C4h,F7h,E2h,E4h,DCh,EBh,FCh,03h
	DB	0Bh,FBh,04h,0Fh,EFh,1Ch,8Fh,48h,19h,52h,19h,13h,13h,D5h,65h,15h
	DB	47h,94h,13h,48h,1Bh,39h,88h,88h,35h,4Fh,F9h,A4h,53h,33h,F8h,F3h
	DB	90h,3Fh,E1h,13h,A0h,88h,FFh,F5h,54h,4Fh,D6h,43h,4Fh,33h,F4h,34h
	DB	E6h,81h,A0h,FFh,44h,8Fh,44h,5Fh,3Fh,F4h,3Fh,44h,31h,F4h,F4h,F5h
	DB	42h,4Fh,4Fh,F2h,33h,4Fh,58h,23h,C1h,F2h,FFh,22h,F3h,B3h,79h,44h
	DB	2Fh,FFh,99h,A1h,F5h,44h,F8h,44h,F3h,42h,24h,5Fh,B5h,97h,2Fh,ACh
	DB	B5h,32h,EBh,FFh,F4h,22h,FFh,87h,C5h,EFh,C7h,4Dh,8Ch,CFh,79h,14h
	DB	FCh,CFh,92h,54h,CFh,D6h,83h,35h,93h,B7h,F3h,66h,C9h,3Dh,5Fh,F5h
	DB	45h,51h,0Fh,3Fh,7Bh,16h,A2h,FFh,D5h,FFh,01h,EAh,0Dh,00h,FFh,34h
	DB	FFh,43h,A8h,C2h,F4h,C1h,44h,43h,F4h,45h,5Ah,C5h,43h,3Dh,D4h,B4h
	DB	E1h,F3h,87h,33h,45h,A9h,D6h,70h

; CBS v5.2 Format 0 compressed Stage 5 tileset (3,136B raw -> 2,437B compressed)
STAGE5_TILES_CBS:
	DB	85h,88h,0Ah,CCh,C0h,DAh,CFh,D0h,FFh,D2h,FBh,14h,52h,F1h,16h,33h
	DB	31h,3Fh,D3h,BEh,3Eh,CFh,DFh,00h,FFh,FFh,48h,A1h,FFh,07h,03h,FDh
	DB	43h,01h,FEh,B9h,E8h,FAh,68h,3Fh,2Dh,10h,FFh,98h,80h,7Fh,BFh,21h
	DB	A2h,FFh,5Fh,C0h,3Fh,4Fh,91h,BFh,23h,E0h,9Fh,3Bh,F8h,87h,2Fh,E0h
	DB	3Fh,FDh,01h,FEh,F9h,24h,FBh,03h,FCh,F7h,07h,F9h,51h,FBh,82h,EFh
	DB	0Fh,F7h,CFh,3Eh,47h,95h,97h,01h,40h,4Ah,FEh,D0h,FBh,E7h,92h,9Bh
	DB	18h,E7h,BFh,20h,DFh,6Bh,EFh,D6h,FAh,FAh,D0h,F9h,AEh,FDh,9Ah,35h
	DB	F1h,8Ah,3Ah,E7h,C0h,41h,FDh,CBh,0Bh,F5h,FEh,0Fh,F2h,FAh,03h,FEh
	DB	17h,D0h,FDh,FAh,04h,42h,FDh,86h,FAh,DFh,68h,D6h,E1h,8Eh,FDh,04h
	DB	F4h,5Ah,FCh,E3h,F8h,31h,02h,FDh,3Bh,E0h,2Fh,7Ch,F8h,0Ah,D0h,3Eh
	DB	ABh,9Ch,39h,26h,81h,81h,7Eh,64h,67h,98h,CDh,9Eh,09h,F7h,62h,EBh
	DB	08h,F7h,97h,10h,EFh,27h,0Dh,6Bh,E0h,1Fh,29h,ADh,15h,2Fh,F5h,08h
	DB	A3h,07h,73h,F0h,6Fh,35h,F0h,2Fh,9Fh,FCh,83h,5Bh,F8h,57h,B7h,F0h
	DB	BFh,6Fh,E0h,2Ch,D2h,A1h,97h,80h,94h,B5h,3Fh,1Ah,1Fh,9Dh,BBh,ACh
	DB	D0h,A6h,05h,75h,F0h,CFh,6Bh,E8h,D7h,39h,F8h,E7h,3Eh,FEh,21h,9Fh
	DB	FCh,93h,47h,29h,4Fh,96h,56h,0Fh,C5h,ABh,50h,D1h,D4h,FAh,31h,85h
	DB	F3h,11h,07h,73h,0Eh,FEh,2Fh,1Fh,8Eh,4Ch,FAh,82h,19h,FFh,5Bh,29h
	DB	96h,69h,09h,32h,D6h,C0h,31h,ADh,1Fh,C9h,01h,7Fh,90h,DAh,3Fh,C6h
	DB	F8h,FFh,08h,F1h,FFh,31h,CFh,FFh,CFh,FCh,59h,F0h,4Bh,F0h,1Fh,1Fh
	DB	C3h,03h,31h,2Bh,07h,9Fh,C2h,FFh,DAh,DDh,2Fh,3Ch,B8h,3Fh,CBh,DCh
	DB	1Fh,EDh,FAh,52h,DEh,2Ch,E6h,CEh,0Fh,F6h,17h,F0h,CFh,CDh,1Fh,F8h
	DB	C7h,1Ah,FCh,F3h,0Fh,4Ah,E3h,52h,7Bh,07h,52h,F5h,BDh,29h,FDh,C6h
	DB	5Ah,C6h,49h,98h,B1h,A1h,E4h,84h,42h,9Dh,18h,81h,3Bh,60h,FFh,66h
	DB	B1h,2Fh,1Fh,90h,1Dh,DDh,4Ah,EFh,DBh,1Eh,34h,21h,85h,2Dh,C3h,0Ah
	DB	DBh,82h,14h,B2h,8Eh,B5h,EEh,ACh,25h,24h,24h,8Ah,11h,FAh,20h,14h
	DB	25h,C4h,B5h,DFh,E3h,F9h,AAh,A1h,67h,44h,C4h,21h,FEh,46h,7Fh,FEh
	DB	58h,7Fh,F9h,B0h,3Fh,F3h,A0h,3Fh,EEh,A1h,3Fh,EDh,A2h,3Fh,E2h,76h
	DB	4Bh,B6h,ADh,14h,78h,A0h,B1h,A1h,A7h,ACh,38h,BCh,E1h,FAh,D2h,50h
	DB	44h,52h,A4h,00h,84h,3Bh,50h,99h,04h,A4h,9Dh,02h,5Eh,28h,4Eh,31h
	DB	46h,0Fh,4Bh,4Fh,D1h,47h,B9h,ADh,E9h,9Ah,CAh,D6h,EFh,92h,B3h,84h
	DB	96h,45h,95h,10h,69h,40h,CBh,80h,21h,9Ah,01h,32h,09h,3Fh,EFh,91h
	DB	3Fh,DDh,A7h,CEh,F5h,4Eh,7Fh,9Eh,D1h,0Fh,7Ch,CAh,27h,E0h,14h,C0h
	DB	2Ah,81h,5Ch,FCh,B3h,55h,C7h,61h,DEh,EBh,92h,28h,E1h,23h,52h,E3h
	DB	42h,C2h,D4h,FAh,86h,91h,86h,A4h,34h,3Eh,34h,4Ch,A1h,59h,85h,8Fh
	DB	2Fh,87h,B3h,53h,42h,E3h,29h,73h,0Ch,6Bh,3Dh,2Fh,1Ch,FBh,14h,0Ch
	DB	41h,59h,43h,40h,FEh,42h,41h,FFh,45h,A4h,82h,8Eh,86h,45h,DFh,84h
	DB	CCh,04h,EEh,CCh,24h,0Fh,0Ch,F4h,BFh,BCh,44h,5Fh,4Ch,B8h,FAh,76h
	DB	C9h,29h,0Eh,01h,60h,07h,E2h,F4h,D0h,A4h,4Ah,B0h,DEh,FAh,52h,51h
	DB	55h,D7h,B5h,5Eh,8Dh,7Dh,7Bh,09h,EBh,26h,FCh,FBh,42h,6Eh,85h,33h
	DB	0Ah,5Ch,2Eh,B4h,A5h,9Bh,BBh,47h,ABh,14h,E7h,30h,3Ah,F1h,1Ch,CBh
	DB	07h,85h,DFh,02h,03h,8Dh,DFh,4Ah,08h,55h,06h,B5h,81h,9Ch,D8h,D7h
	DB	50h,8Ah,C7h,83h,5Ah,9Fh,E8h,92h,F0h,F3h,11h,CFh,80h,1Dh,B3h,62h
	DB	03h,A7h,07h,8Ch,85h,8Dh,11h,2Ch,17h,EFh,50h,1Fh,18h,FBh,78h,70h
	DB	7Dh,CAh,A5h,89h,0Ch,DCh,E9h,FFh,36h,0Dh,03h,87h,0Eh,D1h,42h,F9h
	DB	ACh,F2h,26h,69h,94h,1Eh,DDh,B7h,28h,89h,4Bh,FBh,41h,D6h,23h,9Ch
	DB	17h,B5h,30h,70h,25h,26h,26h,6Ah,3Eh,D2h,A5h,0Fh,21h,CCh,4Ch,D8h
	DB	42h,59h,F0h,39h,1Dh,72h,67h,79h,7Fh,81h,62h,7Fh,C2h,D3h,28h,0Dh
	DB	D0h,14h,D3h,60h,7Fh,E6h,54h,EBh,7Fh,CDh,43h,7Fh,D3h,4Ch,7Fh,CCh
	DB	00h,FEh,E1h,01h,FCh,B3h,41h,FCh,D3h,27h,FCh,E3h,1Fh,F8h,7Fh,0Fh
	DB	F0h,8Fh,5Fh,E0h,DFh,3Fh,9Fh,ECh,FDh,3Ah,3Ch,3Fh,FCh,44h,39h,FEh
	DB	EEh,6Ah,DEh,26h,03h,A6h,78h,65h,EAh,CDh,FAh,0Ah,03h,C7h,5Eh,FDh
	DB	FFh,92h,C3h,BDh,DBh,D0h,45h,14h,3Bh,0Bh,34h,1Bh,0Fh,A7h,E6h,F8h
	DB	37h,F3h,1Ah,DFh,CFh,8Eh,0Dh,A5h,6Ch,D4h,D0h,27h,87h,AFh,24h,FBh
	DB	48h,48h,50h,58h,88h,A4h,B8h,90h,B0h,76h,3Fh,29h,71h,21h,52h,61h
	DB	81h,84h,AFh,66h,20h,68h,8Bh,D5h,BDh,DBh,BBh,DAh,FAh,8Ah,CBh,91h
	DB	B0h,1Ah,B1h,1Dh,BBh,41h,2Ch,79h,41h,61h,E9h,FAh,1Ch,7Fh,24h,3Bh
	DB	52h,3Ah,04h,3Dh,D0h,D1h,18h,A1h,14h,42h,16h,84h,0Bh,21h,0Dh,B3h
	DB	E1h,E1h,26h,E6h,66h,7Fh,F5h,75h,7Dh,DDh,5Dh,0Eh,C6h,06h,2Dh,EFh
	DB	2Fh,10h,C4h,88h,8Dh,63h,27h,27h,E8h,6Fh,68h,58h,5Fh,5Eh,98h,9Fh
	DB	9Bh,70h,2Ch,73h,40h,10h,06h,CDh,3Dh,CDh,CAh,3Ah,CAh,C5h,3Dh,D5h
	DB	A4h,7Ch,B4h,87h,7Fh,97h,07h,EDh,BFh,99h,46h,6Fh,C0h,80h,37h,17h
	DB	D7h,17h,2Ah,AAh,2Ah,DDh,D5h,D5h,67h,E1h,61h,35h,F4h,74h,3Fh,F3h
	DB	56h,6Fh,41h,8Ah,BEh,67h,FFh,67h,4Fh,FEh,4Eh,D7h,FDh,D5h,ACh,FCh
	DB	BCh,4Bh,F9h,59h,0Bh,FAh,2Ah,0Ch,F8h,58h,15h,FDh,35h,7Eh,55h,91h
	DB	E3h,62h,1Ah,FBh,DAh,0Bh,F9h,D9h,15h,F0h,90h,1Eh,F6h,B6h,0Bh,F8h
	DB	78h,05h,F1h,E1h,1Bh,F0h,D0h,11h,F9h,79h,02h,FAh,EAh,13h,D7h,06h
	DB	FEh,D6h,0Ah,FEh,AEh,09h,FDh,EDh,8Fh,A1h,DDh,26h,EFh,08h,69h,78h
	DB	3Fh,DFh,60h,5Fh,5Fh,FBh,1Ah,1Fh,20h,1Fh,8Fh,B0h,AFh,0Fh,70h,2Fh
	DB	48h,F0h,C4h,87h,F8h,B7h,A5h,97h,43h,FCh,5Bh,23h,7Ch,2Bh,91h,7Eh
	DB	5Dh,10h,3Fh,36h,48h,00h,A0h,2Bh,80h,BFh,B3h,40h,1Fh,19h,70h,0Dh
	DB	1Eh,10h,0Fh,07h,D0h,5Fh,5Bh,20h,3Fh,2Eh,A0h,FFh,B6h,90h,7Fh,1Bh
	DB	50h,06h,55h,28h,FFh,2Bh,20h,95h,E4h,22h,4Bh,72h,04h,85h,64h,13h
	DB	0Ah,B3h,0Eh,13h,BEh,03h,26h,7Fh,6Fh,80h,3Fh,3Fh,D0h,4Fh,1Bh,70h
	DB	5Fh,57h,4Fh,1Ch,ABh,50h,8Fh,87h,A8h,2Fh,2Ah,D8h,D7h,D5h,90h,87h
	DB	86h,40h,F7h,53h,A0h,31h,84h,7Fh,40h,62h,53h,3Fh,33h,8Eh,3Fh,3Eh
	DB	83h,BFh,9Fh,96h,2Fh,F5h,90h,48h,A0h,59h,88h,71h,98h,08h,3Fh,18h
	DB	EFh,58h,E4h,8Dh,F1h,69h,84h,FBh,44h,23h,CCh,09h,3Fh,3Ch,0Ch,B6h
	DB	B2h,82h,ADh,ACh,ACh,7Ah,C2h,FFh,D0h,DBh,FBh,DBh,8Eh,FEh,8Eh,77h
	DB	FFh,77h,EFh,FFh,0Ah,1Fh,C7h,07h,1Fh,8Ah,0Ah,5Dh,55h,0Dh,27h,81h
	DB	01h,51h,50h,0Ah,2Fh,ADh,01h,12h,D2h,92h,19h,F9h,19h,3Fh,1Ch,42h
	DB	96h,92h,B0h,A0h,35h,0Ch,8Ah,FDh,08h,FFh,14h,18h,FFh,28h,10h,FEh
	DB	50h,B1h,FDh,A1h,62h,7Eh,A1h,BDh,42h,C0h,FEh,ACh,E7h,7Dh,F0h,10h
	DB	FBh,D1h,6Bh,F8h,C5h,78h,B9h,14h,9Ch,24h,36h,6Ch,92h,75h,92h,CAh
	DB	DEh,8Bh,A2h,05h,24h,FDh,FCh,B5h,FBh,FAh,2Bh,77h,FCh,F5h,8Bh,01h
	DB	14h,FDh,EBh,14h,9Ah,C0h,46h,06h,06h,31h,00h,00h,E6h,60h,E0h,C5h
	DB	85h,85h,DAh,42h,42h,8Bh,88h,88h,79h,20h,20h,73h,45h,39h,21h,7Ah
	DB	52h,72h,B7h,80h,86h,A6h,A0h,AFh,4Dh,4Dh,4Bh,94h,FFh,E8h,F6h,44h
	DB	74h,94h,28h,F3h,00h,F0h,A4h,3Ch,A0h,95h,14h,14h,34h,FFh,50h,D3h
	DB	13h,A1h,58h,48h,A3h,03h,59h,A1h,4Eh,77h,6Bh,40h,61h,D5h,10h,11h
	DB	9Dh,85h,85h,6Bh,0Ah,0Bh,06h,FFh,28h,FBh,21h,56h,83h,82h,41h,28h
	DB	E3h,76h,0Bh,46h,05h,04h,04h,D8h,C0h,D8h,9Fh,05h,3Dh,BEh,B0h,8Eh
	DB	D1h,D1h,DFh,1Eh,1Ch,10h,3Dh,FAh,49h,7Fh,12h,7Fh,90h,BFh,C8h,3Fh
	DB	FFh,95h,ADh,7Fh,40h,40h,08h,BCh,FEh,02h,FEh,F9h,05h,F9h,FAh,06h
	DB	FAh,F6h,0Eh,F6h,F1h,09h,F1h,F2h,1Ah,F2h,E5h,1Dh,E5h,ECh,80h,8Fh
	DB	C3h,C0h,CFh,6Ch,0Ch,0Bh,D6h,C6h,C1h,6Eh,26h,25h,A0h,80h,81h,0Eh
	DB	02h,02h,40h,FFh,29h,78h,00h,7Dh,FDh,00h,FFh,BEh,02h,FDh,93h,02h
	DB	FCh,4Ch,04h,F8h,B5h,85h,79h,8Fh,8Ch,74h,79h,40h,1Ah,01h,FBh,23h
	DB	E3h,D4h,10h,F0h,1Bh,00h,C3h,6Eh,40h,47h,9Dh,01h,3Fh,82h,25h,FCh
	DB	B7h,34h,08h,55h,44h,0Ah,BBh,A1h,14h,74h,50h,28h,D9h,01h,50h,6Eh
	DB	42h,A1h,9Bh,09h,E6h,82h,42h,9Ah,10h,85h,54h,44h,00h,28h,FEh,4Eh
	DB	7Eh,7Ah,02h,FAh,B9h,81h,79h,3Fh,00h,7Fh,47h,40h,3Fh,B1h,51h,4Eh
	DB	E7h,28h,21h,94h,84h,04h,5Bh,52h,50h,B7h,25h,A1h,BBh,12h,79h,49h
	DB	45h,28h,D4h,14h,D4h,29h,08h,E8h,07h,05h,35h,58h,1Ah,0Ah,EFh,A2h
	DB	50h,B6h,16h,A1h,DDh,44h,6Bh,03h,42h,D7h,81h,85h,B2h,30h,0Ah,4Eh
	DB	0Eh,42h,B2h,28h,9Dh,85h,50h,9Ah,18h,A1h,EFh,AAh,5Bh,43h,48h,B1h
	DB	45h,EFh,2Fh,0Ah,1Dh,11h,14h,F9h,48h,84h,4Ch,52h,31h,30h,54h,14h
	DB	69h,28h,96h,50h,BFh,A1h,E9h,14h,D7h,F7h,29h,DDh,51h,08h,CBh,A1h
	DB	BFh,BDh,97h,91h,42h,FBh,FAh,85h,BFh,ABh,21h,F7h,0Dh,CEh,FFh,CEh
	DB	F4h,B0h,0Ah,D9h,48h,14h,A7h,A1h,29h,EBh,CAh,6Eh,BBh,70h,FFh,85h
	DB	FBh,0Dh,7Dh,C3h,E0h,5Ah,DDh,E9h,D2h,B8h,75h,95h,85h,F8h,6Ah,68h
	DB	CFh,41h,AAh,8Ah,FFh,D7h,50h,14h,ADh,A1h,28h,7Bh,10h,50h,8Fh,0Fh
	DB	A1h,3Ch,24h,95h,05h,48h,75h,45h,BFh,93h,0Ah,FFh,FEh,14h,DBh,CBh
	DB	28h,55h,54h,50h,EEh,82h,A1h,37h,27h,CBh,01h,42h,57h,03h,85h,EBh
	DB	20h,0Ah,3Ch,08h,14h,FBh,AAh,29h,FCh,DCh,08h,69h,A4h,DFh,D4h,79h
	DB	22h,BBh,A3h,A6h,C0h,94h,9Bh,32h,90h,85h,3Ah,14h,F4h,D4h,3Fh,F9h
	DB	B9h,76h,C4h,C4h,ABh,A2h,A2h,53h,91h,11h,0Dh,80h,00h,EAh,88h,88h
	DB	B7h,E9h,57h,B5h,EDh,A9h,4Ah,87h,A4h,C5h,FFh,B3h,00h,0Ah,BEh,B6h
	DB	14h,D7h,05h,28h,FBh,DBh,51h,35h,34h,D2h,2Bh,C0h,00h,50h,66h,66h
	DB	E0h,60h,43h,66h,50h,04h,DDh,97h,81h,B1h,DEh,C0h,FEh,A7h,A0h,BFh
	DB	E8h,E8h,E7h,EFh,CFh,C9h,7Ch,74h,74h,20h,78h,FFh,0Ah,3Bh,FBh,3Bh
	DB	1Dh,FDh,DDh,B7h,85h,14h,DFh,99h,28h,2Fh,03h,50h,FDh,EDh,A4h,37h
	DB	33h,67h,32h,C0h,A5h,DFh,C7h,FDh,C0h,69h,B5h,05h,25h,80h,AEh,A8h
	DB	A8h,4Bh,42h,42h,96h,90h,90h,EEh,4Ch,4Ch,F0h,FCh,70h,C3h,F0h,C0h
	DB	84h,A0h,80h,64h,5Ch,BBh,A2h,A3h,77h,50h,57h,DDh,00h,0Fh,6Eh,40h
	DB	5Fh,82h,00h,1Fh,EDh,8Ch,83h,98h,10h,13h,75h,64h,64h,F5h,35h,F5h
	DB	5Ah,5Dh,F3h,55h,3Dh,65h,F5h,57h,DAh,9Dh,8Bh,0Ah,F5h,83h,95h,F7h
	DB	8Bh,81h,41h,28h,C0h,57h,9Bh,00h,33h,5Ch,40h,3Fh,23h,23h,1Dh,9Ch
	DB	9Ch,84h,D1h,51h,D1h,EFh,04h,F4h,19h,19h,F9h,F5h,15h,A9h,A0h,FBh
	DB	54h,22h,E8h,84h,72h,E5h,CFh,0Bh,F2h,61h,24h,C7h,C1h,33h,F0h,69h
	DB	B7h,24h,04h,90h,B2h,78h,DFh,01h,1Fh,DFh,C1h,5Fh,40h,CAh,60h,1Fh
	DB	BCh,13h,11h,BAh,A9h,A8h,75h,45h,45h,DAh,90h,90h,B3h,22h,22h,FDh
	DB	91h,91h,F2h,E0h,E0h,9Dh,99h,99h,A3h,A0h,AFh,73h,50h,53h,D9h,00h
	DB	03h,6Fh,42h,41h,98h,08h,30h,28h,83h,99h,3Ah,11h,56h,46h,47h,7Dh
	DB	CDh,A1h,FFh,13h,D3h,25h,1Eh,44h,AAh,50h,E1h,1Ah,E9h,15h,1Dh,F2h
	DB	58h,A3h,A0h,E7h,9Bh,BCh,81h,E0h,A0h,A3h,BEh,18h,17h,D2h,40h,46h
	DB	6Bh,9Bh,0Eh,D5h,80h,83h,B1h,30h,33h,48h,08h,0Fh,91h,21h,BEh,EDh
	DB	14h,1Ah,1Ah,5Ah,41h,A1h,42h,F1h,31h,F1h,6Ch,ACh,1Ch,48h,10h,C9h
	DB	DFh,5Ch,44h,BAh,BAh,A2h,A4h,E0h,0Ch,BCh,AFh,A9h,A9h,D7h,D6h,D6h
	DB	37h,D7h,1Ah,6Ah,4Ah,4Ah,D5h,4Ah,09h,D0h,B7h,A7h,A7h,E9h,8Fh,8Fh
	DB	7Ah,7Fh,7Eh,F8h,60h,60h,25h,05h,05h,A8h,37h,37h,90h,49h,D4h,3Ch
	DB	3Fh,3Dh,F1h,FFh,4Ah,E3h,FBh,12h,EAh,3Fh,9Fh,70h,07h,4Bh,60h,41h
	DB	E9h,50h,50h,03h,A8h,0Bh,35h,14h,D3h,23h,94h,7Fh,B1h,98h,22h,23h
	DB	B7h,09h,96h,BBh,FBh,34h,DBh,07h,28h,B1h,81h,70h,2Dh,9Bh,84h,60h
	DB	47h,42h,18h,03h,00h,F7h,C3h,C3h,ECh,4Bh,DDh,CDh,CDh,78h,4Bh,4Bh
	DB	E0h,B1h,79h,FFh,12h,A0h,44h,61h,1Fh,2Fh,44h,F1h,F2h,44h,12h,1Fh
	DB	41h,21h,F1h,F8h,88h,5Eh,DFh,E1h,39h,12h,19h,37h,E3h,39h,13h,9Fh
	DB	DDh,8Ch,CFh,84h,F8h,A1h,45h,03h,44h,58h,FFh,44h,55h,88h,F8h,88h
	DB	88h,08h,D2h,FFh,50h,8Fh,28h,B8h,EFh,F3h,33h,A8h,4Dh,FAh,E9h,5Fh
	DB	DDh,11h,C1h,F3h,F1h,2Fh,8Fh,F9h,C2h,2Dh,57h,F3h,99h,F2h,11h,39h
	DB	9Fh,3Fh,1Fh,99h,99h,DFh,B7h,B4h,57h,9Ah,FFh,1Fh,22h,1Fh,31h,F2h
	DB	1Fh,21h,CFh,CBh,F2h,F2h,2Fh,E7h,5Dh,FFh,F1h,EEh,EBh,DCh,C2h,A3h
	DB	F2h,D6h,B1h,12h,FDh,BFh,12h,C5h,E7h,F5h,43h,2Fh,8Fh,C9h,12h,11h
	DB	D9h,8Bh,91h,11h,F1h

; CBS v5.2 Format 0 compressed Stage 2 tileset (3,720B raw -> 2,328B compressed)
STAGE2_TILES_CBS:
	DB	05h,A1h,52h,FFh,5Fh,4Fh,41h,2Fh,FFh,F2h,44h,22h,FFh,2Fh,54h,41h
	DB	F1h,F2h,54h,4Fh,1Fh,F4h,41h,DCh,E6h,F1h,8Dh,22h,F2h,12h,F1h,2Fh
	DB	1Fh,11h,FFh,FFh,F1h,FFh,FFh,FFh,7Eh,BBh,F7h,B0h,F9h,FDh,FFh,9Fh
	DB	2Fh,FFh,2Fh,EBh,8Fh,FDh,22h,22h,B7h,FEh,E7h,F4h,FBh,B4h,FFh,E5h
	DB	2Fh,3Ah,DFh,2Fh,48h,12h,D0h,11h,E2h,D0h,0Fh,5Fh,F1h,22h,12h,AFh
	DB	FCh,DDh,97h,DEh,F3h,A4h,DAh,FEh,5Fh,F5h,93h,C0h,10h,2Fh,60h,7Eh
	DB	1Fh,14h,59h,22h,F1h,F4h,52h,21h,1Fh,F9h,01h,25h,24h,2Fh,7Ah,14h
	DB	5Fh,F4h,5Fh,55h,11h,F4h,FFh,11h,BFh,F6h,FDh,CDh,B6h,7Dh,FAh,F8h
	DB	A6h,7Dh,59h,59h,51h,12h,25h,BDh,B7h,80h,F2h,E0h,C0h,63h,5Fh,1Fh
	DB	79h,C9h,00h,4Fh,FEh,5Fh,D5h,83h,B2h,F7h,91h,FBh,FDh,F5h,8Dh,ACh
	DB	ABh,11h,F1h,C1h,FBh,14h,22h,24h,41h,D4h,CAh,11h,47h,E8h,EAh,12h
	DB	D1h,41h,28h,21h,7Fh,ADh,A0h,D4h,8Ch,44h,1Fh,F6h,E5h,C8h,F8h,CBh
	DB	C0h,9Fh,12h,24h,44h,78h,4Fh,D4h,FEh,F5h,FBh,E8h,79h,FAh,4Ah,25h
	DB	1Bh,F5h,D2h,FDh,32h,E5h,D6h,06h,24h,07h,54h,33h,33h,54h,44h,44h
	DB	43h,44h,33h,E9h,F7h,FDh,34h,63h,E9h,33h,4Fh,EBh,42h,44h,DFh,47h
	DB	22h,80h,A7h,28h,54h,45h,43h,32h,44h,FFh,FFh,33h,24h,45h,52h,4Fh
	DB	45h,44h,45h,F4h,70h,5Fh,52h,5Ch,7Fh,B9h,C1h,88h,73h,FBh,4Fh,F5h
	DB	45h,C5h,C9h,52h,54h,13h,55h,45h,25h,F5h,54h,52h,ABh,4Ah,42h,7Ch
	DB	ECh,F3h,4Ah,54h,42h,44h,24h,43h,FCh,D1h,FEh,2Eh,F3h,D1h,92h,F0h
	DB	FFh,9Ah,34h,54h,68h,25h,2Fh,B1h,FFh,77h,ABh,0Bh,F9h,F8h,D5h,BAh
	DB	FDh,F5h,EAh,B5h,E8h,0Ah,F2h,33h,ECh,F3h,8Bh,F5h,34h,F4h,53h,F5h
	DB	5Fh,60h,97h,2Bh,FFh,25h,5Fh,FFh,55h,32h,55h,55h,3Ch,CFh,25h,FFh
	DB	F5h,AFh,56h,55h,73h,8Fh,55h,F5h,DBh,F8h,F8h,ACh,4Ah,5Fh,F5h,7Dh
	DB	F4h,1Ah,43h,44h,2Fh,16h,14h,44h,5Fh,BCh,1Ch,71h,80h,75h,DDh,70h
	DB	25h,74h,A3h,4Fh,43h,34h,6Dh,E0h,FAh,8Eh,EFh,F5h,4Bh,5Fh,AAh,63h
	DB	F4h,7Dh,97h,FCh,FFh,FBh,8Bh,67h,FAh,F8h,DDh,FFh,42h,EDh,DBh,11h
	DB	FFh,F8h,FFh,EBh,FBh,46h,FFh,E5h,B0h,E4h,F9h,F2h,58h,F1h,C9h,ECh
	DB	F1h,45h,A0h,7Fh,66h,29h,9Dh,ABh,18h,F2h,F1h,34h,09h,83h,C9h,84h
	DB	45h,15h,85h,AAh,3Dh,1Fh,EBh,B5h,29h,95h,E7h,4Fh,A5h,57h,11h,8Ah
	DB	67h,14h,45h,58h,14h,D9h,E9h,FFh,45h,FBh,F4h,0Ch,F1h,1Fh,AAh,B7h
	DB	11h,C6h,09h,F1h,13h,B1h,6Dh,11h,34h,D0h,E5h,14h,AAh,2Fh,D1h,2Ah
	DB	13h,45h,D6h,EDh,14h,D1h,B7h,43h,F2h,D1h,F3h,C2h,F4h,43h,53h,E7h
	DB	F9h,5Fh,47h,59h,3Fh,7Fh,DCh,F5h,34h,1Fh,A7h,3Eh,35h,1Dh,EDh,0Dh
	DB	2Fh,21h,FFh,44h,89h,2Fh,FFh,41h,A3h,41h,E4h,A5h,81h,F6h,FFh,4Fh
	DB	5Fh,22h,ADh,2Fh,66h,15h,4Bh,22h,F1h,51h,BEh,BDh,FBh,FBh,D4h,58h
	DB	35h,00h,C8h,FEh,0Ah,2Dh,02h,0Fh,12h,07h,00h,01h,02h,21h,26h,69h
	DB	4Fh,3Ch,B5h,63h,AEh,12h,6Fh,11h,00h,05h,C0h,D3h,9Fh,02h,4Dh,3Fh
	DB	33h,F4h,5Fh,2Bh,AFh,9Eh,FEh,FFh,67h,AEh,F7h,DFh,7Dh,BAh,02h,D9h
	DB	B5h,C0h,CDh,F2h,04h,4Bh,22h,95h,22h,DBh,35h,0Ah,25h,E9h,87h,01h
	DB	10h,2Bh,02h,15h,02h,35h,D4h,1Ah,A6h,5Dh,99h,77h,3Bh,3Ch,DFh,3Ah
	DB	BEh,58h,F8h,F4h,FEh,35h,DFh,1Ah,A7h,5Fh,9Fh,E1h,D0h,F0h,FCh,A2h
	DB	5Bh,99h,62h,22h,70h,FCh,5Dh,2Ah,25h,83h,89h,BCh,20h,26h,82h,11h
	DB	02h,8Bh,A6h,30h,F3h,1Dh,07h,01h,14h,C0h,15h,9Dh,00h,57h,5Ah,AFh
	DB	77h,9Dh,C6h,2Eh,F5h,EEh,FCh,FAh,FFh,FEh,FCh,5Eh,BFh,03h,34h,5Eh
	DB	04h,D3h,D0h,93h,BFh,76h,1Dh,C7h,1Eh,ADh,83h,EDh,1Ch,06h,23h,70h
	DB	67h,A8h,96h,EBh,7Fh,0Eh,00h,7Eh,B7h,7Eh,38h,7Ah,FBh,42h,11h,81h
	DB	12h,C8h,A5h,D6h,33h,07h,3Fh,1Ch,18h,0Dh,C2h,73h,F8h,C0h,C0h,40h
	DB	80h,ADh,B9h,07h,A8h,4Bh,FAh,F0h,10h,41h,40h,8Bh,F4h,40h,3Eh,E0h
	DB	60h,80h,CEh,43h,30h,0Ch,37h,F6h,38h,C4h,F0h,19h,07h,C6h,F0h,F8h
	DB	0Dh,9Ch,89h,F9h,63h,43h,33h,67h,AFh,F1h,FFh,ACh,EAh,57h,33h,DBh
	DB	0Ch,63h,A8h,65h,34h,5Eh,2Ch,E5h,AEh,EDh,4Dh,35h,53h,F4h,45h,63h
	DB	D9h,55h,5Fh,57h,B5h,9Eh,F3h,34h,43h,3Fh,E5h,63h,54h,5Fh,53h,FFh
	DB	B7h,ABh,E3h,C5h,3Ah,37h,9Dh,35h,49h,55h,6Bh,CFh,54h,9Dh,43h,33h
	DB	4Ah,85h,35h,A3h,11h,F5h,91h,C1h,5Fh,8Fh,EFh,5Fh,54h,58h,FAh,FEh
	DB	F3h,C7h,DBh,F3h,3Fh,B1h,55h,34h,FBh,D3h,DFh,CAh,ADh,A3h,3Fh,5Ah
	DB	FDh,87h,45h,25h,66h,4Fh,D3h,5Fh,45h,35h,B7h,3Ch,D1h,FFh,C9h,60h
	DB	CBh,3Fh,F5h,F4h,44h,F9h,DFh,EAh,F7h,5Ah,D8h,B1h,65h,43h,54h,D7h
	DB	17h,43h,0Dh,BAh,4Ch,DEh,69h,3Fh,54h,FFh,2Fh,4Fh,C5h,E3h,FFh,A9h
	DB	E3h,9Bh,E5h,BFh,EDh,C3h,D9h,13h,43h,F4h,4Bh,4Fh,C6h,3Fh,F9h,ECh
	DB	6Fh,5Bh,C5h,85h,1Ah,F1h,F3h,F6h,EFh,63h,C3h,07h,FEh,CDh,6Dh,C1h
	DB	A7h,39h,F3h,43h,44h,6Bh,A7h,54h,82h,EFh,F7h,5Ah,7Fh,DFh,F2h,FBh
	DB	91h,BFh,E9h,FFh,EDh,6Dh,DFh,45h,D1h,B2h,55h,F4h,FBh,33h,B9h,E8h
	DB	7Bh,A1h,D8h,FFh,59h,FBh,CDh,D0h,E3h,44h,F3h,D5h,C1h,4Fh,3Ah,2Fh
	DB	82h,C7h,ECh,EDh,5Ch,7Fh,53h,F7h,FDh,D5h,C9h,DDh,1Bh,47h,9Dh,61h
	DB	33h,3Fh,F3h,5Dh,19h,A5h,85h,35h,DCh,2Fh,ABh,DFh,F1h,91h,B1h,BBh
	DB	58h,C2h,BFh,AAh,EFh,E1h,FFh,EBh,8Dh,EFh,73h,FFh,89h,F9h,D9h,7Fh
	DB	8Fh,DFh,25h,F4h,DBh,CAh,E3h,ABh,4Fh,95h,D4h,25h,5Fh,F3h,B7h,2Ah
	DB	FFh,1Dh,33h,72h,CDh,DCh,CDh,97h,A1h,F3h,25h,E6h,93h,1Fh,D7h,C1h
	DB	33h,F7h,F7h,3Bh,43h,5Bh,23h,C7h,F2h,3Fh,DBh,4Bh,EAh,47h,19h,3Dh
	DB	09h,D9h,09h,FFh,8Ch,58h,F5h,F5h,FEh,44h,9Fh,43h,B5h,F1h,9Fh,F4h
	DB	F2h,ECh,7Bh,8Fh,4Fh,99h,3Dh,55h,53h,53h,1Ah,E0h,E3h,45h,A5h,25h
	DB	54h,24h,24h,2Ah,55h,42h,15h,87h,42h,DDh,53h,A3h,C2h,39h,21h,23h
	DB	5Fh,43h,73h,EDh,5Dh,F5h,03h,DDh,A1h,3Dh,5Fh,BBh,63h,D8h,6Dh,B0h
	DB	FBh,8Dh,13h,99h,44h,3Fh,3Fh,DFh,19h,2Ch,F6h,B6h,F8h,66h,FDh,97h
	DB	A5h,F7h,FFh,BBh,DDh,DFh,9Dh,A7h,CBh,C7h,BDh,1Fh,7Fh,83h,66h,DBh
	DB	EBh,46h,2Fh,52h,BFh,EFh,EDh,78h,FCh,D7h,9Ch,DCh,C5h,FDh,9Eh,BBh
	DB	DDh,DFh,D1h,ABh,D9h,2Fh,0Eh,FAh,BDh,FFh,A4h,D5h,F3h,46h,F3h,B9h
	DB	34h,C7h,44h,11h,55h,3Fh,FDh,78h,5Eh,F4h,DDh,39h,33h,37h,23h,ECh
	DB	DBh,FAh,B6h,F6h,44h,D3h,78h,FDh,FBh,F9h,19h,70h,70h,72h,88h,BCh
	DB	F5h,FBh,0Dh,6Dh,21h,14h,FFh,1Fh,22h,C8h,28h,15h,C6h,5Fh,21h,A4h
	DB	07h,47h,FFh,11h,7Ah,64h,85h,99h,44h,23h,35h,52h,24h,34h,A7h,C7h
	DB	94h,91h,35h,12h,55h,12h,AFh,57h,51h,CDh,CFh,F6h,1Dh,4Eh,BEh,70h
	DB	D4h,BDh,F3h,F2h,01h,50h,92h,12h,55h,D2h,93h,35h,1Eh,35h,35h,0Fh
	DB	5Ah,3Eh,7Bh,D9h,E5h,5Ch,6Bh,45h,B9h,0Bh,EEh,6Bh,24h,69h,09h,9Eh
	DB	B5h,9Dh,E7h,9Fh,6Fh,EBh,C6h,FDh,9Fh,F4h,3Bh,B9h,6Bh,DBh,46h,6Dh
	DB	AEh,49h,7Ah,D3h,69h,EEh,95h,3Bh,97h,0Ah,FBh,B9h,4Dh,FDh,9Fh,21h
	DB	BDh,51h,E5h,FBh,BBh,0Dh,34h,2Dh,46h,FFh,E1h,F7h,6Dh,C5h,2Eh,DEh
	DB	D6h,F2h,F3h,96h,EFh,BAh,99h,7Ch,3Dh,BDh,2Dh,BAh,2Ch,8Eh,68h,E3h
	DB	54h,1Fh,3Bh,0Dh,BAh,85h,F9h,FAh,64h,F7h,DEh,F5h,DAh,18h,47h,45h
	DB	12h,5Fh,F9h,49h,42h,2Fh,F1h,71h,F7h,ADh,1Fh,23h,65h,F4h,66h,99h
	DB	8Bh,05h,24h,96h,95h,5Fh,2Fh,F9h,55h,73h,D7h,11h,12h,F5h,A8h,5Ch
	DB	74h,C9h,68h,21h,42h,6Bh,17h,19h,B1h,EDh,15h,11h,F8h,49h,D9h,B1h
	DB	31h,F1h,12h,06h,98h,8Fh,3Fh,F7h,97h,E7h,ACh,21h,56h,54h,51h,13h
	DB	B1h,42h,E1h,14h,42h,C4h,C1h,1Fh,42h,47h,41h,41h,D3h,53h,4Fh,D7h
	DB	6Ah,75h,11h,DFh,1Ah,C1h,41h,46h,F8h,8Dh,F8h,1Ah,F1h,F1h,34h,81h
	DB	6Ah,81h,54h,A6h,12h,8Fh,F5h,F8h,12h,31h,A1h,37h,84h,6Dh,44h,81h
	DB	21h,47h,11h,21h,41h,07h,2Fh,4Fh,12h,21h,ADh,AFh,E3h,CDh,ADh,D5h
	DB	1Dh,F1h,53h,0Ch,A3h,51h,5Ah,58h,E0h,8Fh,81h,BDh,AAh,4Ch,34h,71h
	DB	F1h,82h,EFh,4Fh,18h,D0h,B7h,44h,FCh,79h,91h,E6h,33h,EFh,12h,95h
	DB	54h,84h,21h,99h,44h,F2h,FFh,6Eh,CBh,E7h,37h,81h,23h,1Eh,F1h,34h
	DB	3Fh,BAh,B9h,54h,53h,11h,62h,77h,34h,F1h,3Ch,F9h,CDh,F1h,4Fh,4Ch
	DB	67h,71h,5Fh,F2h,93h,25h,30h,DDh,1Fh,7Eh,FBh,F7h,FDh,78h,F2h,95h
	DB	F5h,07h,A0h,F9h,5Fh,52h,42h,FFh,55h,F8h,9Fh,4Ah,41h,96h,DCh,6Ch
	DB	C5h,03h,EFh,2Fh,5Fh,24h,25h,F9h,B3h,A1h,F4h,11h,51h,8Fh,2Dh,D9h
	DB	D5h,34h,1Fh,70h,3Dh,7Ah,2Eh,25h,85h,8Ah,E3h,EBh,57h,58h,15h,71h
	DB	DBh,F5h,24h,2Eh,50h,E3h,BBh,E1h,F4h,F1h,88h,C1h,14h,14h,CEh,65h
	DB	CFh,32h,18h,45h,E4h,E2h,F9h,F5h,8Fh,90h,1Fh,E9h,FBh,5Fh,0Dh,FFh
	DB	56h,A5h,DAh,CAh,99h,66h,18h,F5h,59h,69h,18h,61h,9Fh,BCh,37h,E3h
	DB	75h,F1h,8Fh,0Dh,F2h,92h,F9h,44h,1Fh,18h,FFh,45h,F2h,63h,21h,F8h
	DB	74h,D9h,5Ah,13h,F4h,1Eh,CFh,05h,96h,E0h,75h,51h,F0h,14h,F2h,E7h
	DB	F0h,FBh,FFh,A3h,E9h,E7h,E8h,7Fh,ADh,EBh,F9h,1Fh,21h,28h,EBh,B1h
	DB	B5h,02h,25h,F4h,22h,F8h,F3h,89h,F3h,88h,55h,12h,8Dh,54h,2Fh,C5h
	DB	75h,AAh,E6h,84h,FCh,4Dh,01h,11h,69h,44h,28h,B3h,13h,43h,18h,51h
	DB	18h,F4h,F9h,E1h,22h,0Dh,5Fh,84h,A9h,6Dh,11h,84h,35h,BEh,04h,E5h
	DB	1Bh,F5h,4Eh,48h,E5h,71h,ABh,85h,EDh,CEh,35h,5Fh,59h,24h,D7h,6Bh
	DB	9Fh,5Bh,82h,89h,2Fh,14h,8Fh,F9h,BBh,F3h,77h,F4h,49h,57h,51h,3Eh
	DB	63h,FDh,A9h,55h,4Eh,3Ah,67h,F5h,90h,5Fh,25h,C9h,C7h,74h,47h,ECh
	DB	57h,C8h,2Fh,20h,D5h,FFh,E9h,E7h,F3h,D7h,5Fh,0Fh,AFh,75h,F9h,31h
	DB	E7h,CFh,D5h,B9h,DFh,FBh,05h,9Bh,D2h,28h,81h,FFh,62h,D8h,C0h,96h
	DB	F4h,3Bh,E3h,1Dh,D2h,69h,52h,DDh,6Eh,8Ch,D6h,C1h,F5h,ABh,3Ah,25h
	DB	2Fh,F9h,24h,EBh,5Bh,2Fh,52h,25h,25h,A5h,11h,81h,1Dh,F4h,A4h,69h
	DB	14h,31h,F4h,9Fh,6Fh,0Ah,FFh,5Bh,BCh,EFh,67h,96h,73h,D5h,07h,BBh
	DB	80h,98h,FCh,DFh,73h,F9h,2Eh,20h,ECh,EDh,FEh,CFh,79h,52h,16h,90h
	DB	ACh,69h,E3h,3Dh,45h,9Fh,45h,F9h,F9h,DAh,DBh,BCh,AAh,68h,62h,7Fh
	DB	7Bh,27h,F1h,2Dh,89h,D0h,D2h,35h,0Dh,95h,FFh,53h,5Fh,69h,6Bh,15h
	DB	96h,51h,A1h,5Fh,DAh,BCh,CAh,00h,D0h,55h,88h,1Fh,95h,F9h,3Bh,00h
	DB	1Ah,9Fh,14h,55h,62h,55h,2Fh,05h,A1h,4Fh,46h,44h,28h,4Fh,59h,C8h
	DB	F4h,55h,99h,38h,4Fh,F9h,3Fh,99h,99h,25h,A9h,0Ah,0Fh,69h,51h,21h
	DB	A9h,C9h,53h,51h,83h,7Eh,78h,89h,36h,D2h,78h,5Fh,65h,E8h,9Fh,BAh
	DB	7Ah,D2h,21h,85h,EFh,28h,21h,D5h,30h,15h,31h,83h,DCh,69h,EFh,56h
	DB	9Ah,98h,F2h,21h,1Fh,D6h,B9h,BFh,F1h,41h,D7h,93h,49h,F4h,57h,33h
	DB	83h,03h,80h,F0h,EFh,2Ah,5Ah,43h,87h,E5h,99h,81h,40h,51h,F2h,03h
	DB	56h,80h,06h,8Ch,1Fh,4Dh,11h,22h,03h,12h,02h,12h,D1h,C1h,D3h,FFh
	DB	EDh,AFh,B1h,73h,6Ah,C0h,45h,25h,08h,F3h,9Dh,F3h,33h,1Ch,73h,6Ch
	DB	06h,28h,C1h,25h,D0h,55h,08h,A3h,33h,F1h,F3h,54h,21h,5Fh,2Dh,E5h
	DB	7Ah,05h,BAh,BFh,45h,93h,E9h,FAh,69h,BCh,FBh,DDh,BCh,F5h,D5h,5Fh
	DB	88h,FBh,4Fh,F4h,D3h,DFh,5Dh,25h,68h,01h,14h,C4h,14h,45h,94h,24h
	DB	91h,F5h,A1h,F4h,E3h,51h,68h,14h,54h,AEh,FDh,D7h,8Dh,32h,F7h,44h
	DB	88h,91h,F5h,5Fh,DFh,F1h,A9h,5Eh,04h,84h,24h,47h,22h,53h,C0h,57h
	DB	43h,CDh,1Ch,5Bh,1Ch,DDh,6Dh,62h,2Dh,32h,72h,0Bh,3Dh,AAh,1Fh,F8h
	DB	E9h,5Dh,34h,EDh,14h,37h,5Fh,52h,4Ch,83h,88h,8Ch,CFh,4Fh,A2h,F8h
	DB	44h,F8h,68h,4Fh,6Ah,44h,C1h,FCh,CFh,D1h,CFh,A3h,FFh,58h,F2h,C1h
	DB	F0h,88h,FFh,F9h,88h,81h,F8h,88h,A3h,F8h,46h,F8h,8Dh,F8h,1Ah,FFh
	DB	FFh,18h,9Fh,0Ch,F8h,3Bh,7Fh,BFh,8Fh,37h,F9h,A4h,0Ah,63h,FEh,14h
	DB	45h,33h,3Bh,A8h,C2h,F5h,F9h,F1h,65h,FAh,9Dh,F9h,6Eh,6Bh,53h,17h
	DB	2Ch,C1h,9Fh,2Bh,EFh,83h,D8h,73h

; English 6+20 icon bank & stone/inventory UI graphics descriptor targeting VRAM C800h
SHARED_EN_ICONS_AND_STONE_UI_GFX_DESCRIPTOR:
	DB	FFh,0Ch	; Unpack 2 color nibbles to TILE_COLOR_NIBBLE_LUT
	DB	0Dh,00h,00h	; 13 tiles -> dst 00h, attr 00h
	DW	SHARED_ENGLISH_ICONS_1BPP + 0000h	; Bank 05 1bpp source
	DB	44h
	DB	FFh,0Dh	; Unpack 2 color nibbles to TILE_COLOR_NIBBLE_LUT
	DB	11h,0Ch,00h	; 17 tiles -> dst 0Ch, attr 00h
	DW	SHARED_ENGLISH_ICONS_1BPP + 0060h	; Bank 05 1bpp source
	DB	44h
	DB	FFh,0Ch	; Unpack 2 color nibbles to TILE_COLOR_NIBBLE_LUT
	DB	11h,1Ch,00h	; 17 tiles -> dst 1Ch, attr 00h
	DW	SHARED_ENGLISH_ICONS_1BPP + 00E0h	; Bank 05 1bpp source
	DB	44h
	DB	FFh,0Dh	; Unpack 2 color nibbles to TILE_COLOR_NIBBLE_LUT
	DB	11h,2Ch,00h	; 17 tiles -> dst 2Ch, attr 00h
	DW	SHARED_ENGLISH_ICONS_1BPP + 0160h	; Bank 05 1bpp source
	DB	44h
	DB	FFh,0Ch	; Unpack 2 color nibbles to TILE_COLOR_NIBBLE_LUT
	DB	05h,3Ch,00h	; 5 tiles -> dst 3Ch, attr 00h
	DW	SHARED_ENGLISH_ICONS_1BPP + 01E0h	; Bank 05 1bpp source
	DB	44h
	DB	FFh,0Dh	; Unpack 2 color nibbles to TILE_COLOR_NIBBLE_LUT
	DB	19h,40h,00h	; 25 tiles -> dst 40h, attr 00h
	DW	SHARED_ENGLISH_ICONS_1BPP + 0200h	; Bank 05 1bpp source
	DB	44h
	DB	FFh,0Ch	; Unpack 2 color nibbles to TILE_COLOR_NIBBLE_LUT
	DB	09h,58h,00h	; 9 tiles -> dst 58h, attr 00h
	DW	SHARED_ENGLISH_ICONS_1BPP + 02C0h	; Bank 05 1bpp source
	DB	44h
	DB	FFh,0Dh	; Unpack 2 color nibbles to TILE_COLOR_NIBBLE_LUT
	DB	19h,60h,00h	; 25 tiles -> dst 60h, attr 00h
	DW	SHARED_ENGLISH_ICONS_1BPP + 0300h	; Bank 05 1bpp source
	DB	44h
	DB	FFh,0Ch	; Unpack 2 color nibbles to TILE_COLOR_NIBBLE_LUT
	DB	08h,78h,00h	; 8 tiles -> dst 78h, attr 00h
	DW	SHARED_ENGLISH_ICONS_1BPP + 03C0h	; Bank 05 1bpp source
	DB	44h
	DB	20h,80h,00h	; 32 tiles -> dst 80h, attr 00h
	DW	9A30h	; Bank 07 raw-4bpp source
	DB	07h
	DB	20h,A0h,00h	; 32 tiles -> dst A0h, attr 00h
	DW	9DB0h	; Bank 07 raw-4bpp source
	DB	07h
	DB	00h	; End of descriptor

; English F5 Compass screen graphics descriptor
COMPASS_SCREEN_EN_GFX_DESCRIPTOR:
	DB	FEh,07h,BFh	; Unpack 4 color nibbles to TILE_COLOR_NIBBLE_LUT
	DB	0Eh,01h,00h	; 14 tiles -> dst 01h, attr 00h
	DW	AD48h	; Bank 07 2bpp source
	DB	87h
	DB	07h,0Fh,00h	; 7 tiles -> dst 0Fh, attr 00h
	DW	ADB8h	; Bank 07 2bpp mirrored source
	DB	A7h
	DB	FEh,07h,EFh	; Unpack 4 color nibbles to TILE_COLOR_NIBBLE_LUT
	DB	1Fh,16h,00h	; 31 tiles -> dst 16h, attr 00h
	DW	AE28h	; Bank 07 2bpp source
	DB	87h
	DB	0Ah,35h,00h	; 10 tiles -> dst 35h, attr 00h
	DW	AF78h	; Bank 07 2bpp mirrored source
	DB	A7h
	DB	FFh,7Fh	; Unpack 2 color nibbles to TILE_COLOR_NIBBLE_LUT
	DB	0Ch,40h,00h	; 12 tiles -> dst 40h, attr 00h
	DW	SHARED_ENGLISH_ICONS_1BPP + 0080h	; Bank 05 1bpp source
	DB	44h
	DB	0Dh,50h,00h	; 13 tiles -> dst 50h, attr 00h
	DW	SHARED_ENGLISH_ICONS_1BPP + 0180h	; Bank 05 1bpp source
	DB	44h
	DB	00h	; End of descriptor

; English Title/Ending FIREBIRD 2bpp logo graphics descriptor
FIREBIRD_LOGO_CREDITS_GFX_DESCRIPTOR:
	DB	FEh,07h,CFh	; Unpack 4 color nibbles to TILE_COLOR_NIBBLE_LUT
	DB	40h,01h,00h	; 64 tiles -> dst 01h, attr 00h
	DW	FIREBIRD_LOGO_2BPP_TILES	; Bank 13 2bpp source
	DB	8Dh
	DB	10h,41h,00h	; 16 tiles -> dst 41h..50h, including FIN lettering
	DW	FIREBIRD_LOGO_2BPP_TILES + 0400h	; Bank 13 2bpp source
	DB	8Dh
	DB	00h	; End of descriptor

	DS	8000h - $,FFh
	DS	8000h - $,FFh
	ELSE

; Stage 1 (6020h) 29-tile 3bpp block (29 x 24B = 696B -> dst=01h..1Dh, attr=00h; first 20
; tiles 6478h-6657h also loaded horizontally mirrored -> dst=1Eh..31h).
STAGE1_TILES_3BPP_6478:
	DB	FFh,00h,00h,FFh,00h,00h,FFh,00h,00h,FFh,01h,01h
	DB	FFh,00h,00h,F6h,00h,00h,F9h,00h,00h,FEh,02h,02h
	DB	FFh,00h,00h,FFh,00h,00h,FFh,00h,00h,FFh,00h,00h
	DB	FFh,00h,00h,FFh,00h,00h,F9h,00h,00h,FEh,02h,02h
	DB	FFh,00h,00h,FFh,00h,00h,DFh,60h,40h,FFh,30h,20h
	DB	FFh,10h,10h,FFh,00h,00h,FFh,00h,00h,FFh,00h,00h
	DB	FFh,00h,00h,BFh,C0h,80h,FFh,60h,40h,EFh,31h,21h
	DB	FFh,02h,02h,FFh,20h,00h,BFh,60h,20h,FFh,40h,40h
	DB	FFh,04h,04h,FFh,02h,02h,FFh,48h,00h,FFh,CCh,88h
	DB	BDh,C6h,84h,FFh,82h,82h,FFh,20h,20h,FFh,40h,40h
	DB	FFh,1Fh,18h,FFh,0Fh,09h,FFh,07h,05h,BFh,C3h,83h
	DB	FFh,60h,40h,FDh,33h,20h,FFh,03h,03h,FFh,00h,00h
	DB	FFh,FFh,A2h,FFh,FFh,65h,FFh,FEh,FAh,FFh,8Eh,8Eh
	DB	DFh,60h,40h,FFh,30h,20h,FFh,18h,10h,FFh,00h,00h
	DB	FFh,DFh,D8h,FFh,0Fh,09h,FFh,0Fh,09h,BFh,C7h,87h
	DB	FFh,60h,40h,FDh,33h,20h,FFh,03h,03h,FFh,00h,00h
	DB	FFh,F8h,B8h,FFh,E0h,60h,FFh,D8h,D0h,FFh,8Ch,88h
	DB	FDh,06h,04h,AFh,70h,00h,FFh,70h,70h,FFh,00h,00h
	DB	FDh,05h,06h,FFh,0Fh,09h,FFh,0Fh,09h,FFh,07h,04h
	DB	DFh,33h,13h,FFh,60h,20h,FFh,CDh,45h,FFh,18h,08h
	DB	FBh,0Bh,0Ch,BBh,CBh,0Dh,FBh,DBh,DDh,FDh,1Dh,1Eh
	DB	EFh,2Fh,3Fh,EFh,2Fh,35h,DFh,5Fh,65h,DFh,5Fh,6Bh
	DB	BFh,BFh,CBh,BFh,BFh,D7h,FFh,FFh,97h,FFh,7Eh,6Eh
	DB	FFh,38h,38h,FFh,00h,00h,AFh,71h,01h,FEh,72h,73h
	DB	FFh,01h,01h,FBh,1Ch,00h,FFh,1Dh,1Dh,FFh,01h,01h
	DB	FEh,42h,03h,FEh,62h,43h,EDh,35h,26h,FDh,15h,16h
	DB	FFh,00h,00h,FFh,00h,00h,FFh,00h,00h,FFh,01h,00h
	DB	FEh,03h,00h,FDh,03h,01h,FDh,02h,00h,FFh,00h,00h
	DB	FFh,00h,00h,FFh,00h,00h,FDh,01h,02h,F6h,06h,09h
	DB	F5h,1Fh,01h,EFh,18h,00h,CFh,30h,00h,DFh,20h,00h
	DB	FFh,00h,00h,FFh,01h,00h,FEh,03h,00h,FDh,02h,00h
	DB	FFh,00h,00h,FFh,00h,00h,FFh,00h,00h,FFh,00h,00h
	DB	FCh,00h,03h,FBh,0Bh,04h,FDh,0Fh,01h,FBh,1Ch,00h
	DB	E7h,18h,00h,EFh,13h,03h,EFh,14h,04h,FFh,00h,00h
	DB	00h,FFh,00h,60h,7Fh,60h,F5h,35h,36h,F6h,06h,09h
	DB	F5h,1Fh,01h,EFh,18h,00h,CFh,30h,00h,DFh,20h,00h
	DB	E0h,FFh,E0h,CCh,0Fh,0Ch,F1h,01h,01h,FEh,00h,00h
	DB	FFh,00h,00h,FFh,00h,00h,FFh,00h,00h,FFh,00h,00h
	DB	00h,FFh,00h,06h,FEh,06h,2Fh,ECh,2Ch,FFh,C0h,C0h
	DB	FFh,00h,00h,FFh,00h,00h,FFh,00h,00h,FFh,00h,00h
	DB	FFh,00h,00h,FFh,00h,00h,FFh,00h,00h,FFh,00h,00h
	DB	FFh,00h,00h,FFh,00h,00h,FFh,00h,00h,FFh,00h,00h
	DB	FFh,00h,00h,FFh,40h,40h,FFh,00h,00h,FFh,02h,02h
	DB	FFh,00h,00h,FFh,00h,00h,EFh,00h,00h,FFh,00h,00h
	DB	FEh,00h,00h,FFh,00h,00h,BFh,00h,00h,FFh,00h,00h
	DB	FFh,00h,00h,FDh,00h,00h,FFh,00h,00h,FFh,00h,00h
	DB	FFh,00h,00h,FFh,00h,00h,FFh,00h,00h,E7h,08h,08h
	DB	F7h,10h,10h,FFh,00h,00h,FFh,00h,00h,FFh,00h,00h
	DB	FFh,00h,00h,9Fh,20h,20h,DFh,40h,40h,FFh,00h,00h
	DB	F9h,02h,02h,FDh,04h,04h,BFh,00h,00h,FFh,00h,00h
	DB	FFh,00h,00h,FBh,00h,00h,7Fh,00h,00h,FFh,00h,00h
	DB	FFh,00h,00h,9Dh,20h,20h,9Fh,00h,00h,FFh,00h,00h
	DB	FFh,00h,00h,E3h,1Ch,1Ch,05h,7Ah,7Ah,3Dh,04h,04h
	DB	11h,10h,10h,B3h,30h,30h,F7h,30h,30h,FFh,00h,00h
	DB	D9h,F9h,4Fh,EBh,BFh,A0h,EDh,1Fh,04h,F7h,09h,00h
	DB	F6h,09h,00h,FFh,00h,00h,FFh,00h,00h,FFh,00h,00h
	DB	39h,39h,FFh,F8h,FBh,9Ch,BFh,FDh,91h,D3h,2Ch,00h
	DB	D3h,2Ch,00h,FBh,04h,00h,FFh,00h,00h,FFh,00h,00h

; Stage 1 (6020h) 46-tile 3bpp solid terrain block (46 x 24B = 1104B -> dst=32h..5Fh,
; attr=05h; first 35 tiles 6730h-6A77h also loaded mirrored -> dst=60h..82h).
STAGE1_TILES_3BPP_6730:
	DB	FFh,00h,00h,AFh,20h,50h,F7h,F8h,00h,B6h,FAh,11h
	DB	7Ch,C7h,00h,FBh,C6h,42h,FFh,C4h,44h,FFh,B0h,80h
	DB	BEh,E6h,01h,77h,CFh,06h,57h,D7h,6Fh,E3h,EBh,B7h
	DB	ADh,FDh,23h,75h,FDh,73h,AFh,AFh,DCh,77h,F7h,4Eh
	DB	FAh,FFh,78h,ECh,EFh,50h,FBh,FFh,89h,BDh,BFh,DDh
	DB	3Eh,FEh,3Fh,7Ah,FAh,47h,DDh,FDh,96h,BDh,FDh,BEh
	DB	FBh,3Bh,0Ch,ABh,7Bh,0Dh,FBh,1Bh,1Dh,FDh,FDh,3Eh
	DB	2Fh,AFh,7Fh,EFh,EFh,F5h,DFh,5Fh,65h,DFh,DFh,EBh
	DB	EFh,F3h,80h,ACh,97h,C0h,7Fh,77h,B3h,67h,67h,DFh
	DB	C2h,FAh,87h,BEh,FEh,3Fh,FDh,FDh,FEh,9Dh,9Dh,FEh
	DB	FBh,FBh,4Ch,FBh,FBh,EDh,DBh,DBh,BDh,BDh,BDh,7Eh
	DB	AFh,EFh,3Fh,6Fh,EFh,75h,5Fh,DFh,65h,DFh,DFh,EBh
	DB	BEh,BFh,CAh,BEh,BFh,D6h,BFh,BFh,DBh,DFh,DFh,E7h
	DB	FDh,FFh,FCh,FFh,FFh,5Ah,FBh,FFh,5Bh,FFh,FFh,BFh
	DB	FBh,FFh,B9h,FDh,FFh,64h,EBh,FFh,A2h,F9h,FFh,78h
	DB	FDh,FFh,FCh,CEh,FFh,C6h,83h,FBh,87h,B3h,FFh,B1h
	DB	BFh,BFh,CBh,BFh,BFh,D6h,BFh,BFh,DBh,DFh,DFh,E7h
	DB	FFh,FFh,FFh,F9h,FDh,5Bh,FFh,FFh,5Dh,FFh,FFh,BEh
	DB	FAh,FFh,78h,ECh,EFh,50h,FBh,FFh,89h,BFh,BFh,DFh
	DB	2Eh,FEh,27h,76h,FEh,77h,FDh,FDh,FEh,FDh,FDh,FEh
	DB	FBh,FBh,FCh,EBh,EBh,9Dh,BBh,FBh,1Dh,7Dh,FDh,7Eh
	DB	EFh,EFh,FFh,EFh,EFh,F5h,DFh,DFh,E5h,DFh,DFh,EBh
	DB	BEh,BEh,D9h,7Bh,7Fh,B2h,7Fh,FFh,7Fh,67h,E7h,5Fh
	DB	C2h,FAh,87h,9Eh,FEh,1Fh,FDh,FDh,FEh,9Dh,9Dh,FEh
	DB	BEh,BFh,CAh,BEh,BFh,D6h,BFh,BFh,DBh,DFh,DFh,E7h
	DB	FFh,FFh,FFh,FFh,FFh,5Eh,FFh,FFh,5Fh,FFh,FFh,BFh
	DB	FDh,FDh,BEh,FBh,FBh,7Dh,F7h,F7h,FBh,F7h,F7h,7Ah
	DB	DBh,DBh,FDh,BFh,BFh,DFh,7Fh,7Fh,B7h,FFh,FFh,6Fh
	DB	BFh,BFh,CAh,BFh,BFh,D7h,BFh,BFh,DFh,DFh,DFh,E6h
	DB	FFh,FFh,FDh,FFh,FFh,5Bh,FFh,FFh,57h,FFh,FFh,BFh
	DB	FFh,FFh,DFh,7Fh,7Fh,BEh,FFh,FFh,FEh,FFh,FFh,FDh
	DB	FEh,FEh,FBh,FEh,FEh,F7h,FDh,FDh,F6h,FDh,FDh,CEh
	DB	FFh,FFh,AFh,FFh,FFh,67h,FFh,FFh,B7h,EFh,FFh,6Ah
	DB	FFh,FFh,FEh,FBh,FFh,E1h,64h,FFh,44h,EFh,FFh,8Fh
	DB	DFh,FFh,98h,BBh,FFh,32h,7Fh,FFh,7Fh,6Fh,EFh,57h
	DB	C6h,FEh,83h,9Eh,FEh,1Fh,FDh,FDh,FEh,BDh,BDh,DEh
	DB	BFh,BFh,CAh,BFh,BFh,D7h,BFh,BFh,D7h,DFh,DFh,E6h
	DB	FFh,FFh,FCh,FFh,FFh,5Fh,FFh,FFh,5Fh,FEh,FEh,BFh
	DB	FBh,FBh,4Ch,FBh,FBh,EDh,BBh,FBh,9Dh,3Dh,FDh,3Eh
	DB	2Fh,EFh,3Fh,EFh,EFh,F5h,DFh,DFh,E5h,DFh,DFh,EBh
	DB	FFh,FFh,BFh,FFh,FFh,73h,FFh,FFh,BDh,FFh,FFh,63h
	DB	FFh,FFh,FAh,FFh,FFh,F6h,FFh,FFh,A8h,FBh,FBh,FDh
	DB	DBh,DBh,ECh,DBh,DBh,EDh,FBh,FBh,ADh,FDh,FDh,7Eh
	DB	EFh,EFh,7Fh,EFh,EFh,F5h,DFh,DFh,E5h,DFh,DFh,EBh
	DB	FFh,E0h,A0h,FFh,E0h,60h,EFh,F0h,A0h,EEh,F2h,61h
	DB	ECh,D7h,C0h,FBh,C6h,C2h,FFh,C4h,44h,FFh,B0h,80h
	DB	FBh,FBh,BDh,FDh,FDh,56h,FFh,FFh,AFh,FFh,FFh,CDh
	DB	FEh,FEh,DBh,FEh,FEh,3Bh,7Dh,7Dh,B6h,7Dh,7Dh,AEh
	DB	BFh,BFh,CBh,BFh,BFh,D7h,BFh,BFh,DBh,DFh,DFh,E7h
	DB	FFh,FFh,FFh,FFh,FFh,53h,FBh,FFh,59h,FFh,FFh,BDh
	DB	FFh,FFh,B2h,FFh,FFh,7Dh,FFh,FFh,B9h,FFh,FFh,7Bh
	DB	FFh,FFh,E7h,EFh,EFh,F6h,EFh,EFh,F5h,F7h,F7h,D9h
	DB	BBh,BBh,CCh,FBh,FBh,FDh,FBh,FBh,BDh,FDh,FDh,BEh
	DB	EFh,EFh,7Fh,EFh,EFh,F5h,DFh,DFh,E5h,DFh,DFh,EAh
	DB	BFh,BFh,CBh,BFh,BFh,D7h,BFh,BFh,DBh,DFh,DFh,E4h
	DB	FDh,FDh,FEh,FDh,FDh,5Eh,FEh,FEh,5Fh,FFh,FFh,B3h
	DB	FFh,FFh,BFh,FFh,FFh,37h,FFh,FFh,77h,FFh,FFh,EFh
	DB	FEh,FEh,DFh,FEh,FEh,BFh,FDh,FDh,3Eh,FDh,FDh,FEh
	DB	FFh,FFh,A2h,FFh,FFh,65h,FFh,FFh,7Bh,FFh,CFh,4Fh
	DB	FFh,93h,93h,FFh,2Dh,2Dh,FFh,FFh,FFh,FEh,FEh,FFh
	DB	FBh,FBh,DCh,FBh,FBh,2Dh,FBh,FBh,CDh,FDh,FDh,3Eh
	DB	EFh,EFh,FFh,EFh,EFh,B5h,5Fh,5Fh,E5h,DFh,DFh,EBh
	DB	FDh,FDh,FEh,FFh,FFh,FDh,F7h,F7h,FEh,EFh,6Fh,77h
	DB	DEh,DEh,EFh,BEh,BEh,DFh,BDh,BDh,D6h,DDh,DDh,EEh
	DB	FBh,FBh,FCh,FBh,EBh,ADh,FBh,FBh,7Dh,FDh,FDh,FEh
	DB	EFh,EFh,FFh,EFh,6Fh,75h,DFh,5Fh,65h,DFh,DFh,EBh
	DB	BFh,BFh,CBh,BFh,BEh,D6h,BFh,BEh,DAh,DFh,DCh,E4h
	DB	FFh,F8h,F8h,FFh,F0h,50h,FFh,F0h,50h,FFh,E0h,A0h
	DB	FFh,3Fh,3Fh,FFh,0Bh,0Bh,FFh,05h,05h,FFh,03h,03h
	DB	FEh,06h,07h,FEh,06h,07h,FDh,0Dh,0Eh,FDh,3Dh,3Eh
	DB	FFh,FFh,F3h,B9h,BFh,F9h,DDh,DFh,2Dh,AFh,FFh,0Eh
	DB	7Fh,FFh,26h,67h,E7h,59h,CCh,FFh,84h,DEh,FFh,8Eh
	DB	FDh,FFh,FCh,B7h,B7h,CCh,BAh,FBh,26h,79h,FFh,71h
	DB	FDh,FFh,F8h,F6h,F7h,CEh,CBh,FBh,87h,B5h,FDh,B3h
	DB	BEh,FEh,19h,77h,FFh,36h,57h,D7h,6Fh,E3h,EBh,B7h
	DB	ADh,FDh,23h,75h,FDh,73h,AFh,AFh,DCh,77h,F7h,4Eh
	DB	FAh,FFh,78h,ECh,EFh,50h,FBh,FFh,89h,BCh,BFh,DCh
	DB	3Ch,FFh,3Ch,7Ah,FBh,46h,DFh,FFh,91h,BBh,FFh,B9h
	DB	FEh,FFh,FEh,FCh,FCh,7Bh,79h,FFh,30h,B7h,FFh,B7h
	DB	FCh,FCh,EBh,DBh,DFh,E3h,CCh,CFh,FCh,FFh,FFh,9Fh
	DB	BEh,FEh,39h,DBh,DFh,32h,3Fh,7Fh,8Fh,5Fh,FFh,0Eh
	DB	AFh,FFh,8Dh,6Eh,7Fh,CAh,6Bh,FFh,2Ah,13h,FFh,12h
	DB	FFh,FFh,BCh,CAh,FBh,CCh,1Dh,FFh,10h,F6h,F6h,79h
	DB	F9h,F9h,E7h,FFh,FFh,E3h,EFh,FFh,E7h,EFh,FFh,EFh
	DB	57h,FFh,57h,3Dh,BFh,5Dh,09h,7Fh,89h,87h,FFh,87h
	DB	9Fh,FFh,9Fh,E7h,E7h,F9h,ECh,FFh,C4h,DFh,FFh,8Fh
	DB	FAh,3Fh,38h,ECh,2Fh,10h,FBh,7Fh,09h,BCh,3Fh,5Ch
	DB	3Ch,FFh,3Ch,7Ah,FBh,46h,DFh,FFh,91h,BBh,FFh,B9h
	DB	E0h,FFh,E0h,ACh,2Fh,5Ch,F1h,F9h,01h,B6h,FAh,11h
	DB	7Ch,C7h,00h,FBh,C6h,42h,FFh,C4h,44h,FFh,B0h,80h
	DB	10h,D7h,28h,3Ah,FAh,26h,77h,FEh,60h,7Bh,4Fh,81h
	DB	6Dh,F7h,00h,FBh,F7h,C2h,B6h,7Fh,26h,DCh,3Fh,14h

; Stage 1 (6020h) 11-tile 3bpp background/decor block (11 x 24B = 264B -> dst=83h..8Dh
; normal and dst=A5h..AFh mirrored, attr=00h).
STAGE1_TILES_3BPP_6B80:
	DB	BFh,E0h,00h,7Fh,E0h,20h,7Fh,E0h,20h,67h,E0h,58h
	DB	FFh,FCh,B0h,B9h,E6h,20h,FDh,C2h,C0h,FEh,81h,80h
	DB	D7h,10h,28h,BBh,78h,24h,F7h,5Eh,40h,7Bh,4Fh,81h
	DB	6Dh,F7h,00h,FBh,F7h,C2h,B6h,7Fh,26h,DCh,3Fh,14h
	DB	FCh,DFh,1Ch,AEh,EFh,B2h,FBh,FFh,C9h,DFh,5Fh,35h
	DB	3Fh,DFh,1Ah,7Fh,8Fh,0Eh,FFh,07h,07h,FFh,03h,03h
	DB	D7h,17h,2Fh,BBh,7Bh,27h,F7h,5Fh,41h,7Bh,4Fh,81h
	DB	6Dh,FFh,08h,FBh,FFh,CAh,B6h,7Fh,26h,DCh,3Fh,14h
	DB	FCh,DFh,1Ch,AEh,EFh,B2h,FBh,FFh,C9h,DFh,5Fh,35h
	DB	3Fh,DFh,1Ah,6Fh,BFh,26h,F7h,3Fh,33h,FBh,0Fh,09h
	DB	FCh,DFh,1Ch,AEh,EFh,B2h,FBh,FFh,C9h,DFh,5Fh,37h
	DB	3Eh,DEh,1Bh,6Eh,FEh,67h,F5h,3Dh,36h,FDh,0Dh,0Eh
	DB	9Ch,9Ch,FFh,1Fh,DFh,3Bh,FFh,BFh,8Ch,D9h,39h,16h
	DB	FDh,3Fh,21h,E7h,18h,00h,CFh,30h,00h,DFh,20h,00h
	DB	D7h,D7h,EFh,BBh,FBh,A7h,F7h,FFh,E1h,7Bh,7Fh,B1h
	DB	6Dh,FFh,08h,FBh,FFh,CAh,B6h,FFh,A6h,DCh,FFh,D4h
	DB	FCh,FFh,3Ch,AEh,EFh,B2h,FBh,FFh,C9h,DFh,DFh,B5h
	DB	3Fh,FFh,3Ah,6Fh,FFh,66h,F7h,FFh,F3h,FBh,FFh,F9h
	DB	DFh,FFh,5Fh,EFh,FFh,EFh,EDh,FDh,EEh,F6h,F6h,F9h
	DB	35h,FFh,21h,1Fh,FFh,07h,3Fh,FFh,0Fh,2Bh,FFh,0Bh
	DB	17h,D7h,2Fh,3Bh,FBh,27h,D7h,DFh,C1h,7Bh,4Fh,81h
	DB	6Dh,FFh,08h,FBh,FFh,CAh,B6h,7Fh,26h,DCh,3Fh,14h

; Stage 1 (6020h) 7-tile 3bpp background/decor block (7 x 24B = 168B -> dst=8Eh..94h normal
; and dst=B0h..B6h mirrored, attr=00h).
STAGE1_TILES_3BPP_6C88:
	DB	3Fh,F0h,30h,2Fh,E0h,20h,42h,C0h,40h,55h,C1h,41h
	DB	73h,D2h,52h,97h,94h,94h,A6h,A4h,A4h,ADh,A9h,A9h
	DB	A9h,A9h,A9h,6Bh,EAh,6Ah,57h,D4h,54h,3Bh,F8h,38h
	DB	15h,F0h,10h,23h,E3h,23h,37h,E6h,26h,3Fh,F8h,38h
	DB	3Fh,F0h,30h,2Fh,E0h,20h,5Fh,C0h,40h,4Fh,C0h,40h
	DB	7Fh,C0h,40h,DBh,80h,80h,B5h,A4h,A4h,AEh,A8h,A8h
	DB	27h,E0h,20h,29h,E0h,20h,22h,E0h,20h,30h,F0h,30h
	DB	10h,F0h,10h,0Eh,FEh,0Eh,03h,FFh,03h,00h,FFh,00h
	DB	00h,FFh,00h,01h,FFh,01h,03h,FEh,02h,03h,FEh,02h
	DB	07h,FCh,04h,07h,FCh,04h,07h,FCh,04h,09h,F8h,08h
	DB	09h,F9h,09h,13h,F2h,12h,17h,F4h,14h,0Bh,F8h,08h
	DB	0Fh,F8h,08h,19h,F0h,10h,17h,F4h,14h,2Fh,E8h,28h
	DB	FFh,05h,05h,F7h,07h,07h,E2h,22h,22h,11h,11h,10h
	DB	12h,13h,10h,0Fh,0Fh,0Fh,13h,1Fh,13h,E3h,FFh,E3h

; Stage 1 (6020h) 10-tile 3bpp background block (10 x 24B = 240B -> dst=95h..9Eh, attr=00h).
STAGE1_TILES_3BPP_6D30:
	DB	FFh,00h,00h,9Fh,00h,60h,6Fh,F0h,00h,EFh,F0h,20h
	DB	7Fh,D0h,10h,7Fh,C0h,40h,FFh,C0h,40h,FFh,B0h,80h
	DB	EFh,F0h,80h,AFh,90h,C0h,7Fh,70h,B0h,67h,60h,D8h
	DB	EFh,FCh,A0h,B9h,E6h,20h,FDh,C2h,C0h,DEh,C1h,20h
	DB	3Fh,F0h,00h,E7h,F8h,E0h,DFh,C8h,A8h,8Fh,B4h,44h
	DB	BFh,E0h,20h,63h,C2h,5Ch,5Eh,DFh,66h,DFh,F1h,81h
	DB	39h,39h,FFh,D8h,DBh,2Ch,BFh,FDh,81h,DBh,3Ch,00h
	DB	C3h,3Ch,00h,F3h,CCh,C0h,F7h,28h,20h,FFh,00h,00h
	DB	00h,FFh,00h,00h,9Fh,60h,F0h,FFh,00h,F0h,FFh,20h
	DB	50h,FFh,10h,40h,FFh,40h,C0h,FFh,40h,F0h,FFh,C0h
	DB	F0h,FFh,80h,B0h,BFh,E0h,70h,7Fh,B0h,60h,67h,D8h
	DB	FCh,FFh,A0h,BEh,FFh,38h,FEh,FFh,FCh,DBh,DFh,3Ah
	DB	38h,FFh,08h,FCh,FFh,E4h,DCh,DFh,B4h,8Eh,BFh,4Ah
	DB	BEh,FFh,3Eh,62h,E3h,7Ch,5Eh,DFh,66h,D7h,FFh,87h
	DB	AEh,FFh,0Eh,7Ch,FFh,3Ch,7Ch,FFh,3Ch,66h,E7h,5Eh
	DB	FEh,FFh,B2h,B9h,FFh,39h,FDh,FFh,FDh,FEh,FFh,FEh
	DB	D9h,F9h,4Fh,EBh,FFh,E0h,EDh,FFh,E4h,FFh,FFh,F6h
	DB	7Eh,FFh,76h,1Bh,FFh,1Bh,00h,FFh,00h,00h,FFh,00h
	DB	39h,39h,FFh,F8h,FBh,94h,BFh,FFh,93h,F7h,FFh,D3h
	DB	D7h,FFh,D3h,7Ah,FFh,7Ah,0Ch,FFh,0Ch,00h,FFh,00h

; Stage 1 (6020h) 6-tile 3bpp background block (6 x 24B = 144B -> dst=9Fh..A4h, attr=00h).
STAGE1_TILES_3BPP_6E20:
	DB	FFh,00h,00h,9Bh,00h,00h,2Ch,20h,20h,E2h,E2h,E2h
	DB	32h,F2h,32h,08h,F8h,08h,04h,FCh,04h,03h,FFh,03h
	DB	FFh,04h,04h,FDh,04h,04h,E6h,22h,22h,33h,11h,11h
	DB	31h,11h,11h,0Eh,0Fh,0Eh,10h,1Fh,10h,E0h,FFh,E0h
	DB	FFh,00h,00h,FFh,00h,00h,DCh,00h,00h,31h,01h,01h
	DB	01h,01h,01h,07h,07h,07h,8Ch,8Fh,8Ch,F0h,FFh,F0h
	DB	FFh,00h,00h,FFh,00h,00h,FFh,80h,80h,8Fh,08h,08h
	DB	08h,00h,00h,30h,30h,30h,F0h,F0h,F0h,0Fh,FFh,0Fh
	DB	FFh,00h,00h,FFh,00h,00h,FFh,00h,00h,FEh,00h,00h
	DB	FEh,0Ah,0Ah,E9h,29h,29h,65h,25h,25h,B5h,95h,95h
	DB	FFh,1Fh,18h,FFh,0Fh,09h,FFh,07h,05h,7Fh,03h,03h
	DB	7Fh,50h,50h,97h,94h,94h,A6h,A4h,A4h,ADh,A9h,A9h

; Stage 1 (6020h) 5-tile 3bpp hazard/special block (5 x 24B = 120B -> dst=B7h..BBh,
; attr=28h; first 4 tiles 6EB0h-6F0Fh also mirrored -> dst=BCh..BFh).
STAGE1_TILES_3BPP_6EB0:
	DB	00h,FFh,00h,00h,FFh,00h,01h,FDh,02h,06h,F6h,09h
	DB	15h,FFh,01h,1Fh,FFh,07h,3Fh,FFh,0Fh,2Bh,FFh,0Bh
	DB	04h,FFh,04h,01h,FFh,00h,02h,FFh,00h,03h,FFh,01h
	DB	03h,FFh,03h,02h,FFh,02h,00h,FFh,00h,00h,FFh,00h
	DB	01h,FFh,01h,03h,FFh,03h,00h,FFh,00h,01h,FFh,00h
	DB	02h,FFh,00h,01h,FFh,01h,03h,FFh,03h,03h,FFh,03h
	DB	00h,FCh,03h,0Bh,FBh,04h,0Fh,FFh,03h,1Ch,FFh,04h
	DB	19h,FFh,19h,13h,FFh,13h,15h,FFh,15h,00h,FFh,00h
	DB	00h,FFh,00h,00h,FFh,00h,00h,FFh,00h,00h,FFh,00h
	DB	00h,FFh,00h,00h,FFh,00h,00h,FFh,00h,00h,FFh,00h

; Stage 1 (6020h) 6-tile raw-4bpp destructible/special block (6 x 32B = 192B ->
; dst=F0h..F5h, attr=05h).
STAGE1_TILES_4BPP_6F28:
	DB	3Fh,F8h,88h,88h,35h,4Fh,88h,88h,53h,33h,F8h,88h,F3h,33h,3Fh,88h
	DB	F3h,3Fh,FFh,88h,FFh,F5h,54h,4Fh,FFh,43h,4Fh,33h,F4h,34h,FFh,FFh
	DB	88h,FFh,FFh,44h,8Fh,44h,5Fh,3Fh,F4h,3Fh,44h,FFh,F4h,F4h,F5h,42h
	DB	4Fh,4Fh,F2h,33h,4Fh,F4h,3Fh,23h,FFh,43h,FFh,22h,F4h,3Fh,22h,22h
	DB	44h,2Fh,FFh,88h,F3h,F5h,44h,F8h,FFh,44h,F3h,4Fh,24h,5Fh,4Fh,4Fh
	DB	33h,2Fh,F4h,F4h,32h,F3h,4Fh,F4h,22h,FFh,34h,FFh,22h,22h,F3h,4Fh
	DB	88h,88h,8Ch,CFh,88h,FFh,FCh,CFh,8Fh,54h,5Fh,CFh,F4h,F5h,35h,FFh
	DB	43h,F3h,44h,5Fh,3Fh,FFh,34h,5Fh,F5h,45h,FFh,44h,3Fh,44h,5Fh,F4h
	DB	3Fh,FFh,FFh,FFh,35h,FFh,FFh,FFh,53h,33h,F3h,3Fh,F3h,33h,3Fh,FFh
	DB	F3h,3Fh,FFh,FFh,FFh,F5h,54h,4Fh,FFh,43h,4Fh,33h,F4h,34h,FFh,FFh
	DB	FFh,FFh,FFh,F4h,FFh,FFh,FFh,44h,43h,F4h,45h,F3h,3Fh,FFh,43h,3Fh
	DB	FFh,FFh,F4h,34h,FFh,44h,5Fh,F3h,F4h,33h,45h,FFh,F3h,FFh,34h,5Fh

; Stage 5 (613Fh) 2-tile raw-4bpp block (2 x 32B = 64B -> dst=01h..02h, attr=00h).
STAGE5_TILES_4BPP_6FE8:
	DB	88h,88h,88h,88h,88h,88h,88h,88h,88h,88h,88h,88h,88h,88h,88h,88h
	DB	88h,88h,88h,88h,88h,88h,88h,88h,88h,88h,88h,88h,88h,88h,88h,88h
	DB	88h,88h,88h,88h,88h,88h,88h,88h,88h,88h,88h,88h,88h,CCh,88h,88h
	DB	88h,88h,88h,88h,88h,88h,88h,88h,88h,88h,88h,88h,88h,88h,88h,88h

; Stage 5 (613Fh) 19-tile 3bpp background block (19 x 24B = 456B -> dst=03h..15h, attr=00h).
STAGE5_TILES_3BPP_7028:
	DB	D0h,FFh,D2h,D0h,FFh,52h,F1h,FFh,33h,31h,3Fh,D3h
	DB	BEh,3Eh,CFh,DFh,00h,FFh,FFh,00h,FFh,FFh,00h,FFh
	DB	FFh,FFh,07h,FFh,03h,FDh,FFh,01h,FEh,FFh,00h,FFh
	DB	FFh,00h,FFh,FFh,00h,FFh,FFh,00h,FFh,FFh,00h,FFh
	DB	3Fh,00h,FFh,3Fh,00h,FFh,3Fh,00h,FFh,3Fh,00h,FFh
	DB	FFh,00h,FFh,FFh,00h,FFh,FFh,00h,FFh,FFh,00h,FFh
	DB	FFh,80h,7Fh,BFh,80h,7Fh,BFh,80h,FFh,5Fh,C0h,3Fh
	DB	4Fh,C0h,BFh,23h,E0h,9Fh,3Bh,F8h,87h,2Fh,E0h,3Fh
	DB	FDh,01h,FEh,F9h,01h,FEh,FBh,03h,FCh,F7h,07h,F9h
	DB	F7h,07h,FBh,F7h,07h,FBh,EFh,0Fh,F7h,CFh,0Fh,F7h
	DB	FFh,03h,FFh,FFh,01h,FFh,FFh,01h,FEh,FFh,00h,FFh
	DB	FFh,00h,FFh,FFh,00h,FFh,FFh,00h,FFh,FEh,00h,FFh
	DB	E7h,00h,FFh,9Bh,18h,E7h,BFh,20h,DFh,BFh,20h,DFh
	DB	EFh,00h,FFh,FFh,00h,FFh,FFh,00h,FFh,FFh,00h,FFh
	DB	FFh,00h,FFh,FFh,00h,FFh,FFh,00h,FFh,F9h,00h,FFh
	DB	FDh,00h,FFh,FFh,00h,FFh,FFh,00h,FFh,FFh,00h,FFh
	DB	FEh,00h,FFh,F1h,01h,FEh,F9h,01h,FEh,E7h,07h,F9h
	DB	CBh,0Bh,F5h,FEh,0Fh,F2h,FAh,03h,FEh,FDh,01h,FFh
	DB	FEh,00h,FFh,FEh,00h,FFh,FDh,01h,FEh,FDh,01h,FEh
	DB	FAh,03h,FCh,FFh,03h,FDh,FDh,01h,FFh,FEh,00h,FFh
	DB	FFh,00h,FFh,FFh,00h,FFh,FFh,00h,FFh,FEh,00h,FFh
	DB	FFh,01h,FEh,FEh,00h,FFh,FCh,00h,FFh,F8h,00h,FFh
	DB	FEh,02h,FDh,FFh,01h,FEh,FFh,01h,FEh,FFh,00h,FFh
	DB	FFh,00h,FFh,FFh,00h,FFh,FEh,00h,FFh,FEh,00h,FFh
	DB	FFh,00h,FFh,FFh,00h,FFh,FFh,00h,FFh,FFh,00h,FFh
	DB	3Eh,00h,FFh,9Ch,80h,7Fh,81h,81h,7Eh,64h,67h,98h
	DB	FFh,00h,FFh,FFh,00h,FFh,F7h,00h,FFh,EBh,08h,F7h
	DB	97h,10h,EFh,27h,20h,DFh,6Bh,E0h,1Fh,29h,E0h,9Fh
	DB	2Fh,E0h,1Fh,A3h,E0h,9Fh,73h,F0h,6Fh,35h,F0h,2Fh
	DB	9Fh,FCh,83h,5Bh,F8h,57h,B7h,F0h,BFh,6Fh,E0h,FFh
	DB	5Fh,C0h,FFh,3Fh,80h,FFh,3Fh,80h,7Fh,3Fh,80h,7Fh
	DB	BFh,80h,FFh,1Fh,C0h,BFh,2Fh,E0h,1Fh,2Fh,E0h,1Fh
	DB	75h,F0h,CFh,6Bh,E8h,D7h,39h,F8h,E7h,3Eh,FEh,21h
	DB	9Fh,FCh,93h,47h,F0h,4Fh,2Fh,E0h,3Fh,0Fh,C0h,BFh
	DB	50h,FFh,D2h,50h,FFh,D2h,31h,FFh,F3h,11h,FFh,73h
	DB	0Eh,FEh,2Fh,1Fh,E0h,9Fh,2Fh,E0h,1Fh,2Fh,E0h,1Fh
	DB	19h,FFh,5Bh,29h,FFh,69h,FFh,FFh,D6h,C0h,C0h,3Fh
	DB	1Fh,00h,FFh,7Fh,00h,FFh,FFh,00h,FFh,FFh,00h,FFh

; Stage 5 (613Fh) 30-tile 3bpp background block (30 x 24B = 720B -> dst=20h..3Dh, attr=00h).
STAGE5_TILES_3BPP_71F0:
	DB	3Eh,3Fh,C6h,F8h,FFh,08h,F1h,FFh,31h,CFh,FFh,CFh
	DB	FCh,FFh,FCh,F0h,FFh,F0h,C0h,FFh,C3h,03h,FFh,1Fh
	DB	80h,FFh,9Fh,C2h,FFh,DAh,FCh,FFh,3Ch,B8h,3Fh,CBh
	DB	DCh,1Fh,EDh,DCh,1Fh,EDh,DEh,1Fh,E6h,CEh,0Fh,F6h
	DB	17h,F0h,CFh,17h,F0h,CFh,1Fh,F8h,C7h,1Fh,FCh,F3h
	DB	0Fh,FCh,E3h,0Fh,FEh,F9h,07h,FEh,F5h,01h,FFh,FDh
	DB	C6h,FFh,C6h,98h,FFh,98h,E0h,FFh,E4h,84h,FFh,9Dh
	DB	18h,FFh,3Bh,60h,FFh,66h,00h,FFh,1Fh,90h,FFh,F7h
	DB	E0h,FFh,EFh,00h,FFh,1Eh,00h,FFh,FEh,21h,FFh,2Dh
	DB	C3h,FFh,DBh,82h,FFh,B2h,8Eh,FFh,EEh,98h,FFh,98h
	DB	24h,FFh,24h,F8h,FFh,FAh,20h,FFh,25h,C4h,FFh,DFh
	DB	98h,FFh,F9h,60h,FFh,67h,00h,FFh,3Fh,00h,FFh,FEh
	DB	46h,7Fh,FEh,58h,7Fh,F9h,B0h,3Fh,F3h,A0h,3Fh,EEh
	DB	A1h,3Fh,EDh,A2h,3Fh,E2h,76h,7Fh,B6h,F8h,FFh,78h
	DB	A0h,FFh,A1h,20h,FFh,ACh,38h,FFh,3Ch,38h,FFh,3Ch
	DB	38h,FFh,3Ch,50h,FFh,52h,50h,FFh,52h,50h,FFh,52h
	DB	00h,FFh,3Bh,00h,FFh,99h,04h,FFh,9Dh,02h,FFh,5Eh
	DB	02h,FFh,4Eh,02h,FFh,4Eh,02h,FFh,46h,0Fh,FFh,4Fh
	DB	00h,FFh,B9h,00h,FFh,99h,02h,FFh,9Ah,04h,FFh,9Dh
	DB	00h,FFh,92h,00h,FFh,96h,00h,FFh,95h,10h,FFh,9Dh
	DB	40h,FFh,4Fh,80h,FFh,9Ah,00h,FFh,32h,09h,3Fh,EFh
	DB	91h,3Fh,DDh,A7h,3Fh,EFh,4Eh,7Fh,9Eh,FCh,FFh,7Ch
	DB	F0h,FFh,F0h,E0h,FFh,E0h,C0h,FFh,C0h,80h,FFh,81h
	DB	C0h,FFh,C3h,40h,FFh,C7h,61h,FFh,7Fh,FEh,FFh,FEh
	DB	21h,FFh,E1h,23h,FFh,E3h,42h,FFh,C2h,42h,FFh,C2h
	DB	86h,FFh,86h,86h,FFh,86h,34h,FFh,34h,4Ch,FFh,7Ch
	DB	00h,FFh,8Fh,00h,FFh,87h,00h,FFh,C7h,00h,FFh,E3h
	DB	10h,FFh,73h,0Ch,FFh,3Dh,04h,FFh,1Ch,04h,FFh,0Ch
	DB	41h,FFh,43h,40h,FEh,42h,41h,FFh,45h,41h,FFh,45h
	DB	82h,FFh,86h,82h,FFh,86h,84h,FFh,84h,CCh,FFh,CCh
	DB	24h,0Fh,0Ch,F4h,BFh,BCh,44h,5Fh,4Ch,04h,FFh,0Ch
	DB	04h,FFh,0Ch,04h,FFh,0Ch,02h,FFh,0Eh,01h,FFh,07h
	DB	04h,FFh,0Ch,04h,FFh,0Ch,04h,FFh,0Ch,04h,FFh,0Ch
	DB	04h,FFh,0Ch,04h,FFh,0Ch,02h,FFh,0Eh,01h,FFh,07h
	DB	4Ah,FFh,DEh,4Ah,FFh,DEh,4Ah,FFh,DEh,4Ah,FFh,DEh
	DB	51h,FFh,D7h,31h,FFh,F3h,19h,FFh,7Bh,09h,FFh,3Bh
	DB	00h,FFh,FCh,00h,FFh,6Eh,00h,FFh,33h,00h,FFh,5Ch
	DB	00h,FFh,2Eh,80h,FFh,9Bh,C0h,FFh,CCh,61h,FFh,E7h
	DB	30h,FFh,F1h,1Ch,FFh,FCh,07h,FFh,FFh,03h,FFh,FFh
	DB	00h,FFh,DFh,00h,FFh,E7h,08h,FFh,F9h,06h,FFh,FEh
	DB	9Ch,FFh,FCh,E0h,FFh,E0h,C0h,FFh,C7h,83h,FFh,9Fh
	DB	9Ch,FFh,FCh,F0h,FFh,F3h,C0h,FFh,CFh,80h,FFh,9Fh
	DB	03h,FFh,03h,07h,FFh,07h,8Ch,FFh,8Dh,11h,FFh,17h
	DB	07h,FFh,1Fh,18h,FFh,78h,70h,FFh,F1h,C0h,FFh,CFh
	DB	00h,FFh,0Ch,00h,FFh,78h,01h,FFh,FBh,03h,FFh,7Fh
	DB	0Eh,FFh,FEh,18h,FFh,F9h,70h,FFh,F2h,00h,FFh,8Fh
	DB	00h,FFh,1Fh,00h,FFh,7Fh,00h,FFh,FEh,01h,FFh,FDh
	DB	03h,FFh,FBh,07h,FFh,E7h,1Ch,FFh,9Ch,30h,FFh,30h
	DB	03h,FFh,03h,26h,FFh,26h,CCh,FFh,CCh,D2h,FFh,D2h
	DB	CCh,FFh,4Ch,D8h,FFh,59h,F0h,FFh,73h,E0h,FFh,67h
	DB	79h,7Fh,81h,62h,7Fh,C2h,0Ch,FFh,0Dh,D0h,FFh,D3h
	DB	60h,7Fh,E6h,41h,7Fh,CDh,43h,7Fh,D3h,4Ch,7Fh,CCh
	DB	00h,FEh,E1h,01h,FCh,B3h,41h,FCh,D3h,27h,FCh,E3h
	DB	1Fh,F8h,7Fh,0Fh,F0h,8Fh,5Fh,E0h,DFh,3Fh,E0h,FFh
	DB	ECh,FFh,ECh,3Ch,3Fh,FCh,DEh,1Fh,FEh,EEh,0Fh,F6h
	DB	F7h,07h,FBh,FBh,03h,FDh,FFh,01h,FEh,FFh,00h,FFh
	DB	01h,FFh,07h,01h,FFh,07h,01h,FFh,07h,03h,FFh,07h
	DB	C7h,FFh,C7h,FFh,FFh,FFh,C3h,C3h,BDh,FFh,00h,FFh
	DB	08h,FFh,3Bh,0Bh,FFh,1Bh,0Fh,FFh,3Ch,38h,F8h,37h
	DB	F3h,F0h,CFh,CFh,C0h,BFh,FFh,80h,7Fh,FFh,00h,FFh

; Stage 5 (613Fh) 32-tile 3bpp solid terrain block (32 x 24B = 768B -> dst=40h..5Fh,
; attr=05h).
STAGE5_TILES_3BPP_74C0:
	DB	27h,FFh,AFh,24h,FFh,AFh,48h,FFh,58h,88h,FFh,B8h
	DB	90h,FFh,B0h,90h,FFh,B0h,11h,FFh,71h,21h,FFh,61h
	DB	A0h,FFh,AFh,20h,FFh,20h,68h,FFh,6Eh,D8h,FFh,DBh
	DB	D0h,FFh,D3h,D0h,FFh,D3h,90h,FFh,91h,B0h,FFh,B1h
	DB	1Dh,FDh,FDh,03h,FFh,7Fh,01h,FFh,33h,00h,FFh,33h
	DB	00h,FFh,33h,00h,FFh,33h,00h,FFh,33h,00h,FFh,33h
	DB	00h,7Fh,24h,08h,FFh,3Ah,04h,FFh,3Dh,00h,FFh,18h
	DB	00h,FFh,14h,00h,FFh,16h,00h,FFh,0Bh,00h,FFh,0Dh
	DB	B3h,E1h,E1h,26h,E6h,66h,7Fh,F5h,75h,7Dh,DDh,5Dh
	DB	0Eh,C6h,06h,2Dh,EFh,2Fh,10h,FFh,33h,00h,FFh,33h
	DB	63h,27h,27h,E8h,6Fh,68h,58h,5Fh,5Eh,98h,9Fh,9Bh
	DB	70h,7Fh,73h,D0h,FFh,D3h,90h,FFh,91h,B0h,FFh,B1h
	DB	CDh,3Dh,CDh,CAh,3Ah,CAh,C5h,3Dh,D5h,A4h,7Ch,B4h
	DB	87h,7Fh,97h,07h,FFh,27h,0Fh,FFh,6Fh,0Fh,FFh,4Fh
	DB	17h,D7h,17h,2Ah,AAh,2Ah,DDh,D5h,D5h,67h,E1h,61h
	DB	35h,F4h,74h,3Fh,FDh,FDh,3Eh,FEh,BEh,67h,FFh,67h
	DB	4Fh,FEh,4Eh,D7h,FDh,D5h,ACh,FCh,BCh,4Bh,F9h,59h
	DB	0Bh,FAh,2Ah,0Ch,F8h,58h,15h,FDh,35h,0Eh,FEh,7Eh
	DB	1Fh,FFh,7Fh,1Ah,FBh,DAh,0Bh,F9h,D9h,15h,F0h,90h
	DB	1Eh,F6h,B6h,0Bh,F8h,78h,05h,F1h,E1h,1Bh,F0h,D0h
	DB	11h,F9h,79h,02h,FAh,EAh,07h,FFh,D7h,06h,FEh,D6h
	DB	0Ah,FEh,AEh,09h,FDh,EDh,15h,FDh,DDh,26h,FEh,AEh
	DB	3Fh,00h,3Fh,DFh,60h,5Fh,5Fh,60h,5Fh,1Fh,20h,1Fh
	DB	8Fh,B0h,AFh,0Fh,70h,2Fh,0Fh,F0h,2Fh,87h,F8h,B7h
	DB	87h,F8h,97h,43h,FCh,5Bh,23h,7Ch,2Bh,91h,7Eh,5Dh
	DB	10h,3Fh,36h,48h,3Fh,2Bh,80h,BFh,B3h,40h,1Fh,19h
	DB	70h,1Fh,1Eh,10h,0Fh,07h,D0h,5Fh,5Bh,20h,3Fh,2Eh
	DB	A0h,FFh,B6h,90h,7Fh,1Bh,50h,7Fh,55h,28h,FFh,2Bh
	DB	20h,FFh,E4h,30h,FFh,72h,04h,FFh,64h,13h,FFh,B3h
	DB	0Eh,FFh,BEh,03h,FFh,DFh,00h,7Fh,6Fh,80h,3Fh,3Fh
	DB	D0h,CFh,CFh,70h,5Fh,57h,B0h,AFh,ABh,50h,1Fh,1Eh
	DB	A8h,2Fh,2Ah,D8h,D7h,D5h,90h,87h,86h,40h,F7h,53h
	DB	20h,FFh,E4h,30h,FFh,72h,84h,7Fh,64h,53h,3Fh,33h
	DB	8Eh,3Fh,3Eh,83h,BFh,9Fh,00h,7Fh,2Fh,80h,BFh,9Fh
	DB	48h,7Fh,59h,88h,BFh,98h,08h,3Fh,18h,48h,7Fh,58h
	DB	E4h,FFh,FCh,84h,FFh,FCh,44h,FFh,CCh,44h,FFh,CCh
	DB	3Fh,3Ch,0Ch,B6h,B2h,82h,ADh,ACh,ACh,7Ah,7Ah,7Ah
	DB	DBh,FBh,DBh,8Eh,FEh,8Eh,77h,FFh,77h,EFh,FFh,FFh
	DB	1Fh,C7h,07h,1Fh,8Ah,0Ah,5Dh,55h,55h,27h,81h,01h
	DB	51h,50h,50h,2Fh,ADh,ADh,12h,D2h,92h,19h,F9h,19h
	DB	3Fh,1Ch,1Ch,96h,92h,92h,ADh,ACh,ACh,7Ah,7Ah,7Ah
	DB	DBh,FBh,DBh,8Eh,FEh,8Eh,77h,FFh,77h,EFh,FFh,FFh
	DB	0Ch,FFh,0Ch,08h,FFh,08h,18h,FFh,18h,10h,FEh,10h
	DB	B1h,FDh,B1h,62h,7Eh,62h,A1h,BDh,A1h,C0h,FEh,C0h
	DB	30h,FFh,F0h,10h,FFh,F0h,18h,FFh,F8h,08h,FFh,78h
	DB	0Ch,FFh,9Ch,24h,FFh,6Ch,92h,FFh,BEh,CAh,FFh,DEh
	DB	FFh,00h,FFh,FFh,00h,FFh,FFh,00h,FFh,FDh,00h,FCh
	DB	FEh,00h,FCh,FAh,02h,FAh,FCh,00h,FCh,FDh,01h,FDh
	DB	EBh,00h,C0h,46h,06h,06h,31h,00h,00h,E6h,60h,E0h
	DB	C5h,85h,85h,DAh,42h,42h,8Bh,88h,88h,79h,20h,20h
	DB	FFh,00h,FFh,73h,00h,21h,7Ah,52h,72h,B7h,80h,86h
	DB	A6h,A0h,AFh,4Dh,4Dh,4Bh,94h,94h,94h,F6h,44h,74h
	DB	FCh,00h,FCh,F3h,00h,F0h,A4h,00h,A0h,95h,14h,14h
	DB	34h,34h,34h,D3h,13h,13h,58h,48h,48h,A3h,03h,03h
	DB	FFh,00h,77h,6Bh,40h,61h,D5h,10h,11h,9Dh,85h,85h
	DB	6Bh,0Ah,0Bh,06h,06h,06h,FBh,21h,21h,83h,82h,82h
	DB	EBh,00h,E3h,76h,06h,46h,05h,04h,04h,D8h,C0h,D8h
	DB	9Fh,05h,3Dh,BEh,B0h,8Eh,D1h,D1h,DFh,1Eh,1Ch,10h
	DB	FFh,00h,FFh,FFh,00h,FFh,7Fh,00h,7Fh,7Fh,00h,7Fh
	DB	7Fh,00h,7Fh,BFh,00h,3Fh,FFh,80h,BFh,7Fh,40h,7Fh
	DB	FCh,00h,FCh,FEh,02h,FEh,F9h,05h,F9h,FAh,06h,FAh
	DB	F6h,0Eh,F6h,F1h,09h,F1h,F2h,1Ah,F2h,E5h,1Dh,E5h
	DB	ECh,80h,8Fh,C3h,C0h,CFh,6Ch,0Ch,0Bh,D6h,C6h,C1h
	DB	6Eh,26h,25h,A0h,80h,81h,0Eh,02h,02h,40h,40h,40h

; Stage 5 (613Fh) 39-tile 3bpp solid terrain block (39 x 24B = 936B -> dst=60h..86h,
; attr=05h).
STAGE5_TILES_3BPP_77C0:
	DB	78h,00h,7Dh,FDh,00h,FFh,BEh,02h,FDh,93h,02h,FCh
	DB	4Ch,04h,F8h,B5h,85h,79h,8Fh,8Ch,74h,79h,79h,01h
	DB	FBh,23h,E3h,D4h,10h,F0h,1Bh,00h,C3h,6Eh,40h,47h
	DB	9Dh,01h,3Fh,82h,82h,FCh,B7h,34h,08h,55h,44h,44h
	DB	BBh,A1h,A1h,74h,50h,50h,D9h,01h,01h,6Eh,42h,42h
	DB	9Bh,09h,09h,E6h,82h,82h,9Ah,10h,10h,54h,44h,44h
	DB	FEh,4Eh,7Eh,7Ah,02h,FAh,B9h,81h,79h,3Fh,00h,7Fh
	DB	47h,40h,3Fh,B1h,B1h,4Eh,E7h,E7h,21h,94h,84h,04h
	DB	5Bh,52h,52h,B7h,25h,25h,BBh,12h,12h,79h,49h,49h
	DB	D4h,14h,D4h,29h,08h,E8h,07h,05h,35h,58h,1Ah,0Ah
	DB	EFh,A2h,A2h,B6h,16h,16h,DDh,44h,44h,6Bh,03h,03h
	DB	D7h,81h,81h,B2h,30h,30h,4Eh,0Eh,0Eh,B2h,B2h,B2h
	DB	9Dh,85h,85h,9Ah,18h,18h,EFh,AAh,AAh,5Bh,43h,43h
	DB	B1h,B1h,B1h,EFh,2Fh,2Fh,1Dh,11h,11h,F9h,48h,48h
	DB	4Ch,4Ch,4Ch,31h,30h,30h,54h,54h,54h,69h,69h,69h
	DB	96h,96h,96h,BFh,BFh,BFh,E9h,E9h,E9h,D7h,F7h,F7h
	DB	DDh,51h,51h,CBh,CBh,CBh,BFh,BDh,BDh,97h,91h,91h
	DB	FBh,FAh,FAh,BFh,ABh,ABh,F7h,F7h,F7h,CEh,FFh,CEh
	DB	F4h,B0h,B0h,D9h,48h,48h,A7h,A1h,A1h,EBh,CAh,CAh
	DB	BBh,B1h,B1h,EFh,EFh,EFh,FBh,FBh,FBh,7Dh,7Dh,7Dh
	DB	5Bh,52h,52h,B7h,25h,25h,BBh,12h,12h,79h,49h,49h
	DB	D4h,94h,94h,E9h,48h,48h,A7h,95h,85h,F8h,6Ah,68h
	DB	CFh,4Ch,4Ch,AAh,AAh,AAh,D7h,50h,50h,ADh,A1h,A1h
	DB	7Bh,10h,10h,8Fh,0Fh,0Fh,3Ch,24h,24h,95h,05h,05h
	DB	75h,75h,75h,BFh,93h,93h,FFh,FEh,FEh,DBh,CBh,CBh
	DB	55h,54h,54h,EEh,82h,82h,37h,27h,27h,CBh,01h,01h
	DB	57h,03h,03h,EBh,20h,20h,3Ch,08h,08h,FBh,AAh,AAh
	DB	FCh,DCh,DCh,69h,69h,69h,DFh,D4h,D4h,79h,79h,79h
	DB	BBh,A3h,A3h,74h,50h,50h,D9h,01h,01h,6Eh,42h,42h
	DB	9Bh,09h,09h,E6h,82h,82h,9Bh,10h,10h,55h,44h,44h
	DB	14h,F4h,D4h,3Fh,F9h,B9h,76h,C4h,C4h,ABh,A2h,A2h
	DB	53h,91h,11h,0Dh,80h,00h,EAh,88h,88h,B7h,A2h,A2h
	DB	57h,12h,12h,A9h,00h,00h,A4h,A4h,A4h,B3h,00h,00h
	DB	BEh,B6h,B6h,D7h,05h,05h,FBh,DBh,DBh,35h,34h,34h
	DB	2Bh,C0h,00h,46h,06h,06h,31h,00h,00h,66h,E0h,60h
	DB	C5h,85h,85h,DAh,42h,42h,8Bh,88h,88h,79h,20h,20h
	DB	F4h,B0h,B0h,D9h,48h,48h,97h,81h,B1h,DEh,C0h,FEh
	DB	A7h,A0h,BFh,E8h,E8h,E7h,EFh,CFh,C9h,7Ch,74h,74h
	DB	F4h,B0h,B0h,D9h,48h,48h,A7h,A1h,A1h,EBh,CAh,CAh
	DB	BBh,B1h,B1h,EFh,EFh,EFh,3Bh,FBh,3Bh,1Dh,FDh,DDh
	DB	B7h,85h,85h,DFh,99h,99h,2Fh,03h,03h,FDh,EDh,EDh
	DB	37h,33h,33h,67h,67h,67h,F7h,F7h,F7h,DFh,FFh,DFh
	DB	FFh,00h,FFh,73h,00h,21h,7Ah,52h,72h,B5h,80h,80h
	DB	AEh,A8h,A8h,4Bh,42h,42h,96h,90h,90h,EEh,4Ch,4Ch
	DB	F0h,FCh,70h,C3h,F0h,C0h,84h,A0h,80h,95h,14h,14h
	DB	34h,34h,34h,D3h,13h,13h,58h,48h,48h,A3h,03h,03h
	DB	BBh,A2h,A3h,77h,50h,57h,DDh,00h,0Fh,6Eh,40h,5Fh
	DB	82h,00h,1Fh,EDh,8Ch,83h,98h,10h,13h,75h,64h,64h
	DB	F5h,35h,F5h,FFh,03h,F3h,FFh,06h,FEh,FFh,03h,FFh
	DB	67h,00h,FFh,8Bh,0Ah,F5h,06h,06h,F7h,8Bh,81h,41h
	DB	57h,03h,03h,9Bh,00h,33h,5Ch,40h,3Fh,23h,23h,1Dh
	DB	9Ch,9Ch,84h,D1h,51h,D1h,EFh,04h,F4h,19h,19h,F9h
	DB	F5h,15h,F5h,FFh,03h,FBh,FFh,00h,FFh,F8h,00h,FFh
	DB	72h,02h,FDh,CFh,0Bh,F2h,37h,27h,C7h,CBh,C1h,01h
	DB	57h,12h,12h,A9h,00h,00h,A4h,A4h,A4h,B7h,00h,04h
	DB	BEh,B2h,B6h,DFh,01h,1Fh,DFh,C1h,FFh,67h,60h,1Fh
	DB	BCh,13h,11h,BAh,A9h,A8h,75h,45h,45h,DAh,90h,90h
	DB	B3h,22h,22h,FDh,91h,91h,F2h,E0h,E0h,9Dh,99h,99h
	DB	A3h,A0h,AFh,73h,50h,53h,D9h,00h,03h,6Fh,42h,41h
	DB	98h,08h,09h,E6h,82h,83h,99h,10h,11h,56h,46h,47h
	DB	7Dh,75h,75h,FFh,13h,D3h,FFh,1Eh,FEh,FFh,07h,FFh
	DB	E1h,00h,FCh,C6h,06h,F2h,27h,27h,E7h,9Bh,01h,81h
	DB	E0h,A0h,A3h,BEh,18h,17h,D2h,40h,46h,6Bh,00h,03h
	DB	D5h,80h,83h,B1h,30h,33h,48h,08h,0Fh,B2h,B2h,BEh
	DB	EDh,85h,85h,1Ah,18h,18h,EFh,AAh,AAh,5Ah,43h,42h
	DB	F1h,31h,F1h,6Ch,2Fh,ACh,1Ch,11h,10h,F9h,48h,48h
	DB	DFh,5Ch,44h,BAh,BAh,A2h,D7h,50h,50h,ADh,A1h,A1h
	DB	7Bh,10h,10h,8Fh,0Fh,0Fh,3Ch,24h,24h,95h,05h,05h
	DB	AFh,A9h,A9h,D7h,D6h,D6h,37h,A1h,A1h,6Ah,4Ah,4Ah
	DB	D5h,51h,51h,B7h,A7h,A7h,E9h,8Fh,8Fh,7Ah,7Fh,7Eh
	DB	F8h,60h,60h,25h,05h,05h,F7h,37h,37h,CEh,CFh,CFh
	DB	3Ch,3Fh,3Dh,F1h,FFh,FFh,08h,FFh,FBh,04h,FFh,3Fh
	DB	9Fh,70h,07h,4Bh,60h,41h,D5h,10h,11h,9Dh,85h,85h
	DB	6Bh,0Ah,0Bh,06h,06h,06h,FBh,21h,21h,03h,02h,02h
	DB	35h,FFh,FDh,23h,FFh,7Fh,03h,FFh,67h,11h,FFh,B7h
	DB	09h,FFh,BBh,09h,FFh,DBh,07h,7Fh,6Fh,81h,3Fh,3Fh
	DB	10h,8Fh,84h,60h,47h,42h,18h,03h,00h,F7h,C3h,C3h
	DB	1Ch,11h,10h,DDh,CDh,CDh,78h,4Bh,4Bh,E0h,27h,27h

; Stage 5 (613Fh) 6-tile raw-4bpp block (6 x 32B = 192B -> dst=F0h..F5h, attr=05h).
STAGE5_TILES_4BPP_7B68:
	DB	FFh,12h,88h,88h,1Fh,2Fh,88h,88h,F1h,F2h,88h,88h,12h,1Fh,88h,88h
	DB	21h,F1h,F8h,88h,FFh,1Fh,2Fh,88h,F1h,12h,19h,FFh,3Fh,39h,13h,9Fh
	DB	88h,88h,8Ch,CFh,88h,88h,8Ch,CFh,88h,88h,8Ch,CFh,88h,88h,8Ch,CFh
	DB	88h,88h,8Ch,CFh,88h,88h,8Ch,45h,88h,88h,44h,58h,FFh,44h,55h,88h
	DB	F8h,88h,88h,88h,F8h,88h,88h,88h,F8h,88h,88h,88h,F8h,88h,88h,88h
	DB	F8h,88h,88h,88h,F8h,88h,88h,88h,FFh,88h,8Fh,FFh,FFh,FFh,F3h,33h
	DB	88h,88h,8Ch,F2h,88h,88h,8Fh,2Fh,88h,88h,FFh,11h,88h,8Fh,F1h,2Fh
	DB	8Fh,F9h,F1h,F2h,F3h,99h,F2h,11h,39h,9Fh,3Fh,1Fh,99h,99h,FFh,F1h
	DB	2Fh,FFh,FFh,FFh,F1h,FFh,FFh,FFh,1Fh,22h,1Fh,1Fh,F2h,1Fh,21h,21h
	DB	21h,F2h,11h,F2h,F2h,2Fh,22h,1Fh,FFh,F2h,11h,21h,F1h,1Fh,F2h,1Fh
	DB	FFh,FFh,FFh,F2h,FFh,FFh,FFh,F1h,2Fh,12h,2Fh,12h,12h,21h,21h,FFh
	DB	F2h,12h,12h,2Fh,21h,FFh,11h,21h,12h,11h,FFh,F1h,F1h,FFh,11h,F1h

; Stage 2 (6074h) 35-tile raw-4bpp block (1120B total across 09C28h-0A087h -> dst=01h..23h,
; attr=20h; first tile 7C28h-7C47h also mirrored -> dst=28h): Bank 04 part 1 (984B = 30.75
; tiles; continues seamlessly into Bank 05 0A000h-0A087h when Banks 04+05 are mapped
; together at 6000h-9FFFh).
STAGE2_TILES_4BPP_7C28_PART1:
	DB	52h,FFh,5Fh,4Fh,41h,2Fh,FFh,F2h,44h,22h,FFh,2Fh,54h,41h,F1h,F2h
	DB	54h,4Fh,1Fh,1Fh,F4h,41h,22h,FFh,2Fh,4Fh,1Fh,22h,F2h,12h,F1h,2Fh
	DB	1Fh,11h,FFh,FFh,F1h,FFh,FFh,FFh,1Fh,FFh,F2h,FFh,FFh,2Fh,FFh,F2h
	DB	FFh,F2h,F2h,F2h,2Fh,FFh,2Fh,2Fh,2Fh,2Fh,F2h,FFh,F2h,FFh,22h,22h
	DB	22h,F2h,FFh,2Fh,22h,22h,22h,F2h,22h,22h,FFh,FFh,22h,2Fh,22h,F2h
	DB	22h,22h,2Fh,FFh,12h,22h,22h,22h,11h,22h,22h,2Fh,22h,22h,22h,F2h
	DB	5Fh,F1h,22h,12h,FFh,F2h,12h,22h,F2h,2Fh,22h,22h,2Fh,22h,22h,22h
	DB	F2h,2Fh,22h,22h,22h,F2h,22h,22h,22h,22h,22h,22h,22h,22h,22h,22h
	DB	5Fh,FFh,FFh,12h,FFh,F2h,2Fh,22h,F2h,2Fh,22h,22h,2Fh,22h,22h,22h
	DB	F2h,2Fh,22h,22h,22h,F2h,22h,22h,22h,22h,22h,22h,22h,22h,22h,22h
	DB	1Fh,14h,59h,22h,F1h,F4h,52h,21h,1Fh,F4h,52h,FFh,FFh,24h,2Fh,F2h
	DB	FFh,F2h,F2h,F2h,2Fh,FFh,2Fh,2Fh,2Fh,2Fh,F2h,FFh,F2h,FFh,22h,22h
	DB	FFh,F4h,5Fh,55h,11h,F4h,FFh,11h,21h,1Fh,21h,1Fh,F2h,F2h,FFh,F2h
	DB	FFh,FFh,2Fh,FFh,FFh,2Fh,FFh,FFh,2Fh,FFh,FFh,2Fh,F2h,FFh,F2h,F2h
	DB	59h,59h,51h,12h,25h,55h,11h,FFh,1Fh,FFh,12h,FFh,F2h,12h,FFh,F2h
	DB	FFh,FFh,2Fh,FFh,FFh,2Fh,FFh,FFh,2Fh,FFh,FFh,2Fh,F2h,FFh,F2h,F2h
	DB	5Fh,1Fh,12h,22h,FFh,F2h,2Fh,22h,F2h,2Fh,22h,22h,2Fh,22h,22h,22h
	DB	F2h,2Fh,22h,22h,22h,F2h,22h,22h,22h,22h,22h,22h,22h,22h,22h,22h
	DB	22h,22h,22h,22h,22h,22h,22h,22h,22h,22h,22h,F2h,22h,2Fh,22h,F2h
	DB	2Fh,22h,22h,2Fh,22h,22h,F2h,F2h,22h,F2h,2Fh,2Fh,12h,22h,22h,F2h
	DB	22h,22h,22h,22h,22h,22h,22h,22h,22h,22h,22h,22h,22h,22h,11h,11h
	DB	21h,11h,11h,14h,22h,24h,41h,12h,22h,22h,11h,22h,22h,22h,22h,22h
	DB	22h,22h,22h,22h,22h,22h,22h,22h,22h,22h,22h,22h,12h,22h,22h,22h
	DB	41h,22h,22h,22h,22h,22h,22h,21h,22h,22h,21h,11h,22h,22h,11h,11h
	DB	22h,22h,22h,44h,22h,22h,22h,22h,11h,22h,22h,22h,22h,22h,22h,22h
	DB	22h,22h,22h,21h,22h,22h,21h,11h,22h,11h,11h,11h,22h,22h,11h,11h
	DB	12h,24h,44h,22h,22h,22h,22h,22h,22h,22h,22h,22h,22h,22h,22h,22h
	DB	12h,22h,22h,22h,11h,11h,12h,22h,11h,12h,22h,22h,12h,22h,22h,22h
	DB	22h,22h,22h,22h,22h,22h,22h,22h,22h,22h,22h,22h,22h,22h,22h,22h
	DB	22h,22h,22h,22h,22h,22h,22h,25h,22h,22h,22h,24h,22h,24h,32h,24h
	DB	22h,22h,22h,22h,22h,22h,22h,24h,22h,22h,22h,22h,25h,54h,33h,33h
	DB	54h,44h,44h,43h,44h,33h,44h,44h,44h,44h,34h,44h,54h,44h,33h,4Fh
	DB	24h,44h,22h,22h,44h,44h,33h,22h,44h,44h,44h,32h,24h,54h,45h,43h
	DB	32h,44h,FFh,FFh,33h,24h,45h,52h,4Fh,45h,44h,45h,F4h,54h,5Fh,52h
	DB	22h,22h,22h,22h,22h,22h,22h,22h,22h,44h,33h,32h,24h,44h,44h,43h
	DB	44h,44h,4Fh,F5h,45h,45h,44h,52h,54h,54h,55h,45h,25h,F5h,54h,52h
	DB	22h,22h,24h,42h,22h,22h,44h,44h,22h,22h,54h,42h,22h,22h,22h,22h
	DB	22h,22h,22h,22h,22h,22h,22h,22h,22h,22h,24h,43h,22h,22h,25h,44h
	DB	22h,22h,22h,22h,22h,22h,22h,22h,22h,22h,22h,22h,22h,22h,22h,22h
	DB	22h,22h,22h,22h,22h,24h,32h,22h,22h,24h,42h,22h,22h,22h,22h,22h
	DB	22h,22h,22h,22h,22h,22h,22h,22h,22h,22h,22h,22h,22h,24h,43h,22h
	DB	22h,54h,44h,22h,22h,25h,22h,22h,22h,22h,22h,22h,22h,22h,22h,22h
	DB	22h,24h,42h,25h,44h,42h,22h,24h,44h,42h,22h,25h,22h,22h,22h,22h
	DB	24h,43h,22h,22h,54h,44h,22h,22h,25h,22h,22h,44h,22h,22h,22h,54h
	DB	45h,45h,44h,F2h,54h,54h,33h,45h,45h,45h,43h,34h,F4h,53h,45h,45h
	DB	5Fh,F4h,54h,FFh,25h,5Fh,FFh,55h,32h,55h,55h,22h,42h,22h,22h,22h
	DB	25h,FFh,F5h,22h,44h,55h,52h,22h,55h,22h,22h,22h,52h,22h,22h,22h
	DB	52h,22h,22h,22h,22h,22h,22h,22h,22h,24h,32h,22h,22h,24h,42h,22h
	DB	22h,5Fh,F5h,22h,22h,22h,22h,22h,22h,22h,22h,22h,22h,22h,22h,22h
	DB	22h,22h,22h,22h,22h,43h,22h,22h,22h,44h,22h,43h,22h,22h,22h,44h
	DB	22h,22h,22h,22h,22h,24h,44h,22h,22h,54h,44h,22h,22h,25h,22h,22h
	DB	22h,22h,22h,22h,22h,22h,22h,43h,22h,22h,22h,44h,22h,22h,22h,22h
	DB	5Fh,FFh,FFh,12h,FFh,F2h,2Fh,22h,F2h,2Fh,22h,22h,2Fh,22h,22h,22h
	DB	F2h,2Fh,22h,22h,22h,F2h,22h,22h,22h,22h,22h,21h,22h,22h,21h,11h
	DB	22h,22h,22h,22h,22h,22h,22h,22h,22h,22h,22h,22h,4Fh,22h,22h,22h
	DB	34h,F2h,22h,22h,44h,55h,22h,22h,54h,45h,F2h,22h,F5h,44h,5Fh,22h
	DB	F2h,22h,F2h,FFh,F2h,F2h,2Fh,F2h,2Fh,F2h,F2h,2Fh,2Fh,22h,FFh,FFh
	DB	22h,FFh,FFh,22h,F2h,FFh,2Fh,2Fh,2Fh,F2h,22h,FFh,F2h,F2h,FFh,F8h
	DB	22h,FFh,2Fh,2Fh,FFh,2Fh,2Fh,22h,22h,2Fh,F2h,F2h,F2h,F2h,2Fh,F2h
	DB	2Fh,2Fh,FFh,2Fh,F2h,2Fh,F2h,2Fh,2Fh,FFh,2Fh,F1h,22h,FFh,F1h,45h
	DB	22h,FFh,FFh,FFh,FFh,2Fh,FFh,21h,22h,FFh,F8h,18h,F2h,F1h,11h,14h
	DB	11h,11h,84h,45h,15h,85h,44h,55h

	ENDIF
	DEPHASE

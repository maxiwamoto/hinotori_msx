; Physical Bank 07 (ROM 0E000h-0FFFFh): Sprite sets/directory and RLE/raw sprite patterns.
; Enhanced reuses orphaned-data space for RAM scroll images, boot menu/setup and turbo.
	PHASE	6000h

; 24-entry DW sprite-set resource-list pointer table indexed by SpriteSetSelector (C480h,
; 0..23: 18 normal routes 0..17 + 6 boss encounters 18..23) at Bank 00 565Ch.
SPRITE_SET_PTR_TABLE:
	DW	SPRITE_SET_LIST_605C_S00_S01	; [00h]
	DW	SPRITE_SET_LIST_605C_S00_S01	; [01h]
	DW	SPRITE_SET_LIST_606B_S02	; [02h]
	DW	SPRITE_SET_LIST_607E_S03_S04	; [03h]
	DW	SPRITE_SET_LIST_607E_S03_S04	; [04h]
	DW	SPRITE_SET_LIST_6093_S05	; [05h]
	DW	SPRITE_SET_LIST_60A6_S06_S07_S08	; [06h]
	DW	SPRITE_SET_LIST_60A6_S06_S07_S08	; [07h]
	DW	SPRITE_SET_LIST_60A6_S06_S07_S08	; [08h]
	DW	SPRITE_SET_LIST_60B3_S09	; [09h]
	DW	SPRITE_SET_LIST_60C4_S10	; [0Ah]
	DW	SPRITE_SET_LIST_60D1_S11	; [0Bh]
	DW	SPRITE_SET_LIST_60E0_S12	; [0Ch]
	DW	SPRITE_SET_LIST_60F3_S13	; [0Dh]
	DW	SPRITE_SET_LIST_6104_S14	; [0Eh]
	DW	SPRITE_SET_LIST_6115_S15	; [0Fh]
	DW	SPRITE_SET_LIST_612A_S16	; [10h]
	DW	SPRITE_SET_LIST_6135_S17	; [11h]
	DW	SPRITE_SET_LIST_6146_S18	; [12h]
	DW	SPRITE_SET_LIST_614D_S19	; [13h]
	DW	SPRITE_SET_LIST_6156_S20	; [14h]
	DW	SPRITE_SET_LIST_615D_S21	; [15h]
	DW	SPRITE_SET_LIST_6162_S22	; [16h]
	DW	SPRITE_SET_LIST_6169_S23	; [17h]

; Common gameplay fixed-VRAM sprite pattern command list (4 RLE + 1 raw command + FFh = 28B
; -> populates shared projectile/pickup/explosion patterns in VRAM F880h-FA7Fh), executed at
; Bank 00 564Ah via 4AB0h.
COMMON_DIRECT_SPRITE_CMD_LIST:
	DB	00h	; RLE sprite upload
	DW	SPRITE_RES_COMMON_DIRECT0_70BC,F880h
	DB	00h	; RLE sprite upload
	DW	SPRITE_RES_COMMON_DIRECT1_7173,F8C0h
	DB	00h	; RLE sprite upload
	DW	SPRITE_RES_COMMON_DIRECT2_72D5,F940h
	DB	00h	; RLE sprite upload
	DW	SPRITE_RES_COMMON_DIRECT3_72C0,FA40h
	DB	02h	; Raw sprite upload
	DW	SPRITE_RES_COMMON_DIRECT4_7153,0020h,FA60h
	DB	FFh	; End of direct sprite list

; Alternate/ending fixed-VRAM sprite pattern command list (3 RLE commands + FFh = 16B ->
; populates ending sprite patterns in VRAM F800h-F8BFh), executed from Bank 06 AD68h (LD
; HL,604Ch ; CALL 563Eh).
ENDING_ALTERNATE_DIRECT_SPRITE_CMD_LIST:
	DB	00h	; RLE sprite upload
	DW	SPRITE_RES_ENDING_DIRECT0_73DA,VRAM_SPRITE_GEN_BASE
	DB	00h	; RLE sprite upload
	DW	SPRITE_RES_ENDING_DIRECT1_73C0,F880h
	DB	00h	; RLE sprite upload
	DW	SPRITE_RES_ENDING_DIRECT2_73C7,F8A0h
	DB	FFh	; End of direct sprite list

; Sprite-set resource list for Set 00 (L1R1), Set 01 (L1R2) (7 [dir_index, pattern_slot]
; pairs + FFh terminator = 15B).
SPRITE_SET_LIST_605C_S00_S01:
	DB	0Bh,50h	; Directory 0Bh -> VRAM slot 50h
	DB	0Ah,68h	; Directory 0Ah -> VRAM slot 68h
	DB	02h,70h	; Directory 02h -> VRAM slot 70h
	DB	13h,80h	; Directory 13h -> VRAM slot 80h
	DB	06h,90h	; Directory 06h -> VRAM slot 90h
	DB	10h,A0h	; Directory 10h -> VRAM slot A0h
	DB	00h,B0h	; Directory 00h -> VRAM slot B0h
	DB	FFh	; End of sprite-set list

; Sprite-set resource list for Set 02 (L1R3) (9 [dir_index, pattern_slot] pairs + FFh
; terminator = 19B).
SPRITE_SET_LIST_606B_S02:
	DB	0Bh,58h	; Directory 0Bh -> VRAM slot 58h
	DB	0Ah,50h	; Directory 0Ah -> VRAM slot 50h
	DB	02h,90h	; Directory 02h -> VRAM slot 90h
	DB	13h,70h	; Directory 13h -> VRAM slot 70h
	DB	06h,80h	; Directory 06h -> VRAM slot 80h
	DB	10h,A0h	; Directory 10h -> VRAM slot A0h
	DB	00h,B0h	; Directory 00h -> VRAM slot B0h
	DB	03h,D0h	; Directory 03h -> VRAM slot D0h
	DB	04h,F8h	; Directory 04h -> VRAM slot F8h
	DB	FFh	; End of sprite-set list

; Sprite-set resource list for Set 03 (L2R1), Set 04 (L2R2) (10 [dir_index, pattern_slot]
; pairs + FFh terminator = 21B).
SPRITE_SET_LIST_607E_S03_S04:
	DB	01h,50h	; Directory 01h -> VRAM slot 50h
	DB	0Eh,58h	; Directory 0Eh -> VRAM slot 58h
	DB	0Fh,78h	; Directory 0Fh -> VRAM slot 78h
	DB	11h,88h	; Directory 11h -> VRAM slot 88h
	DB	0Bh,90h	; Directory 0Bh -> VRAM slot 90h
	DB	05h,A8h	; Directory 05h -> VRAM slot A8h
	DB	0Ch,B8h	; Directory 0Ch -> VRAM slot B8h
	DB	0Ah,C8h	; Directory 0Ah -> VRAM slot C8h
	DB	14h,D0h	; Directory 14h (cut Enemy 16 flying turtle, id=16h) -> VRAM slot D0h (CF16h=D0h)
	DB	13h,E0h	; Directory 13h -> VRAM slot E0h
	DB	FFh	; End of sprite-set list

; Sprite-set resource list for Set 05 (L2R3) (9 [dir_index, pattern_slot] pairs + FFh
; terminator = 19B).
SPRITE_SET_LIST_6093_S05:
	DB	03h,50h	; Directory 03h -> VRAM slot 50h
	DB	0Eh,78h	; Directory 0Eh -> VRAM slot 78h
	DB	0Bh,98h	; Directory 0Bh -> VRAM slot 98h
	DB	08h,B0h	; Directory 08h -> VRAM slot B0h
	DB	09h,B0h	; Directory 09h -> VRAM slot B0h
	DB	04h,C0h	; Directory 04h -> VRAM slot C0h
	DB	05h,C8h	; Directory 05h -> VRAM slot C8h
	DB	12h,D8h	; Directory 12h -> VRAM slot D8h
	DB	13h,E8h	; Directory 13h -> VRAM slot E8h
	DB	FFh	; End of sprite-set list

; Sprite-set resource list for Set 06 (L3R1), Set 07 (L3R2), Set 08 (L3R3) (6 [dir_index,
; pattern_slot] pairs + FFh terminator = 13B).
SPRITE_SET_LIST_60A6_S06_S07_S08:
	DB	0Dh,50h	; Directory 0Dh -> VRAM slot 50h
	DB	0Eh,70h	; Directory 0Eh -> VRAM slot 70h
	DB	05h,90h	; Directory 05h -> VRAM slot 90h
	DB	01h,A0h	; Directory 01h -> VRAM slot A0h
	DB	10h,B0h	; Directory 10h -> VRAM slot B0h
	DB	13h,C0h	; Directory 13h -> VRAM slot C0h
	DB	FFh	; End of sprite-set list

; Sprite-set resource list for Set 09 (L4R1) (8 [dir_index, pattern_slot] pairs + FFh
; terminator = 17B).
SPRITE_SET_LIST_60B3_S09:
	DB	12h,50h	; Directory 12h -> VRAM slot 50h
	DB	10h,60h	; Directory 10h -> VRAM slot 60h
	DB	0Bh,70h	; Directory 0Bh -> VRAM slot 70h
	DB	15h,88h	; Directory 15h -> VRAM slot 88h
	DB	05h,90h	; Directory 05h -> VRAM slot 90h
	DB	08h,A0h	; Directory 08h -> VRAM slot A0h
	DB	09h,A0h	; Directory 09h -> VRAM slot A0h
	DB	13h,B0h	; Directory 13h -> VRAM slot B0h
	DB	FFh	; End of sprite-set list

; Sprite-set resource list for Set 10 (L4R2) (6 [dir_index, pattern_slot] pairs + FFh
; terminator = 13B).
SPRITE_SET_LIST_60C4_S10:
	DB	13h,50h	; Directory 13h -> VRAM slot 50h
	DB	0Bh,60h	; Directory 0Bh -> VRAM slot 60h
	DB	15h,78h	; Directory 15h -> VRAM slot 78h
	DB	12h,80h	; Directory 12h -> VRAM slot 80h
	DB	07h,90h	; Directory 07h -> VRAM slot 90h
	DB	0Eh,A0h	; Directory 0Eh -> VRAM slot A0h
	DB	FFh	; End of sprite-set list

; Sprite-set resource list for Set 11 (L4R3) (7 [dir_index, pattern_slot] pairs + FFh
; terminator = 15B).
SPRITE_SET_LIST_60D1_S11:
	DB	12h,50h	; Directory 12h -> VRAM slot 50h
	DB	15h,60h	; Directory 15h -> VRAM slot 60h
	DB	01h,68h	; Directory 01h -> VRAM slot 68h
	DB	17h,70h	; Directory 17h -> VRAM slot 70h
	DB	0Eh,90h	; Directory 0Eh -> VRAM slot 90h
	DB	07h,B0h	; Directory 07h -> VRAM slot B0h
	DB	28h,FCh	; Directory 28h -> VRAM slot FCh
	DB	FFh	; End of sprite-set list

; Sprite-set resource list for Set 12 (L5R1) (9 [dir_index, pattern_slot] pairs + FFh
; terminator = 19B).
SPRITE_SET_LIST_60E0_S12:
	DB	0Bh,50h	; Directory 0Bh -> VRAM slot 50h
	DB	12h,68h	; Directory 12h -> VRAM slot 68h
	DB	07h,78h	; Directory 07h -> VRAM slot 78h
	DB	16h,88h	; Directory 16h -> VRAM slot 88h
	DB	15h,A8h	; Directory 15h -> VRAM slot A8h
	DB	18h,B0h	; Directory 18h -> VRAM slot B0h
	DB	06h,D0h	; Directory 06h -> VRAM slot D0h
	DB	13h,E0h	; Directory 13h -> VRAM slot E0h
	DB	28h,FCh	; Directory 28h -> VRAM slot FCh
	DB	FFh	; End of sprite-set list

; Sprite-set resource list for Set 13 (L5R2) (8 [dir_index, pattern_slot] pairs + FFh
; terminator = 17B).
SPRITE_SET_LIST_60F3_S13:
	DB	16h,50h	; Directory 16h -> VRAM slot 50h
	DB	13h,70h	; Directory 13h -> VRAM slot 70h
	DB	11h,80h	; Directory 11h -> VRAM slot 80h
	DB	18h,88h	; Directory 18h -> VRAM slot 88h
	DB	06h,A8h	; Directory 06h -> VRAM slot A8h
	DB	15h,B8h	; Directory 15h -> VRAM slot B8h
	DB	17h,C0h	; Directory 17h -> VRAM slot C0h
	DB	28h,FCh	; Directory 28h -> VRAM slot FCh
	DB	FFh	; End of sprite-set list

; Sprite-set resource list for Set 14 (L5R3) (8 [dir_index, pattern_slot] pairs + FFh
; terminator = 17B).
SPRITE_SET_LIST_6104_S14:
	DB	16h,50h	; Directory 16h -> VRAM slot 50h
	DB	13h,70h	; Directory 13h -> VRAM slot 70h
	DB	11h,80h	; Directory 11h -> VRAM slot 80h
	DB	17h,88h	; Directory 17h -> VRAM slot 88h
	DB	06h,A8h	; Directory 06h -> VRAM slot A8h
	DB	0Fh,B8h	; Directory 0Fh -> VRAM slot B8h
	DB	12h,C8h	; Directory 12h -> VRAM slot C8h
	DB	28h,FCh	; Directory 28h -> VRAM slot FCh
	DB	FFh	; End of sprite-set list

; Sprite-set resource list for Set 15 (L6R1) (10 [dir_index, pattern_slot] pairs + FFh
; terminator = 21B).
SPRITE_SET_LIST_6115_S15:
	DB	02h,50h	; Directory 02h -> VRAM slot 50h
	DB	0Ah,60h	; Directory 0Ah -> VRAM slot 60h
	DB	08h,68h	; Directory 08h -> VRAM slot 68h
	DB	09h,68h	; Directory 09h -> VRAM slot 68h
	DB	12h,78h	; Directory 12h -> VRAM slot 78h
	DB	27h,88h	; Directory 27h -> VRAM slot 88h
	DB	18h,90h	; Directory 18h -> VRAM slot 90h
	DB	11h,B0h	; Directory 11h -> VRAM slot B0h
	DB	0Eh,B8h	; Directory 0Eh -> VRAM slot B8h
	DB	28h,FCh	; Directory 28h -> VRAM slot FCh
	DB	FFh	; End of sprite-set list

; Sprite-set resource list for Set 16 (L6R2) (5 [dir_index, pattern_slot] pairs + FFh
; terminator = 11B).
SPRITE_SET_LIST_612A_S16:
	DB	06h,50h	; Directory 06h -> VRAM slot 50h
	DB	27h,60h	; Directory 27h -> VRAM slot 60h
	DB	0Ch,68h	; Directory 0Ch -> VRAM slot 68h
	DB	11h,78h	; Directory 11h -> VRAM slot 78h
	DB	0Eh,80h	; Directory 0Eh -> VRAM slot 80h
	DB	FFh	; End of sprite-set list

; Sprite-set resource list for Set 17 (L6R3) (8 [dir_index, pattern_slot] pairs + FFh
; terminator = 17B).
SPRITE_SET_LIST_6135_S17:
	DB	27h,50h	; Directory 27h -> VRAM slot 50h
	DB	15h,58h	; Directory 15h -> VRAM slot 58h
	DB	0Ch,60h	; Directory 0Ch -> VRAM slot 60h
	DB	01h,70h	; Directory 01h -> VRAM slot 70h
	DB	11h,78h	; Directory 11h -> VRAM slot 78h
	DB	16h,80h	; Directory 16h -> VRAM slot 80h
	DB	13h,A0h	; Directory 13h -> VRAM slot A0h
	DB	28h,FCh	; Directory 28h -> VRAM slot FCh
	DB	FFh	; End of sprite-set list

; Sprite-set resource list for Set 18 (Boss 1) (3 [dir_index, pattern_slot] pairs + FFh
; terminator = 7B).
SPRITE_SET_LIST_6146_S18:
	DB	19h,50h	; Directory 19h -> VRAM slot 50h
	DB	1Fh,B0h	; Directory 1Fh -> VRAM slot B0h
	DB	1Eh,F0h	; Directory 1Eh -> VRAM slot F0h
	DB	FFh	; End of sprite-set list

; Sprite-set resource list for Set 19 (Boss 2) (4 [dir_index, pattern_slot] pairs + FFh
; terminator = 9B).
SPRITE_SET_LIST_614D_S19:
	DB	1Ah,50h	; Directory 1Ah -> VRAM slot 50h
	DB	20h,D0h	; Directory 20h -> VRAM slot D0h
	DB	21h,D8h	; Directory 21h -> VRAM slot D8h
	DB	1Eh,F0h	; Directory 1Eh -> VRAM slot F0h
	DB	FFh	; End of sprite-set list

; Sprite-set resource list for Set 20 (Boss 3) (3 [dir_index, pattern_slot] pairs + FFh
; terminator = 7B).
SPRITE_SET_LIST_6156_S20:
	DB	1Bh,50h	; Directory 1Bh -> VRAM slot 50h
	DB	22h,94h	; Directory 22h -> VRAM slot 94h
	DB	1Eh,F0h	; Directory 1Eh -> VRAM slot F0h
	DB	FFh	; End of sprite-set list

; Sprite-set resource list for Set 21 (Boss 4) (2 [dir_index, pattern_slot] pairs + FFh
; terminator = 5B).
SPRITE_SET_LIST_615D_S21:
	DB	23h,9Ch	; Directory 23h -> VRAM slot 9Ch
	DB	1Eh,F0h	; Directory 1Eh -> VRAM slot F0h
	DB	FFh	; End of sprite-set list

; Sprite-set resource list for Set 22 (Boss 5) (3 [dir_index, pattern_slot] pairs + FFh
; terminator = 7B).
SPRITE_SET_LIST_6162_S22:
	DB	1Ch,50h	; Directory 1Ch -> VRAM slot 50h
	DB	24h,B0h	; Directory 24h -> VRAM slot B0h
	DB	1Eh,F0h	; Directory 1Eh -> VRAM slot F0h
	DB	FFh	; End of sprite-set list

; Sprite-set resource list for Set 23 (Boss 6) (4 [dir_index, pattern_slot] pairs + FFh
; terminator = 9B).
SPRITE_SET_LIST_6169_S23:
	DB	1Dh,50h	; Directory 1Dh -> VRAM slot 50h
	DB	25h,B0h	; Directory 25h -> VRAM slot B0h
	DB	26h,B0h	; Directory 26h -> VRAM slot B0h
	DB	1Eh,F0h	; Directory 1Eh -> VRAM slot F0h
	DB	FFh	; End of sprite-set list

	IF	HINOTORI_ENHANCED = 00h

; Unreferenced 1-byte FFh empty sprite-set list / terminator pad immediately preceding
; SpriteResourceDirectory at 6173h.
UNREFERENCED_EMPTY_SPRITE_SET_LIST_6172:
	DB	FFh	; End of sprite-set list
	ENDIF

; 41-entry x 6-byte sprite resource directory (dir#00..dir#28, 246B); each record is
; [logical_id, mode, DW src_cpu, DW expanded_size] read by Bank 00 5688h-56D7h (all 41
; entries are referenced across the 20 sprite-set lists).
SPRITE_RESOURCE_DIRECTORY:
	DB	01h,00h	; Dir 00h: logical ID 01h (RLE)
	DW	SPRITE_RES_DIR00_6F77,0100h
	DB	02h,00h	; Dir 01h: logical ID 02h (RLE)
	DW	SPRITE_RES_DIR01_6C52,0040h
	DB	03h,00h	; Dir 02h: logical ID 03h (RLE)
	DW	SPRITE_RES_DIR02_699A,0080h
	DB	04h,00h	; Dir 03h: logical ID 04h (RLE)
	DW	SPRITE_RES_DIR03_6790,0100h
	DB	05h,00h	; Dir 04h: logical ID 05h (RLE)
	DW	SPRITE_RES_DIR04_6893,0040h
	DB	06h,00h	; Dir 05h: logical ID 06h (RLE)
	DW	SPRITE_RES_DIR05_6917,0080h
	DB	07h,00h	; Dir 06h: logical ID 07h (RLE)
	DW	SPRITE_RES_DIR06_6A1D,0080h
	DB	09h,00h	; Dir 07h: logical ID 09h (RLE)
	DW	SPRITE_RES_DIR07_6AA0,0080h
	DB	0Ah,00h	; Dir 08h: logical ID 0Ah (RLE)
	DW	SPRITE_RES_DIR08_DIR09_6E0D,0080h
	DB	0Bh,00h	; Dir 09h: logical ID 0Bh (RLE)
	DW	SPRITE_RES_DIR08_DIR09_6E0D,0080h
	DB	0Ch,00h	; Dir 0Ah: logical ID 0Ch (RLE)
	DW	SPRITE_RES_DIR0A_68D5,0040h
	DB	0Dh,00h	; Dir 0Bh: logical ID 0Dh (RLE)
	DW	SPRITE_RES_DIR0B_6BA6,00C0h
	DB	0Eh,00h	; Dir 0Ch: logical ID 0Eh (RLE)
	DW	SPRITE_RES_DIR0C_6B23,0080h
	DB	0Fh,00h	; Dir 0Dh: logical ID 0Fh (RLE)
	DW	SPRITE_RES_DIR0D_6C94,0100h
	DB	10h,00h	; Dir 0Eh: logical ID 10h (RLE)
	DW	SPRITE_RES_DIR0E_6E90,0100h
	DB	11h,00h	; Dir 0Fh: logical ID 11h (RLE)
	DW	SPRITE_RES_DIR0F_6D8A,0080h
	DB	12h,00h	; Dir 10h: logical ID 12h (RLE)
	DW	SPRITE_RES_DIR10_6649,0080h
	DB	13h,00h	; Dir 11h: logical ID 13h (RLE)
	DW	SPRITE_RES_DIR11_66CC,0040h
	DB	14h,00h	; Dir 12h: logical ID 14h (RLE)
	DW	SPRITE_RES_DIR12_670E,0080h
	DB	15h,00h	; Dir 13h: logical ID 15h (RLE)
	DW	SPRITE_RES_DIR13_65C9,0080h
	DB	16h,00h	; Dir 14h: logical ID 16h (RLE; cut Stage 2 flying turtle chaser, poses 2Ch/2Dh)
	DW	SPRITE_RES_DIR14_6504,0080h
	DB	17h,00h	; Dir 15h: logical ID 17h (RLE)
	DW	SPRITE_RES_DIR15_6587,0040h
	DB	18h,00h	; Dir 16h: logical ID 18h (RLE)
	DW	SPRITE_RES_DIR16_642A,0100h
	DB	19h,00h	; Dir 17h: logical ID 19h (RLE)
	DW	SPRITE_RES_DIR17_6269,0100h
	DB	1Ah,00h	; Dir 18h: logical ID 1Ah (RLE)
	DW	SPRITE_RES_DIR18_6335,0100h
	DB	1Bh,00h	; Dir 19h: logical ID 1Bh (RLE)
	DW	SPRITE_RES_DIR19_85B3,0300h
	DB	1Dh,00h	; Dir 1Ah: logical ID 1Dh (RLE)
	DW	SPRITE_RES_DIR1A_886D,0400h
	DB	1Ch,00h	; Dir 1Bh: logical ID 1Ch (RLE)
	DW	SPRITE_RES_DIR1B_8C19,0220h
	DB	1Fh,00h	; Dir 1Ch: logical ID 1Fh (RLE)
	DW	SPRITE_RES_DIR1C_8DE0,0300h
	DB	20h,00h	; Dir 1Dh: logical ID 20h (RLE)
	DW	SPRITE_RES_DIR1D_90A2,0300h
	DB	21h,00h	; Dir 1Eh: logical ID 21h (RLE)
	DW	SPRITE_RES_DIR1E_9569,0080h
	DB	24h,00h	; Dir 1Fh: logical ID 24h (RLE)
	DW	SPRITE_RES_DIR1F_9398,0080h
	DB	22h,00h	; Dir 20h: logical ID 22h (RLE)
	DW	SPRITE_RES_DIR20_9429,0040h
	DB	23h,00h	; Dir 21h: logical ID 23h (RLE)
	DW	SPRITE_RES_DIR21_93E7,0040h
	DB	29h,00h	; Dir 22h: logical ID 29h (RLE)
	DW	SPRITE_RES_DIR22_9467,0040h
	DB	25h,00h	; Dir 23h: logical ID 25h (RLE)
	DW	SPRITE_RES_DIR23_94A4,0040h
	DB	26h,00h	; Dir 24h: logical ID 26h (RLE)
	DW	SPRITE_RES_DIR24_94E6,0040h
	DB	27h,00h	; Dir 25h: logical ID 27h (RLE)
	DW	SPRITE_RES_DIR25_DIR26_9528,0040h
	DB	28h,00h	; Dir 26h: logical ID 28h (RLE)
	DW	SPRITE_RES_DIR25_DIR26_9528,0040h
	DB	2Ah,00h	; Dir 27h: logical ID 2Ah (RLE)
	DW	SPRITE_RES_DIR27_707A,0040h
	DB	00h,02h	; Dir 28h: logical ID 00h (raw)
	DW	SPRITE_RES_DIR28_7133,0020h

; Active RLE sprite resource dir#17(id=19h) at CPU 6269h (204B packed -> 0100h = 8 x 16x16
; patterns).
SPRITE_RES_DIR17_6269:
	DB	08h,00h,88h,03h,0Fh,1Fh,1Fh,3Fh,3Fh,5Dh,4Eh,08h,00h,88h,F0h,F8h
	DB	FCh,F2h,F7h,FFh,7Fh,F9h,08h,00h,88h,03h,0Ch,13h,17h,2Fh,2Fh,77h
	DB	7Fh,08h,00h,90h,F0h,08h,8Ch,DEh,EDh,E5h,D9h,BFh,93h,E3h,E1h,92h
	DB	97h,7Fh,FFh,5Fh,03h,DFh,8Ah,D3h,E0h,E0h,40h,40h,F9h,FEh,C8h,88h
	DB	98h,04h,FCh,82h,DCh,88h,05h,00h,88h,F3h,A3h,A1h,F3h,F7h,7Ch,8Fh
	DB	7Fh,03h,FFh,87h,F3h,E0h,E0h,40h,40h,EFh,1Eh,03h,F8h,86h,ECh,CCh
	DB	FCh,FCh,DCh,88h,0Dh,00h,82h,0Fh,1Fh,04h,3Fh,82h,7Ah,FDh,08h,00h
	DB	88h,C0h,F0h,F8h,FCh,FCh,F4h,F2h,F9h,08h,00h,88h,0Fh,10h,27h,2Fh
	DB	3Fh,3Fh,7Fh,8Fh,08h,00h,94h,C0h,70h,08h,84h,CCh,DCh,9Eh,FFh,DBh
	DB	D3h,54h,58h,59h,FFh,EFh,FFh,FFh,5Fh,47h,03h,04h,00h,03h,FFh,02h
	DB	B9h,83h,CEh,E8h,FCh,03h,FEh,82h,3Eh,0Ch,03h,00h,8Ch,FBh,F3h,77h
	DB	7Fh,7Fh,FEh,EDh,FFh,FFh,5Fh,47h,03h,04h,00h,8Dh,EDh,1Dh,F7h,AFh
	DB	BFh,FEh,F8h,FCh,E6h,CEh,FEh,3Eh,0Ch,03h,00h,00h

; Active RLE sprite resource dir#18(id=1Ah) at CPU 6335h (245B packed -> 0100h = 8 x 16x16
; patterns).
SPRITE_RES_DIR18_6335:
	DB	05h,00h,8Bh,01h,03h,04h,05h,0Bh,1Bh,37h,23h,57h,5Ah,3Fh,05h,00h
	DB	8Bh,C0h,20h,90h,50h,ECh,EEh,F5h,F9h,4Eh,3Dh,F1h,05h,00h,8Bh,01h
	DB	02h,07h,07h,0Fh,1Eh,2Fh,3Fh,7Dh,7Fh,2Bh,05h,00h,CBh,C0h,E0h,70h
	DB	F0h,FCh,BAh,7Bh,DFh,BEh,FBh,EFh,2Dh,19h,0Fh,0Eh,0Bh,1Fh,12h,2Eh
	DB	34h,34h,48h,ADh,FFh,3Fh,0Fh,03h,5Ah,2Ch,D2h,9Ah,66h,AAh,11h,15h
	DB	09h,0Eh,19h,F3h,F5h,FEh,F8h,80h,3Bh,1Fh,0Bh,0Bh,0Fh,1Fh,1Eh,3Eh
	DB	2Ch,3Ch,78h,DDh,FFh,3Fh,0Fh,03h,B6h,FCh,FEh,F6h,FAh,BEh,1Fh,1Bh
	DB	0Fh,0Eh,1Fh,FDh,FBh,FEh,F8h,80h,04h,00h,8Ch,03h,06h,09h,0Ah,17h
	DB	37h,6Fh,47h,AEh,B4h,7Fh,5Ah,04h,00h,8Ch,80h,40h,20h,A0h,D8h,DCh
	DB	EAh,F2h,9Ch,7Ah,E2h,B4h,04h,00h,8Ch,03h,05h,0Eh,0Fh,1Fh,3Dh,5Eh
	DB	7Fh,FBh,FFh,57h,77h,04h,00h,B3h,80h,C0h,E0h,E0h,F8h,74h,F6h,BEh
	DB	7Ch,F6h,DEh,6Ch,32h,1Fh,1Eh,15h,0Fh,0Ah,07h,03h,02h,03h,1Ch,7Dh
	DB	7Eh,1Fh,03h,00h,7Ch,D8h,A8h,C8h,50h,A0h,A0h,E0h,30h,68h,70h,BCh
	DB	7Ch,F0h,80h,00h,3Fh,17h,17h,1Fh,0Fh,0Fh,06h,03h,03h,8Bh,1Fh,7Eh
	DB	7Fh,1Fh,03h,00h,FCh,F8h,D8h,B8h,F0h,03h,60h,88h,F0h,F8h,B0h,7Ch
	DB	FCh,F0h,80h,00h,00h

; Active RLE sprite resource dir#16(id=18h) at CPU 642Ah (218B packed -> 0100h = 8 x 16x16
; patterns).
SPRITE_RES_DIR16_642A:
	DB	08h,00h,03h,03h,85h,0Fh,1Eh,2Fh,4Fh,5Fh,07h,00h,89h,80h,E0h,F8h
	DB	FCh,FCh,BAh,7Ah,FEh,FAh,08h,00h,88h,03h,02h,02h,0Fh,13h,31h,7Bh
	DB	6Fh,07h,00h,94h,80h,60h,38h,24h,E4h,E6h,F6h,FEh,FEh,77h,77h,7Fh
	DB	4Fh,37h,05h,07h,07h,0Eh,1Fh,1Fh,03h,3Fh,83h,13h,00h,F4h,03h,F8h
	DB	86h,E8h,68h,28h,34h,7Ch,7Ch,03h,F8h,8Eh,E0h,80h,00h,77h,75h,5Fh
	DB	7Fh,35h,07h,07h,05h,0Eh,1Fh,1Fh,03h,3Fh,91h,13h,00h,F4h,E8h,38h
	DB	F8h,F8h,58h,38h,34h,4Ch,6Ch,F8h,C8h,F8h,E0h,80h,08h,00h,89h,01h
	DB	07h,1Fh,3Fh,3Fh,7Dh,5Eh,7Fh,5Fh,08h,00h,03h,C0h,85h,F0h,78h,F4h
	DB	F2h,FAh,07h,00h,89h,01h,06h,1Ch,24h,27h,67h,6Fh,7Fh,7Fh,08h,00h
	DB	89h,C0h,40h,40h,F0h,C8h,8Ch,DEh,F6h,2Fh,03h,1Fh,96h,17h,16h,14h
	DB	1Eh,3Eh,7Fh,7Fh,3Fh,3Fh,1Fh,0Eh,00h,EEh,EEh,FEh,F2h,ECh,A0h,E0h
	DB	E0h,C0h,E0h,03h,F0h,9Dh,A0h,00h,00h,2Fh,17h,1Ch,1Fh,1Fh,1Ah,1Ch
	DB	1Eh,32h,7Bh,7Fh,33h,3Fh,1Fh,0Eh,00h,EEh,AEh,FAh,FEh,ACh,E0h,E0h
	DB	A0h,C0h,E0h,03h,F0h,83h,A0h,00h,00h,00h

; RLE sprite resource dir#14 (logical ID 16h, OBJ_TYPE 16h cut Stage 2 flying turtle/guardian)
; at CPU 6504h (131B packed -> 0080h = 4 x 16x16 OR-color patterns for 2-frame poses 2Ch/2Dh).
; Still uploaded to VRAM slot D0h (CF16h=D0h) on Stage 2 Routes 1 & 2 in both retail ROMs even
; though its post-horizontal-wrap spawner in Bank 01 was disabled by NOOP_POST_TRANSITION_HOOK.
SPRITE_RES_DIR14_6504:
	DB	FFh,03h,07h,1Eh,2Bh,5Dh,6Fh,9Dh,AFh,EBh,F0h,6Eh,77h,26h,76h,5Ch
	DB	38h,80h,C0h,F0h,A8h,64h,FAh,52h,FAh,B6h,5Ah,ACh,D4h,4Ch,2Ah,2Fh
	DB	15h,03h,04h,1Fh,3Eh,6Ah,5Dh,FFh,DEh,FFh,9Fh,5Dh,7Fh,3Eh,5Ah,64h
	DB	38h,80h,40h,F0h,F8h,BCh,6Eh,FEh,FEh,FAh,BEh,7Ch,ECh,74h,3Eh,31h
	DB	1Bh,01h,03h,0Fh,15h,26h,5Fh,4Ah,5Fh,6Dh,5Ah,35h,2Bh,32h,54h,F4h
	DB	A8h,C0h,E0h,78h,D4h,BAh,F6h,B9h,F5h,D7h,0Fh,76h,EEh,64h,6Eh,3Ah
	DB	1Ch,01h,02h,0Fh,1Fh,3Dh,76h,7Fh,7Fh,5Fh,7Dh,3Eh,37h,2Eh,7Ch,8Ch
	DB	D8h,C0h,20h,F8h,7Ch,56h,BAh,FFh,7Bh,FFh,F9h,BAh,FEh,7Ch,5Ah,26h
	DB	81h,1Ch,00h

; Active RLE sprite resource dir#15(id=17h) at CPU 6587h (66B packed -> 0040h = 2 x 16x16
; patterns).
SPRITE_RES_DIR15_6587:
	DB	88h,03h,06h,05h,07h,0Fh,1Fh,3Fh,3Fh,03h,1Fh,B5h,37h,7Fh,FFh,DFh
	DB	3Ch,E0h,30h,D0h,58h,FCh,BCh,EEh,BAh,76h,FBh,EFh,D7h,FBh,FFh,FFh
	DB	CEh,03h,05h,07h,05h,0Ah,16h,2Fh,33h,18h,10h,10h,2Ah,40h,A9h,D7h
	DB	3Ch,E0h,D0h,70h,F8h,A4h,64h,DAh,56h,CAh,05h,19h,29h,05h,13h,B5h
	DB	CEh,00h

; Active RLE sprite resource dir#13(id=15h) at CPU 65C9h (128B packed -> 0080h = 4 x 16x16
; patterns).
SPRITE_RES_DIR13_65C9:
	DB	02h,00h,8Ch,07h,0Fh,1Fh,2Fh,3Fh,3Fh,17h,2Dh,23h,14h,08h,04h,04h
	DB	00h,8Ch,E0h,D0h,F8h,F4h,B8h,E8h,F4h,A8h,54h,48h,90h,20h,03h,00h
	DB	9Eh,07h,18h,30h,20h,50h,40h,40h,68h,52h,5Ch,2Bh,37h,1Bh,07h,00h
	DB	00h,E0h,18h,2Ch,04h,0Ah,46h,16h,0Ah,56h,AAh,B4h,6Ch,D8h,E0h,03h
	DB	00h,8Ch,02h,09h,02h,2Bh,05h,07h,13h,0Fh,2Bh,1Eh,0Fh,05h,04h,00h
	DB	8Ch,80h,50h,E8h,B8h,F4h,FCh,7Ch,FCh,FCh,F8h,F0h,E0h,03h,00h,9Fh
	DB	07h,1Dh,36h,3Dh,54h,7Ah,78h,6Ch,70h,54h,21h,30h,1Ah,07h,00h,00h
	DB	E0h,78h,ACh,14h,46h,0Ah,02h,82h,02h,02h,04h,0Ch,18h,E0h,00h,00h

; Active RLE sprite resource dir#10(id=12h) at CPU 6649h (131B packed -> 0080h = 4 x 16x16
; patterns).
SPRITE_RES_DIR10_6649:
	DB	FFh,72h,BBh,DFh,AFh,D6h,6Dh,7Fh,FEh,7Fh,DBh,FDh,4Fh,07h,01h,02h
	DB	04h,4Eh,DDh,FBh,F5h,6Bh,B6h,FEh,7Fh,FEh,DBh,BFh,F2h,E0h,80h,40h
	DB	20h,72h,CBh,A6h,D5h,ABh,57h,6Eh,BDh,4Ah,B5h,B3h,4Bh,06h,01h,02h
	DB	04h,4Eh,D3h,65h,ABh,D5h,EAh,76h,BDh,52h,ADh,CDh,D2h,60h,80h,40h
	DB	20h,2Ah,57h,6Fh,57h,6Ah,35h,7Fh,FEh,7Fh,FBh,BDh,EFh,47h,01h,02h
	DB	02h,54h,EAh,F6h,EAh,56h,ACh,FEh,7Fh,FEh,DFh,BDh,F7h,E2h,80h,40h
	DB	40h,3Ah,6Fh,56h,6Bh,57h,2Fh,76h,BDh,4Ah,95h,F3h,ABh,46h,01h,02h
	DB	02h,5Ch,F6h,6Ah,D6h,EAh,F4h,6Eh,BDh,52h,A9h,CFh,D5h,62h,80h,40h
	DB	81h,40h,00h

; Active RLE sprite resource dir#11(id=13h) at CPU 66CCh (66B packed -> 0040h = 2 x 16x16
; patterns).
SPRITE_RES_DIR11_66CC:
	DB	ABh,06h,1Dh,31h,63h,45h,42h,5Dh,2Eh,3Fh,1Fh,17h,09h,0Ch,0Bh,07h
	DB	03h,30h,5Ch,C6h,63h,D1h,21h,DDh,3Ah,7Eh,7Ch,B4h,C8h,98h,E8h,F0h
	DB	E0h,06h,1Fh,3Eh,7Ch,7Ah,7Dh,72h,3Fh,3Fh,17h,1Ah,03h,0Fh,92h,05h
	DB	03h,30h,7Ch,BEh,9Fh,2Fh,DFh,27h,FEh,FEh,F4h,ECh,F8h,78h,F8h,50h
	DB	E0h,00h

; Active RLE sprite resource dir#12(id=14h) at CPU 670Eh (130B packed -> 0080h = 4 x 16x16
; patterns).
SPRITE_RES_DIR12_670E:
	DB	CDh,00h,1Eh,25h,79h,47h,27h,05h,06h,0Fh,1Fh,16h,19h,16h,0Eh,05h
	DB	03h,00h,00h,84h,C2h,E2h,E7h,BDh,7Ah,FEh,B4h,C8h,B0h,00h,00h,40h
	DB	80h,00h,1Eh,3Bh,7Fh,46h,24h,06h,07h,09h,10h,19h,1Fh,1Eh,0Ah,07h
	DB	03h,00h,00h,84h,C2h,62h,27h,7Fh,CEh,86h,CCh,F8h,B0h,00h,00h,40h
	DB	80h,00h,01h,00h,00h,1Dh,3Fh,7Fh,ADh,D2h,ADh,C7h,47h,33h,03h,00h
	DB	9Dh,E0h,50h,38h,64h,FCh,FCh,68h,98h,70h,A0h,E2h,F2h,DCh,88h,70h
	DB	00h,00h,01h,00h,00h,1Dh,33h,61h,F3h,BFh,EEh,C4h,46h,33h,03h,00h
	DB	90h,E0h,70h,28h,7Ch,9Ch,0Ch,98h,F8h,F0h,60h,22h,72h,BCh,F8h,70h
	DB	00h,00h

; Active RLE sprite resource dir#03(id=04h) at CPU 6790h (259B packed -> 0100h = 8 x 16x16
; patterns).
SPRITE_RES_DIR03_6790:
	DB	C3h,14h,28h,48h,50h,90h,88h,45h,43h,23h,16h,3Fh,7Dh,DFh,FFh,FFh
	DB	EFh,28h,14h,12h,0Ah,09h,09h,D1h,E2h,62h,34h,7Eh,DDh,7Fh,FFh,7Eh
	DB	FEh,1Ch,38h,78h,70h,F0h,F8h,7Dh,7Eh,3Eh,1Dh,3Ah,4Fh,AAh,8Dh,9Eh
	DB	BBh,38h,1Ch,1Eh,0Eh,0Fh,0Fh,DFh,3Eh,BEh,DCh,AAh,7Bh,A9h,D9h,BEh
	DB	EAh,7Fh,77h,7Bh,03h,3Fh,FFh,2Bh,1Eh,3Ch,3Fh,3Fh,7Fh,7Fh,3Fh,0Fh
	DB	00h,FFh,7Fh,FFh,F6h,EEh,EEh,3Eh,7Ch,7Ch,FEh,FEh,DAh,DAh,FCh,E0h
	DB	00h,4Dh,5Eh,67h,32h,3Dh,27h,3Fh,1Eh,3Ch,3Fh,3Fh,7Fh,7Fh,3Fh,0Fh
	DB	00h,D9h,B9h,EDh,DEh,F2h,F2h,36h,4Ch,64h,DEh,82h,A6h,FEh,FCh,E0h
	DB	00h,14h,28h,48h,50h,90h,90h,8Bh,47h,46h,2Ch,7Eh,BBh,FEh,FFh,7Eh
	DB	7Fh,28h,14h,12h,0Ah,09h,11h,A2h,C2h,C4h,68h,FCh,BEh,FBh,FFh,FFh
	DB	F7h,1Ch,38h,78h,70h,F0h,F0h,FBh,7Ch,7Dh,3Bh,55h,DEh,95h,9Bh,75h
	DB	5Bh,38h,1Ch,1Eh,0Eh,0Fh,1Fh,BEh,7Eh,7Ch,B8h,5Ch,F2h,55h,B1h,59h
	DB	BDh,FEh,FFh,FFh,6Fh,77h,8Eh,77h,7Ch,3Eh,3Eh,7Fh,7Fh,5Bh,5Bh,3Fh
	DB	07h,00h,FEh,EEh,DEh,03h,FCh,AAh,D4h,78h,3Ch,FCh,FCh,FEh,FEh,FCh
	DB	F0h,00h,9Dh,9Fh,B7h,7Bh,4Fh,4Fh,6Ch,32h,26h,7Bh,41h,65h,7Fh,3Fh
	DB	07h,00h,72h,FAh,E6h,4Ch,BCh,E4h,FCh,78h,3Ch,FCh,FCh,FEh,FEh,FCh
	DB	F0h,00h,00h

; Active RLE sprite resource dir#04(id=05h) at CPU 6893h (66B packed -> 0040h = 2 x 16x16
; patterns).
SPRITE_RES_DIR04_6893:
	DB	93h,14h,28h,68h,50h,D0h,D0h,EBh,77h,7Eh,3Ch,1Eh,3Bh,7Eh,3Fh,1Eh
	DB	0Fh,28h,14h,16h,03h,0Bh,9Dh,B6h,CEh,FCh,78h,F0h,B8h,FCh,F8h,F0h
	DB	E0h,1Ch,38h,58h,70h,B0h,B0h,9Bh,4Ch,45h,2Bh,15h,1Eh,35h,1Bh,0Dh
	DB	07h,38h,1Ch,1Ah,03h,0Dh,8Ah,BAh,72h,44h,A8h,50h,F0h,58h,B0h,60h
	DB	C0h,00h

; Active RLE sprite resource dir#0A(id=0Ch) at CPU 68D5h (66B packed -> 0040h = 2 x 16x16
; patterns).
SPRITE_RES_DIR0A_68D5:
	DB	C0h,1Eh,25h,5Ah,6Dh,5Eh,EDh,BBh,AFh,95h,68h,9Dh,BBh,BFh,BCh,51h
	DB	3Fh,78h,A4h,5Ah,B6h,7Ah,B7h,DDh,F5h,A9h,16h,B9h,DDh,FDh,3Dh,8Ah
	DB	FCh,1Eh,3Bh,7Dh,76h,6Bh,B7h,DCh,DAh,FFh,57h,FBh,FFh,FFh,F7h,6Eh
	DB	3Fh,78h,DCh,BEh,6Eh,D6h,EDh,3Bh,5Bh,FFh,EAh,DFh,FFh,FFh,EFh,76h
	DB	FCh,00h

; Active RLE sprite resource dir#05(id=06h) at CPU 6917h (131B packed -> 0080h = 4 x 16x16
; patterns).
SPRITE_RES_DIR05_6917:
	DB	FFh,07h,0Bh,15h,33h,35h,7Eh,E7h,68h,E9h,F7h,77h,BBh,2Fh,1Fh,09h
	DB	04h,E0h,D0h,A8h,CCh,ACh,7Eh,E7h,16h,97h,EFh,EEh,DDh,F4h,F8h,90h
	DB	20h,07h,0Ch,1Ah,3Ch,3Eh,7Bh,FEh,77h,FEh,FFh,7Bh,BCh,2Fh,1Fh,09h
	DB	04h,E0h,30h,58h,3Ch,7Ch,DEh,7Fh,EEh,7Fh,FFh,DEh,3Dh,F4h,F8h,90h
	DB	20h,07h,08h,11h,33h,31h,7Eh,E7h,68h,E9h,F7h,73h,BDh,2Fh,1Fh,09h
	DB	04h,E0h,10h,88h,CCh,8Ch,7Eh,E7h,16h,97h,EFh,CEh,BDh,F4h,F8h,90h
	DB	20h,07h,0Fh,1Eh,3Ch,3Eh,79h,FEh,77h,FEh,FFh,7Ch,BEh,2Fh,1Fh,09h
	DB	04h,E0h,F0h,78h,3Ch,7Ch,9Eh,7Fh,EEh,7Fh,FFh,3Eh,7Dh,F4h,F8h,90h
	DB	81h,20h,00h

; Active RLE sprite resource dir#02(id=03h) at CPU 699Ah (131B packed -> 0080h = 4 x 16x16
; patterns).
SPRITE_RES_DIR02_699A:
	DB	FFh,41h,E2h,F3h,BDh,7Ah,56h,2Bh,4Dh,CEh,6Fh,36h,1Fh,15h,0Bh,05h
	DB	03h,82h,47h,CFh,BDh,5Eh,6Ah,D4h,B2h,73h,F6h,6Ch,F8h,A8h,D0h,A0h
	DB	C0h,41h,A3h,92h,CEh,45h,69h,3Ch,7Eh,BBh,56h,3Bh,18h,1Fh,0Fh,06h
	DB	03h,82h,C5h,49h,73h,A2h,96h,3Ch,7Eh,DDh,6Ah,DCh,18h,F8h,F0h,60h
	DB	C0h,41h,E2h,F3h,BDh,56h,26h,6Bh,CDh,6Eh,2Fh,16h,1Bh,15h,17h,0Bh
	DB	05h,82h,47h,CFh,BDh,6Ah,64h,D6h,B3h,76h,F4h,68h,D8h,A8h,E8h,D0h
	DB	A0h,41h,A3h,92h,CEh,69h,39h,7Ch,BEh,5Bh,36h,19h,1Ch,1Fh,1Fh,0Fh
	DB	06h,82h,C5h,49h,73h,96h,9Ch,3Eh,7Dh,DAh,6Ch,98h,38h,F8h,F8h,F0h
	DB	81h,60h,00h

; Active RLE sprite resource dir#06(id=07h) at CPU 6A1Dh (131B packed -> 0080h = 4 x 16x16
; patterns).
SPRITE_RES_DIR06_6A1D:
	DB	FFh,07h,0Ah,14h,15h,2Ch,33h,65h,CEh,97h,5Fh,6Ch,BDh,9Bh,AEh,73h
	DB	00h,E0h,50h,28h,A8h,34h,CCh,A6h,73h,E9h,FAh,36h,BDh,DAh,75h,D3h
	DB	0Eh,07h,0Dh,1Bh,1Fh,3Bh,3Ch,5Ah,B1h,ECh,66h,53h,EEh,FFh,DDh,73h
	DB	00h,E0h,B0h,D8h,F8h,DCh,3Ch,5Ah,8Dh,37h,66h,CAh,77h,FEh,BBh,DDh
	DB	0Eh,0Fh,14h,28h,2Dh,4Ch,73h,65h,CEh,97h,5Fh,6Ch,BDh,5Bh,AFh,CAh
	DB	71h,C0h,A0h,50h,A8h,38h,CCh,A6h,73h,E9h,FAh,36h,BDh,D9h,F5h,4Eh
	DB	80h,0Fh,1Bh,37h,37h,7Bh,7Ch,5Ah,B1h,ECh,66h,53h,EEh,7Fh,DDh,BBh
	DB	71h,C0h,60h,B0h,F8h,D8h,3Ch,5Ah,8Dh,37h,66h,CAh,77h,FFh,BBh,CEh
	DB	81h,80h,00h

; Active RLE sprite resource dir#07(id=09h) at CPU 6AA0h (131B packed -> 0080h = 4 x 16x16
; patterns).
SPRITE_RES_DIR07_6AA0:
	DB	FFh,01h,02h,0Dh,1Dh,17h,1Bh,3Ch,53h,6Dh,66h,3Dh,1Eh,1Eh,15h,0Bh
	DB	1Eh,E0h,D0h,ECh,EEh,FAh,F4h,CEh,F7h,EFh,CDh,16h,38h,BCh,D4h,68h
	DB	3Ch,01h,03h,0Eh,17h,1Ah,1Dh,27h,6Eh,5Bh,5Dh,26h,19h,13h,1Bh,0Dh
	DB	12h,E0h,30h,1Ch,3Ah,D6h,ECh,3Ah,DDh,39h,FBh,F6h,C8h,64h,ECh,58h
	DB	24h,01h,1Bh,17h,37h,59h,74h,7Ch,56h,5Bh,39h,18h,72h,E5h,78h,30h
	DB	00h,E0h,F6h,FAh,FAh,F4h,EEh,CDh,DBh,FBh,FAh,CCh,1Ah,E7h,9Eh,0Ch
	DB	00h,01h,1Ah,1Fh,3Ah,6Fh,4Fh,5Fh,6Fh,6Eh,3Fh,17h,6Fh,9Dh,48h,30h
	DB	00h,E0h,16h,2Eh,D6h,ECh,1Ah,FBh,FDh,D5h,36h,FCh,E6h,79h,92h,0Ch
	DB	81h,00h,00h

; Active RLE sprite resource dir#0C(id=0Eh) at CPU 6B23h (131B packed -> 0080h = 4 x 16x16
; patterns).
SPRITE_RES_DIR0C_6B23:
	DB	FFh,05h,0Fh,1Ch,1Bh,3Fh,2Fh,37h,7Bh,5Eh,7Ah,F7h,AFh,4Fh,37h,1Ah
	DB	0Fh,A0h,F0h,38h,D8h,FCh,F4h,ECh,DEh,7Ah,5Eh,EFh,F5h,F2h,ECh,58h
	DB	F0h,07h,0Ah,17h,1Dh,2Ah,3Dh,3Eh,5Dh,7Fh,7Dh,BDh,FFh,7Fh,3Dh,1Dh
	DB	0Fh,E0h,50h,E8h,B8h,54h,BCh,7Ch,BAh,FEh,BEh,BDh,FFh,FEh,BCh,B8h
	DB	F0h,05h,0Fh,1Ch,1Bh,3Fh,2Fh,2Fh,73h,5Eh,7Ah,F7h,AFh,47h,3Ah,1Fh
	DB	07h,A0h,F0h,38h,D8h,FCh,F4h,F4h,CEh,7Ah,5Eh,EFh,F5h,E2h,5Ch,F8h
	DB	E0h,07h,0Ah,17h,1Dh,2Eh,3Bh,3Eh,5Dh,7Fh,7Dh,BDh,FFh,7Dh,3Dh,1Fh
	DB	07h,E0h,50h,E8h,B8h,74h,DCh,7Ch,BAh,FEh,BEh,BDh,FFh,BEh,BCh,F8h
	DB	81h,E0h,00h

; Active RLE sprite resource dir#0B(id=0Dh) at CPU 6BA6h (172B packed -> 00C0h = 6 x 16x16
; patterns).
SPRITE_RES_DIR0B_6BA6:
	DB	C0h,03h,C4h,E9h,F3h,F0h,D3h,F1h,D7h,67h,73h,31h,76h,7Fh,7Fh,3Fh
	DB	0Fh,C0h,23h,F7h,FFh,F7h,E3h,CFh,FBh,F6h,FEh,FCh,F8h,F8h,F0h,E0h
	DB	80h,03h,C7h,AEh,9Ch,9Fh,BCh,BEh,BFh,5Dh,4Fh,3Eh,7Fh,7Bh,7Ch,3Fh
	DB	0Fh,C0h,E3h,15h,09h,09h,1Dh,3Dh,EDh,AAh,C2h,0Ch,68h,D8h,30h,E0h
	DB	80h,03h,00h,8Ch,03h,C4h,E9h,F3h,F0h,D3h,F7h,D7h,E7h,78h,3Fh,1Fh
	DB	04h,00h,8Ch,C0h,23h,F7h,FFh,F7h,F3h,DFh,FBh,F6h,38h,F0h,80h,04h
	DB	00h,8Ch,03h,C7h,AEh,9Ch,9Fh,BCh,B8h,FFh,FDh,7Fh,3Fh,1Fh,04h,00h
	DB	8Ch,C0h,E3h,15h,09h,09h,0Dh,2Dh,EFh,AEh,D8h,F0h,80h,07h,00h,88h
	DB	03h,C4h,E9h,F3h,F0h,FBh,3Fh,1Fh,08h,00h,88h,C0h,23h,F7h,FFh,FFh
	DB	FEh,E0h,80h,08h,00h,88h,03h,C7h,AEh,9Ch,FFh,FCh,3Fh,1Fh,08h,00h
	DB	8Ah,C0h,E3h,15h,09h,0Fh,1Eh,E0h,80h,00h,00h,00h

; Active RLE sprite resource dir#01(id=02h) at CPU 6C52h (66B packed -> 0040h = 2 x 16x16
; patterns).
SPRITE_RES_DIR01_6C52:
	DB	C0h,07h,18h,31h,61h,ACh,7Eh,F7h,5Dh,D7h,4Bh,AFh,7Fh,B4h,7Ah,BDh
	DB	73h,C0h,F8h,F4h,CAh,B5h,7Fh,EAh,75h,DFh,B6h,EAh,FEh,5Bh,BDh,7Ah
	DB	DCh,07h,1Fh,3Eh,7Eh,FFh,F7h,FAh,FEh,ECh,77h,FFh,77h,EFh,6Dh,BEh
	DB	73h,C0h,38h,1Ch,3Eh,7Fh,EFh,DEh,FFh,67h,CEh,FEh,DEh,EFh,6Dh,FAh
	DB	DCh,00h

; Active RLE sprite resource dir#0D(id=0Fh) at CPU 6C94h (246B packed -> 0100h = 8 x 16x16
; patterns).
SPRITE_RES_DIR0D_6C94:
	DB	05h,00h,8Bh,04h,0Eh,0Fh,0Fh,35h,4Bh,B5h,96h,72h,9Ah,EBh,05h,00h
	DB	8Bh,90h,B8h,F8h,F8h,54h,EAh,F2h,D6h,6Ah,EDh,F7h,05h,00h,8Bh,04h
	DB	0Ah,0Bh,0Dh,3Eh,76h,CFh,EDh,FFh,FFh,9Eh,05h,00h,FFh,90h,28h,68h
	DB	58h,BCh,36h,5Eh,3Eh,BEh,FBh,B9h,AFh,5Fh,D7h,FFh,74h,2Eh,77h,76h
	DB	2Bh,13h,0Dh,3Fh,79h,7Bh,35h,1Fh,FBh,BEh,4Fh,9Fh,15h,5Dh,2Ah,54h
	DB	C8h,D8h,3Eh,EFh,FFh,FEh,FCh,80h,DFh,67h,ABh,ABh,7Fh,39h,4Ch,4Fh
	DB	37h,1Fh,0Bh,3Dh,7Eh,7Dh,3Fh,1Fh,7Dh,E6h,F1h,EFh,FBh,B3h,F6h,ECh
	DB	F8h,E8h,26h,F3h,EBh,FEh,FCh,80h,09h,1Dh,1Fh,2Fh,7Ah,57h,6Bh,2Dh
	DB	24h,75h,F7h,DBh,2Fh,DFh,7Bh,BDh,20h,70h,F0h,E0h,B0h,CCh,F2h,B9h
	DB	D6h,CDh,CBh,AFh,D7h,E2h,FAh,D5h,09h,14h,16h,3Ah,4Dh,6Ch,7Eh,3Ah
	DB	3Fh,5Fh,9Dh,BEh,DFh,BFh,67h,C3h,20h,50h,D0h,A0h,97h,70h,7Ch,AEh
	DB	67h,6Fh,FFh,7Dh,D9h,F9h,FEh,C6h,ABh,FEh,FCh,E8h,7Ch,2Fh,13h,1Ch
	DB	3Ch,44h,7Dh,28h,05h,00h,9Bh,BFh,7Fh,07h,3Bh,D5h,EFh,FEh,54h,A8h
	DB	70h,B0h,B8h,9Ch,44h,7Ch,28h,F1h,9Bh,9Fh,4Fh,37h,1Fh,14h,24h,7Ch
	DB	55h,28h,05h,00h,90h,EBh,FFh,F9h,FDh,EFh,F3h,E2h,6Ch,D8h,B0h,D0h
	DB	C8h,E4h,7Ch,54h,28h,00h

; Active RLE sprite resource dir#0F(id=11h) at CPU 6D8Ah (131B packed -> 0080h = 4 x 16x16
; patterns).
SPRITE_RES_DIR0F_6D8A:
	DB	FFh,00h,44h,EFh,EDh,BBh,5Bh,3Ah,2Dh,15h,17h,0Fh,16h,3Dh,69h,9Eh
	DB	6Fh,42h,F7h,EDh,FAh,D4h,F4h,B8h,A8h,68h,50h,E0h,D8h,EEh,F3h,DEh
	DB	F8h,00h,44h,ABh,ABh,DEh,6Eh,2Fh,37h,1Fh,1Fh,0Fh,1Fh,2Eh,5Fh,F3h
	DB	6Fh,42h,B5h,5Bh,56h,BCh,ACh,E8h,78h,D8h,F0h,E0h,F8h,B6h,DDh,6Eh
	DB	F8h,42h,EFh,B7h,5Fh,2Bh,2Fh,1Dh,15h,16h,0Ah,07h,1Bh,77h,CFh,7Bh
	DB	1Fh,00h,22h,F7h,B7h,DDh,DAh,5Ch,B4h,A8h,E8h,F0h,68h,BCh,96h,79h
	DB	F6h,42h,ADh,DAh,6Ah,3Dh,35h,17h,1Eh,1Bh,0Fh,07h,1Fh,6Dh,BBh,76h
	DB	1Fh,00h,22h,D5h,D5h,7Bh,76h,F4h,ECh,F8h,F8h,F0h,F8h,74h,FAh,CFh
	DB	81h,F6h,00h

; Active RLE sprite resource dir#08(id=0Ah)/dir#09(id=0Bh) at CPU 6E0Dh (131B packed ->
; 0080h = 4 x 16x16 patterns).
SPRITE_RES_DIR08_DIR09_6E0D:
	DB	FFh,07h,1Dh,30h,71h,4Fh,CDh,BBh,95h,DFh,9Fh,EFh,47h,69h,32h,1Dh
	DB	07h,E0h,38h,CCh,16h,E2h,F3h,F5h,F9h,F1h,FDh,E7h,F2h,16h,DCh,38h
	DB	E0h,07h,1Eh,3Fh,6Eh,77h,FFh,DFh,FFh,BFh,FFh,DCh,7Fh,76h,3Dh,1Eh
	DB	07h,E0h,F8h,3Ch,EEh,DEh,6Fh,FBh,D7h,9Fh,33h,7Bh,CEh,EEh,2Ch,F8h
	DB	E0h,07h,1Ch,33h,68h,47h,CFh,AFh,9Fh,8Fh,BFh,E7h,4Fh,68h,3Bh,1Ch
	DB	07h,E0h,B8h,0Ch,8Eh,F2h,B3h,DDh,A9h,FBh,F9h,F7h,E2h,96h,4Ch,B8h
	DB	E0h,07h,1Fh,3Ch,77h,7Bh,F6h,DFh,EBh,F9h,CCh,DEh,73h,77h,34h,1Fh
	DB	07h,E0h,78h,FCh,76h,EEh,FFh,FBh,FFh,FDh,FFh,3Bh,FEh,6Eh,BCh,78h
	DB	81h,E0h,00h

; Active RLE sprite resource dir#0E(id=10h) at CPU 6E90h (231B packed -> 0100h = 8 x 16x16
; patterns).
SPRITE_RES_DIR0E_6E90:
	DB	FFh,07h,0Fh,1Dh,2Fh,46h,47h,5Dh,3Fh,1Fh,1Fh,17h,3Bh,74h,7Bh,3Ch
	DB	0Fh,F0h,F8h,DCh,FAh,B1h,F1h,DDh,FEh,FCh,FCh,F4h,FCh,74h,FCh,78h
	DB	F0h,07h,08h,16h,37h,79h,7Dh,6Fh,2Fh,17h,1Ah,1Ch,3Fh,7Fh,7Fh,3Fh
	DB	0Fh,F0h,08h,34h,76h,4Fh,DFh,FBh,FAh,F4h,ACh,1Ch,ECh,9Ch,ECh,98h
	DB	F0h,00h,00h,07h,0Fh,1Dh,2Fh,46h,57h,3Dh,1Fh,1Bh,3Fh,74h,7Bh,3Ch
	DB	0Fh,00h,00h,F0h,F8h,DCh,FAh,B1h,F5h,DEh,FCh,ECh,FCh,74h,FCh,78h
	DB	F0h,00h,00h,07h,08h,16h,37h,79h,6Dh,2Fh,16h,1Ch,3Fh,7Fh,7Fh,3Fh
	DB	0Fh,00h,00h,F0h,08h,34h,76h,4Fh,DBh,FAh,B4h,1Ch,FCh,9Ch,ECh,98h
	DB	81h,F0h,05h,00h,8Bh,07h,0Fh,1Dh,2Fh,46h,57h,3Dh,7Fh,7Bh,3Fh,0Fh
	DB	05h,00h,8Bh,F0h,F8h,DCh,FAh,B1h,F5h,DEh,FCh,ECh,F8h,E0h,05h,00h
	DB	8Bh,07h,08h,16h,37h,79h,6Dh,2Fh,76h,7Ch,3Fh,0Fh,05h,00h,8Bh,F0h
	DB	08h,34h,76h,4Fh,DBh,FAh,B4h,1Ch,F8h,E0h,08h,00h,88h,07h,0Fh,1Dh
	DB	2Fh,66h,77h,3Dh,0Fh,08h,00h,88h,F0h,F8h,DCh,FAh,B2h,F4h,D8h,F0h
	DB	08h,00h,88h,07h,08h,16h,37h,79h,7Dh,3Fh,0Fh,08h,00h,88h,F0h,08h
	DB	34h,76h,4Eh,DCh,F8h,F0h,00h

; Active RLE sprite resource dir#00(id=01h) at CPU 6F77h (259B packed -> 0100h = 8 x 16x16
; patterns).
SPRITE_RES_DIR00_6F77:
	DB	FFh,13h,35h,3Bh,2Fh,12h,13h,19h,1Dh,2Bh,3Ch,39h,3Ah,19h,1Dh,0Fh
	DB	03h,C8h,ACh,DCh,F4h,48h,C8h,98h,B8h,D4h,3Ch,9Ch,5Ch,98h,B8h,F0h
	DB	C0h,13h,36h,2Ch,36h,1Fh,1Ch,17h,1Eh,37h,23h,27h,37h,17h,1Bh,0Dh
	DB	03h,C8h,6Ch,34h,6Ch,F8h,38h,E8h,78h,ECh,C4h,E4h,ECh,E8h,D8h,B0h
	DB	C0h,13h,35h,3Bh,2Fh,12h,13h,1Fh,1Fh,2Dh,3Bh,31h,32h,35h,1Ch,18h
	DB	08h,C8h,ACh,DCh,F4h,48h,C8h,F8h,F8h,B4h,DCh,8Ch,4Ch,ACh,38h,18h
	DB	10h,13h,36h,2Ch,36h,1Fh,1Ch,15h,1Bh,36h,27h,2Fh,2Fh,2Dh,14h,18h
	DB	08h,C8h,6Ch,34h,6Ch,F8h,38h,A8h,D8h,6Ch,E4h,F4h,F4h,B4h,28h,18h
	DB	90h,10h,00h,00h,13h,35h,3Bh,2Fh,12h,37h,7Fh,7Fh,E7h,E3h,D9h,E6h
	DB	41h,03h,00h,8Dh,C8h,ACh,DCh,F4h,48h,ECh,FEh,FEh,E7h,C7h,9Bh,67h
	DB	82h,03h,00h,8Dh,13h,36h,2Ch,36h,1Fh,38h,55h,4Bh,9Dh,9Eh,BFh,A7h
	DB	41h,03h,00h,8Dh,C8h,6Ch,34h,6Ch,F8h,1Ch,AAh,D2h,B9h,79h,FDh,E5h
	DB	82h,03h,00h,8Dh,03h,17h,2Fh,2Ah,17h,37h,7Fh,7Fh,E7h,C3h,C9h,76h
	DB	21h,03h,00h,8Dh,C0h,E8h,F4h,54h,E8h,ECh,FEh,FEh,E7h,C3h,93h,6Eh
	DB	84h,03h,00h,8Dh,03h,14h,3Eh,37h,18h,3Dh,57h,4Bh,9Dh,BEh,BFh,57h
	DB	21h,03h,00h,8Eh,C0h,28h,7Ch,ECh,18h,BCh,EAh,D2h,B9h,7Dh,FDh,EAh
	DB	84h,00h,00h

; Active RLE sprite resource dir#27(id=2Ah) at CPU 707Ah (52B packed -> 0040h = 2 x 16x16
; patterns).
SPRITE_RES_DIR27_707A:
	DB	05h,00h,85h,02h,22h,55h,09h,08h,09h,00h,89h,20h,00h,20h,20h,56h
	DB	88h,80h,00h,80h,05h,00h,05h,02h,9Ah,04h,1Ah,01h,05h,05h,01h,01h
	DB	00h,01h,00h,40h,00h,40h,40h,50h,50h,40h,ACh,30h,20h,20h,00h,20h
	DB	20h,00h,00h,00h

; 7-entry DW pointer table indexed by GaoState (C840h, 0..6) at Bank 00 566Eh
; (LoadGaoStatePatternF8A0); selects which 32-byte raw 16x16 weapon/form sprite pattern
; (70D3h, 70F3h, or 7113h) is uploaded to VRAM F8A0h.
GAO_STATE_PATTERN_PTR_TABLE:
	DW	GAO_STATE0_RAW_SPRITE_PATTERN_70D3	; [00h]
	DW	GAO_STATE1_TO2_RAW_SPRITE_PATTERN_70F3	; [01h]
	DW	GAO_STATE1_TO2_RAW_SPRITE_PATTERN_70F3	; [02h]
	DW	GAO_STATE3_TO6_RAW_SPRITE_PATTERN_7113	; [03h]
	DW	GAO_STATE3_TO6_RAW_SPRITE_PATTERN_7113	; [04h]
	DW	GAO_STATE3_TO6_RAW_SPRITE_PATTERN_7113	; [05h]
	DW	GAO_STATE3_TO6_RAW_SPRITE_PATTERN_7113	; [06h]

; Active RLE direct sprite resource common#0 from 6030h command list (23B -> VRAM F880h,
; 0020h = 1 x 16x16 patterns).
SPRITE_RES_COMMON_DIRECT0_70BC:
	DB	08h,00h,82h,01h,0Fh,03h,1Fh,83h,0Fh,07h,01h,08h,00h,88h,C0h,E0h
	DB	F6h,FEh,FEh,FCh,D8h,80h,00h

; Raw 32-byte 16x16 1-plane sprite pattern for GaoState=0 (dagger/default shot), pointed to
; by GaoStatePatternPtrTable[0] and uploaded to VRAM F8A0h by Bank 00 566Eh.
GAO_STATE0_RAW_SPRITE_PATTERN_70D3:
	DB	01h,01h,01h,01h,01h,01h,01h,01h,01h,04h,03h,00h,01h,01h,01h,00h
	DB	00h,80h,C0h,C0h,C0h,C0h,C0h,C0h,C0h,10h,E0h,00h,C0h,C0h,C0h,80h

; Raw 32-byte 16x16 1-plane sprite pattern for GaoState=1..2 (upgraded weapon/projectile),
; pointed to by GaoStatePatternPtrTable[1..2] and uploaded to VRAM F8A0h by Bank 00 566Eh.
GAO_STATE1_TO2_RAW_SPRITE_PATTERN_70F3:
	DB	01h,01h,03h,03h,03h,05h,01h,03h,03h,05h,01h,01h,01h,00h,00h,00h
	DB	C0h,C0h,E0h,E0h,D0h,C0h,E0h,E0h,D0h,C0h,C0h,C0h,C0h,80h,80h,80h

; Raw 32-byte 16x16 1-plane sprite pattern for GaoState=3..6 (bird/transformed silhouette,
; matching dir#22 pattern 1), pointed to by GaoStatePatternPtrTable[3..6] and uploaded to
; VRAM F8A0h by Bank 00 566Eh.
GAO_STATE3_TO6_RAW_SPRITE_PATTERN_7113:
	DB	00h,00h,01h,02h,02h,0Bh,0Bh,07h,13h,0Fh,00h,03h,00h,00h,00h,00h
	DB	00h,00h,00h,60h,80h,F8h,E4h,F0h,E8h,E8h,A0h,20h,40h,00h,00h,00h

; Active RAW sprite resource dir#28(id=00h) at CPU 7133h (32B packed -> 0020h = 1 x 16x16
; patterns).
SPRITE_RES_DIR28_7133:
	DB	22h,36h,14h,2Ah,1Ch,2Ah,1Ch,08h,08h,08h,08h,08h,1Ch,1Ch,08h,00h
	DB	88h,D8h,50h,A8h,70h,A8h,70h,20h,20h,20h,20h,20h,70h,70h,20h,00h

; Active RAW direct sprite resource common#4 from 6030h command list (32B -> VRAM FA60h,
; 0020h = 1 x 16x16 patterns).
SPRITE_RES_COMMON_DIRECT4_7153:
	DB	00h,00h,00h,00h,00h,00h,00h,00h,10h,33h,14h,14h,14h,14h,13h,00h
	DB	00h,00h,00h,00h,00h,00h,00h,00h,00h,6Ch,92h,92h,92h,92h,6Ch,00h

; Active RLE direct sprite resource common#1 from 6030h command list (82B -> VRAM F8C0h,
; 0080h = 4 x 16x16 patterns).
SPRITE_RES_COMMON_DIRECT1_7173:
	DB	07h,00h,03h,03h,92h,05h,17h,28h,7Ch,80h,00h,20h,72h,77h,7Fh,3Fh
	DB	26h,2Ch,70h,C0h,F0h,F0h,80h,0Dh,00h,84h,01h,03h,00h,10h,06h,00h
	DB	88h,14h,1Ch,1Ch,10h,00h,00h,80h,80h,0Ch,00h,94h,06h,07h,07h,05h
	DB	17h,1Ch,16h,38h,40h,70h,76h,FFh,FEh,98h,B0h,C0h,80h,E0h,E0h,C0h
	DB	0Eh,00h,02h,03h,02h,00h,81h,08h,04h,00h,84h,60h,78h,70h,40h,0Ah
	DB	00h,00h

	IF	HINOTORI_ENHANCED = 00h

; Unreferenced (orphaned) 128-byte raw 16x16 sprite pattern block (4 x 32B = 2 two-plane
; OR-color 16x16 orb/creature frames); zero pointers in 6000h-6268h, 70AEh, or any Z80 code
; bank.
ORPHANED_SPRITE_RAW_71C5:
	DB	01h,06h,08h,08h,30h,70h,78h,3Eh,1Ch,34h,7Eh,7Fh,7Eh,3Ch,1Eh,07h
	DB	C0h,30h,C8h,68h,24h,04h,08h,30h,18h,14h,3Ch,7Ch,3Ch,98h,B0h,C0h
	DB	01h,07h,0Fh,0Fh,3Fh,7Fh,7Fh,3Fh,1Fh,3Fh,7Bh,75h,7Bh,3Fh,1Fh,07h
	DB	C0h,F0h,38h,98h,DCh,FCh,F8h,F0h,F8h,FCh,ECh,D4h,ECh,F8h,F0h,C0h
	DB	00h,00h,00h,03h,0Ch,10h,10h,60h,E6h,FCh,60h,4Ch,C6h,E0h,7Ch,1Fh
	DB	00h,00h,00h,E0h,18h,64h,34h,02h,32h,1Ch,06h,19h,31h,82h,1Ch,E0h
	DB	00h,00h,00h,03h,0Fh,1Fh,1Fh,7Fh,FFh,FFh,7Fh,7Fh,FFh,FFh,7Fh,1Fh
	DB	00h,00h,00h,E0h,F8h,9Ch,CCh,FEh,FEh,FCh,FEh,FFh,FFh,FEh,FCh,E0h

; Unreferenced (orphaned) 4A8Dh-format RLE sprite pattern stream (00h-terminated, 123B
; packed -> 0080h = 128B = 4 x 16x16 patterns = 2 OR-color winged-creature frames); zero
; pointers in 6000h-6268h or any Z80 code bank.
ORPHANED_SPRITE_RLE_7245:
	DB	04h,00h,8Ch,01h,03h,03h,07h,E9h,F0h,B3h,67h,36h,29h,6Dh,74h,05h
	DB	00h,02h,80h,89h,C0h,6Eh,FEh,F2h,F4h,E8h,DCh,BEh,AEh,04h,00h,8Ch
	DB	01h,02h,02h,06h,EEh,BFh,DFh,5Dh,3Fh,3Eh,5Eh,4Fh,05h,00h,02h,80h
	DB	C9h,C0h,AEh,1Ah,9Eh,4Ch,D8h,3Ch,7Ah,F2h,B7h,F5h,ABh,A4h,A4h,AEh
	DB	7Fh,3Fh,5Eh,6Ch,3Eh,16h,1Ch,3Ch,3Eh,16h,D5h,DBh,AFh,4Bh,4Fh,EBh
	DB	BEh,BCh,7Eh,32h,7Ch,68h,38h,3Ch,7Ch,68h,DFh,BEh,CFh,F7h,D7h,EBh
	DB	51h,33h,66h,7Ch,3Ah,1Eh,14h,24h,2Ah,16h,7Bh,FDh,E1h,DDh,D1h,ADh
	DB	D2h,FCh,7Ah,3Eh,5Ch,78h,28h,24h,54h,68h,00h
	ENDIF

; Active RLE direct sprite resource common#3 from 6030h command list (21B -> VRAM FA40h,
; 0020h = 1 x 16x16 patterns).
SPRITE_RES_COMMON_DIRECT3_72C0:
	DB	05h,00h,86h,01h,03h,07h,05h,02h,01h,0Ah,00h,86h,80h,C0h,E0h,E0h
	DB	40h,80h,05h,00h,00h

; Active RLE direct sprite resource common#2 from 6030h command list (235B -> VRAM F940h,
; 0100h = 8 x 16x16 patterns).
SPRITE_RES_COMMON_DIRECT2_72D5:
	DB	A0h,01h,00h,0Fh,3Fh,7Fh,47h,DFh,9Ch,BEh,3Eh,3Fh,3Bh,1Bh,18h,0Eh
	DB	03h,C0h,70h,18h,D8h,DCh,FCh,7Ch,7Dh,39h,FBh,E2h,FEh,FCh,F0h,00h
	DB	80h,03h,00h,89h,0Ch,03h,01h,07h,0Fh,0Fh,0Bh,13h,11h,08h,00h,89h
	DB	88h,C8h,D0h,F0h,F0h,E0h,80h,C0h,30h,03h,00h,DFh,03h,0Fh,10h,0Eh
	DB	3Fh,79h,7Eh,E6h,CCh,DBh,5Bh,5Eh,2Eh,0Fh,07h,01h,80h,E0h,F0h,74h
	DB	7Ah,DAh,DBh,33h,67h,7Eh,9Eh,FCh,70h,08h,F0h,C0h,00h,01h,00h,00h
	DB	0Eh,3Fh,23h,47h,47h,0Fh,0Dh,0Ch,04h,06h,01h,00h,00h,80h,60h,20h
	DB	30h,B0h,F0h,E2h,E2h,C4h,FCh,70h,00h,00h,80h,00h,00h,07h,1Eh,3Fh
	DB	20h,0Eh,3Fh,78h,52h,76h,76h,37h,33h,1Bh,01h,00h,00h,80h,D8h,CCh
	DB	ECh,6Eh,6Eh,4Ah,1Eh,FCh,70h,04h,FCh,78h,E0h,03h,00h,81h,07h,03h
	DB	00h,82h,08h,10h,03h,20h,82h,02h,01h,06h,00h,82h,80h,40h,03h,04h
	DB	82h,08h,10h,03h,00h,81h,E0h,05h,00h,9Ah,1Eh,38h,60h,40h,40h,00h
	DB	10h,10h,18h,18h,0Ch,07h,00h,00h,E0h,30h,18h,18h,08h,08h,00h,02h
	DB	02h,06h,1Ch,78h,07h,00h,82h,10h,20h,06h,00h,82h,08h,04h,04h,00h
	DB	82h,20h,10h,06h,00h,82h,04h,08h,04h,00h,00h

; Active RLE direct sprite resource alternate#1 from 604Ch command list (7B -> VRAM F880h,
; 0020h = 1 x 16x16 patterns).
SPRITE_RES_ENDING_DIRECT1_73C0:
	DB	05h,00h,81h,10h,1Ah,00h,00h

; Active RLE direct sprite resource alternate#2 from 604Ch command list (19B -> VRAM F8A0h,
; 0020h = 1 x 16x16 patterns).
SPRITE_RES_ENDING_DIRECT2_73C7:
	DB	04h,00h,02h,01h,85h,03h,1Fh,03h,01h,01h,0Bh,00h,83h,80h,F0h,80h
	DB	07h,00h,00h

; Active RLE direct sprite resource alternate#0 from 604Ch command list (125B -> VRAM F800h,
; 0080h = 4 x 16x16 patterns).
SPRITE_RES_ENDING_DIRECT0_73DA:
	DB	02h,00h,83h,03h,04h,07h,03h,0Fh,83h,3Fh,7Fh,7Fh,04h,FFh,81h,7Fh
	DB	03h,00h,02h,80h,03h,C0h,98h,F8h,DCh,EEh,FAh,FBh,F9h,FDh,EFh,00h
	DB	00h,03h,07h,07h,0Ch,0Fh,0Fh,3Dh,4Eh,46h,A6h,A3h,B2h,97h,58h,03h
	DB	00h,02h,80h,A7h,C0h,40h,C0h,F8h,E4h,9Eh,8Eh,0Fh,1Fh,DBh,2Dh,3Fh
	DB	1Fh,1Fh,3Fh,3Fh,1Bh,1Eh,1Ah,12h,1Ah,1Eh,14h,12h,1Eh,0Eh,00h,F7h
	DB	F7h,FFh,F9h,FFh,D0h,F0h,68h,48h,48h,78h,70h,04h,00h,9Ch,37h,18h
	DB	10h,2Fh,3Dh,15h,1Ah,16h,1Eh,16h,1Ah,1Ch,1Eh,12h,0Eh,00h,D5h,37h
	DB	1Dh,EFh,9Fh,B0h,B0h,58h,78h,78h,48h,70h,04h,00h,00h

	IF	HINOTORI_ENHANCED = 00h

; Unreferenced (orphaned) 4A8Dh-format RLE sprite stream #00 (00h-terminated, 291B packed ->
; 0140h = 10 x 16x16 patterns = 5 OR-color sprite frames).
ORPHANED_SPRITE_RLE_00_7457:
	DB	C0h,00h,06h,0Dh,18h,18h,31h,31h,33h,3Fh,72h,5Eh,FFh,FEh,3Fh,2Fh
	DB	1Eh,00h,00h,FFh,3Bh,D7h,FFh,BFh,FFh,FEh,FFh,7Fh,1Fh,9Fh,8Eh,07h
	DB	0Fh,00h,06h,0Bh,1Fh,17h,2Fh,2Fh,2Dh,3Dh,7Eh,6Ah,BFh,FFh,36h,33h
	DB	1Eh,00h,00h,FFh,DFh,2Ah,87h,45h,26h,17h,F7h,7Fh,1Fh,97h,89h,07h
	DB	0Fh,10h,00h,8Bh,0Fh,1Fh,1Fh,0Fh,0Fh,1Fh,1Eh,1Fh,1Bh,1Fh,3Fh,03h
	DB	7Fh,82h,3Fh,1Fh,10h,00h,9Bh,0Fh,18h,10h,0Fh,0Dh,18h,11h,10h,14h
	DB	19h,3Fh,74h,70h,70h,38h,1Fh,00h,E0h,BEh,BFh,EFh,7Eh,FEh,ACh,DDh
	DB	F9h,BBh,05h,FFh,03h,00h,9Dh,E0h,10h,08h,0Ch,84h,C6h,FEh,FAh,FFh
	DB	7Dh,F9h,DBh,F2h,00h,E0h,7Eh,D9h,DFh,8Fh,B7h,FFh,EFh,FFh,55h,E3h
	DB	73h,FFh,DFh,FDh,03h,00h,94h,E0h,F0h,F8h,FCh,7Ch,3Eh,C2h,F6h,83h
	DB	4Bh,FFh,E5h,4Eh,F7h,EFh,DBh,C7h,FFh,FFh,DFh,03h,FFh,92h,FEh,F8h
	DB	F0h,F0h,E0h,80h,FAh,DEh,DDh,FDh,FBh,FFh,FBh,FAh,FEh,9Ah,1Eh,0Ch
	DB	04h,00h,9Ch,FAh,D0h,24h,39h,C7h,FFh,5Eh,7Ch,FFh,FFh,7Eh,78h,70h
	DB	70h,E0h,80h,76h,DAh,D3h,E3h,EDh,7Dh,7Fh,F6h,FEh,96h,1Ah,0Ch,04h
	DB	00h,C0h,07h,0Ch,1Ch,19h,31h,31h,33h,3Fh,76h,5Eh,FFh,FEh,3Fh,2Fh
	DB	1Eh,00h,00h,F8h,0Fh,D3h,F7h,BFh,FFh,FFh,FEh,7Fh,9Fh,9Fh,8Fh,07h
	DB	0Bh,1Fh,07h,0Bh,1Bh,16h,2Fh,2Fh,2Dh,3Dh,7Ah,6Ah,BFh,FFh,36h,33h
	DB	1Eh,00h,00h,F8h,FFh,2Fh,8Ah,67h,25h,B6h,FFh,7Fh,97h,97h,89h,07h
	DB	0Fh,13h,00h

; Unreferenced (orphaned) 4A8Dh-format RLE sprite stream #01 (00h-terminated, 211B packed ->
; 0100h = 8 x 16x16 patterns = 4 OR-color sprite frames).
ORPHANED_SPRITE_RLE_01_757A:
	DB	10h,00h,03h,1Fh,04h,0Fh,82h,1Fh,3Fh,04h,7Fh,82h,3Fh,07h,11h,00h
	DB	89h,15h,1Fh,1Fh,0Fh,0Fh,0Bh,08h,1Dh,3Fh,04h,7Fh,8Fh,3Fh,07h,00h
	DB	00h,E0h,B0h,BEh,EFh,7Fh,FEh,ACh,DDh,F9h,B3h,F9h,03h,FFh,81h,F9h
	DB	04h,00h,9Ch,E0h,30h,08h,08h,04h,C4h,EAh,FAh,CBh,EDh,FDh,F9h,00h
	DB	E0h,70h,DEh,DDh,8Fh,B7h,FFh,EEh,FEh,5Dh,F7h,C1h,C7h,7Dh,BEh,04h
	DB	00h,8Eh,E0h,F0h,F8h,F8h,FCh,BCh,D6h,A6h,BDh,D7h,FBh,D7h,F8h,F7h
	DB	03h,FFh,85h,FEh,DFh,CFh,8Fh,CFh,05h,FFh,AFh,3Fh,DBh,F2h,FAh,DEh
	DB	FDh,FDh,7Bh,FFh,7Ah,DAh,DEh,9Ah,9Eh,8Ch,00h,00h,E7h,88h,C7h,0Fh
	DB	F8h,F9h,D8h,C8h,8Ch,CEh,F7h,F2h,F0h,F0h,F9h,3Fh,E5h,4Eh,76h,DAh
	DB	F3h,63h,ADh,3Dh,BEh,56h,DEh,96h,9Ah,8Ch,09h,00h,02h,01h,87h,03h
	DB	02h,04h,04h,05h,0Dh,0Dh,03h,00h,8Dh,01h,3Fh,CFh,A7h,E7h,E7h,DFh
	DB	FFh,3Fh,1Eh,3Fh,FFh,FFh,07h,00h,02h,01h,02h,03h,02h,07h,83h,06h
	DB	0Bh,0Fh,03h,00h,8Dh,01h,3Fh,F9h,D9h,1Bh,1Eh,27h,8Dh,FEh,FFh,D7h
	DB	1Bh,3Fh,00h

; Unreferenced (orphaned) 4A8Dh-format RLE sprite stream #02 (00h-terminated, 191B packed ->
; 00C0h = 6 x 16x16 patterns = 3 OR-color sprite frames).
ORPHANED_SPRITE_RLE_02_764D:
	DB	8Dh,1Bh,11h,11h,1Ah,1Bh,1Fh,77h,5Fh,FFh,FEh,3Fh,2Fh,1Eh,03h,00h
	DB	02h,DFh,9Bh,5Fh,CFh,8Fh,8Fh,0Fh,1Fh,BFh,FFh,FFh,7Fh,7Fh,3Fh,07h
	DB	00h,14h,1Eh,1Eh,15h,1Eh,1Fh,7Bh,6Bh,BFh,FFh,36h,33h,1Eh,03h,00h
	DB	D2h,D5h,5Fh,DFh,4Fh,8Fh,8Bh,08h,1Dh,BFh,FFh,FFh,7Fh,7Fh,3Fh,07h
	DB	00h,00h,07h,1Ch,F8h,FAh,FFh,BFh,BDh,ECh,7Eh,FEh,AFh,DFh,FFh,BFh
	DB	F9h,7Ch,F6h,7Ah,2Dh,2Dh,3Dh,FFh,FBh,FAh,B2h,FAh,F6h,7Eh,76h,B4h
	DB	BCh,00h,07h,1Fh,FFh,CDh,E0h,70h,D3h,DBh,8Dh,B5h,FDh,E9h,FFh,5Dh
	DB	FEh,7Ch,FEh,C6h,F3h,D7h,CBh,C9h,9Fh,FEh,AEh,C6h,DAh,7Ah,7Eh,ACh
	DB	BCh,F8h,F7h,03h,FFh,85h,FEh,DFh,CFh,8Fh,CFh,05h,FFh,8Ch,3Fh,F4h
	DB	FCh,D8h,C0h,E0h,E0h,60h,E0h,60h,C0h,C0h,03h,80h,02h,00h,9Bh,E7h
	DB	88h,C7h,0Fh,F8h,F9h,D8h,C8h,8Ch,CEh,F7h,F2h,F0h,F0h,F9h,3Fh,ECh
	DB	74h,58h,C0h,E0h,60h,A0h,20h,A0h,40h,C0h,03h,80h,02h,00h,00h

; Unreferenced (orphaned) 4A8Dh-format RLE sprite stream #03 (00h-terminated, 234B packed ->
; 0100h = 8 x 16x16 patterns = 4 OR-color sprite frames).
ORPHANED_SPRITE_RLE_03_770C:
	DB	02h,00h,83h,03h,1Fh,7Fh,03h,FFh,86h,E7h,CAh,91h,73h,3Eh,1Ch,04h
	DB	00h,03h,FFh,99h,FEh,FCh,FAh,FBh,FDh,FDh,FEh,7Fh,FFh,F8h,F3h,00h
	DB	00h,03h,1Eh,79h,E0h,DCh,BFh,FFh,F7h,EEh,4Fh,26h,1Ch,04h,00h,98h
	DB	FFh,38h,83h,47h,0Fh,9Dh,DFh,9Bh,9Fh,9Fh,4Fh,EFh,BFh,DFh,00h,01h
	DB	03h,03h,07h,0Fh,0Fh,1Fh,3Fh,7Fh,03h,FFh,83h,7Fh,1Fh,00h,09h,FFh
	DB	81h,F0h,05h,FFh,92h,7Fh,00h,01h,03h,02h,04h,08h,08h,1Ch,2Ah,4Dh
	DB	87h,81h,C3h,7Fh,1Fh,00h,EFh,03h,FFh,86h,7Fh,70h,38h,3Fh,1Fh,F0h
	DB	05h,FFh,91h,7Fh,00h,00h,E0h,F8h,FFh,7Fh,3Fh,1Fh,DFh,3Fh,BFh,7Fh
	DB	FFh,FFh,1Fh,CBh,05h,00h,88h,C0h,E0h,F0h,F0h,F8h,F8h,FCh,FCh,03h
	DB	FEh,02h,00h,8Eh,E0h,18h,C7h,E1h,F0h,FAh,FBh,DBh,FBh,F2h,E7h,F7h
	DB	FFh,FFh,05h,00h,8Ch,C0h,60h,30h,10h,98h,08h,CCh,84h,3Ah,7Eh,EEh
	DB	F7h,08h,FFh,81h,7Fh,05h,FFh,88h,F0h,6Eh,C2h,B1h,B9h,DDh,F7h,C0h
	DB	03h,E0h,81h,C0h,03h,E0h,99h,80h,00h,3Fh,9Dh,9Dh,BBh,E2h,06h,1Ch
	DB	FCh,F8h,7Ch,E6h,F3h,F0h,F8h,FFh,F0h,5Eh,FEh,CFh,C7h,FBh,77h,40h
	DB	03h,20h,86h,40h,E0h,60h,60h,80h,00h,00h

; Unreferenced (orphaned) 4A8Dh-format RLE sprite stream #04 (00h-terminated, 234B packed ->
; 0100h = 8 x 16x16 patterns = 4 OR-color sprite frames).
ORPHANED_SPRITE_RLE_04_77F6:
	DB	04h,00h,84h,01h,03h,07h,0Fh,03h,1Fh,02h,3Fh,03h,7Fh,02h,00h,8Eh
	DB	0Fh,7Fh,FFh,FEh,FCh,FAh,FBh,FDh,FDh,FEh,FFh,FFh,F8h,F3h,04h,00h
	DB	A6h,01h,03h,06h,0Ch,1Ch,10h,1Ch,31h,21h,5Ch,7Eh,77h,00h,00h,0Fh
	DB	7Ch,E3h,CFh,0Fh,1Dh,5Fh,9Bh,9Fh,DFh,EFh,FFh,DFh,DFh,76h,43h,9Fh
	DB	BBh,BFh,EFh,0Fh,1Fh,3Fh,7Fh,03h,FFh,83h,7Fh,1Fh,00h,09h,FFh,81h
	DB	F0h,05h,FFh,92h,7Fh,7Ah,7Fh,E3h,C6h,FCh,E8h,08h,1Ch,2Ah,4Dh,87h
	DB	81h,C3h,7Fh,1Fh,00h,EFh,03h,FFh,86h,7Fh,70h,38h,3Fh,1Fh,F0h,05h
	DB	FFh,83h,7Fh,00h,00h,03h,FFh,99h,7Fh,3Fh,1Fh,DFh,3Fh,BFh,7Fh,FEh
	DB	FDh,1Dh,CBh,00h,00h,80h,F0h,FCh,FEh,FFh,FFh,E7h,53h,89h,CEh,7Ch
	DB	38h,04h,00h,9Fh,FFh,18h,C0h,E2h,F3h,FBh,FAh,D3h,F1h,E3h,E2h,F7h
	DB	FFh,FFh,00h,00h,80h,70h,0Ch,82h,39h,7Dh,FFh,EFh,77h,F2h,64h,38h
	DB	00h,00h,F7h,08h,FFh,81h,7Fh,05h,FFh,82h,F0h,00h,03h,80h,03h,C0h
	DB	03h,E0h,81h,C0h,03h,E0h,93h,80h,00h,3Fh,9Dh,9Dh,BBh,E2h,06h,1Ch
	DB	FCh,F8h,7Ch,E6h,F3h,F0h,F8h,FFh,F0h,00h,03h,80h,83h,C0h,40h,40h
	DB	03h,20h,86h,40h,E0h,60h,60h,80h,00h,00h

; Unreferenced (orphaned) 4A8Dh-format RLE sprite stream #05 (00h-terminated, 233B packed ->
; 0100h = 8 x 16x16 patterns = 4 OR-color sprite frames).
ORPHANED_SPRITE_RLE_05_78E0:
	DB	83h,03h,1Fh,7Fh,03h,FFh,86h,E7h,CAh,91h,73h,3Eh,1Ch,03h,00h,81h
	DB	01h,03h,FFh,99h,FEh,FCh,FAh,FBh,FDh,FDh,FEh,7Fh,FFh,F8h,F3h,FFh
	DB	FFh,03h,1Eh,79h,E0h,DCh,BFh,FFh,F7h,EEh,4Fh,26h,1Ch,03h,00h,93h
	DB	01h,FFh,38h,83h,47h,0Fh,9Dh,DFh,9Bh,9Fh,9Fh,4Fh,EFh,BFh,DFh,EFh
	DB	FFh,01h,01h,03h,03h,04h,07h,82h,03h,07h,03h,0Fh,82h,07h,01h,07h
	DB	FFh,81h,FCh,08h,FFh,02h,01h,83h,03h,02h,02h,03h,04h,96h,06h,03h
	DB	06h,0Ch,0Ch,0Eh,07h,01h,FFh,7Fh,7Fh,70h,38h,1Fh,1Fh,3Ch,DFh,AFh
	DB	CFh,1Fh,3Fh,7Fh,05h,FFh,99h,7Fh,3Fh,1Fh,DFh,3Fh,BFh,7Fh,FEh,FDh
	DB	1Dh,CBh,F7h,FFh,80h,F0h,FCh,FEh,FFh,FFh,E7h,53h,89h,CEh,7Ch,38h
	DB	03h,00h,9Dh,80h,FFh,18h,C0h,E2h,F3h,FBh,FAh,D3h,F1h,E3h,E2h,F7h
	DB	FFh,FFh,3Fh,9Dh,80h,70h,0Ch,82h,39h,7Dh,FFh,EFh,77h,F2h,64h,38h
	DB	03h,00h,81h,80h,07h,FFh,81h,3Fh,07h,FFh,83h,C0h,80h,80h,03h,C0h
	DB	04h,E0h,81h,C0h,04h,E0h,97h,C0h,00h,9Dh,BBh,E2h,06h,1Ch,FCh,F8h
	DB	3Ch,FAh,F5h,F3h,F8h,FCh,FEh,FFh,C0h,80h,80h,C0h,40h,40h,04h,20h
	DB	87h,C0h,60h,20h,20h,60h,C0h,00h,00h

; Unreferenced (orphaned) 4A8Dh-format RLE sprite stream #06 (00h-terminated, 236B packed ->
; 0100h = 8 x 16x16 patterns = 4 OR-color sprite frames).
ORPHANED_SPRITE_RLE_06_79C9:
	DB	04h,00h,84h,01h,03h,07h,0Fh,03h,1Fh,02h,3Fh,03h,7Fh,02h,00h,8Eh
	DB	0Fh,7Fh,FFh,FEh,FCh,FAh,FBh,FDh,FDh,FEh,FFh,FFh,F8h,F3h,04h,00h
	DB	A3h,01h,03h,06h,0Ch,1Ch,10h,1Ch,31h,21h,5Ch,7Eh,77h,00h,00h,0Fh
	DB	7Ch,E3h,CFh,0Fh,1Dh,5Fh,9Bh,9Fh,DFh,EFh,FFh,DFh,DFh,76h,43h,9Fh
	DB	BBh,BFh,E3h,03h,03h,07h,81h,03h,03h,07h,82h,01h,00h,09h,FFh,81h
	DB	FEh,05h,FFh,88h,7Fh,7Ah,7Fh,E3h,C7h,FFh,E2h,02h,03h,04h,98h,02h
	DB	07h,06h,06h,01h,00h,EFh,FFh,FFh,7Fh,7Fh,70h,38h,1Fh,1Fh,3Eh,67h
	DB	CFh,0Fh,1Fh,FFh,7Fh,00h,00h,03h,FFh,99h,7Fh,3Fh,1Fh,DFh,3Fh,BFh
	DB	7Fh,FEh,FDh,1Dh,CBh,00h,00h,80h,F0h,FCh,FEh,FFh,FFh,E7h,53h,89h
	DB	CEh,7Ch,38h,04h,00h,9Fh,FFh,18h,C0h,E2h,F3h,FBh,FAh,D3h,F1h,E3h
	DB	E2h,F7h,FFh,FFh,00h,00h,80h,70h,0Ch,82h,39h,7Dh,FFh,EFh,77h,F2h
	DB	64h,38h,00h,00h,F7h,08h,FFh,81h,0Fh,05h,FFh,8Bh,F0h,00h,80h,80h
	DB	C0h,E0h,F0h,F0h,F8h,FCh,FEh,03h,FFh,8Dh,FEh,F8h,00h,3Fh,9Dh,9Dh
	DB	BBh,E2h,06h,1Ch,FCh,F8h,0Fh,05h,FFh,91h,F0h,00h,80h,80h,C0h,20h
	DB	10h,10h,38h,54h,B2h,E1h,81h,C3h,FEh,F8h,00h,00h

; Unreferenced (orphaned) 4A8Dh-format RLE sprite stream #07 (00h-terminated, 232B packed ->
; 0100h = 8 x 16x16 patterns = 4 OR-color sprite frames).
ORPHANED_SPRITE_RLE_07_7AB5:
	DB	02h,00h,83h,03h,1Fh,7Fh,03h,FFh,86h,E7h,CAh,91h,73h,3Eh,1Ch,04h
	DB	00h,03h,FFh,99h,FEh,FCh,FAh,FBh,FDh,FDh,FEh,7Fh,FFh,F8h,F3h,00h
	DB	00h,03h,1Eh,79h,E0h,DCh,BFh,FFh,F7h,EEh,4Fh,26h,1Ch,04h,00h,8Fh
	DB	FFh,38h,83h,47h,0Fh,9Dh,DFh,9Bh,9Fh,9Fh,4Fh,EFh,BFh,DFh,00h,03h
	DB	01h,03h,03h,03h,07h,81h,03h,03h,07h,82h,01h,00h,09h,FFh,81h,FEh
	DB	05h,FFh,82h,7Fh,00h,03h,01h,83h,03h,02h,02h,03h,04h,A6h,02h,07h
	DB	06h,06h,01h,00h,EFh,FFh,FFh,7Fh,7Fh,70h,38h,1Fh,1Fh,3Eh,67h,CFh
	DB	0Fh,1Fh,FFh,7Fh,00h,00h,E0h,F8h,FFh,7Fh,3Fh,1Fh,DFh,3Fh,BFh,7Fh
	DB	FFh,FFh,1Fh,CBh,05h,00h,88h,C0h,E0h,F0h,F0h,F8h,F8h,FCh,FCh,03h
	DB	FEh,02h,00h,8Eh,E0h,18h,C7h,E1h,F0h,FAh,FBh,DBh,FBh,F2h,E7h,F7h
	DB	FFh,FFh,05h,00h,8Ch,C0h,60h,30h,10h,98h,08h,CCh,84h,3Ah,7Eh,EEh
	DB	F7h,08h,FFh,81h,0Fh,05h,FFh,8Bh,F0h,6Eh,C2h,B1h,B9h,DDh,F7h,F0h
	DB	F8h,FCh,FEh,03h,FFh,8Dh,FEh,F8h,00h,3Fh,9Dh,9Dh,BBh,E2h,06h,1Ch
	DB	FCh,F8h,0Fh,05h,FFh,91h,F0h,5Eh,FEh,CFh,C7h,FBh,37h,10h,38h,54h
	DB	B2h,E1h,81h,C3h,FEh,F8h,00h,00h

; Unreferenced (orphaned) 4A8Dh-format RLE sprite stream #08 (00h-terminated, 215B packed ->
; 0100h = 8 x 16x16 patterns = 4 OR-color sprite frames).
ORPHANED_SPRITE_RLE_08_7B9D:
	DB	06h,00h,03h,01h,03h,03h,04h,0Fh,84h,07h,1Fh,3Eh,7Eh,0Ch,FFh,06h
	DB	00h,03h,01h,03h,03h,02h,0Fh,02h,0Bh,93h,07h,1Ah,3Dh,65h,DEh,A7h
	DB	DEh,BFh,3Fh,5Fh,5Fh,92h,24h,64h,FCh,F7h,0Fh,07h,03h,04h,07h,82h
	DB	03h,01h,07h,00h,99h,FEh,FDh,FFh,FBh,FFh,FFh,FEh,FEh,FFh,FFh,7Fh
	DB	7Fh,3Eh,1Fh,07h,00h,0Bh,05h,03h,07h,07h,06h,04h,03h,01h,07h,00h
	DB	A0h,F1h,FBh,EFh,EFh,BFh,9Bh,87h,C7h,E7h,EDh,6Eh,78h,39h,1Ch,07h
	DB	00h,F0h,3Ch,12h,1Dh,1Bh,FDh,F6h,FBh,EDh,EEh,B6h,F7h,DBh,DFh,DFh
	DB	F3h,04h,00h,02h,80h,87h,C0h,40h,40h,E0h,60h,60h,78h,03h,E8h,90h
	DB	F0h,FCh,FEh,FFh,F7h,BBh,FDh,F6h,DBh,FDh,EFh,AEh,B6h,B7h,BCh,FCh
	DB	04h,00h,02h,80h,03h,C0h,03h,E0h,02h,F8h,9Ch,98h,58h,07h,6Fh,7Bh
	DB	7Eh,7Ch,78h,30h,31h,73h,FBh,3Fh,0Fh,0Eh,DCh,F0h,00h,C8h,D0h,E0h
	DB	D0h,50h,D0h,E0h,C0h,80h,80h,06h,00h,9Ah,F8h,DEh,FEh,ABh,BFh,A7h
	DB	CFh,EEh,ECh,D4h,F9h,FBh,FAh,3Ch,F0h,00h,78h,70h,60h,70h,F0h,70h
	DB	60h,C0h,80h,80h,06h,00h,00h

; Unreferenced (orphaned) 4A8Dh-format RLE sprite stream #09 (00h-terminated, 217B packed ->
; 0100h = 8 x 16x16 patterns = 4 OR-color sprite frames).
ORPHANED_SPRITE_RLE_09_7C74:
	DB	06h,00h,03h,01h,03h,03h,04h,0Fh,84h,07h,1Fh,3Eh,7Eh,0Ch,FFh,06h
	DB	00h,03h,01h,03h,03h,02h,0Fh,02h,0Bh,93h,07h,1Ah,3Dh,65h,DEh,A7h
	DB	DEh,BFh,3Fh,5Fh,5Fh,92h,24h,64h,FCh,F7h,0Fh,07h,03h,04h,07h,83h
	DB	03h,01h,01h,06h,00h,87h,FEh,FDh,FFh,FBh,FFh,FFh,FEh,04h,FFh,02h
	DB	7Fh,8Dh,3Fh,1Fh,07h,0Bh,05h,03h,07h,07h,06h,04h,03h,01h,01h,06h
	DB	00h,A0h,F1h,FBh,EFh,EFh,9Fh,82h,C7h,E7h,E8h,EFh,EBh,69h,7Eh,3Fh
	DB	1Ch,07h,F0h,3Ch,12h,1Dh,1Bh,FDh,F6h,FBh,EDh,EEh,B6h,F7h,DBh,DFh
	DB	DFh,F3h,04h,00h,02h,80h,87h,C0h,40h,40h,E0h,60h,60h,78h,03h,E8h
	DB	90h,F0h,FCh,FEh,FFh,F7h,BBh,FDh,F6h,DBh,FDh,EFh,AEh,B6h,B7h,BCh
	DB	FCh,04h,00h,02h,80h,03h,C0h,03h,E0h,02h,F8h,8Bh,98h,58h,07h,6Fh
	DB	7Bh,7Eh,7Ch,30h,31h,73h,DFh,04h,FFh,8Eh,FEh,FCh,F0h,C8h,D0h,E0h
	DB	D0h,50h,D0h,E0h,C0h,C0h,80h,80h,05h,00h,9Bh,F8h,DEh,FEh,ABh,BFh
	DB	EFh,CEh,FCh,A8h,F9h,E9h,EDh,1Fh,FEh,1Ch,F0h,78h,70h,60h,70h,F0h
	DB	70h,60h,C0h,C0h,80h,80h,05h,00h,00h

; Unreferenced (orphaned) 4A8Dh-format RLE sprite stream #10 (00h-terminated, 165B packed ->
; 0100h = 8 x 16x16 patterns = 4 OR-color sprite frames).
ORPHANED_SPRITE_RLE_10_7D4D:
	DB	09h,00h,87h,6Ah,D5h,FFh,6Bh,6Bh,3Eh,3Eh,08h,00h,88h,07h,0Ch,1Fh
	DB	3Fh,3Fh,3Dh,1Fh,0Fh,09h,00h,87h,6Ah,BFh,95h,55h,55h,22h,32h,08h
	DB	00h,8Dh,07h,0Fh,17h,2Ah,37h,2Fh,1Dh,0Fh,1Bh,1Dh,0Eh,07h,03h,0Bh
	DB	00h,88h,3Fh,FFh,FFh,7Eh,F7h,F8h,3Fh,0Fh,08h,00h,85h,17h,1Bh,0Dh
	DB	06h,03h,0Bh,00h,8Bh,3Eh,FFh,7Bh,EDh,DFh,EFh,30h,8Fh,80h,40h,0Eh
	DB	0Dh,00h,88h,E0h,30h,F8h,FCh,FCh,BCh,F8h,F0h,09h,00h,87h,6Ah,D5h
	DB	FFh,6Bh,6Bh,3Eh,2Ch,08h,00h,88h,E0h,F0h,E8h,54h,ECh,F4h,B8h,70h
	DB	09h,00h,8Fh,6Ah,BFh,95h,55h,55h,22h,34h,7Ch,EFh,9Eh,F7h,E3h,87h
	DB	FCh,F0h,08h,00h,85h,E8h,D8h,30h,E0h,C0h,0Bh,00h,8Bh,FCh,FFh,EDh
	DB	9Eh,FEh,FBh,8Ch,F0h,01h,06h,18h,05h,00h,87h,D8h,28h,D0h,20h,C0h
	DB	00h,40h,09h,00h,00h

; Unreferenced (orphaned) 4A8Dh-format RLE sprite stream #11 (00h-terminated, 133B packed ->
; 0100h = 8 x 16x16 patterns = 4 OR-color sprite frames).
ORPHANED_SPRITE_RLE_11_7DF2:
	DB	0Dh,00h,83h,6Ah,D5h,FFh,0Ch,00h,84h,07h,0Ch,1Fh,3Fh,0Dh,00h,83h
	DB	6Ah,BFh,95h,0Ch,00h,89h,07h,0Fh,17h,2Ah,6Bh,6Bh,3Eh,3Eh,0Eh,0Bh
	DB	00h,88h,3Fh,3Dh,1Fh,0Fh,3Fh,3Fh,1Fh,0Fh,08h,00h,02h,55h,85h,22h
	DB	32h,0Eh,20h,0Ch,09h,00h,8Ah,37h,2Fh,1Dh,4Fh,BEh,BFh,9Bh,0Fh,40h
	DB	10h,12h,00h,84h,E0h,30h,F8h,FCh,0Dh,00h,83h,6Ah,D5h,FFh,0Ch,00h
	DB	84h,E0h,F0h,E8h,54h,0Dh,00h,8Bh,6Ah,BFh,95h,FCh,BCh,F8h,F0h,7Ch
	DB	ECh,98h,F0h,08h,00h,02h,6Bh,83h,3Eh,2Ch,38h,0Bh,00h,8Ah,ECh,F4h
	DB	B8h,72h,FDh,FDh,E8h,F0h,02h,18h,06h,00h,02h,55h,85h,22h,34h,3Ah
	DB	42h,38h,09h,00h,00h

; Unreferenced (orphaned) 4A8Dh-format RLE sprite stream #12 (00h-terminated, 156B packed ->
; 0100h = 8 x 16x16 patterns = 4 OR-color sprite frames).
ORPHANED_SPRITE_RLE_12_7E77:
	DB	1Ah,00h,86h,03h,0Fh,1Fh,3Eh,3Ch,3Ch,1Ah,00h,86h,03h,09h,1Bh,27h
	DB	2Fh,37h,03h,00h,96h,03h,07h,0Eh,18h,13h,36h,24h,6Ch,46h,C2h,ADh
	DB	AFh,DBh,7Eh,7Fh,FFh,FDh,7Fh,3Fh,FFh,3Fh,0Fh,03h,00h,81h,0Ch,06h
	DB	00h,9Ah,03h,06h,0Dh,1Fh,1Fh,2Eh,3Ch,74h,7Ah,FEh,FBh,F9h,DBh,67h
	DB	6Bh,FDh,7Fh,FFh,EEh,E7h,31h,0Fh,80h,D0h,1Eh,0Ch,0Dh,00h,86h,C0h
	DB	F0h,F8h,7Ch,3Ch,3Ch,1Ah,00h,86h,C0h,70h,D8h,FCh,E4h,FCh,10h,00h
	DB	8Dh,7Eh,FEh,FFh,BFh,FFh,FAh,F7h,FCh,F0h,00h,08h,10h,40h,06h,00h
	DB	9Ah,C0h,E0h,70h,38h,D8h,6Ch,24h,36h,62h,43h,B5h,F5h,DBh,E6h,D6h
	DB	3Fh,FEh,7Eh,7Fh,FFh,8Ch,F2h,00h,1Ch,70h,40h,06h,00h,8Dh,C0h,60h
	DB	B0h,D8h,E8h,74h,3Ch,2Eh,5Eh,7Fh,DFh,9Fh,DBh,00h

; Unreferenced (orphaned) 4A8Dh-format RLE sprite stream #13 (00h-terminated, 233B packed ->
; 0100h = 8 x 16x16 patterns = 4 OR-color sprite frames).
ORPHANED_SPRITE_RLE_13_7F13:
	DB	04h,00h,90h,01h,0Fh,1Fh,37h,37h,27h,27h,37h,1Fh,0Fh,0Fh,1Fh,00h
	DB	00h,03h,7Fh,05h,FFh,87h,EFh,F2h,FEh,F7h,FDh,FEh,FFh,04h,00h,E4h
	DB	01h,0Fh,12h,2Eh,2Ch,3Ch,3Ch,2Ch,16h,0Ah,0Eh,1Fh,00h,00h,03h,7Fh
	DB	C6h,1Dh,15h,17h,3Ah,3Ch,3Fh,3Fh,7Fh,7Fh,77h,3Eh,3Fh,79h,5Eh,EFh
	DB	BFh,5Fh,FFh,A7h,46h,03h,01h,01h,03h,07h,06h,0Ch,FEh,FFh,FFh,BFh
	DB	9Fh,9Dh,FFh,7Eh,FFh,FEh,FFh,BFh,BFh,3Fh,1Fh,0Fh,21h,7Eh,6Fh,FFh
	DB	D9h,70h,BEh,E7h,47h,03h,01h,01h,02h,04h,05h,0Bh,BFh,DFh,EDh,A3h
	DB	9Eh,9Bh,EEh,EFh,E7h,F7h,33h,78h,76h,D8h,EEh,FFh,0Ch,1Ch,14h,1Bh
	DB	1Fh,19h,0Fh,07h,08h,00h,8Bh,7Fh,7Ch,FBh,FAh,FAh,FBh,F1h,5Dh,B6h
	DB	DDh,08h,05h,00h,88h,0Bh,1Bh,1Bh,14h,19h,16h,09h,07h,08h,00h,8Bh
	DB	B9h,EBh,7Dh,FEh,D6h,75h,EFh,77h,FFh,D5h,08h,07h,00h,83h,E0h,F8h
	DB	FFh,03h,7Fh,88h,3Fh,1Bh,A3h,2Bh,F7h,5Fh,3Fh,7Fh,05h,00h,9Bh,C0h
	DB	E0h,F8h,FCh,F6h,F2h,F2h,FAh,FEh,ECh,E4h,00h,00h,E0h,F8h,EFh,DEh
	DB	F2h,EEh,FDh,FFh,7Fh,FFh,7Fh,FDh,F7h,AAh,05h,00h,8Bh,C0h,20h,18h
	DB	1Ch,1Eh,9Eh,9Eh,16h,3Eh,3Ch,3Ch,00h

; Unreferenced 4A8Dh-format RLE sprite stream #14 (0FFFCh-100F7h, 252B total -> 0100h = 8 x
; 16x16 patterns): Bank 07 part 1 (4B at 7FFCh-7FFFh; continues into Bank 08 8000h-80F7h).
ORPHANED_SPRITE_RLE_14_7FFC_PART1:
	DB	81h,BFh,03h,FFh
	ELSE

; MSX2+ horizontal-scroll RAM images copied by HS_BOOT_INIT (asm/enhanced/hscroll_core.asm):
; the resident page-3 routines (run at HS_RESIDENT_BASE) and the page-0 module (run at
; HS_MODULE_BASE).
HS_RESIDENT_IMAGE:
	PHASE	HS_RESIDENT_BASE
	INCLUDE	"asm/enhanced/hscroll_resident.asm"

HS_RESIDENT_END:
	DEPHASE
	PHASE	HS_RESIDENT_IMAGE + HS_RESIDENT_END - HS_RESIDENT_BASE

HS_MODULE_IMAGE:
	PHASE	HS_MODULE_BASE
	INCLUDE	"asm/enhanced/hscroll_module.asm"

HS_MODULE_END:
	DEPHASE
	PHASE	HS_MODULE_IMAGE + HS_MODULE_END - HS_MODULE_BASE

HS_RESIDENT_SIZE:  EQU	HS_RESIDENT_END - HS_RESIDENT_BASE
HS_MODULE_SIZE:    EQU	HS_MODULE_END - HS_MODULE_BASE

; Bank 07 helper called by HS_BOOT_INIT with Bank 07 mapped at 6000h: copies the resident
; page-3 RAM routines and, on MSX2+ with page-0 RAM, installs the page-0 module and 0038h hook.
HS_BANK07_BOOT_INIT:
	CALL	ENHANCED_BOOT_TURBO_ON
	DI

ENHANCED_BOOT_TURBO_READY:
; Music and gameplay use VBlank timing: select 60 Hz on PAL machines too.
; Preserve other R#9 bits and update the BIOS shadow so CHGMOD keeps it.
	LD	A,(BIOS_RG9SAV)
	AND	FDh
	LD	B,A
	LD	C,09h
	CALL	BIOS_WRTVDP
	DI	; WRTVDP may enable interrupts; module installation requires DI.
	XOR	A
	LD	(HS_FLAGS),A
	LD	(HS_CAM_LO),A
	LD	HL,HS_RESIDENT_IMAGE
	LD	DE,HS_RESIDENT_BASE
	LD	BC,HS_RESIDENT_SIZE
	LDIR
	LD	A,(BIOS_MSXVER)
	CP	02h
	RET	C
	IN	A,(PPI_SLOT_PORT)
	LD	(HS_A8_ROM),A
	LD	B,A
	RLCA
	RLCA
	AND	03h
	LD	C,A
	LD	A,B
	AND	FCh
	OR	C
	LD	(HS_A8_RAM),A
	LD	B,00h
	LD	HL,BIOS_EXPTBL
	ADD	HL,BC
	LD	A,(HL)
	AND	80h
	LD	(HS_SUB_EXPANDED),A
	JR	Z,.install
	LD	A,(SUBSLOT_REG)
	CPL
	LD	(HS_SUB_ROM),A
	LD	B,A
	RLCA
	RLCA
	AND	03h
	LD	C,A
	LD	A,B
	AND	FCh
	OR	C
	LD	(HS_SUB_RAM),A

.install:
	LD	HL,0000h
	LD	DE,SHARED_WORK_BUFFER
	LD	BC,HS_MODULE_BASE
	LDIR
	CALL	HS_SELECT_PAGE0_RAM
	LD	C,03h

.try_seg:
	LD	A,C
	OUT	(RAM_MAPPER_PAGE0),A
	LD	HL,HS_MODULE_BASE
	LD	(HL),5Ah
	LD	A,(HL)
	CP	5Ah
	JR	NZ,.no_ram
	CPL
	LD	(HL),A
	CP	(HL)
	JR	NZ,.no_ram
	LD	HL,SND_UNUSED_C000 + HS_MODULE_BASE
	LD	A,(HL)
	OR	A
	JR	Z,.seg_ok
	LD	(HL),00h
	DEC	C
	JR	NZ,.try_seg
	JR	.no_ram

.seg_ok:
	LD	HL,SHARED_WORK_BUFFER
	LD	DE,0000h
	LD	BC,HS_MODULE_BASE
	LDIR
	LD	HL,HS_MODULE_IMAGE
	LD	DE,HS_MODULE_BASE
	LD	BC,HS_MODULE_SIZE
	LDIR
	LD	A,C3h
	LD	(BIOS_KEYINT),A
	LD	HL,HS_ISR_TRAMPOLINE
	LD	(BIOS_KEYINT + 01h),HL
	LD	A,HSF_READY
	LD	(HS_FLAGS),A

.no_ram:
	JP	HS_SELECT_PAGE0_ROM	; asm/enhanced/hscroll_resident.asm

; Interactive cold-boot Start Menu: selects LANGUAGE (JAPANESE / ENGLISH) and, when MSX2+
; horizontal scrolling is available (HS_FLAGS != 0 at boot), allows toggling H. SCROLL ON/OFF,
; then displays UNPACKING GRAPHICS and clears VRAM pages 2 and 3.
HS_BANK07_BOOT_MENU:
	XOR	A
	LD	(BOOT_DISPLAY_MODE_FLAG),A
	LD	D,A
	LD	E,A
	CALL	WRITE_PALETTE_ENTRY_TO_VDP
	LD	BC,0F07h
	CALL	BIOS_WRTVDP
	CALL	CLEAR_ACTIVE_VRAM_PAGE
	CALL	WAIT_FOR_VDP_COMMAND_COMPLETE
	LD	A,(HS_FLAGS)
	OR	A
	JR	NZ,.msx2p_menu
	LD	HL,BOOT_LANGUAGE_SELECT_TEXT
	CALL	DRAW_POSITIONED_TEXT_STRING

.msx2_draw:
	LD	A,(LANGUAGE_MODE_FLAG)
	OR	A
	LD	HL,BOOT_LANG_CURSOR_JP_TEXT
	JR	Z,.msx2_render
	LD	HL,BOOT_LANG_CURSOR_EN_TEXT

.msx2_render:
	CALL	DRAW_POSITIONED_TEXT_STRING

.msx2_wait_rel:
	CALL	READ_JOYSTICK_TRIGGER_AND_DIRS
	LD	B,A
	AND	30h
	JP	NZ,.menu_done
	LD	A,B
	AND	0Fh
	JR	NZ,.msx2_wait_rel

.msx2_loop:
	CALL	READ_JOYSTICK_TRIGGER_AND_DIRS
	LD	B,A
	AND	30h
	JP	NZ,.menu_done
	LD	A,B
	AND	0Fh
	JR	Z,.msx2_loop
	LD	HL,LANGUAGE_MODE_FLAG
	LD	A,(HL)
	XOR	01h
	LD	(HL),A
	JR	.msx2_draw

.msx2p_menu:
	LD	DE,F068h
	LD	C,0Ch
	LD	HL,HS_BOOT_DOT_GLYPH_1BPP
	CALL	UNPACK_1BPP_TILES_WITH_BG_COLOR
	LD	HL,HS_BOOT_MSX2P_MENU_TEXT
	CALL	DRAW_POSITIONED_TEXT_STRING
	LD	E,00h

.msx2p_draw:
	PUSH	DE
	LD	A,(LANGUAGE_MODE_FLAG)
	OR	A
	LD	HL,HS_BOOT_CURSOR_JP_TEXT
	JR	Z,.draw_lang
	LD	HL,HS_BOOT_CURSOR_EN_TEXT

.draw_lang:
	CALL	DRAW_POSITIONED_TEXT_STRING
	LD	A,(HS_FLAGS)
	OR	A
	LD	HL,HS_BOOT_HSCROLL_OFF_TEXT
	JR	Z,.draw_hs_val
	LD	HL,HS_BOOT_HSCROLL_ON_TEXT

.draw_hs_val:
	CALL	DRAW_POSITIONED_TEXT_STRING
	POP	DE
	PUSH	DE
	LD	A,E
	CP	02h
	LD	HL,HS_BOOT_CURSOR_HS_ON_TEXT
	JR	Z,.draw_hs_cur
	LD	HL,HS_BOOT_CURSOR_HS_OFF_TEXT

.draw_hs_cur:
	CALL	DRAW_POSITIONED_TEXT_STRING
	POP	DE

.msx2p_wait_rel:
	PUSH	DE
	CALL	READ_JOYSTICK_TRIGGER_AND_DIRS
	POP	DE
	AND	3Fh
	JR	NZ,.msx2p_wait_rel

.msx2p_loop:
	PUSH	DE
	CALL	READ_JOYSTICK_TRIGGER_AND_DIRS
	POP	DE
	LD	B,A
	AND	30h
	JR	NZ,.on_trig
	BIT	00h,B
	JR	NZ,.on_up
	BIT	01h,B
	JR	NZ,.on_down
	LD	A,B
	AND	0Ch
	JR	Z,.msx2p_loop

.toggle_hs:
	LD	HL,HS_FLAGS
	LD	A,(HL)
	XOR	HSF_READY
	LD	(HL),A
	JR	.msx2p_draw

.on_trig:
	LD	A,E
	CP	02h
	JR	Z,.toggle_hs
	JR	.menu_done

.on_up:
	LD	A,E
	OR	A
	JR	NZ,.dec_e
	LD	E,03h

.dec_e:
	DEC	E
	JR	.sync_lang

.on_down:
	INC	E
	LD	A,E
	CP	03h
	JR	C,.sync_lang
	LD	E,00h

.sync_lang:
	LD	A,E
	CP	02h
	JR	NC,.msx2p_draw
	LD	(LANGUAGE_MODE_FLAG),A
	JR	.msx2p_draw

.menu_done:
	CALL	CLEAR_ACTIVE_VRAM_PAGE
	CALL	WAIT_FOR_VDP_COMMAND_COMPLETE
	LD	HL,BOOT_UNPACKING_GFX_TEXT
	CALL	DRAW_POSITIONED_TEXT_STRING
	XOR	A
	LD	H,A
	LD	L,A
	LD	B,A
	LD	C,A
	LD	D,02h
	CALL	FILL_VRAM_RECT_HMMV
	XOR	A
	LD	H,A
	LD	L,A
	LD	B,A
	LD	C,A
	LD	D,03h
	CALL	FILL_VRAM_RECT_HMMV
	JP	WAIT_FOR_VDP_COMMAND_COMPLETE	; asm/banks/bank00.asm

; 8x8 1bpp period ('.') glyph unpacked to character code 2Eh in Page 1 font cache
HS_BOOT_DOT_GLYPH_1BPP:
	DB	00h,00h,00h,00h,00h,18h,18h,00h

; Positioned cold-boot language selection strings (MSX2 fallback)
BOOT_LANGUAGE_SELECT_TEXT:
	DB	44h,48h,"SELECT",00h,"LANGUAGE",FEh
	DB	60h,60h,"JAPANESE",FEh
	DB	60h,70h,"ENGLISH",FEh
	DB	48h,90h,"PUSH",00h,"SPACE",00h,"KEY",FFh

BOOT_LANG_CURSOR_JP_TEXT:
	DB	50h,60h,3Eh,FEh
	DB	50h,70h,00h,FFh

BOOT_LANG_CURSOR_EN_TEXT:
	DB	50h,60h,00h,FEh
	DB	50h,70h,3Eh,FFh

; Positioned cold-boot Start Menu strings (MSX2+ with H. SCROLL ON/OFF option)
HS_BOOT_MSX2P_MENU_TEXT:
	DB	44h,40h,"SELECT",00h,"LANGUAGE",FEh
	DB	58h,58h,"JAPANESE",FEh
	DB	58h,68h,"ENGLISH",FEh
	DB	44h,80h,"H.",00h,"SCROLL",FEh
	DB	48h,A0h,"PUSH",00h,"SPACE",00h,"KEY",FFh

HS_BOOT_CURSOR_JP_TEXT:
	DB	48h,58h,3Eh,FEh
	DB	48h,68h,00h,FFh

HS_BOOT_CURSOR_EN_TEXT:
	DB	48h,58h,00h,FEh
	DB	48h,68h,3Eh,FFh

HS_BOOT_HSCROLL_ON_TEXT:
	DB	A4h,80h,"ON",00h,FFh

HS_BOOT_HSCROLL_OFF_TEXT:
	DB	A4h,80h,"OFF",FFh

HS_BOOT_CURSOR_HS_ON_TEXT:
	DB	34h,80h,3Eh,FFh

HS_BOOT_CURSOR_HS_OFF_TEXT:
	DB	34h,80h,00h,FFh

BOOT_UNPACKING_GFX_TEXT:
	DB	38h,60h,"UNPACKING",00h,"GRAPHICS",FFh

	INCLUDE	"asm/enhanced/turbo.asm"

BANK07_ENHANCED_TAIL_PADDING_FF:
	DS	8000h - $,FFh
	ENDIF

	DEPHASE

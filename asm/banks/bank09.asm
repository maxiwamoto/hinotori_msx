; Physical Bank 09 (ROM 12000h-13FFFh): Terrain/mobile/ambient route spawn streams,
; route transition table, Konami boot logo tiles, F5 Compass & F4 Stage Map tiles/tilemaps,
; King Kong 2 companion combination & cassette SAVE/LOAD engine (with PHASE F220h RAM hook),
; and F2 POWER UP weapon shop (MainState 0Dh)
	PHASE	A000h

; 304-byte page-spanning continuation of 28-tile (0380h-byte = seven 16x16 icons: stone
; bases/shared UI icons) raw-4bpp tile block 11DB0h..1212Fh loaded to VRAM tiles A0h..BBh by
; Bank 04 descriptor 63A3h command @083F1. (Command @083F1 requests count=32, harmlessly
; over-reading 4 unused tiles BCh..BFh across A130h..A1AFh.)
SHARED_UI_ICON_RAW4BPP_TILES_PAGE_CONT:
	DB	00h,00h,00h,F6h,00h,00h,00h,0Fh,00h,00h,00h,00h,00h,00h,00h,00h
	DB	66h,F9h,6Eh,F0h,FFh,FFh,9Eh,F0h,FFh,FFh,F6h,F0h,9Fh,FFh,96h,F0h
	DB	F9h,F9h,6Fh,00h,69h,96h,F0h,00h,FFh,FFh,00h,00h,00h,00h,00h,00h
	DB	00h,0Fh,C8h,8Ch,00h,FCh,88h,CCh,0Fh,C8h,8Ch,CCh,0Fh,FFh,CCh,C8h
	DB	0Fh,FFh,FCh,8Fh,F9h,6Fh,F8h,F0h,FEh,9Fh,FFh,00h,0Fh,FFh,00h,00h
	DB	CAh,8Fh,00h,00h,CAh,F0h,00h,00h,8Fh,00h,00h,00h,F0h,00h,00h,00h
	DB	00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
	DB	F6h,EEh,CCh,CCh,F6h,ECh,ECh,CCh,0Fh,6Eh,CCh,ECh,0Fh,6Eh,EEh,CEh
	DB	00h,F6h,ECh,EEh,00h,0Fh,66h,EEh,00h,00h,FFh,66h,00h,00h,00h,FFh
	DB	CCh,CCh,CEh,6Fh,CCh,EEh,EEh,6Fh,CEh,CCh,E6h,F0h,ECh,EEh,E6h,F0h
	DB	CEh,EEh,6Fh,00h,EEh,66h,F0h,00h,66h,FFh,00h,00h,FFh,00h,00h,00h
	DB	00h,00h,00h,F6h,00h,00h,0Fh,6Fh,00h,00h,F6h,FFh,00h,0Fh,6Fh,FFh
	DB	00h,0Fh,6Fh,FAh,00h,0Fh,6Ah,AAh,00h,F6h,66h,66h,00h,0Fh,FFh,FFh
	DB	FEh,F0h,00h,00h,AFh,EFh,00h,00h,FFh,EEh,F0h,00h,AFh,FFh,EFh,00h
	DB	AAh,EFh,EFh,00h,AAh,EEh,EFh,00h,66h,66h,66h,F0h,FFh,FFh,FFh,00h
	DB	0Fh,F8h,8Ah,88h,0Fh,9Fh,F8h,88h,0Fh,99h,9Fh,FFh,0Fh,99h,99h,99h
	DB	00h,F9h,99h,96h,00h,0Fh,F9h,66h,00h,00h,0Fh,FFh,00h,00h,00h,00h
	DB	88h,88h,8Fh,F0h,88h,8Fh,F6h,F0h,FFh,F6h,66h,F0h,96h,66h,66h,F0h
	DB	66h,66h,6Fh,00h,66h,6Fh,F0h,00h,FFh,F0h,00h,00h,00h,00h,00h,00h

; 50-byte (25-entry) 16-bit pointer table (A130h..A161h) read by Bank 01 6C69h: entries
; 0..17 = Levels 1..6 Routes 1..3; entries 18..23 = Bosses 1..6; 25th entry (index 24 = 18h
; at A160h..A161h) points to empty FFFFh stream at A267h (selected by route transition
; descriptors 14..17).
TERRAIN_OBJECT_STREAM_PTR_TABLE:
	DW	LEVEL1_ROUTE1_TERRAIN_STREAM
	DW	LEVEL1_ROUTE2_TERRAIN_STREAM
	DW	LEVEL1_ROUTE3_TERRAIN_STREAM
	DW	LEVEL2_ROUTE1_TERRAIN_STREAM
	DW	LEVEL2_ROUTE2_TERRAIN_STREAM
	DW	LEVEL2_ROUTE3_TERRAIN_STREAM
	DW	LEVEL3_ROUTE1_TERRAIN_STREAM
	DW	LEVEL3_ROUTE2_TERRAIN_STREAM
	DW	LEVEL3_ROUTE3_TERRAIN_STREAM
	DW	LEVEL4_ROUTE1_TERRAIN_STREAM
	DW	LEVEL4_ROUTE2_TERRAIN_STREAM
	DW	LEVEL4_ROUTE3_TERRAIN_STREAM
	DW	LEVEL5_ROUTE1_TERRAIN_STREAM
	DW	LEVEL5_ROUTE2_TERRAIN_STREAM
	DW	LEVEL5_ROUTE3_TERRAIN_STREAM
	DW	LEVEL6_ROUTE1_TERRAIN_STREAM
	DW	LEVEL6_ROUTE2_TERRAIN_STREAM
	DW	LEVEL6_ROUTE3_TERRAIN_STREAM
	DW	BOSS1_TERRAIN_STREAM
	DW	BOSS2_TERRAIN_STREAM
	DW	BOSS3_TERRAIN_STREAM
	DW	BOSS4_TERRAIN_STREAM
	DW	BOSS5_TERRAIN_STREAM
	DW	BOSS6_TERRAIN_STREAM
	DW	ROUTE18_EMPTY_TERRAIN_STREAM

; 36-byte (18-entry) 16-bit pointer table (A162h..A185h) read by Bank 01 6CACh for normal
; routes 0..17 (Levels 1..6 Routes 1..3), pointing to 3-byte 0000h-terminated mobile enemy
; spawn streams in A67Ah..AB3Bh.
MOBILE_OBJECT_STREAM_PTR_TABLE:
	DW	LEVEL1_ROUTE1_MOBILE_STREAM
	DW	LEVEL1_ROUTE2_MOBILE_STREAM
	DW	LEVEL1_ROUTE3_MOBILE_STREAM
	DW	LEVEL2_ROUTE1_MOBILE_STREAM
	DW	LEVEL2_ROUTE2_MOBILE_STREAM
	DW	LEVEL2_ROUTE3_MOBILE_STREAM
	DW	LEVEL3_ROUTE1_MOBILE_STREAM
	DW	LEVEL3_ROUTE2_MOBILE_STREAM
	DW	LEVEL3_ROUTE3_MOBILE_STREAM
	DW	LEVEL4_ROUTE1_MOBILE_STREAM
	DW	LEVEL4_ROUTE2_MOBILE_STREAM
	DW	LEVEL4_ROUTE3_MOBILE_STREAM
	DW	LEVEL5_ROUTE1_MOBILE_STREAM
	DW	LEVEL5_ROUTE2_MOBILE_STREAM
	DW	LEVEL5_ROUTE3_MOBILE_STREAM
	DW	LEVEL6_ROUTE1_MOBILE_STREAM
	DW	LEVEL6_ROUTE2_MOBILE_STREAM
	DW	LEVEL6_ROUTE3_MOBILE_STREAM

; 36-byte (18-entry) 16-bit pointer table (A186h..A1A9h) read by Bank 01 71CFh (indexed by
; SpriteSetSelector C480h), pointing sequentially to the eighteen 6-byte per-band ambient
; hazard spawn bitmask records at ACDCh..AD47h.
ROUTE_AMBIENT_HAZARD_MASK_PTR_TABLE:
	DW	ROUTE_AMBIENT_HAZARD_SPAWN_MASKS
	DW	ROUTE_01_AMBIENT_HAZARD_MASKS
	DW	ROUTE_02_AMBIENT_HAZARD_MASKS
	DW	ROUTE_03_AMBIENT_HAZARD_MASKS
	DW	ROUTE_04_AMBIENT_HAZARD_MASKS
	DW	ROUTE_05_AMBIENT_HAZARD_MASKS
	DW	ROUTE_06_AMBIENT_HAZARD_MASKS
	DW	ROUTE_07_AMBIENT_HAZARD_MASKS
	DW	ROUTE_08_AMBIENT_HAZARD_MASKS
	DW	ROUTE_09_AMBIENT_HAZARD_MASKS
	DW	ROUTE_10_AMBIENT_HAZARD_MASKS
	DW	ROUTE_11_AMBIENT_HAZARD_MASKS
	DW	ROUTE_12_AMBIENT_HAZARD_MASKS
	DW	ROUTE_13_AMBIENT_HAZARD_MASKS
	DW	ROUTE_14_AMBIENT_HAZARD_MASKS
	DW	ROUTE_15_AMBIENT_HAZARD_MASKS
	DW	ROUTE_16_AMBIENT_HAZARD_MASKS
	DW	ROUTE_17_AMBIENT_HAZARD_MASKS

; Level 1 Route 1 terrain-object stream (13 x 3-byte records + FFFFh terminator, 41 bytes).
LEVEL1_ROUTE1_TERRAIN_STREAM:
	DB	0Ah,30h,C8h
	DB	14h,3Ch,21h
	DB	26h,34h,96h
	DB	01h,00h,D8h
	DB	3Ch,30h,28h
	DB	44h,30h,C8h
	DB	4Ch,34h,29h
	DB	4Eh,30h,68h
	DB	56h,34h,82h
	DB	5Ch,30h,D8h
	DB	68h,34h,2Eh
	DB	80h,3Ch,B2h
	DB	A0h,08h,17h
	DW	FFFFh	; End of stream

; Level 1 Route 2 terrain-object stream (18 x 3-byte records + FFFFh terminator, 56 bytes).
LEVEL1_ROUTE2_TERRAIN_STREAM:
	DB	14h,04h,0Eh
	DB	26h,34h,91h
	DB	36h,34h,29h
	DB	40h,30h,C8h
	DB	50h,3Ch,40h
	DB	52h,34h,A4h
	DB	5Eh,28h,20h
	DB	63h,34h,6Bh
	DB	64h,10h,03h
	DB	6Ch,30h,28h
	DB	6Eh,30h,68h
	DB	76h,34h,85h
	DB	80h,34h,C9h
	DB	84h,0Ch,1Dh
	DB	94h,30h,C8h
	DB	AEh,34h,29h
	DB	B2h,30h,48h
	DB	B6h,28h,C6h
	DW	FFFFh	; End of stream

; Level 1 Route 3 terrain-object stream (18 x 3-byte records + FFFFh terminator, 56 bytes).
LEVEL1_ROUTE3_TERRAIN_STREAM:
	DB	02h,30h,58h
	DB	04h,34h,56h
	DB	15h,40h,20h
	DB	28h,3Ch,83h
	DB	3Ah,34h,24h
	DB	3Ah,30h,D8h
	DB	42h,34h,CAh
	DB	44h,30h,28h
	DB	46h,30h,58h
	DB	4Eh,34h,85h
	DB	6Ah,34h,8Dh
	DB	6Ah,30h,D8h
	DB	90h,30h,28h
	DB	92h,30h,88h
	DB	9Ah,30h,D8h
	DB	A2h,30h,28h
	DB	B6h,30h,58h
	DB	B8h,30h,88h
	DW	FFFFh	; End of stream

; Boss 1 arena terrain-object stream (1 x 3-byte record + FFFFh terminator, 5 bytes).
BOSS1_TERRAIN_STREAM:
	DB	26h,14h,06h
	DW	FFFFh	; End of stream

; Boss 2 arena terrain-object stream (1 x 3-byte record + FFFFh terminator, 5 bytes).
BOSS2_TERRAIN_STREAM:
	DB	26h,14h,07h
	DW	FFFFh	; End of stream

; Boss 3 arena terrain-object stream (2 x 3-byte records + FFFFh terminator, 8 bytes).
BOSS3_TERRAIN_STREAM:
	DB	26h,14h,08h
	DB	26h,14h,0Bh
	DW	FFFFh	; End of stream

; Boss 4 arena terrain-object stream (1 x 3-byte record + FFFFh terminator, 5 bytes).
BOSS4_TERRAIN_STREAM:
	DB	26h,14h,09h
	DW	FFFFh	; End of stream

; Boss 5 arena terrain-object stream (2 x 3-byte records + FFFFh terminator, 8 bytes).
BOSS5_TERRAIN_STREAM:
	DB	26h,14h,0Ah
	DB	26h,14h,0Ch
	DW	FFFFh	; End of stream

; Boss 6 arena terrain-object stream (1 x 3-byte record + FFFFh terminator, 5 bytes).
BOSS6_TERRAIN_STREAM:
	DB	26h,14h,0Dh
	DW	FFFFh	; End of stream

; 2-byte empty terrain-object stream (FFFFh) at A267h..A268h pointed to by 25th entry
; (A160h, route ID 18h) when transition descriptors 14..17 select route 18h.
ROUTE18_EMPTY_TERRAIN_STREAM:
	DW	FFFFh	; End of stream

; 108-byte table of eighteen 6-byte route/boss destination descriptors (A269h..A2D4h:
; target_route_id, initial_row_lo, initial_row_hi, gao_x=90h, gao_y=80h, pad=00h). Read by
; Bank 01 6077h (indexed by 6 * (IX+14h)) and copied via 6x LDI into C486h..C48Bh.
ROUTE_TRANSITION_DESCRIPTOR_TABLE:
	DB	14h,1Fh,00h,90h,80h,00h
	DB	13h,1Fh,00h,90h,80h,00h
	DB	17h,1Fh,00h,90h,80h,00h
	DB	12h,1Fh,00h,90h,80h,00h
	DB	15h,1Fh,00h,90h,80h,00h
	DB	16h,1Fh,00h,90h,80h,00h
	DB	04h,1Fh,00h,90h,80h,00h
	DB	07h,1Fh,00h,90h,80h,00h
	DB	0Ah,1Fh,00h,90h,80h,00h
	DB	0Dh,1Fh,00h,90h,80h,00h
	DB	10h,1Fh,00h,90h,80h,00h
	DB	01h,1Fh,00h,90h,80h,00h
	DB	04h,1Fh,00h,90h,80h,00h
	DB	0Ah,1Fh,00h,90h,80h,00h
	DB	18h,1Fh,00h,90h,80h,00h
	DB	18h,1Fh,00h,90h,80h,00h
	DB	18h,1Fh,00h,90h,80h,00h
	DB	18h,1Fh,00h,90h,80h,00h

; Level 2 Route 1 terrain-object stream (17 x 3-byte records + FFFFh terminator, 53 bytes).
LEVEL2_ROUTE1_TERRAIN_STREAM:
	DB	0Ah,30h,B8h
	DB	14h,34h,21h
	DB	1Ch,30h,D8h
	DB	2Ah,30h,D8h
	DB	5Ah,34h,21h
	DB	5Eh,34h,2Bh
	DB	74h,10h,01h
	DB	77h,30h,D8h
	DB	84h,30h,B8h
	DB	87h,34h,34h
	DB	8Eh,30h,D8h
	DB	9Ah,30h,28h
	DB	9Ch,34h,22h
	DB	A8h,30h,28h
	DB	B2h,30h,A8h
	DB	B8h,34h,D4h
	DB	BEh,30h,58h
	DW	FFFFh	; End of stream

; Level 2 Route 2 terrain-object stream (16 x 3-byte records + FFFFh terminator, 50 bytes).
LEVEL2_ROUTE2_TERRAIN_STREAM:
	DB	14h,04h,0Fh
	DB	36h,34h,23h
	DB	44h,30h,48h
	DB	58h,30h,98h
	DB	5Bh,34h,D1h
	DB	68h,30h,28h
	DB	6Ch,30h,B8h
	DB	75h,34h,D6h
	DB	9Ah,28h,A7h
	DB	9Ch,30h,38h
	DB	A2h,30h,98h
	DB	AAh,30h,D8h
	DB	ACh,30h,38h
	DB	AFh,30h,58h
	DB	B7h,30h,A8h
	DB	BCh,34h,3Eh
	DW	FFFFh	; End of stream

; Level 2 Route 3 terrain-object stream (12 x 3-byte records + FFFFh terminator, 38 bytes).
LEVEL2_ROUTE3_TERRAIN_STREAM:
	DB	2Ah,28h,81h
	DB	3Ch,3Ch,D1h
	DB	40h,34h,51h
	DB	47h,30h,28h
	DB	4Eh,30h,D8h
	DB	50h,34h,D6h
	DB	54h,3Ch,20h
	DB	60h,0Ch,1Bh
	DB	75h,40h,21h
	DB	93h,34h,D5h
	DB	ACh,08h,15h
	DB	B0h,34h,89h
	DW	FFFFh	; End of stream

; Level 3 Route 1 terrain-object stream (22 x 3-byte records + FFFFh terminator, 68 bytes).
LEVEL3_ROUTE1_TERRAIN_STREAM:
	DB	22h,34h,66h
	DB	22h,30h,78h
	DB	29h,30h,98h
	DB	2Eh,30h,58h
	DB	2Eh,30h,88h
	DB	35h,30h,B8h
	DB	3Ah,34h,D1h
	DB	3Eh,30h,48h
	DB	4Eh,30h,28h
	DB	52h,34h,8Dh
	DB	54h,10h,00h
	DB	78h,30h,D8h
	DB	7Ah,34h,D4h
	DB	7Ch,34h,46h
	DB	86h,30h,28h
	DB	88h,34h,3Dh
	DB	9Eh,34h,66h
	DB	A0h,30h,D8h
	DB	A2h,30h,D8h
	DB	AAh,30h,28h
	DB	ACh,30h,68h
	DB	AEh,34h,65h
	DW	FFFFh	; End of stream

; Level 3 Route 2 terrain-object stream (18 x 3-byte records + FFFFh terminator, 56 bytes).
LEVEL3_ROUTE2_TERRAIN_STREAM:
	DB	14h,04h,10h
	DB	2Eh,30h,48h
	DB	4Ah,34h,86h
	DB	4Ah,30h,D8h
	DB	5Eh,34h,2Ah
	DB	6Ch,30h,D8h
	DB	6Fh,34h,DBh
	DB	72h,34h,8Dh
	DB	7Dh,34h,2Eh
	DB	7Dh,34h,DDh
	DB	7Fh,18h,71h
	DB	92h,28h,88h
	DB	95h,34h,3Dh
	DB	9Ch,08h,14h
	DB	AAh,30h,48h
	DB	B4h,28h,C2h
	DB	B8h,30h,28h
	DB	BEh,30h,B8h
	DW	FFFFh	; End of stream

; Level 3 Route 3 terrain-object stream (20 x 3-byte records + FFFFh terminator, 62 bytes).
LEVEL3_ROUTE3_TERRAIN_STREAM:
	DB	29h,30h,88h
	DB	34h,30h,48h
	DB	38h,30h,48h
	DB	3Ah,30h,58h
	DB	44h,30h,D8h
	DB	48h,34h,D9h
	DB	5Ah,30h,58h
	DB	5Ah,34h,8Dh
	DB	70h,3Ch,20h
	DB	74h,0Ch,1Ah
	DB	7Ah,30h,C8h
	DB	7Dh,40h,22h
	DB	84h,30h,88h
	DB	8Ch,34h,21h
	DB	9Fh,30h,88h
	DB	A4h,30h,28h
	DB	A6h,30h,28h
	DB	AAh,34h,D9h
	DB	BCh,34h,24h
	DB	C2h,30h,B8h
	DW	FFFFh	; End of stream

; Level 4 Route 1 terrain-object stream (20 x 3-byte records + FFFFh terminator, 62 bytes).
LEVEL4_ROUTE1_TERRAIN_STREAM:
	DB	1Ah,34h,65h
	DB	21h,30h,B8h
	DB	26h,30h,68h
	DB	2Ch,34h,D9h
	DB	49h,30h,A8h
	DB	4Ch,30h,68h
	DB	4Eh,30h,68h
	DB	50h,34h,2Eh
	DB	52h,30h,D8h
	DB	56h,30h,58h
	DB	66h,34h,D9h
	DB	76h,34h,31h
	DB	76h,28h,A9h
	DB	92h,34h,BDh
	DB	94h,08h,18h
	DB	9Eh,28h,63h
	DB	A8h,30h,28h
	DB	AAh,34h,D2h
	DB	B0h,30h,A8h
	DB	BAh,30h,38h
	DW	FFFFh	; End of stream

; Level 4 Route 2 terrain-object stream (16 x 3-byte records + FFFFh terminator, 50 bytes).
LEVEL4_ROUTE2_TERRAIN_STREAM:
	DB	14h,04h,11h
	DB	26h,30h,68h
	DB	2Eh,34h,21h
	DB	30h,30h,B8h
	DB	36h,34h,B4h
	DB	40h,34h,81h
	DB	4Dh,40h,43h
	DB	5Ch,34h,81h
	DB	62h,30h,A8h
	DB	82h,30h,38h
	DB	86h,34h,71h
	DB	92h,34h,4Dh
	DB	94h,30h,88h
	DB	99h,34h,25h
	DB	AAh,34h,D9h
	DB	BAh,30h,68h
	DW	FFFFh	; End of stream

; Level 4 Route 3 terrain-object stream (25 x 3-byte records + FFFFh terminator, 77 bytes).
LEVEL4_ROUTE3_TERRAIN_STREAM:
	DB	00h,34h,65h
	DB	00h,30h,78h
	DB	10h,30h,28h
	DB	1Dh,34h,5Dh
	DB	24h,10h,04h
	DB	30h,34h,29h
	DB	30h,30h,48h
	DB	44h,30h,58h
	DB	54h,30h,98h
	DB	54h,34h,D1h
	DB	56h,34h,D4h
	DB	5Ch,34h,26h
	DB	5Dh,30h,D8h
	DB	74h,34h,21h
	DB	76h,34h,AAh
	DB	82h,30h,58h
	DB	89h,30h,68h
	DB	8Ch,30h,28h
	DB	98h,30h,D8h
	DB	A2h,34h,25h
	DB	ACh,34h,D1h
	DB	AEh,34h,DBh
	DB	B6h,3Ch,D0h
	DB	B8h,0Ch,1Eh
	DB	BDh,30h,D8h
	DW	FFFFh	; End of stream

; Level 5 Route 1 terrain-object stream (22 x 3-byte records + FFFFh terminator, 68 bytes).
LEVEL5_ROUTE1_TERRAIN_STREAM:
	DB	11h,34h,C9h
	DB	34h,30h,28h
	DB	36h,34h,2Dh
	DB	40h,08h,19h
	DB	4Eh,18h,81h
	DB	56h,18h,41h
	DB	66h,18h,82h
	DB	6Eh,18h,21h
	DB	6Eh,18h,82h
	DB	82h,30h,88h
	DB	82h,34h,ADh
	DB	82h,18h,C1h
	DB	8Ah,28h,A4h
	DB	8Eh,34h,DDh
	DB	8Eh,18h,81h
	DB	92h,30h,28h
	DB	96h,34h,D1h
	DB	9Eh,30h,48h
	DB	9Eh,30h,B8h
	DB	A8h,30h,38h
	DB	A8h,30h,B8h
	DB	B2h,34h,DDh
	DW	FFFFh	; End of stream

; Level 5 Route 2 terrain-object stream (23 x 3-byte records + FFFFh terminator, 71 bytes).
LEVEL5_ROUTE2_TERRAIN_STREAM:
	DB	14h,04h,12h
	DB	28h,3Ch,D1h
	DB	38h,34h,22h
	DB	46h,18h,21h
	DB	46h,18h,41h
	DB	46h,18h,61h
	DB	46h,18h,81h
	DB	46h,18h,A1h
	DB	46h,18h,C1h
	DB	52h,30h,28h
	DB	57h,30h,D8h
	DB	60h,34h,9Ah
	DB	6Eh,30h,28h
	DB	7Ah,30h,D8h
	DB	82h,34h,B9h
	DB	82h,18h,21h
	DB	94h,30h,A8h
	DB	A1h,34h,ADh
	DB	A2h,18h,22h
	DB	A6h,18h,A3h
	DB	A8h,10h,05h
	DB	AEh,28h,2Ah
	DB	B6h,30h,98h
	DW	FFFFh	; End of stream

; Level 5 Route 3 terrain-object stream (17 x 3-byte records + FFFFh terminator, 53 bytes).
LEVEL5_ROUTE3_TERRAIN_STREAM:
	DB	4Ch,30h,28h
	DB	58h,30h,B8h
	DB	5Ah,34h,B5h
	DB	62h,30h,D8h
	DB	76h,30h,D8h
	DB	78h,30h,D8h
	DB	80h,3Ch,20h
	DB	8Ah,18h,83h
	DB	8Eh,18h,C3h
	DB	90h,0Ch,1Fh
	DB	94h,30h,A8h
	DB	97h,40h,44h
	DB	9Ah,18h,21h
	DB	A2h,34h,2Dh
	DB	A6h,18h,41h
	DB	ACh,34h,2Eh
	DB	ACh,30h,88h
	DW	FFFFh	; End of stream

; Level 6 Route 1 terrain-object stream (25 x 3-byte records + FFFFh terminator, 77 bytes).
LEVEL6_ROUTE1_TERRAIN_STREAM:
	DB	08h,30h,48h
	DB	08h,30h,68h
	DB	10h,30h,D8h
	DB	12h,30h,D8h
	DB	2Ah,30h,38h
	DB	2Eh,30h,D8h
	DB	42h,20h,20h
	DB	42h,20h,C0h
	DB	4Eh,20h,20h
	DB	4Eh,20h,C0h
	DB	52h,20h,40h
	DB	52h,20h,A0h
	DB	60h,20h,A0h
	DB	60h,20h,C0h
	DB	64h,20h,80h
	DB	6Ch,10h,02h
	DB	70h,34h,2Dh
	DB	76h,18h,41h
	DB	88h,30h,B8h
	DB	94h,30h,48h
	DB	A0h,30h,B8h
	DB	A6h,18h,C1h
	DB	ACh,34h,D9h
	DB	B6h,30h,88h
	DB	B8h,34h,31h
	DW	FFFFh	; End of stream

; Level 6 Route 2 terrain-object stream (22 x 3-byte records + FFFFh terminator, 68 bytes).
LEVEL6_ROUTE2_TERRAIN_STREAM:
	DB	14h,04h,13h
	DB	28h,30h,58h
	DB	2Ah,34h,55h
	DB	32h,30h,A8h
	DB	3Ah,34h,31h
	DB	3Eh,30h,C8h
	DB	44h,30h,68h
	DB	4Ah,34h,91h
	DB	52h,20h,C0h
	DB	56h,20h,20h
	DB	5Eh,20h,60h
	DB	6Ch,20h,60h
	DB	6Ch,20h,C0h
	DB	70h,20h,20h
	DB	70h,20h,80h
	DB	74h,20h,C0h
	DB	78h,20h,40h
	DB	7Ch,20h,80h
	DB	9Eh,18h,41h
	DB	A0h,08h,16h
	DB	AAh,34h,B5h
	DB	B8h,28h,A5h
	DW	FFFFh	; End of stream

; Level 6 Route 3 terrain-object stream (26 x 3-byte records + FFFFh terminator, 80 bytes).
LEVEL6_ROUTE3_TERRAIN_STREAM:
	DB	04h,20h,40h
	DB	0Ah,20h,C0h
	DB	0Eh,20h,20h
	DB	0Eh,20h,60h
	DB	22h,28h,ABh
	DB	2Ah,18h,C1h
	DB	32h,34h,3Bh
	DB	36h,30h,C8h
	DB	3Ch,30h,58h
	DB	42h,34h,A9h
	DB	56h,20h,60h
	DB	5Ah,20h,C0h
	DB	5Eh,20h,20h
	DB	62h,20h,A0h
	DB	66h,20h,80h
	DB	6Eh,20h,C0h
	DB	76h,20h,20h
	DB	8Ah,20h,20h
	DB	8Ah,20h,C0h
	DB	9Ah,20h,60h
	DB	9Ah,20h,80h
	DB	A2h,20h,40h
	DB	A2h,20h,A0h
	DB	B2h,20h,60h
	DB	B2h,20h,C0h
	DB	BAh,20h,A0h
	DW	FFFFh	; End of stream

; Level 1 Route 1 mobile-object stream (43 x 3-byte records + 0000h terminator, 131 bytes).
LEVEL1_ROUTE1_MOBILE_STREAM:
	DB	00h,10h,20h
	DB	01h,10h,C0h
	DB	03h,0Eh,A0h
	DB	07h,0Eh,60h
	DB	09h,10h,80h
	DB	09h,0Eh,C0h
	DB	0Bh,10h,40h
	DB	0Fh,0Eh,A0h
	DB	47h,04h,40h
	DB	4Bh,04h,C0h
	DB	57h,18h,60h
	DB	5Dh,10h,C0h
	DB	63h,18h,60h
	DB	63h,10h,80h
	DB	67h,0Eh,60h
	DB	67h,10h,C0h
	DB	6Fh,0Eh,E0h
	DB	73h,0Eh,20h
	DB	77h,18h,10h
	DB	83h,18h,10h
	DB	83h,18h,80h
	DB	87h,0Ah,B0h
	DB	8Fh,18h,10h
	DB	8Fh,18h,80h
	DB	8Fh,0Ah,B0h
	DB	94h,0Ah,D0h
	DB	97h,18h,80h
	DB	97h,18h,10h
	DB	9Bh,0Ah,D0h
	DB	A3h,0Eh,80h
	DB	A7h,0Eh,20h
	DB	ABh,0Eh,60h
	DB	AFh,0Eh,90h
	DB	B0h,0Eh,30h
	DB	B2h,10h,40h
	DB	B2h,0Eh,C0h
	DB	B4h,0Eh,40h
	DB	B5h,0Eh,70h
	DB	B9h,0Eh,80h
	DB	BBh,0Eh,30h
	DB	BBh,0Eh,C0h
	DB	BEh,0Eh,90h
	DB	BFh,0Eh,50h
	DW	0000h	; End of stream

; Level 1 Route 2 mobile-object stream (10 x 3-byte records + 0000h terminator, 32 bytes).
LEVEL1_ROUTE2_MOBILE_STREAM:
	DB	04h,18h,40h
	DB	07h,18h,A0h
	DB	47h,0Ah,80h
	DB	4Fh,0Ah,60h
	DB	51h,0Ah,A0h
	DB	67h,0Ah,70h
	DB	6Fh,0Ah,80h
	DB	77h,0Ah,70h
	DB	8Bh,04h,80h
	DB	93h,04h,40h
	DW	0000h	; End of stream

; Level 1 Route 3 mobile-object stream (27 x 3-byte records + 0000h terminator, 83 bytes).
LEVEL1_ROUTE3_MOBILE_STREAM:
	DB	0Bh,18h,60h
	DB	13h,18h,60h
	DB	17h,18h,F0h
	DB	27h,04h,40h
	DB	2Bh,04h,20h
	DB	33h,04h,40h
	DB	3Fh,04h,A0h
	DB	43h,04h,40h
	DB	53h,10h,60h
	DB	5Bh,10h,A0h
	DB	6Bh,04h,50h
	DB	6Fh,04h,A0h
	DB	79h,04h,40h
	DB	7Bh,04h,C0h
	DB	7Bh,10h,60h
	DB	7Fh,10h,A0h
	DB	85h,10h,30h
	DB	86h,10h,C0h
	DB	87h,04h,60h
	DB	8Bh,04h,C0h
	DB	8Fh,10h,A0h
	DB	A3h,18h,10h
	DB	AFh,06h,00h
	DB	AFh,18h,70h
	DB	AFh,18h,F0h
	DB	BBh,18h,70h
	DB	BBh,18h,F0h
	DW	0000h	; End of stream

; Level 2 Route 1 mobile-object stream (18 x 3-byte records + 0000h terminator, 56 bytes).
LEVEL2_ROUTE1_MOBILE_STREAM:
	DB	06h,02h,00h
	DB	1Eh,14h,60h
	DB	55h,16h,80h
	DB	59h,16h,50h
	DB	5Bh,16h,40h
	DB	5Dh,16h,60h
	DB	5Dh,16h,90h
	DB	5Dh,16h,B0h
	DB	63h,16h,50h
	DB	63h,16h,70h
	DB	63h,16h,C0h
	DB	65h,16h,B0h
	DB	66h,16h,D0h
	DB	69h,16h,50h
	DB	69h,16h,80h
	DB	6Bh,16h,B0h
	DB	AFh,02h,00h
	DB	CFh,02h,00h
	DW	0000h	; End of stream

; Level 2 Route 2 mobile-object stream (30 x 3-byte records + 0000h terminator, 92 bytes).
LEVEL2_ROUTE2_MOBILE_STREAM:
	DB	2Bh,0Eh,60h
	DB	2Dh,0Eh,B0h
	DB	34h,0Eh,30h
	DB	3Ah,0Eh,90h
	DB	3Fh,0Eh,50h
	DB	41h,0Eh,A0h
	DB	43h,0Eh,30h
	DB	45h,0Eh,90h
	DB	47h,0Eh,C0h
	DB	4Dh,0Eh,80h
	DB	4Dh,0Eh,D0h
	DB	4Fh,0Eh,50h
	DB	53h,0Eh,90h
	DB	5Bh,0Eh,D0h
	DB	63h,0Eh,A0h
	DB	7Fh,10h,D0h
	DB	87h,10h,A0h
	DB	89h,10h,50h
	DB	89h,10h,30h
	DB	8Dh,10h,30h
	DB	8Fh,10h,70h
	DB	90h,10h,C0h
	DB	91h,10h,A0h
	DB	92h,10h,D0h
	DB	A5h,0Eh,D0h
	DB	A6h,0Eh,70h
	DB	ADh,0Eh,30h
	DB	ADh,0Eh,A0h
	DB	B5h,0Eh,D0h
	DB	B7h,0Eh,50h
	DW	0000h	; End of stream

; Level 2 Route 3 mobile-object stream (26 x 3-byte records + 0000h terminator, 80 bytes).
LEVEL2_ROUTE3_MOBILE_STREAM:
	DB	0Fh,06h,00h
	DB	25h,06h,00h
	DB	4Bh,14h,80h
	DB	59h,14h,90h
	DB	5Dh,14h,30h
	DB	63h,18h,F0h
	DB	69h,10h,B0h
	DB	6Bh,10h,60h
	DB	6Ch,10h,30h
	DB	6Dh,10h,80h
	DB	71h,10h,C0h
	DB	7Dh,10h,B0h
	DB	7Fh,10h,60h
	DB	80h,10h,30h
	DB	81h,10h,80h
	DB	83h,10h,C0h
	DB	85h,10h,70h
	DB	89h,10h,B0h
	DB	8Dh,10h,70h
	DB	91h,10h,90h
	DB	93h,10h,C0h
	DB	9Bh,0Ch,80h
	DB	A7h,0Ch,80h
	DB	C0h,10h,90h
	DB	C1h,10h,20h
	DB	C3h,10h,C0h
	DW	0000h	; End of stream

; Level 3 Route 1 mobile-object stream (14 x 3-byte records + 0000h terminator, 44 bytes).
LEVEL3_ROUTE1_MOBILE_STREAM:
	DB	08h,14h,30h
	DB	1Bh,14h,50h
	DB	23h,12h,30h
	DB	37h,12h,70h
	DB	44h,14h,40h
	DB	5Fh,12h,90h
	DB	72h,14h,60h
	DB	6Fh,12h,B0h
	DB	77h,12h,70h
	DB	83h,12h,30h
	DB	90h,14h,50h
	DB	9Fh,12h,30h
	DB	A8h,12h,B0h
	DB	B7h,12h,50h
	DW	0000h	; End of stream

; Level 3 Route 2 mobile-object stream (8 x 3-byte records + 0000h terminator, 26 bytes).
LEVEL3_ROUTE2_MOBILE_STREAM:
	DB	34h,14h,70h
	DB	5Fh,02h,00h
	DB	6Fh,02h,00h
	DB	ACh,18h,F0h
	DB	AFh,02h,00h
	DB	B0h,18h,10h
	DB	BCh,18h,F0h
	DB	BFh,02h,00h
	DW	0000h	; End of stream

; Level 3 Route 3 mobile-object stream (15 x 3-byte records + 0000h terminator, 47 bytes).
LEVEL3_ROUTE3_MOBILE_STREAM:
	DB	0Bh,02h,00h
	DB	18h,18h,10h
	DB	1Fh,02h,00h
	DB	20h,18h,F0h
	DB	3Bh,02h,00h
	DB	4Bh,08h,00h
	DB	50h,18h,F0h
	DB	53h,02h,00h
	DB	54h,18h,10h
	DB	58h,18h,F0h
	DB	63h,08h,00h
	DB	67h,02h,00h
	DB	93h,02h,00h
	DB	9Bh,02h,00h
	DB	BBh,02h,00h
	DW	0000h	; End of stream

; Level 4 Route 1 mobile-object stream (25 x 3-byte records + 0000h terminator, 77 bytes).
LEVEL4_ROUTE1_MOBILE_STREAM:
	DB	0Bh,10h,C0h
	DB	0Fh,10h,30h
	DB	19h,10h,B0h
	DB	1Fh,18h,10h
	DB	27h,18h,50h
	DB	28h,18h,10h
	DB	2Bh,18h,10h
	DB	2Dh,18h,50h
	DB	30h,18h,10h
	DB	37h,1Ah,80h
	DB	38h,10h,C0h
	DB	3Ah,1Ah,60h
	DB	3Dh,10h,30h
	DB	43h,0Ch,20h
	DB	73h,08h,00h
	DB	77h,1Ah,A0h
	DB	7Ah,08h,00h
	DB	7Fh,10h,D0h
	DB	82h,10h,20h
	DB	83h,08h,00h
	DB	86h,10h,D0h
	DB	87h,1Ah,70h
	DB	8Ah,1Ah,40h
	DB	8Ch,08h,00h
	DB	93h,08h,00h
	DW	0000h	; End of stream

; Level 4 Route 2 mobile-object stream (20 x 3-byte records + 0000h terminator, 62 bytes).
LEVEL4_ROUTE2_MOBILE_STREAM:
	DB	01h,18h,10h
	DB	01h,10h,30h
	DB	01h,10h,C0h
	DB	05h,18h,50h
	DB	05h,10h,90h
	DB	91h,14h,60h
	DB	A3h,10h,D0h
	DB	A5h,10h,30h
	DB	A9h,10h,60h
	DB	AFh,10h,D0h
	DB	AFh,1Ah,80h
	DB	B1h,18h,10h
	DB	B1h,1Ah,A0h
	DB	B3h,18h,50h
	DB	B5h,1Ah,C0h
	DB	B6h,10h,D0h
	DB	B9h,18h,10h
	DB	BAh,10h,60h
	DB	BBh,18h,40h
	DB	BEh,18h,10h
	DW	0000h	; End of stream

; Level 4 Route 3 mobile-object stream (16 x 3-byte records + 0000h terminator, 50 bytes).
LEVEL4_ROUTE3_MOBILE_STREAM:
	DB	11h,02h,00h
	DB	23h,02h,00h
	DB	37h,14h,90h
	DB	41h,14h,60h
	DB	5Fh,1Eh,00h
	DB	65h,1Eh,00h
	DB	67h,1Eh,00h
	DB	6Fh,1Eh,00h
	DB	74h,1Eh,00h
	DB	79h,1Eh,00h
	DB	7Dh,1Eh,00h
	DB	83h,1Eh,00h
	DB	97h,1Ah,20h
	DB	A3h,1Ah,A0h
	DB	A7h,1Ah,80h
	DB	AFh,1Ah,60h
	DW	0000h	; End of stream

; Level 5 Route 1 mobile-object stream (37 x 3-byte records + 0000h terminator, 113 bytes).
LEVEL5_ROUTE1_MOBILE_STREAM:
	DB	01h,10h,C0h
	DB	05h,10h,20h
	DB	05h,10h,A0h
	DB	09h,10h,C0h
	DB	0Bh,10h,20h
	DB	11h,10h,40h
	DB	19h,10h,B0h
	DB	1Fh,20h,00h
	DB	25h,1Ah,C0h
	DB	29h,20h,00h
	DB	2Bh,1Ah,30h
	DB	30h,1Ah,A0h
	DB	33h,20h,00h
	DB	3Bh,20h,00h
	DB	3Bh,1Ah,80h
	DB	41h,20h,00h
	DB	4Bh,18h,B0h
	DB	4Dh,0Ah,81h
	DB	4Fh,0Ah,D1h
	DB	53h,0Ah,C1h
	DB	57h,0Ah,61h
	DB	5Bh,18h,B0h
	DB	5Bh,0Ah,D1h
	DB	5Fh,0Ah,C1h
	DB	60h,0Ah,21h
	DB	63h,18h,70h
	DB	64h,18h,B0h
	DB	65h,18h,10h
	DB	67h,18h,70h
	DB	69h,1Ch,00h
	DB	6Bh,0Ah,31h
	DB	6Dh,18h,A0h
	DB	72h,1Ch,00h
	DB	7Bh,1Ah,B0h
	DB	7Dh,1Ah,C0h
	DB	7Fh,1Ah,80h
	DB	83h,1Ah,50h
	DW	0000h	; End of stream

; Level 5 Route 2 mobile-object stream (18 x 3-byte records + 0000h terminator, 56 bytes).
LEVEL5_ROUTE2_MOBILE_STREAM:
	DB	2Bh,0Ah,21h
	DB	2Bh,0Ah,C1h
	DB	33h,0Ah,A1h
	DB	39h,0Ah,41h
	DB	3Bh,0Ah,C1h
	DB	41h,0Ah,31h
	DB	43h,0Ah,61h
	DB	43h,0Ah,B1h
	DB	71h,20h,00h
	DB	79h,20h,00h
	DB	7Fh,20h,00h
	DB	85h,20h,00h
	DB	91h,18h,50h
	DB	93h,18h,E0h
	DB	99h,18h,E0h
	DB	9Bh,18h,10h
	DB	A2h,18h,80h
	DB	A7h,1Ch,00h
	DW	0000h	; End of stream

; Level 5 Route 3 mobile-object stream (28 x 3-byte records + 0000h terminator, 86 bytes).
LEVEL5_ROUTE3_MOBILE_STREAM:
	DB	07h,0Ah,A1h
	DB	07h,0Ah,21h
	DB	09h,0Ah,71h
	DB	27h,1Ch,00h
	DB	4Fh,1Eh,00h
	DB	5Bh,1Eh,00h
	DB	5Fh,1Eh,00h
	DB	63h,1Eh,00h
	DB	67h,1Eh,00h
	DB	6Bh,16h,40h
	DB	6Dh,16h,40h
	DB	6Fh,16h,40h
	DB	73h,1Eh,00h
	DB	77h,16h,40h
	DB	7Bh,16h,40h
	DB	7Fh,16h,40h
	DB	83h,16h,40h
	DB	93h,18h,A0h
	DB	93h,18h,E0h
	DB	9Eh,18h,80h
	DB	9Eh,18h,E0h
	DB	A7h,18h,80h
	DB	A7h,18h,E0h
	DB	B3h,0Ah,A1h
	DB	B9h,0Ah,41h
	DB	BBh,0Ah,91h
	DB	BBh,0Ah,21h
	DB	BFh,0Ah,51h
	DW	0000h	; End of stream

; Level 6 Route 1 mobile-object stream (32 x 3-byte records + 0000h terminator, 98 bytes).
LEVEL6_ROUTE1_MOBILE_STREAM:
	DB	03h,04h,60h
	DB	03h,0Eh,80h
	DB	1Fh,20h,00h
	DB	21h,0Eh,B0h
	DB	29h,0Eh,60h
	DB	2Bh,0Eh,A0h
	DB	2Dh,0Eh,D0h
	DB	33h,0Eh,50h
	DB	37h,20h,00h
	DB	37h,0Eh,A0h
	DB	3Dh,0Eh,40h
	DB	45h,0Eh,A0h
	DB	4Bh,0Eh,60h
	DB	4Fh,0Eh,A0h
	DB	64h,14h,60h
	DB	8Fh,0Ch,80h
	DB	93h,0Eh,B0h
	DB	97h,0Eh,90h
	DB	9Bh,0Ch,80h
	DB	9Fh,0Eh,30h
	DB	A3h,0Eh,60h
	DB	A3h,0Eh,90h
	DB	A7h,0Ch,80h
	DB	A9h,0Eh,A0h
	DB	B1h,0Eh,60h
	DB	B2h,04h,80h
	DB	B5h,0Eh,30h
	DB	B5h,0Eh,80h
	DB	B7h,04h,30h
	DB	BBh,0Eh,50h
	DB	BDh,04h,90h
	DB	BFh,0Eh,40h
	DW	0000h	; End of stream

; Level 6 Route 2 mobile-object stream (16 x 3-byte records + 0000h terminator, 50 bytes).
LEVEL6_ROUTE2_MOBILE_STREAM:
	DB	03h,0Ah,71h
	DB	97h,14h,60h
	DB	9Fh,14h,60h
	DB	ABh,0Ah,81h
	DB	ADh,0Ah,A1h
	DB	AFh,0Ah,C1h
	DB	B3h,0Ah,91h
	DB	B3h,0Ah,B1h
	DB	B5h,0Ah,D1h
	DB	B7h,0Ah,61h
	DB	BBh,0Ah,81h
	DB	BDh,0Ah,51h
	DB	BDh,0Ah,B1h
	DB	BFh,0Ah,41h
	DB	BFh,0Ah,71h
	DB	BFh,0Ah,C1h
	DW	0000h	; End of stream

; Level 6 Route 3 mobile-object stream (11 x 3-byte records + 0000h terminator, 35 bytes).
LEVEL6_ROUTE3_MOBILE_STREAM:
	DB	1Bh,18h,50h
	DB	24h,18h,10h
	DB	24h,18h,90h
	DB	7Fh,02h,00h
	DB	9Bh,02h,00h
	DB	9Dh,1Ah,80h
	DB	A3h,1Ah,80h
	DB	A5h,1Ah,B0h
	DB	AFh,1Ah,60h
	DB	B3h,1Ah,B0h
	DB	BBh,1Ah,50h
	DW	0000h	; End of stream

; 104 bytes (13 x 8-byte 1bpp tiles) for Konami boot logo emblem layer 1, unpacked with
; color 01h to VRAM 0800h by Bank 01 672Eh (called during MainState 1 boot screen 42BDh ->
; 668Ch).
KONAMI_LOGO_EMBLEM_UPPER_1BPP_TILES:
	DB	07h,07h,0Fh,0Fh,0Fh,1Fh,1Fh,3Fh
	DB	FFh,FFh,FFh,FFh,FFh,FFh,FFh,FFh
	DB	F8h,F8h,F0h,F0h,F0h,E0h,E0h,E0h
	DB	00h,00h,00h,00h,01h,03h,0Fh,7Fh
	DB	3Fh,7Fh,7Fh,FFh,FFh,FFh,FFh,FFh
	DB	FFh,FFh,FFh,FFh,FFh,FCh,F0h,C0h
	DB	C0h,C0h,80h,80h,00h,00h,00h,00h
	DB	00h,00h,00h,01h,03h,07h,0Fh,0Fh
	DB	0Fh,3Fh,FFh,FFh,FFh,FFh,FFh,FFh
	DB	FFh,FFh,FFh,FEh,FCh,F8h,F8h,F0h
	DB	F8h,C0h,00h,00h,00h,00h,00h,00h
	DB	1Fh,1Fh,1Fh,3Fh,3Fh,3Fh,7Fh,7Fh
	DB	F0h,E0h,E0h,C0h,C0h,C0h,80h,80h

; 104 bytes (13 x 8-byte 1bpp tiles) for Konami boot logo emblem layer 2, unpacked with
; color 02h to VRAM 7000h by Bank 01 673Ah.
KONAMI_LOGO_EMBLEM_LOWER_1BPP_TILES:
	DB	00h,00h,00h,00h,00h,01h,01h,03h
	DB	7Fh,7Fh,FFh,FFh,FFh,FFh,FFh,FFh
	DB	FFh,FFh,FFh,FFh,FFh,FEh,FEh,FCh
	DB	80h,80h,00h,00h,00h,00h,00h,00h
	DB	00h,00h,00h,00h,00h,00h,00h,07h
	DB	03h,07h,07h,0Fh,1Fh,3Fh,FFh,FFh
	DB	FFh,FFh,FFh,FFh,FFh,FFh,FFh,F8h
	DB	FCh,F8h,F8h,F0h,E0h,C0h,00h,00h
	DB	00h,03h,0Fh,1Fh,3Fh,7Fh,FFh,FFh
	DB	FFh,FCh,F0h,E0h,C0h,80h,80h,00h
	DB	01h,01h,01h,03h,03h,03h,07h,07h
	DB	FFh,FFh,FFh,FFh,FFh,FFh,FFh,FFh
	DB	FFh,FEh,FEh,FCh,FCh,FCh,F8h,F8h

; 208 bytes (26 x 8-byte 1bpp tiles) for 'KONAMI' logotype lettering, unpacked with color
; 03h to VRAM D800h by Bank 01 6746h.
KONAMI_LOGO_LOGOTYPE_1BPP_TILES:
	DB	3Ch,3Ch,78h,78h,79h,F3h,F7h,FFh
	DB	1Fh,3Eh,7Ch,F9h,F3h,E3h,C3h,87h
	DB	1Fh,7Fh,F8h,F0h,E0h,E0h,C0h,C0h
	DB	C0h,F0h,F8h,78h,78h,79h,79h,79h
	DB	7Fh,7Fh,FFh,F7h,F7h,E7h,E7h,E7h
	DB	0Fh,0Fh,1Eh,1Eh,1Eh,3Ch,3Ch,3Ch
	DB	03h,07h,0Fh,0Eh,1Eh,3Ch,38h,78h
	DB	E0h,E0h,E0h,E0h,E0h,E1h,E1h,E1h
	DB	7Eh,7Eh,FEh,F6h,F6h,EEh,EEh,EEh
	DB	0Fh,0Fh,1Fh,1Dh,3Dh,3Bh,7Bh,73h
	DB	F1h,F1h,E3h,E3h,E3h,C7h,C7h,C7h
	DB	E0h,E0h,C0h,C0h,C0h,80h,80h,80h
	DB	01h,01h,01h,03h,03h,03h,07h,07h
	DB	EFh,E7h,E7h,C7h,C7h,C3h,83h,83h
	DB	87h,87h,87h,C7h,C7h,C7h,E3h,E0h
	DB	80h,80h,81h,81h,83h,C7h,FFh,FEh
	DB	FBh,F3h,F3h,F7h,E7h,C7h,8Fh,0Fh
	DB	C7h,C7h,C7h,87h,87h,87h,07h,07h
	DB	78h,78h,79h,F1h,F3h,F7h,E7h,EFh
	DB	70h,F0h,FFh,FFh,FFh,80h,80h,00h
	DB	E3h,E3h,E3h,E7h,E7h,E7h,EFh,EFh
	DB	CEh,CEh,CFh,8Fh,8Fh,8Fh,0Fh,0Fh
	DB	F7h,E7h,C7h,CFh,8Fh,8Fh,1Eh,1Eh
	DB	8Fh,8Fh,8Fh,1Eh,1Eh,1Eh,3Ch,3Ch
	DB	07h,08h,17h,14h,17h,14h,08h,07h
	DB	80h,40h,20h,A0h,20h,A0h,40h,80h

; 108-byte table of eighteen 6-byte ambient hazard spawn bitmask records (ACDCh..AD47h),
; pointed to by A186h..A1A9h. Indexed by vertical route band ((C302h >> 5) & 7); bits 0..5
; trigger hazard spawners in Bank 01 71C7h..7209h.
ROUTE_AMBIENT_HAZARD_SPAWN_MASKS:
	DB	00h,08h,00h,00h,00h,00h

; 6-byte ambient hazard bitmasks for route 01
ROUTE_01_AMBIENT_HAZARD_MASKS:
	DB	00h,08h,00h,00h,00h,08h

; 6-byte ambient hazard bitmasks for route 02
ROUTE_02_AMBIENT_HAZARD_MASKS:
	DB	00h,08h,08h,01h,00h,00h

; 6-byte ambient hazard bitmasks for route 03
ROUTE_03_AMBIENT_HAZARD_MASKS:
	DB	00h,10h,00h,00h,10h,00h

; 6-byte ambient hazard bitmasks for route 04
ROUTE_04_AMBIENT_HAZARD_MASKS:
	DB	00h,04h,00h,04h,00h,04h

; 6-byte ambient hazard bitmasks for route 05
ROUTE_05_AMBIENT_HAZARD_MASKS:
	DB	00h,00h,00h,00h,00h,00h

; 6-byte ambient hazard bitmasks for route 06
ROUTE_06_AMBIENT_HAZARD_MASKS:
	DB	00h,00h,00h,00h,00h,00h

; 6-byte ambient hazard bitmasks for route 07
ROUTE_07_AMBIENT_HAZARD_MASKS:
	DB	00h,00h,00h,00h,00h,08h

; 6-byte ambient hazard bitmasks for route 08
ROUTE_08_AMBIENT_HAZARD_MASKS:
	DB	00h,08h,00h,08h,00h,08h

; 6-byte ambient hazard bitmasks for route 09
ROUTE_09_AMBIENT_HAZARD_MASKS:
	DB	28h,00h,00h,00h,00h,08h

; 6-byte ambient hazard bitmasks for route 10
ROUTE_10_AMBIENT_HAZARD_MASKS:
	DB	00h,02h,22h,22h,00h,00h

; 6-byte ambient hazard bitmasks for route 11
ROUTE_11_AMBIENT_HAZARD_MASKS:
	DB	20h,00h,00h,02h,00h,20h

; 6-byte ambient hazard bitmasks for route 12
ROUTE_12_AMBIENT_HAZARD_MASKS:
	DB	20h,00h,00h,00h,00h,22h

; 6-byte ambient hazard bitmasks for route 13
ROUTE_13_AMBIENT_HAZARD_MASKS:
	DB	00h,00h,10h,00h,00h,00h

; 6-byte ambient hazard bitmasks for route 14
ROUTE_14_AMBIENT_HAZARD_MASKS:
	DB	00h,30h,00h,00h,00h,00h

; 6-byte ambient hazard bitmasks for route 15
ROUTE_15_AMBIENT_HAZARD_MASKS:
	DB	10h,00h,00h,00h,20h,00h

; 6-byte ambient hazard bitmasks for route 16
ROUTE_16_AMBIENT_HAZARD_MASKS:
	DB	00h,10h,04h,00h,00h,00h

; 6-byte ambient hazard bitmasks for route 17
ROUTE_17_AMBIENT_HAZARD_MASKS:
	DB	04h,10h,00h,10h,00h,00h

; 720 bytes (45 x 16-byte 2bpp tiles: 14 tiles at AD48h..AE27h + 31 tiles at AE28h..B017h)
; loaded by Bank 04 descriptor 62A5h (called from Bank 02 8449h for F5 Compass / World Map
; screen).
COMPASS_WORLD_MAP_2BPP_TILES:
	DB	00h,00h,7Eh,7Eh,FFh,81h,7Fh,80h,0Bh,F4h,00h,FFh,00h,FFh,00h,FFh
	DB	00h,00h,06h,06h,9Fh,98h,FFh,40h,FFh,20h,D0h,2Fh,08h,F7h,00h,FFh
	DB	00h,00h,00h,00h,01h,01h,C7h,46h,FFh,18h,7Fh,80h,04h,FBh,80h,7Fh
	DB	00h,00h,8Ch,8Ch,FDh,F3h,F9h,07h,F1h,0Fh,83h,7Dh,02h,FEh,03h,FFh
	DB	FFh,00h,FFh,00h,86h,79h,00h,FFh,00h,FFh,00h,FFh,3Eh,FEh,C0h,C0h
	DB	FFh,00h,FFh,00h,03h,FCh,00h,FFh,30h,FFh,5Fh,DFh,80h,80h,00h,00h
	DB	FFh,00h,FBh,04h,D6h,29h,02h,FDh,00h,FFh,86h,FFh,7Fh,7Eh,01h,01h
	DB	E0h,80h,BFh,C1h,9Fh,E0h,C7h,F8h,40h,7Fh,60h,5Fh,60h,5Fh,70h,4Fh
	DB	C0h,BFh,E0h,9Fh,60h,5Fh,60h,5Fh,70h,6Fh,38h,27h,30h,2Fh,30h,2Fh
	DB	40h,7Fh,20h,3Fh,20h,3Fh,20h,3Fh,20h,3Fh,20h,3Fh,20h,3Fh,10h,1Fh
	DB	18h,17h,38h,27h,30h,2Fh,30h,2Fh,38h,27h,30h,2Fh,60h,5Fh,60h,5Fh
	DB	20h,3Fh,20h,3Fh,20h,3Fh,20h,3Fh,10h,1Fh,10h,1Fh,0Dh,0Fh,03h,03h
	DB	41h,7Eh,43h,7Ch,22h,3Dh,26h,39h,48h,77h,80h,FFh,A1h,DFh,7Eh,7Eh
	DB	FFh,80h,BEh,C1h,0Ch,73h,40h,7Fh,40h,7Fh,40h,7Fh,3Fh,3Fh,00h,00h
	DB	55h,AAh,22h,DDh,9Ch,63h,55h,AAh,9Ch,63h,22h,DDh,55h,AAh,88h,77h
	DB	F8h,F8h,27h,DFh,9Ch,63h,55h,AAh,9Ch,63h,22h,DDh,55h,AAh,88h,77h
	DB	FFh,FFh,FFh,FFh,9Ch,63h,55h,AAh,9Ch,63h,22h,DDh,55h,AAh,88h,77h
	DB	FFh,FFh,FFh,FFh,9Dh,63h,55h,ABh,9Dh,63h,23h,DDh,55h,ABh,89h,77h
	DB	55h,AAh,22h,DDh,9Ch,63h,55h,AAh,9Ch,63h,22h,DDh,D5h,EAh,3Fh,3Fh
	DB	55h,AAh,22h,DDh,9Ch,63h,55h,AAh,9Ch,63h,22h,DDh,5Fh,AFh,F0h,F0h
	DB	55h,ABh,23h,DFh,9Fh,63h,55h,ABh,9Dh,63h,23h,DDh,F5h,FBh,0Eh,0Eh
	DB	57h,ABh,23h,DFh,9Fh,63h,57h,ABh,9Fh,63h,23h,DFh,5Fh,AFh,F3h,F3h
	DB	D5h,EAh,E2h,DDh,DCh,E3h,D5h,EAh,DCh,E3h,E2h,DDh,F5h,FAh,CFh,CFh
	DB	FCh,FCh,22h,DEh,9Dh,63h,55h,ABh,9Dh,63h,23h,DDh,55h,ABh,89h,77h
	DB	55h,AAh,22h,DDh,9Ch,63h,55h,AAh,FFh,FFh,FFh,FFh,FFh,FFh,FFh,FFh
	DB	55h,ABh,23h,DDh,9Dh,63h,55h,ABh,FFh,FFh,FFh,FFh,FFh,FFh,FFh,FFh
	DB	D5h,AAh,A2h,DDh,9Ch,E3h,D5h,AAh,FFh,FFh,FFh,FFh,FFh,FFh,FFh,FFh
	DB	FFh,FFh,FFh,FFh,FFh,FFh,FFh,FFh,9Ch,63h,22h,DDh,55h,AAh,88h,77h
	DB	55h,ABh,23h,DDh,9Dh,63h,55h,ABh,9Fh,63h,22h,DEh,56h,AAh,8Eh,76h
	DB	FFh,FFh,FFh,FFh,FFh,FFh,FFh,FFh,9Dh,63h,23h,DDh,55h,ABh,89h,77h
	DB	7Ch,7Ch,A3h,DFh,9Ch,63h,55h,AAh,9Ch,63h,22h,DDh,55h,AAh,88h,77h
	DB	55h,ABh,23h,DDh,9Dh,63h,55h,ABh,9Dh,63h,20h,DEh,56h,AAh,8Fh,75h
	DB	55h,AAh,A2h,DDh,9Ch,E3h,D5h,AAh,9Ch,63h,22h,DDh,55h,AAh,88h,77h
	DB	55h,AAh,22h,DDh,9Ch,63h,55h,AAh,9Ch,63h,22h,DDh,FFh,FFh,FFh,FFh
	DB	55h,ABh,23h,DDh,9Dh,63h,55h,ABh,9Dh,63h,23h,DDh,FFh,FFh,FFh,FFh
	DB	55h,AAh,22h,DDh,9Ch,63h,55h,AAh,9Fh,63h,23h,DFh,57h,ABh,8Bh,77h
	DB	FFh,FFh,E2h,DDh,DCh,E3h,D5h,EAh,DCh,E3h,E2h,DDh,D5h,EAh,88h,77h
	DB	EAh,D5h,C4h,FBh,F9h,C6h,FAh,F5h,F9h,E6h,C4h,FBh,AAh,D5h,11h,EEh
	DB	55h,ABh,23h,DFh,9Fh,67h,5Fh,AFh,9Fh,63h,23h,DFh,57h,AFh,FBh,FBh
	DB	FFh,FEh,FEh,FDh,9Ch,7Bh,55h,BAh,9Ch,63h,22h,DDh,55h,AAh,88h,77h
	DB	88h,77h,55h,AAh,22h,DDh,9Ch,63h,55h,BAh,9Ch,7Bh,FEh,FDh,FFh,FEh
	DB	57h,ABh,23h,DFh,9Fh,63h,57h,ABh,9Fh,63h,23h,DFh,57h,ABh,8Bh,77h
	DB	55h,ABh,23h,DFh,9Fh,67h,5Fh,AFh,9Fh,63h,23h,DFh,57h,ABh,8Bh,77h
	DB	57h,ABh,23h,DFh,9Fh,63h,57h,ABh,9Ch,63h,22h,DDh,55h,AAh,B8h,47h
	DB	DFh,DFh,23h,FFh,9Fh,63h,5Fh,AFh,9Fh,67h,23h,DFh,55h,ABh,88h,77h

; 216 bytes = six 36-byte (6x6) F5 Compass sector tilemaps in row-major order (B018h='斬',
; B03Ch='凶', B060h='邪', B084h='怒' [Stage 6 Bot-L], B0A8h='武' [Stage 5 Bot-M], B0CCh='狂'
; [Stage 4 Bot-R]); tiles 40h..4Bh / 50h..5Bh bake the black-on-brown 1bpp stage kanji directly
; into each 6x6 sector, superseding Bank 02 DRAW_COMPASS_SECTOR_KANJI_STUB (83E8h).
COMPASS_SECTOR_6X6_TILEMAPS:
	DB	08h,01h,02h,03h,02h,04h
	DB	09h,16h,2Bh,20h,20h,21h
	DB	0Ah,16h,37h,2Dh,16h,27h
	DB	0Bh,16h,40h,41h,29h,2Ah
	DB	09h,16h,50h,51h,18h,19h
	DB	0Ch,1Ah,1Bh,1Bh,1Ah,1Ch

; 6x6 F5 Compass sector 2 tilemap
COMPASS_SECTOR_2_TILEMAP:
	DB	02h,01h,03h,01h,02h,04h
	DB	20h,20h,20h,20h,20h,21h
	DB	28h,16h,16h,16h,16h,27h
	DB	29h,30h,42h,43h,29h,2Ah
	DB	18h,2Fh,52h,53h,18h,19h
	DB	1Ah,1Bh,2Eh,38h,1Bh,1Ch

; 6x6 F5 Compass sector 3 tilemap
COMPASS_SECTOR_3_TILEMAP:
	DB	01h,01h,02h,03h,01h,0Fh
	DB	20h,20h,20h,35h,16h,12h
	DB	16h,16h,31h,3Bh,16h,10h
	DB	29h,30h,44h,45h,16h,13h
	DB	18h,2Fh,54h,55h,16h,12h
	DB	1Ah,1Bh,1Dh,1Eh,1Ah,13h

; 6x6 F5 Compass sector 4 tilemap
COMPASS_SECTOR_4_TILEMAP:
	DB	0Bh,17h,26h,17h,17h,1Fh
	DB	09h,16h,4Ah,4Bh,3Ah,2Ah
	DB	0Ah,16h,5Ah,5Bh,39h,19h
	DB	0Ch,16h,31h,3Bh,16h,24h
	DB	0Bh,16h,33h,23h,23h,25h
	DB	0Dh,05h,06h,07h,05h,15h

; 6x6 F5 Compass sector 5 tilemap
COMPASS_SECTOR_5_TILEMAP:
	DB	26h,17h,36h,2Ch,26h,1Fh
	DB	29h,29h,48h,49h,3Ah,2Ah
	DB	18h,18h,58h,59h,39h,19h
	DB	28h,16h,16h,16h,16h,24h
	DB	23h,23h,23h,23h,23h,25h
	DB	0Eh,05h,06h,05h,07h,15h

; 6x6 F5 Compass sector 6 tilemap
COMPASS_SECTOR_6_TILEMAP:
	DB	17h,26h,34h,3Eh,26h,12h
	DB	29h,29h,46h,47h,16h,12h
	DB	18h,18h,56h,57h,16h,10h
	DB	16h,16h,32h,3Ch,16h,11h
	DB	23h,23h,23h,3Dh,16h,12h
	DB	0Eh,06h,07h,05h,06h,14h

; 1,000 bytes (125 x 8-byte 1bpp tiles: 1 tile at B0F0h + 62 tiles at B0F8h + 62 tiles at
; B2E8h) loaded by Bank 04 descriptor 62D2h (called from Bank 02 82DBh for F4 Stage Map
; screen).
STAGE_MAP_1BPP_TILES:
	DB	00h,00h,00h,00h,00h,00h,00h,00h
	DB	C0h,C0h,C0h,C0h,C0h,C0h,C0h,C0h
	DB	03h,03h,03h,03h,00h,00h,00h,00h
	DB	FFh,FFh,C0h,C0h,C0h,C0h,C3h,C3h
	DB	03h,03h,03h,03h,03h,03h,FFh,FFh
	DB	03h,03h,00h,00h,00h,00h,03h,03h
	DB	F3h,F3h,03h,03h,03h,03h,03h,03h
	DB	F0h,F0h,00h,00h,00h,00h,C0h,C0h
	DB	C0h,C0h,C0h,C0h,C0h,C0h,00h,00h
	DB	00h,00h,03h,03h,03h,03h,03h,03h
	DB	00h,00h,00h,00h,C0h,C0h,C0h,C0h
	DB	33h,33h,33h,33h,33h,33h,30h,30h
	DB	7Eh,7Eh,60h,60h,60h,60h,00h,00h
	DB	C0h,C0h,C0h,C0h,CFh,CFh,C0h,C0h
	DB	3Fh,3Fh,00h,00h,FFh,FFh,03h,03h
	DB	7Fh,7Fh,01h,01h,61h,61h,61h,61h
	DB	81h,81h,81h,81h,81h,81h,81h,81h
	DB	03h,03h,FFh,FFh,03h,03h,03h,03h
	DB	60h,60h,60h,60h,60h,60h,7Fh,7Fh
	DB	01h,01h,01h,01h,1Fh,1Fh,98h,98h
	DB	C0h,C0h,C0h,C0h,FFh,FFh,C0h,C0h
	DB	00h,00h,00h,00h,FFh,FFh,3Fh,3Fh
	DB	01h,01h,01h,01h,61h,61h,61h,61h
	DB	98h,98h,99h,99h,99h,99h,99h,99h
	DB	C0h,C0h,FCh,FCh,C0h,C0h,C0h,C0h
	DB	01h,01h,01h,01h,00h,00h,00h,00h
	DB	03h,03h,03h,03h,03h,03h,F3h,F3h
	DB	B0h,B0h,BFh,BFh,03h,03h,03h,03h
	DB	00h,00h,3Fh,3Fh,30h,30h,30h,30h
	DB	30h,30h,30h,30h,30h,30h,30h,30h
	DB	7Eh,7Eh,06h,06h,06h,06h,66h,66h
	DB	66h,66h,66h,66h,7Eh,7Eh,06h,06h
	DB	B0h,B0h,B0h,B0h,BFh,BFh,00h,00h
	DB	00h,00h,00h,00h,F0h,F0h,30h,30h
	DB	06h,06h,66h,66h,66h,66h,66h,66h
	DB	60h,60h,61h,61h,61h,61h,61h,61h
	DB	00h,00h,BFh,BFh,B0h,B0h,B0h,B0h
	DB	30h,30h,F0h,F0h,30h,30h,30h,30h
	DB	66h,66h,06h,06h,06h,06h,7Eh,7Eh
	DB	61h,61h,60h,60h,60h,60h,7Fh,7Fh
	DB	FCh,FCh,CCh,CCh,CCh,CCh,FCh,FCh
	DB	F3h,F3h,33h,33h,33h,33h,33h,33h
	DB	C3h,C3h,C3h,C3h,FFh,FFh,C0h,C0h
	DB	33h,33h,33h,33h,33h,33h,33h,33h
	DB	60h,60h,60h,60h,7Fh,7Fh,60h,60h
	DB	01h,01h,01h,01h,FFh,FFh,01h,01h
	DB	66h,66h,66h,66h,66h,66h,66h,66h
	DB	1Fh,1Fh,01h,01h,00h,00h,00h,00h
	DB	66h,66h,60h,60h,60h,60h,7Fh,7Fh
	DB	01h,01h,01h,01h,00h,00h,80h,80h
	DB	01h,01h,00h,00h,60h,60h,60h,60h
	DB	FFh,FFh,01h,01h,01h,01h,00h,00h
	DB	00h,00h,01h,01h,01h,01h,01h,01h
	DB	01h,01h,01h,01h,01h,01h,00h,00h
	DB	C0h,C0h,CCh,CCh,CFh,CFh,C0h,C0h
	DB	03h,03h,00h,00h,F0h,F0h,3Fh,3Fh
	DB	60h,60h,00h,00h,00h,00h,60h,60h
	DB	C0h,C0h,FCh,FCh,0Fh,0Fh,00h,00h
	DB	03h,03h,00h,00h,C0h,C0h,FFh,FFh
	DB	7Fh,7Fh,01h,01h,00h,00h,60h,60h
	DB	80h,80h,F8h,F8h,1Fh,1Fh,00h,00h
	DB	80h,80h,FFh,FFh,7Fh,7Fh,07h,07h
	DB	C0h,C0h,CCh,CCh,CCh,CCh,CCh,CCh
	DB	60h,60h,60h,60h,60h,60h,00h,00h
	DB	07h,07h,07h,07h,07h,07h,07h,07h
	DB	C0h,C0h,FFh,FFh,00h,00h,00h,00h
	DB	B0h,B0h,BFh,BFh,00h,00h,00h,00h
	DB	B0h,B0h,B0h,B0h,BFh,BFh,03h,03h
	DB	00h,00h,00h,00h,00h,00h,FFh,FFh
	DB	00h,00h,B0h,B0h,B0h,B0h,B0h,B0h
	DB	B0h,B0h,B0h,B0h,B0h,B0h,00h,00h
	DB	00h,00h,00h,00h,BFh,BFh,00h,00h
	DB	00h,00h,00h,00h,C0h,C0h,F0h,F0h
	DB	3Fh,3Fh,00h,00h,00h,00h,00h,00h
	DB	00h,00h,00h,00h,BFh,BFh,B0h,B0h
	DB	60h,60h,7Fh,7Fh,60h,60h,00h,00h
	DB	00h,00h,60h,60h,60h,60h,60h,60h
	DB	7Fh,7Fh,60h,60h,60h,60h,7Fh,7Fh
	DB	00h,00h,00h,00h,60h,60h,60h,60h
	DB	C0h,C0h,00h,00h,00h,00h,C3h,C3h
	DB	C3h,C3h,C0h,C0h,C0h,C0h,C0h,C0h
	DB	60h,60h,60h,60h,7Fh,7Fh,01h,01h
	DB	01h,01h,01h,01h,81h,81h,81h,81h
	DB	01h,01h,79h,79h,79h,79h,60h,60h
	DB	81h,81h,81h,81h,F9h,F9h,01h,01h
	DB	B0h,B0h,B0h,B0h,00h,00h,00h,00h
	DB	FFh,FFh,00h,00h,00h,00h,00h,00h
	DB	B0h,B0h,B0h,B0h,B3h,B3h,B0h,B0h
	DB	00h,00h,00h,00h,FCh,FCh,00h,00h
	DB	7Eh,7Eh,60h,60h,60h,60h,60h,60h
	DB	1Fh,1Fh,01h,01h,01h,01h,01h,01h
	DB	60h,60h,60h,60h,00h,00h,00h,00h
	DB	7Fh,7Fh,60h,60h,60h,60h,60h,60h
	DB	FFh,FFh,00h,00h,00h,00h,01h,01h
	DB	0Ch,0Ch,0Ch,0Ch,FCh,FCh,C0h,C0h
	DB	C0h,C0h,C0h,C0h,C3h,C3h,C3h,C3h
	DB	C3h,C3h,C3h,C3h,03h,03h,03h,03h
	DB	B0h,B0h,00h,00h,00h,00h,B3h,B3h
	DB	B3h,B3h,B3h,B3h,B3h,B3h,B3h,B3h
	DB	BFh,BFh,B0h,B0h,B0h,B0h,B0h,B0h
	DB	FFh,FFh,00h,00h,00h,00h,FFh,FFh
	DB	7Eh,7Eh,78h,78h,60h,60h,60h,60h
	DB	1Fh,1Fh,07h,07h,01h,01h,01h,01h
	DB	60h,60h,60h,60h,60h,60h,60h,60h
	DB	01h,01h,01h,01h,01h,01h,01h,01h
	DB	60h,60h,00h,00h,00h,00h,7Fh,7Fh
	DB	01h,01h,01h,01h,7Fh,7Fh,E1h,E1h
	DB	C3h,C3h,C3h,C3h,C3h,C3h,C3h,C3h
	DB	00h,00h,00h,00h,01h,01h,FFh,FFh
	DB	C0h,C0h,F0h,F0h,3Fh,3Fh,03h,03h
	DB	01h,01h,00h,00h,60h,60h,78h,78h
	DB	F8h,F8h,78h,78h,19h,19h,19h,19h
	DB	1Eh,1Eh,06h,06h,66h,66h,66h,66h
	DB	C3h,C3h,03h,03h,03h,03h,FFh,FFh
	DB	66h,66h,66h,66h,06h,06h,1Eh,1Eh
	DB	19h,19h,18h,18h,18h,18h,1Fh,1Fh
	DB	FFh,FFh,C0h,C0h,C0h,C0h,C0h,C0h
	DB	78h,78h,60h,60h,60h,60h,60h,60h
	DB	07h,07h,01h,01h,01h,01h,01h,01h
	DB	7Eh,7Eh,7Eh,7Eh,7Eh,7Eh,7Eh,7Eh
	DB	1Fh,1Fh,1Fh,1Fh,1Fh,1Fh,1Fh,1Fh
	DB	B0h,B0h,B0h,B0h,B0h,B0h,B0h,B0h
	DB	00h,00h,03h,03h,BFh,BFh,B0h,B0h
	DB	00h,00h,00h,00h,B0h,B0h,B0h,B0h
	DB	B0h,B0h,00h,00h,00h,00h,BFh,BFh

; 384 bytes (24 x 16-byte 2bpp tiles: 7 + 6 + 5 + 6 tiles across B4D8h..B657h) loaded by
; Bank 04 descriptor 62D2h for F4 Stage Map icons and connectors.
STAGE_MAP_2BPP_TILES:
	DB	00h,00h,00h,00h,00h,7Eh,00h,7Eh,00h,06h,00h,06h,01h,07h,01h,07h
	DB	00h,00h,00h,00h,00h,18h,00h,18h,00h,1Fh,00h,1Fh,E0h,FFh,E0h,FFh
	DB	00h,7Eh,00h,7Eh,00h,7Eh,00h,7Eh,00h,7Eh,00h,7Eh,01h,7Fh,01h,7Fh
	DB	00h,1Fh,00h,1Fh,00h,1Fh,00h,1Fh,00h,1Fh,00h,1Fh,E0h,FFh,E0h,FFh
	DB	00h,00h,00h,00h,00h,1Fh,00h,1Fh,00h,1Fh,00h,1Fh,E0h,FFh,E0h,FFh
	DB	00h,60h,00h,60h,00h,7Eh,00h,7Eh,00h,7Eh,00h,7Eh,01h,7Fh,01h,7Fh
	DB	00h,01h,00h,01h,00h,1Fh,00h,1Fh,00h,1Fh,00h,1Fh,E0h,FFh,E0h,FFh
	DB	00h,3Fh,00h,3Fh,0Ch,3Fh,0Ch,3Fh,00h,03h,00h,03h,00h,03h,00h,03h
	DB	00h,19h,00h,19h,00h,19h,00h,19h,00h,19h,00h,19h,06h,1Fh,06h,1Fh
	DB	00h,1Fh,00h,1Fh,00h,7Fh,00h,7Fh,18h,7Fh,18h,7Fh,00h,60h,00h,60h
	DB	00h,B0h,00h,B0h,00h,BFh,00h,BFh,00h,BFh,00h,BFh,03h,BFh,03h,BFh
	DB	00h,03h,00h,03h,00h,03h,00h,03h,00h,03h,00h,03h,30h,FFh,30h,FFh
	DB	00h,C0h,00h,C0h,00h,C0h,00h,C0h,00h,FCh,00h,FCh,30h,FCh,30h,FCh
	DB	00h,00h,00h,00h,00h,C0h,00h,C0h,0Ch,FFh,0Ch,FFh,00h,00h,00h,00h
	DB	03h,BFh,03h,BFh,00h,00h,00h,00h,00h,00h,00h,00h,00h,BFh,00h,BFh
	DB	0Ch,BFh,0Ch,BFh,00h,B3h,00h,B3h,00h,B0h,00h,B0h,00h,B0h,00h,B0h
	DB	00h,60h,00h,60h,00h,60h,00h,60h,00h,60h,00h,60h,18h,7Fh,18h,7Fh
	DB	00h,BFh,00h,BFh,00h,00h,00h,00h,00h,00h,00h,00h,03h,BFh,03h,BFh
	DB	00h,01h,00h,01h,06h,FFh,06h,FFh,00h,18h,00h,18h,00h,18h,00h,18h
	DB	00h,C0h,00h,C0h,00h,C0h,00h,C0h,00h,F0h,00h,F0h,0Ch,FFh,0Ch,FFh
	DB	0Ch,3Fh,0Ch,3Fh,00h,F0h,00h,F0h,00h,C0h,00h,C0h,00h,C3h,00h,C3h
	DB	0Ch,FFh,0Ch,FFh,00h,C0h,00h,C0h,00h,C0h,00h,C0h,00h,C0h,00h,C0h
	DB	60h,FFh,60h,FFh,00h,01h,00h,01h,00h,01h,00h,01h,00h,01h,00h,01h
	DB	00h,B0h,00h,B0h,03h,BFh,03h,BFh,00h,B0h,00h,B0h,00h,B0h,00h,B0h

; 504 bytes = six 84-byte (12x7) Stage Map room/route layout tilemaps (B658h, B6ACh, B700h,
; B754h, B7A8h, B7FCh) for Levels 1..6, referenced by Bank 02 pointer table 8312h..831Dh and
; drawn at 82F5h via 58E5h (pure tilemap data, NOT Z80 code).
STAGE_MAP_12X7_LEVEL_TILEMAPS:
	DB	02h,80h,66h,67h,7Ah,02h,A8h,02h,80h,68h,69h,7Ah
	DB	02h,A8h,02h,A4h,6Ah,6Bh,7Ah,02h,A8h,02h,6Ch,A0h
	DB	6Dh,7Bh,81h,A8h,02h,6Eh,6Fh,70h,7Ch,01h,A8h,02h
	DB	89h,71h,98h,7Ah,01h,A8h,72h,03h,73h,74h,7Dh,88h
	DB	ABh,75h,80h,76h,77h,7Ah,01h,A8h,02h,80h,68h,69h
	DB	7Ah,01h,A8h,02h,80h,68h,69h,7Ah,02h,A8h,02h,80h
	DB	95h,96h,7Ah,02h,A8h,02h,80h,78h,79h,7Ah,02h,A8h

; 12x7 F4 Stage Map room tilemap for Level 2
STAGE_MAP_LEVEL_2_TILEMAP:
	DB	02h,80h,5Ah,5Bh,7Ah,02h,A8h,02h,80h,68h,69h,A7h
	DB	81h,A8h,02h,03h,5Ch,69h,7Ah,01h,A8h,02h,80h,5Dh
	DB	5Eh,62h,01h,A8h,9Ch,80h,68h,69h,63h,01h,A8h,5Fh
	DB	80h,68h,69h,63h,01h,A9h,02h,80h,68h,69h,9Fh,01h
	DB	A8h,60h,80h,68h,69h,7Ah,01h,A8h,61h,80h,68h,69h
	DB	7Ah,01h,AAh,72h,80h,68h,69h,64h,65h,ABh,0Bh,80h
	DB	95h,96h,7Ah,02h,A9h,02h,80h,78h,79h,7Ah,02h,A8h

; 12x7 F4 Stage Map room tilemap for Level 3
STAGE_MAP_LEVEL_3_TILEMAP:
	DB	02h,80h,5Ah,5Bh,7Ah,01h,A8h,02h,80h,68h,69h,7Ah
	DB	01h,A8h,02h,87h,4Ch,A2h,56h,01h,A8h,02h,0Ah,4Dh
	DB	79h,7Ah,01h,A8h,02h,80h,4Eh,65h,A1h,02h,A8h,84h
	DB	89h,4Fh,69h,7Ah,01h,ABh,50h,9Bh,68h,69h,64h,57h
	DB	ABh,51h,87h,52h,53h,7Ah,01h,A8h,02h,0Ah,54h,55h
	DB	7Ah,01h,A8h,02h,80h,68h,69h,7Ah,01h,A8h,02h,80h
	DB	95h,96h,58h,59h,A8h,02h,80h,78h,79h,7Ah,01h,A8h

; 12x7 F4 Stage Map room tilemap for Level 4
STAGE_MAP_LEVEL_4_TILEMAP:
	DB	02h,80h,2Fh,30h,43h,9Dh,A8h,02h,80h,2Fh,69h,7Ah
	DB	01h,A8h,A3h,05h,31h,32h,56h,01h,A8h,08h,89h,33h
	DB	34h,44h,45h,ABh,02h,80h,68h,35h,46h,01h,A8h,02h
	DB	80h,68h,36h,47h,01h,A8h,37h,38h,39h,35h,46h,01h
	DB	A8h,3Ah,3Bh,3Ch,3Dh,48h,49h,AAh,02h,86h,3Ch,3Eh
	DB	46h,4Ah,A8h,3Fh,87h,40h,41h,9Ah,88h,A8h,85h,42h
	DB	90h,91h,4Bh,09h,A8h,02h,80h,2Fh,79h,7Ah,01h,A8h

; 12x7 F4 Stage Map room tilemap for Level 5
STAGE_MAP_LEVEL_5_TILEMAP:
	DB	02h,06h,1Fh,79h,7Ah,01h,A8h,02h,87h,20h,99h,21h
	DB	22h,A8h,02h,0Ah,23h,24h,25h,26h,A8h,6Ch,65h,27h
	DB	28h,9Eh,29h,A8h,02h,80h,68h,69h,7Ah,01h,A8h,82h
	DB	2Ah,68h,69h,7Ah,01h,ABh,2Bh,2Ch,68h,69h,7Ah,01h
	DB	A8h,75h,2Ah,2Dh,2Eh,7Ah,01h,A8h,A5h,07h,68h,69h
	DB	7Ah,01h,A8h,02h,80h,68h,36h,21h,0Bh,A8h,02h,80h
	DB	95h,94h,46h,02h,A8h,02h,80h,78h,79h,7Ah,01h,A8h

; 12x7 F4 Stage Map room tilemap for Level 6
STAGE_MAP_LEVEL_6_TILEMAP:
	DB	0Bh,0Ch,0Dh,5Bh,7Ah,01h,A9h,0Eh,0Fh,10h,11h,7Ah
	DB	01h,A8h,02h,12h,5Dh,A6h,7Ah,01h,A8h,04h,72h,13h
	DB	14h,47h,01h,A8h,15h,16h,17h,18h,46h,01h,A8h,19h
	DB	97h,68h,69h,7Ah,01h,A8h,02h,80h,68h,69h,7Ah,01h
	DB	A8h,02h,80h,68h,69h,7Ah,01h,A8h,02h,80h,68h,69h
	DB	7Ah,01h,A8h,02h,80h,68h,1Ah,1Ch,1Dh,A8h,02h,80h
	DB	92h,93h,63h,1Eh,A8h,83h,1Bh,78h,79h,7Ah,01h,A8h

; 48 bytes of FFh alignment padding before King Kong 2 combination initializer at B880h.
BANK09_MID_PADDING_FF:
	DS	0030h,FFh

; King Kong 2 companion-cartridge startup & RAM hook installer (entered via JP B880h from
; Bank 00 4121h). Records Hi no Tori slot ID (F100h), reads KK2 4002h init entry (F102h) via
; BIOS_RDSLT, clears BIOS_FNKSTR (F87Fh, A0h bytes), copies 256 bytes of KK2 init to F120h
; patching FDA0h -> F104h, copies AAh-byte H.TIMI hook template to F220h, installs
; H.TIMI=F220h, maps KK2 into page 1, and jumps to F120h. Variant diff (-7 bytes in a1):
; main (B886h..B891h, 12B) guesses KK2 primary slot from Hi no Tori's slot, breaking
; non-adjacent/expanded slots; a1 removes those 12B (preserving the true detected slot in
; F101h) and adds 5B (B8A4h..B8A8h: LD A,C9h / LD (FD9Fh),A) to disarm H.TIMI before writing
; FDA0h.
KING_KONG2_COMBINATION_INIT_ENTRY:
	CALL	GET_CURRENT_PAGE1_SLOT_ID
	LD	(HINOTORI_SLOT_ID),A
; Original release guesses King Kong 2 primary slot from Hi no Tori's slot;
; [a1] omits this block to preserve the true slot recorded during boot scan
	IF	HINOTORI_A1 = 00h
	OR	A
	LD	B,04h
	JP	M,.add_kk2_slot_step
	LD	B,01h

.add_kk2_slot_step:
	ADD	A,B
	LD	(KK2_SLOT_ID),A
	ENDIF
	LD	HL,KK2_CART_INIT_PTR_ADDR
	CALL	READ_WORD_FROM_KK2_SLOT
	LD	(KK2_INIT_ENTRY_ADDR),DE
	LD	HL,BIOS_FNKSTR
	LD	B,A0h
	CALL	ZERO_B_BYTES_AT_HL
	CALL	COPY_KING_KONG2_PAGE_TO_RAM
	CALL	COPY_KING_KONG2_HOOK_TEMPLATE
	CALL	INSTALL_KING_KONG2_RAM_HOOK
	JP	COPIED_KK2_INIT_STUB	; asm/core/ram_layout.asm

; Canonical InstallKingKong2RamHook: set (FDA0h)=F220h, clear (F106h), ENASLT KK2 page 1
INSTALL_KING_KONG2_RAM_HOOK:
	IF	HINOTORI_A1
	LD	A,C9h	; Disarm H.TIMI with RET before writing hook target address
	LD	(BIOS_H_TIMI),A
	ENDIF
	LD	HL,KING_KONG2_HTIMI_HOOK_RAM
	LD	(BIOS_H_TIMI_ADDR),HL
	LD	HL,0000h
	LD	(COMBINATION_HOOK_BUSY),HL
	LD	A,(KK2_SLOT_ID)
	LD	H,40h
	JP	BIOS_ENASLT	; asm/core/constants.asm

; Canonical GetCurrentPage1SlotId: build ENASLT slot ID from RSLREG & EXPTBL/SLTTBL
GET_CURRENT_PAGE1_SLOT_ID:
	CALL	BIOS_RSLREG
	RRCA
	RRCA
	AND	03h
	LD	C,A
	LD	B,00h
	LD	HL,BIOS_EXPTBL
	ADD	HL,BC
	OR	(HL)
	LD	C,A
	INC	HL
	INC	HL
	INC	HL
	INC	HL
	LD	A,(HL)
	AND	0Ch
	OR	C
	RET

; Read 16-bit word at HL from slot (F101h) into DE via BIOS_RDSLT
READ_WORD_FROM_KK2_SLOT:
	LD	A,(KK2_SLOT_ID)
	LD	C,A
	CALL	READ_BYTE_FROM_SLOT_C
	LD	E,D

; Read 1 byte at HL from slot C via BIOS_RDSLT
READ_BYTE_FROM_SLOT_C:
	LD	A,C
	PUSH	BC
	PUSH	DE
	CALL	BIOS_RDSLT
	POP	DE
	POP	BC
	LD	D,A
	OR	E
	INC	HL
	RET

; Canonical CopyKingKong2PageToRam: copy 256B from (F102h) to F120h and patch FDA0h -> F104h
COPY_KING_KONG2_PAGE_TO_RAM:
	LD	HL,(KK2_INIT_ENTRY_ADDR)
	LD	DE,COPIED_KK2_INIT_STUB
	LD	B,00h

.loc_b8f9:
	PUSH	BC
	PUSH	DE
	LD	A,(KK2_SLOT_ID)
	CALL	BIOS_RDSLT
	POP	DE
	POP	BC
	LD	(DE),A
	INC	HL
	INC	DE
	DJNZ	.loc_b8f9
	LD	BC,0100h
	LD	HL,COPIED_KK2_INIT_STUB

.loc_b90e:
	LD	A,A0h
	CPIR
	RET	NZ
	RET	PO
	LD	A,FDh
	CP	(HL)
	JR	NZ,.loc_b90e
	LD	DE,KK2_HTIMI_HOOK_TARGET
	LD	(HL),D
	DEC	HL
	LD	(HL),E
	RET

; Canonical CopyKingKong2HookTemplate: LDIR 00AAh bytes from B92Ch to F220h
COPY_KING_KONG2_HOOK_TEMPLATE:
	LD	HL,KING_KONG2_HTIMI_RAM_HOOK_TEMPLATE
	LD	DE,KING_KONG2_HTIMI_HOOK_RAM
	LD	BC,KING_KONG2_HTIMI_HOOK_RAM_END - KING_KONG2_HTIMI_HOOK_RAM
	LDIR
	RET

; 170-byte (00AAh) position-relocated Z80 code template copied to resident RAM F220h..F2C9h
; (PHASE F220h). Intercepts King Kong 2 H.TIMI VBlank: chains to KK2 H.TIMI target (F104h)
; unless KK2 is in active play ((C100h)==5, (C201h)==0, (C133h)==0, (C560h)==0, (C300h)<5,
; (C105h)==0); on F4 (SNSMAT row 7 bit 0) or F5 (bit 1), backs up E000h..E2FFh to CA00h,
; maps Hi no Tori into pages 1 & 2, mutes PSG, and runs TapeSaveStateMachine (B9D6h/B9CFh)
; or TapeLoadStateMachine (BAA3h/BA9Ch) on subsequent VBlanks. Includes
; ReturnToKingKong2Slots stub at F2BBh..F2C9h.
KING_KONG2_HTIMI_RAM_HOOK_TEMPLATE:
	DEPHASE
	PHASE	KK2_HTIMI_HOOK_RAM_ADDR

; Runtime F220h (Canonical KingKong2HookTemplate): DI, check (F106h) & KK2 gameplay state
KING_KONG2_HTIMI_HOOK_RAM:
	DI
	LD	A,(COMBINATION_HOOK_BUSY)
	AND	A
	RET	NZ
	LD	A,(MAIN_STATE)
	CP	05h
	JR	Z,CHECK_KK2_COMBINATION_HOTKEY_F231

; Runtime F22Dh: LD HL,(F104h) / JP (HL)
CHAIN_TO_KK2_HTIMI_F22D:
	LD	HL,(KK2_HTIMI_HOOK_TARGET)
	JP	(HL)

; Dispatch active SAVE/LOAD frame or check whether King Kong 2 state allows combination
; hotkeys
CHECK_KK2_COMBINATION_HOTKEY_F231:
	LD	A,(COMBINATION_ACTIVE_MODE)
	DEC	A
	JR	Z,RUN_TAPE_SAVE_FRAME_F29F
	DEC	A
	JR	Z,RUN_TAPE_LOAD_FRAME_F2AD
	LD	A,(CALLBACK_SUBTIMER)
	AND	A
	JR	NZ,CHAIN_TO_KK2_HTIMI_F22D
	LD	A,(KK2_BUSY_SUBSTATE_FLAG)
	AND	A
	JR	NZ,CHAIN_TO_KK2_HTIMI_F22D
	LD	A,(KK2_CUTSCENE_ACTIVE_FLAG)
	AND	A
	JR	NZ,CHAIN_TO_KK2_HTIMI_F22D
	LD	A,(LEVEL_STRIP_STREAM_BASE)
	CP	05h
	JR	NC,CHAIN_TO_KK2_HTIMI_F22D
	LD	A,07h
	CALL	BIOS_SNSMAT
	BIT	00h,A
	JR	Z,BEGIN_TAPE_SAVE_ON_F4_F262
	BIT	01h,A
	JR	Z,BEGIN_TAPE_LOAD_ON_F5_F291
	JR	CHAIN_TO_KK2_HTIMI_F22D

; Runtime F262h (Canonical BeginTapeSaveOnF4): set mode (F107h)=1 and enter common UI swap
BEGIN_TAPE_SAVE_ON_F4_F262:
	LD	A,(MAIN_FRAME_BUSY)
	AND	A
	JR	NZ,CHAIN_TO_KK2_HTIMI_F22D
	LD	HL,0001h
	LD	(COMBINATION_ACTIVE_MODE),HL

; Runtime F26Eh: backup E000h->CA00h (300Bh), ENASLT Hi no Tori pages 1-2, mute PSG, JP
; 4CEDh
SWAP_IN_HINOTORI_FOR_TAPE_UI_F26E:
	CALL	KK2_ROM_PREPARE_VDP_ADDR
	LD	HL,LEVEL_TILE_BUFFER
	LD	DE,LOGICAL_SPRITE_OBJ_TABLE
	LD	BC,0300h
	LDIR
	LD	A,(HINOTORI_SLOT_ID)
	LD	H,80h
	PUSH	AF
	CALL	BIOS_ENASLT
	POP	AF
	LD	H,40h
	CALL	BIOS_ENASLT
	CALL	MUTE_PSG_VOLUMES
	JP	DISABLE_VDP_SPRITES	; asm/banks/bank00.asm

; Runtime F291h (Canonical BeginTapeLoadOnF5): set mode (F107h)=2 and JR F26Eh
BEGIN_TAPE_LOAD_ON_F5_F291:
	LD	A,(MAIN_FRAME_BUSY)
	AND	A
	JR	NZ,CHAIN_TO_KK2_HTIMI_F22D
	LD	HL,0002h
	LD	(COMBINATION_ACTIVE_MODE),HL
	JR	SWAP_IN_HINOTORI_FOR_TAPE_UI_F26E

; Runtime F29Fh (Canonical RunTapeSaveStateMachine): lock (F106h)=1, CALL B9D6h, unlock
RUN_TAPE_SAVE_FRAME_F29F:
	LD	A,01h
	LD	(COMBINATION_HOOK_BUSY),A
	CALL	TAPE_SAVE_STATE_MACHINE_ENTRY
	DI
	XOR	A
	LD	(COMBINATION_HOOK_BUSY),A
	RET

; Runtime F2ADh (Canonical RunTapeLoadStateMachine): lock (F106h)=1, CALL BAA3h, unlock
RUN_TAPE_LOAD_FRAME_F2AD:
	LD	A,01h
	LD	(COMBINATION_HOOK_BUSY),A
	CALL	TAPE_LOAD_STATE_MACHINE_ENTRY
	DI
	XOR	A
	LD	(COMBINATION_HOOK_BUSY),A
	RET

; Runtime F2BBh: map King Kong 2 slot (F101h) back into pages 1 (4000h) and 2 (8000h)
RETURN_TO_KK2_SLOTS_RAM:
	LD	A,(KK2_SLOT_ID)
	LD	H,40h
	PUSH	AF
	CALL	BIOS_ENASLT
	POP	AF
	LD	H,80h
	JP	BIOS_ENASLT	; asm/core/constants.asm

KING_KONG2_HTIMI_HOOK_RAM_END:
	DEPHASE
	PHASE	KING_KONG2_HTIMI_RAM_HOOK_TEMPLATE + (KING_KONG2_HTIMI_HOOK_RAM_END - KING_KONG2_HTIMI_HOOK_RAM)

; Entry point for King Kong 2 F4 cassette SAVE state machine: loads CombinationUiSubstate
; (F108h) and dispatches via CALL 40AEh.
TAPE_SAVE_STATE_MACHINE_ENTRY:
	LD	A,(COMBINATION_UI_SUBSTATE)
	CALL	INLINE_WORD_DISPATCH

; 5-entry inline dispatch table for cassette SAVE substates 0..4
; (B9E6h/B9FAh/BA13h/BA3Bh/BA71h in main; -7 in a1).
KING_KONG2_TAPE_SAVE_STATE_TABLE:
	DW	TAPE_SAVE_STATE0_DRAW_PROMPT
	DW	TAPE_SAVE_STATE1_EDIT_FILENAME
	DW	TAPE_SAVE_STATE2_WRITE_HEADER
	DW	TAPE_SAVE_STATE3_WRITE_DATA
	DW	TAPE_SAVE_STATE4_CONFIRM_RETRY

; Cassette SAVE substate handlers 0..4 plus tape write error handler: draw 'SAVE MODE /
; INPUT FILE NAME', edit 6-char filename, write 10x EAh header + 6-char filename via
; BIOS_TAPOON/TAPOUT, serialize all 13 King Kong 2 RAM blocks (BD02h/BCFBh, 624 bytes) to
; tape, and prompt 'OK? YES -> Y / NO -> N'.
TAPE_SAVE_STATE0_DRAW_PROMPT:
	CALL	CLEAR_TAPE_UI_PANELS
	CALL	FLUSH_BIOS_KEYBUF
	LD	HL,KING_KONG2_TAPE_UI_STRINGS
	CALL	DRAW_POSITIONED_TEXT_STRING
	CALL	CLEAR_TAPE_FILENAME_WORK_BYTES

; INC (F108h) and return
ADVANCE_TAPE_UI_SUBSTATE:
	LD	HL,COMBINATION_UI_SUBSTATE
	INC	(HL)
	RET

; Read filename char (BBE0h); ESC cancels (BB40h); CR prints 'SAVING' and advances
TAPE_SAVE_STATE1_EDIT_FILENAME:
	CALL	EDIT_SIX_CHAR_TAPE_FILENAME
	JP	C,EXIT_TAPE_UI_TO_KING_KONG2
	PUSH	AF
	LD	HL,KK2_TAPE_SAVE_ERROR_TEXT
	CALL	DRAW_TEXT_AT_DE
	POP	AF
	CP	0Dh
	RET	NZ
	LD	HL,KK2_TAPE_SAVING_STATUS_TEXT
	CALL	DRAW_POSITIONED_TEXT_STRING
	JR	ADVANCE_TAPE_UI_SUBSTATE

; BIOS_TAPOON(A=1), write ten EAh sync bytes and 6-char filename (F10Ah..F10Fh)
TAPE_SAVE_STATE2_WRITE_HEADER:
	LD	A,01h
	CALL	BIOS_TAPOON
	LD	B,0Ah

.loc_ba1a:
	PUSH	BC
	LD	A,EAh
	CALL	BIOS_TAPOUT
	POP	BC
	JP	C,TAPE_SAVE_ERROR_REPORT
	DJNZ	.loc_ba1a
	LD	B,06h
	LD	HL,COMBINATION_FILENAME_BUF

.loc_ba2b:
	PUSH	HL
	PUSH	BC
	LD	A,(HL)
	CALL	BIOS_TAPOUT
	JP	C,TAPE_SAVE_ERROR_REPORT
	POP	BC
	POP	HL
	INC	HL
	DJNZ	.loc_ba2b
	JR	ADVANCE_TAPE_UI_SUBSTATE

; BIOS_TAPOON(A=0), stream 13 RAM blocks from BD02h via BIOS_TAPOUT, BIOS_TAPOOF, show 'OK?'
TAPE_SAVE_STATE3_WRITE_DATA:
	XOR	A
	CALL	BIOS_TAPOON
	JP	C,TAPE_SAVE_ERROR_REPORT
	LD	HL,KING_KONG2_SERIALIZED_RAM_RANGES

.loc_ba45:
	LD	E,(HL)
	INC	HL
	LD	D,(HL)
	LD	A,E
	OR	D
	JR	Z,.loc_ba65
	INC	HL
	LD	C,(HL)
	INC	HL
	LD	B,(HL)
	INC	HL
	PUSH	HL

.loc_ba52:
	PUSH	DE
	PUSH	BC
	LD	A,(DE)
	CALL	BIOS_TAPOUT
	POP	BC
	POP	DE
	JR	C,TAPE_SAVE_ERROR_POP_AND_REPORT
	INC	DE
	DEC	BC
	LD	A,B
	OR	C
	JR	NZ,.loc_ba52
	POP	HL
	JR	.loc_ba45

.loc_ba65:
	CALL	BIOS_TAPOOF
	LD	HL,KK2_TAPE_OK_YES_NO_PROMPT_TEXT
	CALL	DRAW_POSITIONED_TEXT_STRING
	JP	ADVANCE_TAPE_UI_SUBSTATE

; BIOS_CHGET: 'Y'/'y' exits to KK2 (BB40h); 'N'/'n' restarts SAVE at substate 0
TAPE_SAVE_STATE4_CONFIRM_RETRY:
	CALL	BIOS_CHGET
	CP	59h
	JP	Z,EXIT_TAPE_UI_TO_KING_KONG2
	CP	79h
	JP	Z,EXIT_TAPE_UI_TO_KING_KONG2
	CP	4Eh
	JR	Z,.loc_ba85
	CP	6Eh
	RET	NZ

.loc_ba85:
	XOR	A
	LD	(COMBINATION_UI_SUBSTATE),A
	RET

; Pop saved table pointer on write error and fall through to BA8Bh
TAPE_SAVE_ERROR_POP_AND_REPORT:
	POP	HL

; BIOS_TAPOOF, erase 'SAVING', show 'SAVE ERROR', reset filename, return to substate 1
TAPE_SAVE_ERROR_REPORT:
	CALL	BIOS_TAPOOF
	LD	HL,KK2_TAPE_SAVING_STATUS_TEXT
	CALL	DRAW_TEXT_AT_DE
	LD	HL,KK2_TAPE_SAVE_ERROR_TEXT
	CALL	DRAW_POSITIONED_TEXT_STRING
	CALL	CLEAR_TAPE_FILENAME_WORK_BYTES
	LD	A,01h
	LD	(COMBINATION_UI_SUBSTATE),A
	RET

; Entry point for King Kong 2 F5 cassette LOAD state machine: loads CombinationUiSubstate
; (F108h) and dispatches via CALL 40AEh.
TAPE_LOAD_STATE_MACHINE_ENTRY:
	LD	A,(COMBINATION_UI_SUBSTATE)
	CALL	INLINE_WORD_DISPATCH

; 3-entry inline dispatch table for cassette LOAD substates 0..2 (BAAFh/BAC1h/BAD5h in main;
; -7 in a1).
KING_KONG2_TAPE_LOAD_STATE_TABLE:
	DW	TAPE_LOAD_STATE0_DRAW_PROMPT
	DW	TAPE_LOAD_STATE1_EDIT_FILENAME
	DW	TAPE_LOAD_STATE2_READ_TAPE

; Cassette LOAD substate handlers 0..2 (header search, 'SKIP'/'FOUND' display, 13-range RAM
; deserialization, 'LOAD ERROR' recovery), common exit-to-King-Kong-2 state sanitizer
; (BB40h/BB39h -> JP F2BBh), VRAM panel clearers, 6-char alphanumeric filename editor
; (BBE0h/BBD9h), PSG volume muter (BC5Bh/BC54h), and PSG mixer restorer (BC6Eh..BC74h in
; main / BC67h..BC6Dh in a1: LD E,BFh / LD A,7 / JP BIOS_WRTPSG, previously misclassified as
; UI data in baseline).
TAPE_LOAD_STATE0_DRAW_PROMPT:
	CALL	CLEAR_TAPE_UI_PANELS
	CALL	FLUSH_BIOS_KEYBUF
	LD	HL,KK2_TAPE_LOAD_MODE_PROMPT_TEXT
	CALL	DRAW_POSITIONED_TEXT_STRING
	CALL	CLEAR_TAPE_FILENAME_WORK_BYTES
	JP	ADVANCE_TAPE_UI_SUBSTATE

; Read filename char (BBE0h); ESC cancels (BB40h); CR advances to tape search
TAPE_LOAD_STATE1_EDIT_FILENAME:
	CALL	EDIT_SIX_CHAR_TAPE_FILENAME
	JP	C,EXIT_TAPE_UI_TO_KING_KONG2
	PUSH	AF
	LD	HL,KK2_TAPE_LOAD_ERROR_TEXT
	CALL	DRAW_TEXT_AT_DE
	POP	AF
	CP	0Dh
	RET	NZ
	JP	ADVANCE_TAPE_UI_SUBSTATE

; BIOS_TAPION, match 10x EAh + 6-char filename (or 'SKIP' mismatch), read 13 RAM blocks
TAPE_LOAD_STATE2_READ_TAPE:
	CALL	BIOS_TAPION
	JP	C,TAPE_LOAD_ERROR_REPORT
	LD	B,0Ah

.loc_badd:
	PUSH	BC
	CALL	BIOS_TAPIN
	POP	BC
	JP	C,TAPE_LOAD_ERROR_REPORT
	CP	EAh
	JR	NZ,TAPE_LOAD_STATE2_READ_TAPE
	DJNZ	.loc_badd
	LD	B,06h
	LD	HL,COMBINATION_TAPE_HDR_NAME

.loc_baf0:
	PUSH	BC
	PUSH	HL
	CALL	BIOS_TAPIN
	POP	HL
	POP	BC
	LD	(HL),A
	INC	HL
	DJNZ	.loc_baf0
	LD	HL,COMBINATION_TAPE_HDR_NAME
	LD	DE,COMBINATION_FILENAME_BUF
	LD	B,06h

.loc_bb03:
	LD	A,(DE)
	CP	(HL)
	JP	NZ,TAPE_LOAD_SKIP_MISMATCHED_FILE
	INC	HL
	INC	DE
	DJNZ	.loc_bb03
	LD	HL,KK2_TAPE_FOUND_TEXT
	CALL	DRAW_POSITIONED_TEXT_STRING
	CALL	DRAW_TAPE_HEADER_FILENAME
	CALL	BIOS_TAPION
	JR	C,TAPE_LOAD_ERROR_REPORT
	LD	HL,KING_KONG2_SERIALIZED_RAM_RANGES

.loc_bb1d:
	LD	E,(HL)
	INC	HL
	LD	D,(HL)
	LD	A,E
	OR	D
	JR	Z,.loc_bb3d
	INC	HL
	LD	C,(HL)
	INC	HL
	LD	B,(HL)
	INC	HL
	PUSH	HL

.loc_bb2a:
	PUSH	DE
	PUSH	BC
	CALL	BIOS_TAPIN
	POP	BC
	POP	DE
	JR	C,TAPE_LOAD_ERROR_POP_AND_REPORT
	LD	(DE),A
	INC	DE
	DEC	BC
	LD	A,B
	OR	C
	JR	NZ,.loc_bb2a
	POP	HL
	JR	.loc_bb1d

.loc_bb3d:
	CALL	BIOS_TAPIOF

; Clamp KK2 stats, reset KK2 sound/flags, and JP F2BBh to map KK2 back into pages 1-2
EXIT_TAPE_UI_TO_KING_KONG2:
	CALL	CLEAR_TAPE_FILENAME_PREVIEW_BOX
	LD	A,(CURRENT_KEY_ROW7_BITS)
	AND	A
	JR	NZ,.loc_bb5d
	LD	HL,KK2_PLAYER_MAX_STAT
	LD	A,(HL)
	CP	80h
	JR	C,.loc_bb53
	LD	(HL),80h

.loc_bb53:
	LD	HL,KK2_PLAYER_HEALTH
	LD	A,(HL)
	CP	04h
	JR	NC,.loc_bb5d
	LD	(HL),04h

.loc_bb5d:
	XOR	A
	LD	(COMBINATION_ACTIVE_MODE),A
	LD	(KK2_TRANSITION_CLEAR),A
	LD	A,FFh
	LD	(KK2_POST_LOAD_MASK),A
	LD	(IRQ_REENTRY_GUARD),A
	LD	A,01h
	LD	(CALLBACK_SUBTIMER),A
	LD	(CHEAT_MENU_ROW_KEYS),A
	LD	(ATTRACT_WAIT_HIGH_CNT),A
	CALL	RESET_KK2_SOUND_CHANNELS_AFTER_TAPE
	JP	RETURN_TO_KK2_SLOTS_RAM

; Point KK2 PSG channels A/B/C (C01Ah/C02Eh/C042h) to FFh silent byte at C098h
RESET_KK2_SOUND_CHANNELS_AFTER_TAPE:
	LD	A,01h
	LD	(KK2_SND_CHA_STATE),A
	LD	(KK2_SND_CHB_STATE),A
	LD	(KK2_SND_CHC_STATE),A
	LD	HL,KK2_SILENT_STREAM_BYTE
	LD	(HL),FFh
	LD	(KK2_SND_CHA_PTR),HL
	LD	(KK2_SND_CHB_PTR),HL
	LD	(KK2_SND_CHC_PTR),HL
	RET

; Pop saved table pointer on read error and fall through to BB98h
TAPE_LOAD_ERROR_POP_AND_REPORT:
	POP	HL

; BIOS_TAPIOF, display 'LOAD ERROR ', reset filename, return to substate 1
TAPE_LOAD_ERROR_REPORT:
	CALL	BIOS_TAPIOF
	LD	HL,KK2_TAPE_LOAD_ERROR_TEXT
	CALL	DRAW_POSITIONED_TEXT_STRING
	CALL	CLEAR_TAPE_FILENAME_WORK_BYTES
	LD	A,01h
	LD	(COMBINATION_UI_SUBSTATE),A
	RET

; Display 'SKIP' + found 6-char header name (F110h) and continue searching tape
TAPE_LOAD_SKIP_MISMATCHED_FILE:
	CALL	BIOS_TAPION
	LD	HL,KK2_TAPE_SKIP_TEXT
	CALL	DRAW_POSITIONED_TEXT_STRING

; Render 6-char header filename (F110h) at DE=5860h
DRAW_TAPE_HEADER_FILENAME:
	LD	DE,5860h
	LD	HL,COMBINATION_TAPE_HDR_NAME
	JP	DRAW_SIX_FILENAME_CHARS_AT_DE

; Zero 40 bytes (28h) at BIOS_KEYBUF (FBF0h)
FLUSH_BIOS_KEYBUF:
	LD	HL,BIOS_KEYBUF
	LD	B,28h
	JP	ZERO_B_BYTES_AT_HL

; Clear 16x32 VRAM area at E058h
CLEAR_TAPE_FILENAME_PREVIEW_BOX:
	LD	HL,E058h
	LD	BC,1020h
	JR	CLEAR_TAPE_UI_RECT_BLACK

; Clear main 160x160 and 160x24 VRAM panels via 4E0Bh
CLEAR_TAPE_UI_PANELS:
	LD	HL,0808h
	LD	BC,A0A0h
	CALL	CLEAR_TAPE_UI_RECT_BLACK
	LD	HL,08B0h
	LD	BC,A018h

; Zero color register D and fill cassette UI rectangle (HL, BC) with black via HMMV
CLEAR_TAPE_UI_RECT_BLACK:
	XOR	A
	LD	D,A
	JP	FILL_VRAM_RECT_HMMV	; asm/banks/bank00.asm

; Clear BIOS_CAPST, read key via BIOS_CHGET, handle ESC/CR/BS/A-Z/0-9, redraw 6 chars
EDIT_SIX_CHAR_TAPE_FILENAME:
	XOR	A
	LD	(BIOS_CAPST),A
	CALL	BIOS_CHGET
	LD	C,A
	LD	HL,COMBINATION_FILENAME_LEN
	LD	DE,COMBINATION_FILENAME_BUF
	LD	A,(HL)
	CALL	ADD_A_TO_DE
	LD	A,C
	CP	1Bh
	JR	Z,.loc_bc1f
	CP	0Dh
	JR	Z,.loc_bc21
	CP	08h
	JR	Z,.loc_bc27
	SUB	30h
	CP	0Ah
	JR	C,.loc_bc14
	SUB	11h
	CP	1Ah
	JR	C,.loc_bc14
	SUB	20h
	CP	1Ah
	RET	NC
	LD	A,C
	SUB	20h
	LD	C,A

.loc_bc14:
	LD	A,C
	LD	(DE),A
	LD	A,(HL)
	INC	A
	CP	06h
	JR	NC,REDRAW_ENTERED_FILENAME
	LD	(HL),A
	JR	REDRAW_ENTERED_FILENAME

.loc_bc1f:
	SCF
	RET

.loc_bc21:
	CALL	REDRAW_ENTERED_FILENAME
	LD	A,0Dh
	RET

.loc_bc27:
	EX	DE,HL
	LD	C,(HL)
	LD	(HL),00h
	LD	A,(DE)
	DEC	A
	JP	M,REDRAW_ENTERED_FILENAME
	LD	(DE),A
	LD	A,C
	AND	A
	JR	NZ,.loc_bc39
	DEC	HL
	LD	(HL),A
	JR	REDRAW_ENTERED_FILENAME

.loc_bc39:
	EX	DE,HL
	INC	(HL)

; Render 6-char buffer (F10Ah) at DE=3050h via 4FA3h
REDRAW_ENTERED_FILENAME:
	LD	DE,3050h
	LD	HL,COMBINATION_FILENAME_BUF

; Render 6-character cassette filename from (HL) at SCREEN 5 coordinates DE
DRAW_SIX_FILENAME_CHARS_AT_DE:
	LD	B,06h

.loc_bc43:
	LD	A,(HL)
	INC	HL
	CALL	DRAW_FIXED_LENGTH_TEXT_AT_DE
	LD	A,D
	ADD	A,08h
	LD	D,A
	DJNZ	.loc_bc43
	XOR	A
	RET

; Zero 14 bytes at F109h..F116h
CLEAR_TAPE_FILENAME_WORK_BYTES:
	LD	HL,COMBINATION_FILENAME_LEN
	LD	B,0Eh

; Fill B bytes at HL with 00h
ZERO_B_BYTES_AT_HL:
	LD	(HL),00h
	INC	HL
	DJNZ	ZERO_B_BYTES_AT_HL
	RET

; Write 0 to PSG volume registers 8, 9, and 10 via BIOS_WRTPSG
MUTE_PSG_VOLUMES:
	LD	E,00h
	LD	A,08h
	CALL	BIOS_WRTPSG
	LD	E,00h
	INC	A
	CALL	BIOS_WRTPSG
	LD	E,00h
	INC	A
	JP	BIOS_WRTPSG	; asm/core/constants.asm
	IF	HINOTORI_ENHANCED = 00h

; LD E,BFh / LD A,7 / JP BIOS_WRTPSG (0093h): 7-byte helper missed by baseline code range
RESTORE_PSG_MIXER_REG7:
	LD	E,BFh
	LD	A,07h
	JP	BIOS_WRTPSG	; asm/core/constants.asm
	ENDIF

; 141 bytes of positioned UI text strings rendered via 4F87h/4F8Bh (FEh = next positioned
; line, FFh = end): 'SAVE MODE / INPUT FILE NAME', 'LOAD MODE / INPUT FILE NAME', 'SAVING',
; 'SAVE ERROR', 'OK; / YES Y / NO N', 'SKIP', 'FOUND', and 'LOAD ERROR '. True start is
; BC75h (main) / BC6Eh (a1).
KING_KONG2_TAPE_UI_STRINGS:
	DB	10h,"0SAVE",00h,"MODE",FEh
	DB	18h,"@INPUT",00h,"FILE",00h,"NAME",FFh

; Positioned 'LOAD MODE / INPUT FILE NAME' prompt
KK2_TAPE_LOAD_MODE_PROMPT_TEXT:
	DB	10h,"0LOAD",00h,"MODE",FEh
	DB	18h,"@INPUT",00h,"FILE",00h,"NAME",FFh

; Positioned 'SAVING' status string
KK2_TAPE_SAVING_STATUS_TEXT:
	DB	"(`SAVING",FFh

; Positioned 'SAVE ERROR' message
KK2_TAPE_SAVE_ERROR_TEXT:
	DB	"(`SAVE",00h,"ERROR",FFh

; Positioned 'OK; / YES Y / NO N' confirmation prompt
KK2_TAPE_OK_YES_NO_PROMPT_TEXT:
	DB	18h,"pOK;",FEh
	DB	20h,80h,"YES",00h,00h,00h,00h,59h,FEh
	DB	20h,88h,"NO",00h,00h,00h,00h,00h,4Eh,FFh

; Positioned 'SKIP' tape search status
KK2_TAPE_SKIP_TEXT:
	DB	"(`SKIP",FFh

; Positioned 'FOUND' tape search status
KK2_TAPE_FOUND_TEXT:
	DB	"(`FOUND",FFh

; Positioned 'LOAD ERROR ' message
KK2_TAPE_LOAD_ERROR_TEXT:
	DB	"(`LOAD",00h,"ERROR",00h,00h,00h,FFh

; 54-byte table of thirteen (address, length) 16-bit word pairs terminated by 0000h
; (BD02h..BD37h in main / BCFBh..BD30h in a1), specifying the 624 bytes of King Kong 2 state
; serialized to/from cassette (C120h:96, C2A0h:96, C321h:10, C340h:128, C580h:48, C680h:1,
; DE00h:32, DF00h:144, DFC0h:32, C810h:8, C307h:1, C600h:16, C800h:16). Canonical alias:
; KingKong2SerializedRamRanges.
KING_KONG2_SERIALIZED_RAM_RANGES:
	DW	C120h,0060h	; King Kong 2 RAM C120h-C17Fh (96 bytes)
	DW	C2A0h,0060h	; King Kong 2 RAM C2A0h-C2FFh (96 bytes)
	DW	C321h,000Ah	; King Kong 2 RAM C321h-C32Ah (10 bytes)
	DW	C340h,0080h	; King Kong 2 RAM C340h-C3BFh (128 bytes)
	DW	C580h,0030h	; King Kong 2 RAM C580h-C5AFh (48 bytes)
	DW	C680h,0001h	; King Kong 2 RAM C680h-C680h (1 bytes)
	DW	DE00h,0020h	; King Kong 2 RAM DE00h-DE1Fh (32 bytes)
	DW	DF00h,0090h	; King Kong 2 RAM DF00h-DF8Fh (144 bytes)
	DW	DFC0h,0020h	; King Kong 2 RAM DFC0h-DFDFh (32 bytes)
	DW	C810h,0008h	; King Kong 2 RAM C810h-C817h (8 bytes)
	DW	C307h,0001h	; King Kong 2 RAM C307h-C307h (1 bytes)
	DW	C600h,0010h	; King Kong 2 RAM C600h-C60Fh (16 bytes)
	DW	C800h,0010h	; King Kong 2 RAM C800h-C80Fh (16 bytes)
	DW	0000h	; End of serialized RAM range list

; Entry point for MainState 0Dh (F2 'POWER UP' weapon & 1-UP selection shop, called from
; Bank 00 464Fh via CALL BD38h in main / CALL BD31h in a1 with Bank 09 in page 3). Cancels
; to MainState 5 if (C205h)!=0; otherwise dispatches MainSubstate B (0 = draw window, title,
; 6 weapons + 1-UP, costs, and current feather/orb balance; 1 = cursor/purchase input; 2 =
; blink & close).
POWER_UP_MAIN_STATE_ENTRY:
	LD	A,(POWER_UP_BLOCKED_FLAG)
	OR	A
	LD	A,05h
	JP	NZ,SET_MAIN_STATE_AND_RESET_SUBSTATE	; asm/banks/bank00.asm
	LD	A,B
	DEC	A
	JP	Z,POWER_UP_SUBSTATE1_HANDLE_INPUT
	JP	P,POWER_UP_SUBSTATE2_BLINK_AND_EXIT
	LD	A,2Fh
	CALL	DISPATCH_SOUND_COMMAND
	IF	HINOTORI_ENHANCED = 00h
	CALL	BUILD_POWER_UP_CURSOR_TILEBOX
	ENDIF
	LD	HL,1720h
	LD	A,CCh
	LD	BC,D040h
	CALL	SAVE_AND_DRAW_POPUP_WINDOW
	CALL	DISABLE_VDP_SPRITES
	LD	A,FFh
	LD	HL,1923h
	LD	BC,CA3Ah
	CALL	COPY_SCROLLED_VRAM_RECT_TO_PAGE
	LD	HL,POWER_UP_HEADER_AND_ORB_GLYPH_TEXT
	CALL	DRAW_SCROLLED_POSITIONED_TEXT
	CALL	DRAW_ALL_POWER_UP_OPTIONS_AND_CURSOR
	CALL	DRAW_PLAYER_FEATHER_ORB_BALANCE
	LD	HL,D0C0h
	LD	DE,A828h
	LD	A,48h
	LD	BC,1010h
	CALL	LMMM_BLIT_ICON_OR_TILE_RECT
	LD	DE,B82Ch
	LD	HL,POWER_UP_ORB_SEPARATOR_TEXT
	LD	C,00h
	CALL	DRAW_SCROLLED_CREDIT_LINE_AT_E
	LD	DE,B82Ch
	LD	HL,POWER_UP_ORB_SEPARATOR_TEXT
	LD	C,FFh
	CALL	DRAW_SCROLLED_CREDIT_LINE_AT_E
	JP	ADVANCE_MAIN_SUBSTATE	; asm/banks/bank00.asm

; 13 bytes containing positioned header string (X=28h, Y=28h, 'POWER@UP', FFh) followed by
; 2-byte orb/separator glyph string (3Ch, FFh) drawn at (B8h, 2Ch).
POWER_UP_HEADER_AND_ORB_GLYPH_TEXT:
	IF	HINOTORI_ENHANCED
	DB	"((POWER",00h,"UP",FFh
	ELSE
	DB	"((POWER@UP",FFh
	ENDIF

; FFh-terminated ':'/orb separator glyph string
POWER_UP_ORB_SEPARATOR_TEXT:
	DB	3Ch,FFh
	IF	HINOTORI_ENHANCED = 00h

; Rendering helpers for F2 POWER UP screen: 20x20 selection box builder in E000h (BDAAh),
; current feather/orb count (C845h) 3-digit/2-digit BCD printer (BDB8h/BDECh), initial
; cursor placement from GaoState (C840h) (BDFDh), 20x20 cursor highlighter (BE0Fh), and
; 6-weapon + '1 UP' row renderer (BE2Dh).
BUILD_POWER_UP_CURSOR_TILEBOX:
	LD	HL,LEVEL_TILE_BUFFER
	LD	BC,1414h
	LD	D,01h
	LD	A,77h
	CALL	BUILD_UI_BOX_TILEMAP_IN_BUFFER
	RET
	ENDIF

; Blank previous digits and print (C845h) feather/orb count in BCD at DE=B82Ch
DRAW_PLAYER_FEATHER_ORB_BALANCE:
	LD	DE,2CB8h
	LD	(SHARED_WORK_BUFFER),DE
	LD	(ITEM_DRAW_COORD_Y),DE
	LD	(POWER_UP_ERASE_WORD2),DE
	LD	A,FFh
	LD	(POWER_UP_ERASE_TERM),A
	LD	HL,SHARED_WORK_BUFFER
	CALL	DRAW_SCROLLED_TEXT_AT_X_AND_E
	LD	A,(FEATHER_ORB_COUNT)
	LD	L,A
	LD	H,00h
	LD	DE,B82Ch
	PUSH	DE
	CALL	CONVERT_HL_BINARY_TO_BCD
	LD	(ITEM_DRAW_COORD_Y),DE
	LD	HL,ITEM_DRAW_COORD_X
	POP	DE
	LD	B,02h
	JP	RENDER_BCD_BYTES_AT_DE	; asm/banks/bank00.asm

; Convert HL to BCD (4893h) and render 1-byte (2-digit) number at DE via 4850h
PRINT_TWO_DIGIT_BCD_AT_DE:
	PUSH	DE
	CALL	CONVERT_HL_BINARY_TO_BCD
	LD	(ITEM_DRAW_COORD_Y),DE
	LD	HL,ITEM_DRAW_COORD_Y
	POP	DE
	LD	B,01h
	JP	RENDER_BCD_BYTES_AT_DE	; asm/banks/bank00.asm

; Set initial (C4D2h) = max(1, (C840h)), draw 6 weapons + 1-UP (BE2Dh), highlight cursor
; (BE0Fh)
DRAW_ALL_POWER_UP_OPTIONS_AND_CURSOR:
	LD	A,(GAO_WEAPON_FORM)
	OR	A
	JR	NZ,.loc_be04
	INC	A

.loc_be04:
	LD	(POWER_UP_CURSOR_INDEX),A
	LD	B,06h
	CALL	DRAW_SIX_WEAPONS_AND_1UP_OPTION
	JP	XOR_BLIT_POWER_UP_CURSOR_BOX

; XOR-blit 20x20 cursor box at X = 25h + 26*((C4D2h)-1), Y = 3Ch via 51EAh
XOR_BLIT_POWER_UP_CURSOR_BOX:
	IF	HINOTORI_ENHANCED
	LD	A,C3h
	ELSE
	LD	A,43h
	ENDIF
	EX	AF,AF'
	LD	A,(POWER_UP_CURSOR_INDEX)
	DEC	A
	ADD	A,A
	LD	B,A
	ADD	A,A
	ADD	A,A
	LD	C,A
	ADD	A,A
	ADD	A,C
	ADD	A,B
	LD	DE,253Ch
	ADD	A,D
	LD	D,A
	IF	HINOTORI_ENHANCED
	LD	HL,VRAM_PAGE3_CURSOR_MASK
	ELSE
	LD	HL,LEVEL_TILE_BUFFER
	ENDIF
	LD	BC,1414h
	EX	AF,AF'
	JP	LMMM_BLIT_ICON_OR_TILE_RECT	; asm/banks/bank00.asm

; Loop B=6 weapon icons/costs (BE6Fh), then print '1' / 'UP' (BE6Ah/BE6Ch) with cost 36
; (24h)
DRAW_SIX_WEAPONS_AND_1UP_OPTION:
	LD	HL,0090h
	LD	DE,273Eh
	LD	A,B
	OR	A
	RET	Z

.loc_be36:
	PUSH	BC
	PUSH	HL
	PUSH	DE
	CALL	DRAW_ONE_WEAPON_ICON_AND_COST
	POP	DE
	POP	HL
	POP	BC
	LD	A,H
	ADD	A,10h
	LD	H,A
	LD	A,D
	ADD	A,1Ah
	LD	D,A
	DJNZ	.loc_be36
	PUSH	DE
	LD	A,D
	ADD	A,04h
	LD	D,A
	LD	HL,POWER_UP_1UP_LABEL_TEXT
	LD	C,FFh
	CALL	DRAW_SCROLLED_CREDIT_LINE_AT_E
	POP	DE
	PUSH	DE
	LD	A,E
	ADD	A,08h
	LD	E,A
	LD	HL,POWER_UP_1UP_LABEL_SUBTEXT
	LD	C,FFh
	CALL	DRAW_SCROLLED_CREDIT_LINE_AT_E
	POP	DE
	LD	HL,0024h
	JR	PRINT_OPTION_COST_BELOW_ICON

; 5 bytes containing two FFh-terminated strings for the 7th shop slot: '1' (31h, FFh) and
; 'UP' (55h, 50h, FFh).
POWER_UP_1UP_LABEL_TEXT:
	DB	31h,FFh

; FFh-terminated 'UP' string for 7th shop slot
POWER_UP_1UP_LABEL_SUBTEXT:
	DB	"UP",FFh

; Blits one 16x16 weapon icon from hidden VRAM page (48h) via 51EAh, looks up its orb cost
; in POWER_UP_ORB_COST_TABLE (BE90h/BE89h), and prints the 2-digit cost below the icon.
DRAW_ONE_WEAPON_ICON_AND_COST:
	PUSH	DE
	PUSH	BC
	LD	A,48h
	LD	BC,1010h
	CALL	LMMM_BLIT_ICON_OR_TILE_RECT
	POP	BC
	LD	A,07h
	SUB	B
	LD	HL,POWER_UP_ORB_COST_TABLE
	CALL	ADD_A_TO_HL
	LD	L,(HL)
	LD	H,00h
	POP	DE

; Offset Y by +12h and jump to BDECh BCD printer
PRINT_OPTION_COST_BELOW_ICON:
	LD	A,E
	ADD	A,12h
	LD	E,A
	LD	B,01h
	JP	PRINT_TWO_DIGIT_BCD_AT_DE

; 8-byte feather/orb cost table indexed 1..7 by PowerUpCursorIndex (C4D2h): [0]=0 (unused),
; [1]=8, [2]=16 (10h), [3]=24 (18h), [4]=32 (20h), [5]=32 (20h), [6]=40 (28h), [7]=36 (24h
; for 1-UP).
POWER_UP_ORB_COST_TABLE:
	DB	00h,08h,10h,18h,20h,20h,28h,24h

; MainState 0Dh substate 1 (left/right cursor movement across slots 1..7, F2 cancel check on
; C108h bit 1, trigger purchase deducting cost from C845h and either incrementing BCD lives
; C160h for slot 7 or equipping weapon C840h for slots 1..6) and substate 2 (cursor blink
; countdown, VRAM window restore, return to MainState 5, and JP 566Eh to upload newly
; selected weapon sprite pattern).
POWER_UP_SUBSTATE1_HANDLE_INPUT:
	LD	A,01h
	LD	(MAIN_STATE_TIMER),A
	LD	A,(PRESSED_INPUT_BITS)
	LD	C,A
	AND	08h
	JR	NZ,MOVE_POWER_UP_CURSOR_RIGHT
	LD	A,C
	AND	04h
	JR	NZ,MOVE_POWER_UP_CURSOR_LEFT
	LD	A,C
	AND	10h
	JR	NZ,ATTEMPT_POWER_UP_PURCHASE
	LD	A,(PRESSED_KEY_ROW6_BITS)
	RRA
	RRA
	RET	NC
	JP	ADVANCE_MAIN_SUBSTATE	; asm/banks/bank00.asm

; Check if already equipped or insufficient (C845h) orbs; deduct cost and apply weapon or
; 1-UP
ATTEMPT_POWER_UP_PURCHASE:
	LD	A,(POWER_UP_CURSOR_INDEX)
	LD	HL,GAO_WEAPON_FORM
	CP	(HL)
	JP	Z,ADVANCE_MAIN_SUBSTATE	; asm/banks/bank00.asm
	LD	HL,POWER_UP_ORB_COST_TABLE
	CALL	ADD_A_TO_HL
	LD	A,(FEATHER_ORB_COUNT)
	SUB	(HL)
	JR	C,PLAY_INSUFFICIENT_ORBS_BUZZER
	LD	(FEATHER_ORB_COUNT),A
	LD	A,(POWER_UP_CURSOR_INDEX)
	CP	07h
	JR	NZ,APPLY_PURCHASED_WEAPON
	LD	A,(PLAYER_LIVES_BCD)
	ADD	A,01h
	DAA
	JR	Z,FINISH_PURCHASE_AND_START_BLINK
	LD	(PLAYER_LIVES_BCD),A
	LD	A,36h
	CALL	DISPATCH_SOUND_COMMAND
	JR	FINISH_PURCHASE_AND_START_BLINK

; Store selected weapon index (1..6) into GaoState (C840h) and play SFX 33h
APPLY_PURCHASED_WEAPON:
	LD	(GAO_WEAPON_FORM),A
	LD	A,33h
	CALL	DISPATCH_SOUND_COMMAND

; Set blink timer (C104h)=1Eh, redraw orb balance, advance to substate 2
FINISH_PURCHASE_AND_START_BLINK:
	LD	A,1Eh
	LD	(MAIN_STATE_TIMER),A
	CALL	DRAW_PLAYER_FEATHER_ORB_BALANCE
	LD	DE,B82Ch
	LD	HL,POWER_UP_ORB_SEPARATOR_TEXT
	LD	C,00h
	CALL	DRAW_SCROLLED_CREDIT_LINE_AT_E
	LD	DE,B82Ch
	LD	HL,POWER_UP_ORB_SEPARATOR_TEXT
	LD	C,FFh
	CALL	DRAW_SCROLLED_CREDIT_LINE_AT_E
	JP	ADVANCE_MAIN_SUBSTATE	; asm/banks/bank00.asm

; Play error SFX 04h and advance to substate 2 exit
PLAY_INSUFFICIENT_ORBS_BUZZER:
	LD	A,04h
	CALL	DISPATCH_SOUND_COMMAND
	JP	ADVANCE_MAIN_SUBSTATE	; asm/banks/bank00.asm

; Decrement (C4D2h) if >= 2 and redraw XOR cursor
MOVE_POWER_UP_CURSOR_LEFT:
	LD	A,(POWER_UP_CURSOR_INDEX)
	CP	02h
	RET	C
	DEC	A
	JR	UPDATE_POWER_UP_CURSOR_POSITION

; Increment (C4D2h) if < 7 and redraw XOR cursor
MOVE_POWER_UP_CURSOR_RIGHT:
	LD	A,(POWER_UP_CURSOR_INDEX)
	CP	07h
	RET	NC
	INC	A

; Erase old XOR cursor, store new (C4D2h), draw new XOR cursor, play SFX 02h
UPDATE_POWER_UP_CURSOR_POSITION:
	PUSH	AF
	CALL	XOR_BLIT_POWER_UP_CURSOR_BOX
	POP	AF
	LD	(POWER_UP_CURSOR_INDEX),A
	CALL	XOR_BLIT_POWER_UP_CURSOR_BOX
	LD	A,02h
	JP	NZ,DISPATCH_SOUND_COMMAND	; asm/banks/bank00.asm

; Blink cursor until (C104h)==0, restore 208x64 VRAM area, return to MainState 5, JP 566Eh
POWER_UP_SUBSTATE2_BLINK_AND_EXIT:
	LD	A,(GAME_TICK_COUNTER)
	AND	01h
	CALL	Z,XOR_BLIT_POWER_UP_CURSOR_BOX
	LD	HL,MAIN_STATE_TIMER
	DEC	(HL)
	RET	NZ
	LD	HL,1720h
	LD	BC,D040h
	CALL	RESTORE_POPUP_WINDOW_VRAM
	CALL	ENABLE_VDP_SPRITES
	IF	HINOTORI_ENHANCED = 00h
	CALL	RESTORE_STAGE_VRAM_TILESETS
	ENDIF
	LD	B,05h
	CALL	TRANSITION_TO_MAIN_STATE_B
	JP	UPLOAD_EQUIPPED_WEAPON_SPRITE_PATTERN	; asm/banks/bank00.asm

; Trailing unused FFh padding filling the remainder of Physical Bank 09 (161 bytes
; BF5Fh..BFFFh in main; 168 bytes BF58h..BFFFh in a1 due to -7 byte shift).
BANK09_TAIL_PADDING_FF:
	DS	C000h - $,FFh

	DEPHASE

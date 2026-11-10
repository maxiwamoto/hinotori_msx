; Physical Bank 13 (ROM 1A000h-1BFFFh): 8x8 1bpp font, Title Firebird & publisher emblem graphics/tilemaps, and kanji masks
	PHASE	6000h

; 109-glyph 8x8 1bpp alphanumeric, Hiragana, and UI popup font (6000h-6367h, 109 x 8B = 872B); used by
; gameplay/ending text renderers and directly sub-sliced into VRAM by Bank 00 55F9h
; (6000h-604Fh digits 0-9 & 6088h-60B7h letters -> sprite VRAM F800h), 55E4h (6158h-616Fh ->
; VRAM EE00h), and 562Bh (61B8h-6217h, 12 tiles -> VRAM 8078h).
MAIN_FONT8X8_1BPP:
	DB	00h,1Ch,22h,63h,63h,63h,22h,1Ch	; Glyph 00h
	DB	00h,18h,38h,18h,18h,18h,18h,7Eh	; Glyph 01h
	DB	00h,3Eh,63h,03h,0Eh,3Ch,70h,7Fh	; Glyph 02h
	DB	00h,3Eh,63h,03h,0Eh,03h,63h,3Eh	; Glyph 03h
	DB	00h,0Eh,1Eh,36h,66h,66h,7Fh,06h	; Glyph 04h
	DB	00h,7Fh,60h,7Eh,63h,03h,63h,3Eh	; Glyph 05h
	DB	00h,3Eh,63h,60h,7Eh,63h,63h,3Eh	; Glyph 06h
	DB	00h,7Fh,63h,06h,0Ch,18h,18h,18h	; Glyph 07h
	DB	00h,3Eh,63h,63h,3Eh,63h,63h,3Eh	; Glyph 08h
	DB	00h,3Eh,63h,63h,3Fh,03h,63h,3Eh	; Glyph 09h
	DB	3Ch,42h,99h,A1h,A1h,99h,42h,3Ch	; Glyph 0Ah
	DB	00h,7Ch,C6h,C6h,1Ch,10h,00h,10h	; Glyph 0Bh
	DB	00h,42h,24h,18h,18h,24h,42h,00h	; Glyph 0Ch
	DB	00h,00h,04h,0Fh,1Fh,0Fh,04h,00h	; Glyph 0Dh
	DB	00h,00h,20h,F0h,F8h,F0h,20h,00h	; Glyph 0Eh
	DB	00h,00h,3Ch,00h,00h,3Ch,00h,00h	; Glyph 0Fh
	DB	00h,00h,00h,00h,7Eh,00h,00h,00h	; Glyph 10h

; 8x8 1bpp Latin uppercase glyph slice uploaded to sprite pattern generator by Bank 00 5616h
MAIN_FONT_LATIN_UPPER_1BPP:
	DB	00h,1Ch,36h,63h,63h,7Fh,63h,63h	; Glyph 11h
	DB	00h,7Eh,63h,63h,7Eh,63h,63h,7Eh	; Glyph 12h
	DB	00h,3Eh,63h,60h,60h,60h,63h,3Eh	; Glyph 13h
	DB	00h,7Ch,66h,63h,63h,63h,66h,7Ch	; Glyph 14h
	DB	00h,7Fh,60h,60h,7Eh,60h,60h,7Fh	; Glyph 15h
	DB	00h,7Fh,60h,60h,7Eh,60h,60h,60h	; Glyph 16h
	DB	00h,3Eh,63h,60h,67h,63h,63h,3Fh	; Glyph 17h
	DB	00h,63h,63h,63h,7Fh,63h,63h,63h	; Glyph 18h
	DB	00h,3Ch,18h,18h,18h,18h,18h,3Ch	; Glyph 19h
	DB	00h,1Fh,06h,06h,06h,06h,66h,3Ch	; Glyph 1Ah
	DB	00h,63h,66h,6Ch,78h,7Ch,6Eh,67h	; Glyph 1Bh
	DB	00h,60h,60h,60h,60h,60h,60h,7Fh	; Glyph 1Ch
	DB	00h,63h,77h,7Fh,7Fh,6Bh,63h,63h	; Glyph 1Dh
	DB	00h,63h,73h,7Bh,7Fh,6Fh,67h,63h	; Glyph 1Eh
	DB	00h,3Eh,63h,63h,63h,63h,63h,3Eh	; Glyph 1Fh
	DB	00h,7Eh,63h,63h,63h,7Eh,60h,60h	; Glyph 20h
	DB	00h,3Eh,63h,63h,63h,6Fh,66h,3Dh	; Glyph 21h
	DB	00h,7Eh,63h,63h,62h,7Ch,66h,63h	; Glyph 22h
	DB	00h,3Eh,63h,60h,3Eh,03h,63h,3Eh	; Glyph 23h
	DB	00h,7Eh,18h,18h,18h,18h,18h,18h	; Glyph 24h
	DB	00h,63h,63h,63h,63h,63h,63h,3Eh	; Glyph 25h
	DB	00h,63h,63h,63h,63h,36h,1Ch,08h	; Glyph 26h
	DB	00h,63h,63h,6Bh,6Bh,7Fh,77h,22h	; Glyph 27h
	DB	00h,63h,76h,3Ch,1Ch,1Eh,37h,63h	; Glyph 28h
	DB	00h,66h,66h,7Eh,3Ch,18h,18h,18h	; Glyph 29h
	DB	00h,7Fh,07h,0Eh,1Ch,38h,70h,7Fh	; Glyph 2Ah

; 8x8 1bpp solid-fill blank tile (glyph 2Bh -> VRAM 0000h tile 00h) plus alternate digits 0-9 & (C)
MAIN_FONT_BLANK_AND_ALT_DIGITS_1BPP:
	DB	FFh,FFh,FFh,FFh,FFh,FFh,FFh,FFh	; Glyph 2Bh
	DB	00h,3Eh,63h,67h,6Bh,73h,63h,3Eh	; Glyph 2Ch
	DB	00h,0Ch,1Ch,0Ch,0Ch,0Ch,0Ch,3Fh	; Glyph 2Dh
	DB	00h,3Eh,63h,07h,1Eh,3Ch,70h,7Fh	; Glyph 2Eh
	DB	00h,3Fh,06h,0Ch,1Eh,03h,63h,3Eh	; Glyph 2Fh
	DB	00h,0Eh,16h,26h,46h,7Fh,06h,06h	; Glyph 30h
	DB	00h,7Eh,60h,7Eh,03h,03h,63h,3Eh	; Glyph 31h
	DB	00h,1Eh,30h,60h,7Eh,63h,63h,3Eh	; Glyph 32h
	DB	00h,7Fh,63h,06h,0Ch,18h,18h,18h	; Glyph 33h
	DB	00h,3Ch,62h,72h,3Eh,4Fh,43h,3Eh	; Glyph 34h
	DB	00h,3Eh,63h,63h,3Fh,03h,06h,3Ch	; Glyph 35h
	DB	3Ch,42h,99h,A1h,A1h,99h,42h,3Ch	; Glyph 36h

; 54-glyph (36h) 8x8 1bpp Hiragana & dakuten dialogue slice uploaded to VRAM 8078h by Bank 00 5631h
MAIN_FONT_HIRAGANA_1BPP:
	DB	00h,10h,7Fh,11h,3Fh,52h,55h,39h	; Glyph 37h
	DB	00h,42h,42h,41h,41h,41h,50h,20h	; Glyph 38h
	DB	00h,3Eh,00h,7Eh,01h,01h,02h,3Ch	; Glyph 39h
	DB	00h,3Eh,00h,7Fh,02h,0Ch,38h,47h	; Glyph 3Ah
	DB	00h,08h,7Fh,08h,3Dh,4Ah,49h,31h	; Glyph 3Bh
	DB	00h,12h,79h,15h,12h,22h,22h,44h	; Glyph 3Ch
	DB	00h,20h,7Eh,08h,3Fh,02h,40h,3Eh	; Glyph 3Dh
	DB	00h,02h,0Ch,30h,40h,30h,0Ch,02h	; Glyph 3Eh
	DB	00h,42h,5Fh,42h,42h,42h,42h,24h	; Glyph 3Fh
	DB	00h,7Ch,02h,00h,00h,00h,40h,3Eh	; Glyph 40h
	DB	00h,08h,7Fh,04h,02h,21h,40h,3Fh	; Glyph 41h
	DB	00h,40h,40h,40h,41h,41h,22h,1Ch	; Glyph 42h
	DB	00h,04h,7Fh,04h,1Ch,24h,1Ch,04h	; Glyph 43h
	DB	00h,22h,7Fh,22h,22h,26h,20h,1Eh	; Glyph 44h
	DB	00h,22h,14h,7Fh,10h,20h,20h,1Eh	; Glyph 45h
	DB	00h,20h,77h,20h,20h,20h,28h,47h	; Glyph 46h
	DB	00h,08h,7Fh,10h,3Eh,41h,01h,1Eh	; Glyph 47h
	DB	00h,00h,7Eh,01h,01h,01h,02h,3Ch	; Glyph 48h
	DB	00h,7Fh,08h,10h,20h,20h,10h,0Eh	; Glyph 49h
	DB	00h,42h,24h,18h,20h,40h,40h,3Eh	; Glyph 4Ah
	DB	00h,26h,71h,24h,44h,1Ch,26h,18h	; Glyph 4Bh
	DB	00h,4Fh,40h,40h,40h,40h,48h,27h	; Glyph 4Ch
	DB	00h,24h,3Eh,65h,69h,73h,55h,2Ah	; Glyph 4Dh
	DB	00h,20h,6Eh,31h,21h,67h,29h,26h	; Glyph 4Eh
	DB	00h,1Ch,2Ah,49h,49h,49h,49h,32h	; Glyph 4Fh
	DB	00h,42h,4Fh,42h,42h,4Eh,53h,2Ch	; Glyph 50h
	DB	00h,78h,12h,23h,42h,42h,44h,38h	; Glyph 51h
	DB	00h,38h,04h,10h,49h,45h,45h,59h	; Glyph 52h
	DB	00h,18h,24h,24h,42h,42h,01h,01h	; Glyph 53h
	DB	00h,4Fh,42h,4Fh,42h,4Eh,53h,2Ch	; Glyph 54h
	DB	04h,7Fh,04h,7Fh,04h,3Eh,45h,38h	; Glyph 55h
	DB	00h,30h,0Ah,0Ah,3Fh,4Ah,4Ah,32h	; Glyph 56h
	DB	00h,12h,79h,10h,30h,51h,51h,3Eh	; Glyph 57h
	DB	00h,41h,3Eh,32h,55h,49h,49h,35h	; Glyph 58h
	DB	00h,20h,7Ch,20h,7Ch,20h,21h,1Eh	; Glyph 59h
	DB	00h,24h,7Eh,25h,29h,22h,10h,10h	; Glyph 5Ah
	DB	00h,04h,4Eh,55h,75h,55h,4Eh,18h	; Glyph 5Bh
	DB	00h,04h,04h,07h,04h,3Ch,46h,39h	; Glyph 5Ch
	DB	00h,38h,04h,40h,7Ch,02h,02h,3Ch	; Glyph 5Dh
	DB	00h,41h,41h,41h,41h,01h,02h,1Ch	; Glyph 5Eh
	DB	00h,3Fh,02h,3Ch,02h,19h,25h,1Eh	; Glyph 5Fh
	DB	00h,20h,6Ch,32h,22h,22h,62h,21h	; Glyph 60h
	DB	00h,3Fh,02h,0Ch,32h,01h,01h,1Eh	; Glyph 61h
	DB	00h,20h,6Eh,31h,21h,61h,21h,22h	; Glyph 62h
	DB	00h,08h,3Eh,10h,3Eh,14h,22h,1Fh	; Glyph 63h
	DB	00h,08h,10h,10h,28h,25h,45h,42h	; Glyph 64h
	DB	00h,00h,24h,7Ch,2Ah,22h,10h,10h	; Glyph 65h
	DB	00h,00h,48h,5Ch,6Ah,6Ah,5Ch,08h	; Glyph 66h
	DB	00h,00h,08h,0Eh,08h,38h,4Ch,32h	; Glyph 67h
	DB	00h,00h,00h,7Ch,02h,02h,04h,38h	; Glyph 68h
	DB	00h,50h,50h,00h,00h,00h,00h,00h	; Glyph 69h
	DB	00h,20h,50h,20h,00h,00h,00h,00h	; Glyph 6Ah
	DB	00h,00h,00h,00h,00h,00h,40h,20h	; Glyph 6Bh
	DB	00h,00h,00h,00h,00h,20h,50h,20h	; Glyph 6Ch

%if	HINOTORI_ENHANCED

; CBS v5.2 Format 0 compressed Title Firebird Phase 1 (1,456B) + Phase 2 (1,808B) tilesets (3,264B raw -> 2,411B)
TITLE_FIREBIRD_PH1_AND_PH2_TILES_CBS:
	DB	A2h,00h,72h,02h,0Ch,19h,13h,36h,2Fh,F1h,45h,30h,47h,9Eh,78h,E0h
	DB	80h,78h,FCh,F9h,FFh,86h,07h,00h,69h,F8h,FEh,00h,08h,10h,0Ah,31h
	DB	61h,E3h,6Fh,7Eh,7Ch,FCh,F8h,29h,F1h,F3h,00h,04h,03h,00h,3Ch,FFh
	DB	C3h,01h,1Fh,7Ch,C0h,00h,14h,81h,82h,D1h,FFh,3Fh,1Fh,3Fh,7Dh,F0h
	DB	C0h,80h,C3h,83h,C7h,62h,E7h,77h,36h,16h,73h,76h,7Ch,28h,38h,39h
	DB	0Dh,01h,0Fh,3Fh,67h,C3h,87h,8Fh,0Ch,C3h,24h,C6h,68h,86h,87h,0Fh
	DB	94h,00h,1Ch,7Fh,F7h,C1h,80h,68h,F0h,1Eh,0Eh,94h,8Eh,84h,C4h,44h
	DB	40h,00h,69h,01h,07h,0Eh,22h,1Ch,34h,06h,01h,E0h,18h,04h,06h,02h
	DB	03h,39h,1Dh,9Dh,9Fh,4Fh,09h,67h,23h,0Ch,18h,82h,9Ch,8Eh,CFh,0Fh
	DB	28h,1Eh,43h,3Ah,F3h,F0h,1Ch,0Ch,10h,D0h,98h,70h,00h,60h,24h,A1h
	DB	64h,6Dh,FDh,FBh,F1h,E3h,95h,06h,07h,C2h,FFh,B4h,31h,7Dh,C7h,81h
	DB	80h,BCh,FFh,C7h,38h,9Fh,8Fh,C1h,78h,0Eh,03h,81h,E3h,71h,B8h,F8h
	DB	3Ch,1Eh,8Eh,28h,E3h,F1h,14h,F0h,70h,78h,58h,0Dh,01h,C7h,FFh,7Ch
	DB	BDh,72h,11h,99h,67h,03h,1Eh,70h,2Ah,1Fh,F3h,8Bh,FEh,05h,C0h,F0h
	DB	38h,07h,24h,0Fh,5Ah,0Eh,1Dh,1Fh,38h,83h,81h,01h,14h,03h,FFh,27h
	DB	E0h,C1h,78h,79h,A1h,08h,CEh,CEh,DCh,BDh,FBh,F7h,FFh,DFh,86h,07h
	DB	1Fh,18h,30h,20h,8Bh,18h,0Eh,87h,F3h,7Ch,1Fh,07h,D3h,7Eh,80h,E1h
	DB	FFh,5Dh,AFh,85h,11h,E1h,F1h,01h,83h,E3h,F3h,39h,3Fh,E1h,C0h,8Ch
	DB	86h,FFh,9Eh,CCh,06h,18h,30h,60h,3Ch,67h,03h,0Fh,1Ch,A0h,18h,68h
	DB	3Fh,FCh,E0h,01h,06h,07h,7Fh,FFh,C1h,90h,3Fh,E3h,00h,38h,3Fh,0Fh
	DB	D4h,70h,BFh,4Ah,FEh,3Fh,D3h,D3h,FEh,A1h,FFh,27h,F7h,7Bh,39h,3Ch
	DB	1Ch,F0h,47h,2Fh,87h,C0h,E0h,F8h,7Eh,7Fh,07h,DFh,BFh,9Fh,FFh,2Bh
	DB	B9h,BAh,1Ch,F8h,FFh,8Dh,EFh,03h,41h,80h,F5h,D1h,0Fh,F3h,F6h,E6h
	DB	C6h,03h,FFh,B9h,AFh,1Ch,52h,01h,F1h,FFh,A1h,70h,38h,F0h,ECh,F1h
	DB	C3h,FFh,3Eh,00h,C6h,FFh,C7h,C3h,45h,ECh,63h,61h,6Fh,73h,30h,1Ch
	DB	8Fh,CCh,ACh,63h,FFh,93h,1Bh,FBh,1Fh,00h,0Eh,28h,B5h,F0h,98h,60h
	DB	2Bh,70h,30h,18h,1Fh,7Eh,4Fh,F8h,3Eh,0Fh,5Dh,5Ah,FCh,84h,ADh,0Fh
	DB	16h,CEh,CAh,C3h,01h,06h,0Ch,31h,1Fh,7Fh,B5h,BEh,5Ah,1Ch,97h,80h
	DB	B1h,E9h,38h,1Ch,96h,36h,C6h,62h,BBh,BDh,60h,70h,A3h,73h,F0h,87h
	DB	1Fh,3Ch,9Dh,80h,F0h,FEh,5Ch,56h,A4h,80h,8Eh,3Fh,BBh,7Fh,23h,BBh
	DB	F1h,2Fh,AFh,05h,EAh,64h,59h,51h,FCh,3Eh,D9h,3Fh,FFh,81h,86h,FAh
	DB	ABh,58h,B4h,18h,40h,67h,3Fh,8Fh,2Eh,0Ah,73h,1Bh,F7h,CFh,8Eh,8Eh
	DB	8Ch,9Ch,98h,90h,21h,23h,38h,38h,71h,73h,E3h,E7h,CFh,DCh,71h,F7h
	DB	ECh,91h,87h,3Fh,F8h,A6h,3Dh,F5h,D5h,88h,7Ah,7Fh,4Dh,0Dh,78h,BFh
	DB	07h,4Dh,0Dh,BDh,96h,07h,FFh,68h,C3h,C1h,EEh,C1h,54h,97h,FEh,8Dh
	DB	81h,E0h,C0h,36h,35h,EFh,4Ah,0Eh,0Ch,0Ch,06h,00h,7Fh,E6h,C0h,54h
	DB	B7h,1Fh,FAh,D6h,9Dh,C3h,1Eh,87h,C6h,A1h,1Eh,F8h,63h,A1h,77h,1Ch
	DB	C7h,CEh,2Bh,81h,F8h,00h,07h,FCh,C1h,1Fh,7Fh,FCh,17h,6Eh,9Ch,39h
	DB	F2h,C6h,0Dh,3Fh,B7h,FFh,FCh,F9h,F7h,FFh,F3h,CEh,59h,A3h,AFh,E0h
	DB	FCh,FFh,C5h,90h,7Dh,1Ah,7Dh,F0h,0Bh,8Fh,A8h,56h,0Fh,F9h,55h,91h
	DB	39h,FFh,7Fh,01h,C0h,47h,E0h,02h,A5h,2Dh,E6h,CCh,10h,20h,60h,40h
	DB	7Eh,56h,94h,75h,C9h,96h,C9h,C0h,3Fh,03h,D3h,EAh,7Fh,FEh,E0h,EAh
	DB	FEh,B6h,10h,C6h,CDh,E1h,83h,56h,B7h,38h,ECh,83h,19h,39h,3Bh,33h
	DB	A9h,FFh,37h,E7h,0Bh,E3h,C7h,CFh,8Fh,9Fh,9Fh,8Fh,98h,30h,60h,C1h
	DB	8Eh,03h,46h,C1h,1Eh,C7h,64h,D0h,13h,E0h,FEh,3Fh,03h,DFh,68h,43h
	DB	6Ah,47h,0Ch,78h,8Dh,48h,06h,ECh,1Dh,3Fh,81h,5Bh,EFh,3Eh,7Ch,F8h
	DB	49h,1Bh,55h,80h,EBh,D6h,7Fh,32h,EBh,BFh,41h,F8h,D7h,8Ah,AEh,3Ch
	DB	D1h,B7h,24h,FFh,42h,01h,85h,03h,24h,07h,7Fh,92h,77h,42h,67h,B4h
	DB	6Fh,00h,7Eh,F8h,E7h,F7h,4Fh,FDh,CBh,F7h,ADh,7Bh,80h,7Bh,F2h,7Dh
	DB	6Eh,8Dh,70h,2Fh,18h,7Ch,A1h,FEh,1Eh,70h,60h,49h,9Fh,0Ch,29h,ACh
	DB	69h,3Eh,18h,39h,73h,E7h,7Eh,1Bh,ADh,71h,7Ch,F0h,D9h,A1h,77h,E0h
	DB	6Ah,AFh,40h,AEh,E5h,BEh,FAh,79h,DAh,06h,3Bh,ADh,91h,42h,13h,87h
	DB	FFh,93h,5Fh,FCh,F1h,8Fh,C1h,3Fh,C7h,8Fh,3Fh,7Ch,FFh,98h,15h,87h
	DB	57h,81h,13h,37h,AFh,B2h,DCh,B1h,BBh,62h,10h,88h,24h,A5h,0Eh,3Ch
	DB	C1h,7Ah,B9h,54h,1Fh,62h,19h,CCh,EEh,E6h,9Fh,DFh,D3h,BBh,2Bh,EBh
	DB	A1h,29h,81h,79h,5Dh,7Eh,D3h,EDh,49h,80h,A9h,BDh,7Ch,E8h,6Bh,7Eh
	DB	7Eh,32h,BDh,22h,7Ah,03h,C9h,B5h,E0h,B3h,ABh,19h,3Bh,37h,9Eh,87h
	DB	D3h,6Eh,03h,D0h,6Ah,FFh,A8h,D5h,19h,1Ah,80h,FEh,64h,CBh,95h,6Ch
	DB	8Fh,01h,D2h,F0h,A1h,77h,F0h,E1h,CFh,BFh,4Eh,81h,56h,FCh,15h,97h
	DB	E1h,67h,FFh,D8h,F7h,53h,1Ch,11h,6Dh,4Ch,2Ah,F5h,F8h,F8h,D8h,DAh
	DB	4Ah,FBh,BDh,DDh,C0h,71h,CDh,86h,E1h,E1h,D1h,70h,D7h,FCh,9Bh,BCh
	DB	46h,1Dh,32h,F7h,79h,72h,83h,C1h,E0h,A5h,3Fh,DFh,E7h,A7h,79h,D3h
	DB	23h,52h,DFh,82h,4Ch,1Eh,E7h,D7h,7Ch,3Ch,0Eh,4Fh,6Dh,01h,3Ch,E4h
	DB	AAh,0Bh,FCh,79h,D6h,D2h,07h,EEh,39h,29h,DEh,F6h,E8h,7Bh,39h,C3h
	DB	D4h,F2h,7Eh,A9h,2Bh,A9h,C8h,C7h,E0h,03h,3Bh,F9h,E0h,60h,E6h,74h
	DB	6Ah,55h,46h,FCh,F7h,AEh,DAh,ECh,FEh,36h,16h,B9h,83h,20h,EAh,97h
	DB	EEh,AEh,BBh,92h,5Fh,07h,9Eh,37h,46h,60h,33h,DBh,DEh,CFh,E7h,F1h
	DB	ACh,52h,E0h,E3h,FEh,87h,9Fh,01h,DFh,03h,9Fh,03h,7Ah,1Dh,FCh,4Ah
	DB	0Fh,7Ch,1Bh,7Bh,00h,4Ch,49h,CFh,6Dh,C7h,62h,DAh,77h,9Fh,87h,E1h
	DB	89h,1Dh,00h,95h,02h,FFh,06h,FFh,0Ch,BDh,1Ch,79h,3Ch,F0h,FAh,E2h
	DB	C6h,84h,1Bh,FBh,17h,F6h,30h,F0h,37h,F7h,2Fh,EFh,6Fh,EEh,68h,E0h
	DB	6Fh,EFh,00h,30h,00h,6Fh,66h,A5h,F8h,1Eh,FEh,83h,F1h,3Fh,E1h,F3h
	DB	E3h,D2h,E0h,F5h,BCh,80h,DFh,C0h,FFh,C0h,7Fh,FDh,80h,E9h,1Dh,D5h
	DB	FEh,2Ch,F8h,FDh,6Eh,38h,78h,61h,B1h,99h,0Ch,7Ch,10h,AFh,DDh,18h
	DB	BAh,02h,06h,04h,EDh,C9h,DDh,19h,2Bh,23h,E7h,C7h,EEh,8Eh,5Fh,5Fh
	DB	DFh,DFh,DCh,C0h,BFh,FEh,6Bh,5Bh,AEh,A1h,E5h,ADh,B4h,B4h,5Dh,FEh
	DB	B8h,11h,52h,BDh,8Fh,42h,F6h,3Dh,F0h,7Fh,7Bh,ADh,5Bh,03h,D9h,1Ah
	DB	FCh,1Fh,49h,C7h,23h,CEh,96h,CAh,41h,E7h,0Fh,80h,01h,F0h,F5h,ADh
	DB	D0h,69h,FBh,DDh,07h,1Ah,FDh,F9h,F3h,D7h,9Fh,39h,BBh,32h,B3h,ADh
	DB	ACh,F9h,0Bh,91h,DFh,9Fh,BFh,3Ch,7Ch,70h,03h,9Dh,1Ch,7Bh,73h,F7h
	DB	E7h,EFh,C8h,DFh,E3h,9Dh,4Fh,43h,C7h,A7h,72h,FCh,FBh,C3h,EAh,9Fh
	DB	76h,E3h,DEh,F4h,73h,26h,0Bh,7Fh,03h,D7h,20h,53h,0Fh,ABh,3Dh,A6h
	DB	78h,52h,A4h,1Fh,0Fh,C7h,8Fh,E3h,03h,F1h,C9h,C0h,BDh,52h,3Eh,0Eh
	DB	0Fh,83h,03h,F0h,01h,FCh,3Eh,3Dh,2Eh,34h,7Fh,1Eh,9Fh,00h,F7h,CFh
	DB	C7h,E7h,E3h,F3h,71h,79h,38h,3Ch,9Ch,1Eh,C6h,07h,63h,03h,19h,C5h
	DB	98h,CEh,8Dh,74h,A4h,47h,90h,0Eh,4Ah,9Dh,00h,39h,08h,7Bh,18h,F3h
	DB	30h,E7h,70h,95h,40h,22h,FFh,E6h,FEh,07h,FCh,0Eh,F8h,19h,F9h,95h
	DB	34h,9Ah,AFh,8Bh,C8h,1Bh,98h,33h,30h,66h,70h,C6h,E0h,8Fh,C0h,1Bh
	DB	88h,3Ah,99h,DBh,C0h,EEh,65h,78h,1Bh,FCh,3Ch,26h,6Bh,55h,0Dh,E0h
	DB	81h,FDh,F1h,FBh,2Ah,F7h,69h,A9h,99h,09h,1Fh,BFh,30h,10h,76h,70h
	DB	E4h,E0h,8Dh,80h,10h,FDh,7Fh,60h,E7h,C0h,8Fh,DBh,A0h,49h,DFh,24h
	DB	DFh,BFh,94h,BFh,A5h,4Dh,3Eh,36h,9Fh,5Ch,A8h,C0h,61h,B3h,D5h,49h
	DB	F8h,09h,E7h,7Bh,1Eh,EFh,88h,70h,60h,07h,04h,E4h,09h,4Fh,ABh,03h
	DB	F0h,C3h,61h,8Dh,8Bh,0Ch,F8h,3Fh,FBh,F4h,35h,A7h,70h,1Bh,D3h,CDh
	DB	F9h,E0h,B5h,99h,8Dh,78h,60h,03h,00h,1Dh,5Fh,69h,38h,8Fh,3Fh,80h
	DB	3Fh,45h,4Ch,1Bh,9Fh,6Ch,8Dh,ACh,11h,04h,EBh,FCh,F0h,F9h,81h,F1h
	DB	A1h,9Dh,FBh,E3h,78h,41h,E0h,83h,69h,2Dh,F8h,F5h,62h,08h,5Dh,C7h
	DB	C0h,A8h,E6h,CBh,CFh,75h,C7h,73h,DFh,0Dh,69h,4Ah,6Ah,4Eh,7Eh,7Ch
	DB	10h,07h,E0h,CFh,35h,0Fh,60h,0Fh,C0h,1Fh,4Fh,2Ah,BCh,7Ch,D6h,3Dh
	DB	C2h,35h,B9h,E3h,09h,ADh,3Bh,F8h,87h,F0h,3Dh,E9h,B7h,05h,0Ah,C4h
	DB	C3h,F1h,9Ch,FCh,7Eh,FEh,83h,E7h,63h,FBh,F9h,3Dh,1Ch,00h,E1h,00h
	DB	8Fh,80h,FFh,80h,7Fh,78h,3Fh,7Dh,9Fh,83h,37h,14h,42h,F3h,5Dh,03h
	DB	FCh,33h,C2h,F8h,E3h,E0h,6Bh,CBh,3Bh,E8h,31h,38h,23h,B6h,D4h,34h
	DB	C8h,70h,77h,86h,F5h,47h,18h,21h,BDh,31h,FCh,3Ch,D4h,C9h,C0h,9Fh
	DB	9Ch,19h,09h,F1h,F2h,F1h,FCh,F2h,D9h,65h,99h,13h,13h,E3h,0Fh,FEh
	DB	25h,25h,07h,0Ch,49h,21h,FDh,F3h,60h,C7h,DDh,A5h,A9h,50h,17h,24h
	DB	6Eh,94h,9Ch,4Fh,51h,A1h,5Ah,E9h,1Fh,1Ah,EFh,C1h,A5h,F1h,D9h,D0h
	DB	14h,63h,71h,52h,80h,5Dh,ABh,B7h,8Ch,52h,F8h,9Fh,C7h,49h,E1h,3Ch
	DB	3Fh,0Ch,CFh,60h,D2h,03h,0Dh,06h,FCh,1Ch,F9h,30h,58h,49h,29h,0Ch
	DB	FCh,30h,F3h,77h,CFh,6Dh,4Dh,88h,B4h,D2h,C0h,06h,33h,28h,F9h,03h
	DB	71h,01h,1Ch,FDh,00h,0Eh,0Dh,03h,F7h,6Ch,5Ch,7Ah,1Ch,7Eh,EBh,FDh
	DB	ACh,F9h,5Ch,B5h,2Dh,87h,2Dh,4Ch,49h,02h,D7h,EDh,6Dh,8Ch,77h,B3h
	DB	95h,43h,BAh,F8h,3Ch,0Fh,04h,F8h,26h,C4h,30h,27h,80h,3Eh,7Dh,CEh
	DB	6Dh,9Fh,59h,5Eh,76h,93h,EFh,E6h,1Ah,9Ch,60h,79h,69h,7Ch,80h,FDh
	DB	7Eh,FBh,5Dh,BDh,71h,54h,A4h,60h,4Fh,4Eh,89h,DEh,CEh,EEh,66h,76h
	DB	33h,BBh,9Bh,BBh,99h,DBh,CDh,ECh,EDh,EBh,6Bh,E0h,7Eh,DFh,5Fh,47h
	DB	67h,7Ch,7Ch,E3h,E2h,1Fh,0Dh,80h,9Bh,3Ch,CEh,C6h,B7h,83h,03h,79h
	DB	C1h,DCh,10h,16h,04h,E5h,01h,F9h,63h,44h,91h,9Ah,E9h,18h,93h,93h
	DB	26h,C1h,7Eh,40h,3Fh,A0h,BFh,66h,6Dh,65h,26h,07h,71h,8Ch,38h,33h
	DB	95h,C1h,07h,39h,A8h,4Ah,7Fh,61h,4Fh,4Fh,8Bh,0Fh,FEh,7Ch,F8h,F0h
	DB	E3h,80h,0Fh,1Ch,49h,78h,1Dh,E0h,D5h,C1h,77h,D5h,DDh,F7h,E5h,EDh
	DB	7Dh,1Ah,91h,30h,44h,D5h,0Dh,F9h,79h,B1h,F2h,DEh,F8h,CFh,A1h,85h
	DB	7Dh,13h,E2h,98h,93h,E0h,7Dh,28h,B8h,37h,C1h,9Ch,4Ch,89h,D5h,83h
	DB	F1h,01h,F1h,0Eh,CFh,26h,A5h,40h,7Fh,80h,B1h,1Dh,06h,C7h,FAh,EDh
	DB	F1h,ECh,F0h,EDh,0Ch,F1h,03h,30h,AEh,CCh,D1h,3Fh,D3h,40h,86h,70h
	DB	E7h,20h,C7h,0Eh,AEh,19h,BAh,98h,D2h,98h,3Ch,78h,3Ch,30h,F5h,A6h
	DB	CFh,CCh,E7h,CCh,67h,24h,37h,12h,DBh,09h,EDh,C0h,FFh,3Ch,ADh,D8h
	DB	A7h,D5h,B4h,07h,68h,62h,DBh,4Ch,29h,43h,C0h,53h,CDh,24h,51h,29h
	DB	50h,5Fh,2Fh,AFh,1Fh,D7h,F7h,F3h,02h,1Bh,01h,FDh,0Ah,7Eh,3Eh,8Dh
	DB	ABh,43h,E1h,D1h,6Ah,84h,E7h,14h,84h,AEh,DDh,04h,95h,7Bh,11h,E2h
	DB	04h,24h,E4h,CCh,4Eh,88h,B0h,23h,73h,E4h,49h,4Ch,2Dh,E6h,18h,57h
	DB	1Fh,41h,4Ah,C5h,10h,90h,EDh,ADh,FEh,02h,FCh,E0h,CFh,48h,8Fh,9Bh
	DB	19h,16h,F2h,0Dh,E5h,0Ch,E7h,18h,4Fh,18h,4Fh,98h,8Fh,38h,93h,21h
	DB	C0h,B2h,B8h,F1h,09h,0Ch,0Fh,8Eh,0Fh,CDh,48h,2Bh,08h,05h,99h,E9h
	DB	64h,D2h,C0h,1Fh,20h,DFh,DCh,ACh,B4h,C6h,40h,8Fh,E7h,ACh,CDh,39h
	DB	F0h,04h,F6h,DDh,B2h,84h,45h,7Ch,80h,49h,B5h,08h,A0h,BFh,50h,5Fh
	DB	0Fh,EFh,04h,F4h,02h,FBh,01h,7Dh,6Bh,E3h,BCh,C7h,E0h,1Fh,80h,CDh
	DB	30h,BFh,08h,0Ah,02h,33h,49h,0Ch,24h,C7h,F3h,3Dh,08h,C6h,E9h,94h
	DB	20h,CDh,3Dh,35h,D9h,3Dh,E8h,69h,E0h,0Ch,1Eh,1Fh,E8h,74h,01h,2Ch
	DB	2Dh,30h,93h,37h,9Eh,B2h,9Ch,B0h,9Fh,18h,8Fh,18h,2Ah,0Ch,36h,98h
	DB	B3h,A0h,4Ah,F8h,99h,6Dh,F1h,27h,9Bh,13h,E0h,9Fh,60h,CFh,01h,8Fh
	DB	24h,9Ah,8Dh,BFh,2Ch,4Ch,E8h,C6h,28h,0Dh,3Eh,8Dh,CCh,B3h,29h,C0h
	DB	01h,E1h,48h,FEh,38h,91h,A8h,E7h,E1h,28h,C1h,D8h,43h,1Fh,E9h,91h
	DB	9Dh,FEh,41h,F9h,39h,F1h,DCh,C9h,40h,A5h,F8h,53h,F9h,5Fh,E5h,DCh
	DB	A9h,B1h,40h,9Ah,D2h,91h,3Eh,11h,01h,81h,19h,80h,9Fh,40h,D2h,13h
	DB	A7h,F8h,B4h,09h,70h,AAh,ECh,90h,1Ch,32h,24h,27h,C6h,E8h,EFh,BCh
	DB	C5h,E9h,70h,67h,63h,C8h,0Dh,DDh,3Fh,5Ch,E8h,C3h,94h,F7h,59h,B8h
	DB	FCh,F0h,32h,90h,0Ch,03h,0Ch,8Fh,03h,FDh,D0h,C1h,A3h,C1h,01h,52h
	DB	F0h,C4h,63h,60h,7Eh,75h,21h,DFh,D5h,E5h,D9h,8Ch,A4h,1Eh,4Eh,AEh
	DB	E3h,FDh,0Fh,02h,CEh,94h,AFh,2Ch,ACh,6Ch,6Fh,8Bh,FEh,AEh,25h,C5h
	DB	0Dh,81h,ABh,5Ah,FDh,F8h,39h,E0h,78h,FCh,58h

; Title & Ending Kadokawa Shoten / Tezuka Production publisher emblem 75-tile 2bpp tileset (1,200B)
PUBLISHER_LOGO_CREDITS_TILES_2BPP:
	DB	00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,0Ch,0Ch,12h,1Eh,21h,3Fh
	DB	00h,00h,07h,07h,08h,0Fh,08h,0Fh,08h,0Fh,08h,0Fh,08h,0Fh,08h,0Fh
	DB	00h,00h,E0h,E0h,10h,F0h,10h,F0h,10h,F0h,10h,F0h,10h,F0h,10h,F0h
	DB	00h,00h,00h,00h,00h,00h,20h,20h,50h,70h,48h,78h,84h,FCh,82h,FEh
	DB	00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,01h,01h,06h,07h,08h,0Fh
	DB	00h,00h,00h,00h,00h,00h,3Fh,3Fh,C0h,FFh,00h,FFh,00h,FFh,00h,FFh
	DB	00h,00h,00h,00h,00h,00h,F8h,F8h,06h,FEh,01h,FFh,00h,FFh,00h,FFh
	DB	00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,80h,80h,40h,C0h,20h,E0h
	DB	00h,00h,00h,00h,0Fh,0Fh,10h,1Fh,10h,1Fh,10h,1Fh,10h,1Fh,10h,1Fh
	DB	0Fh,0Fh,10h,1Fh,F0h,FFh,00h,FFh,00h,FFh,3Fh,FFh,3Fh,FFh,00h,FFh
	DB	C0h,C0h,20h,E0h,3Fh,FFh,00h,FFh,00h,FFh,FCh,FFh,FCh,FFh,00h,FFh
	DB	00h,00h,00h,00h,F0h,F0h,08h,F8h,08h,F8h,08h,F8h,08h,F8h,08h,F8h
	DB	40h,7Fh,80h,FFh,C0h,FFh,60h,7Fh,30h,3Fh,18h,1Fh,0Dh,0Fh,07h,07h
	DB	88h,8Fh,48h,CFh,28h,EFh,28h,EFh,48h,CFh,D0h,DFh,90h,9Fh,10h,1Fh
	DB	11h,F1h,12h,F3h,14h,F7h,14h,F7h,16h,F7h,0Bh,FBh,09h,F9h,08h,F8h
	DB	01h,FFh,03h,FFh,02h,FEh,06h,FEh,0Ch,FCh,18h,F8h,B0h,F0h,E0h,E0h
	DB	08h,0Fh,10h,1Fh,10h,1Fh,20h,3Fh,21h,3Fh,41h,7Fh,41h,7Fh,42h,7Eh
	DB	00h,FFh,38h,FFh,68h,EFh,C8h,CFh,88h,8Fh,08h,0Fh,08h,0Fh,08h,0Fh
	DB	00h,FFh,30h,FFh,2Ch,EFh,26h,E7h,23h,E3h,21h,E1h,21h,E1h,20h,E0h
	DB	10h,F0h,08h,F8h,08h,F8h,04h,FCh,04h,FCh,02h,FEh,82h,FEh,82h,FEh
	DB	10h,1Fh,10h,1Fh,10h,1Fh,10h,1Fh,10h,1Fh,10h,1Fh,10h,1Fh,10h,1Fh
	DB	00h,FFh,3Fh,FFh,3Fh,FFh,00h,FFh,00h,FFh,3Fh,FFh,3Fh,FFh,00h,FFh
	DB	00h,FFh,FCh,FFh,FCh,FFh,00h,FFh,00h,FFh,FFh,FFh,FFh,FFh,00h,FFh
	DB	08h,F8h,08h,F8h,08h,F8h,08h,F8h,08h,F8h,F0h,F0h,FCh,FCh,02h,FEh
	DB	02h,02h,00h,00h,00h,00h,00h,00h,03h,03h,0Ch,0Fh,30h,3Fh,C0h,FFh
	DB	20h,3Fh,20h,3Fh,40h,7Fh,80h,FFh,00h,FFh,00h,FFh,01h,FFh,03h,FFh
	DB	04h,FCh,04h,FCh,02h,FEh,01h,FFh,00h,FFh,80h,FFh,C0h,FFh,60h,7Fh
	DB	40h,40h,00h,00h,00h,00h,00h,00h,80h,80h,60h,E0h,18h,F8h,07h,FFh
	DB	42h,7Eh,42h,7Eh,42h,7Eh,42h,7Eh,41h,7Fh,40h,7Fh,60h,7Fh,20h,3Fh
	DB	10h,1Fh,10h,1Fh,10h,1Fh,20h,3Fh,C0h,FFh,00h,FFh,01h,FFh,03h,FFh
	DB	20h,E0h,40h,C0h,40h,C0h,40h,C0h,81h,81h,86h,87h,F8h,FFh,00h,FFh
	DB	82h,FEh,82h,FEh,82h,FEh,82h,FEh,02h,FEh,02h,FEh,06h,FEh,04h,FCh
	DB	10h,1Fh,10h,1Fh,10h,1Fh,10h,1Fh,10h,1Fh,2Fh,3Fh,24h,3Ch,43h,7Fh
	DB	00h,FFh,3Fh,FFh,3Fh,FFh,00h,FFh,00h,FFh,FFh,FFh,F7h,F7h,08h,FFh
	DB	00h,FFh,FFh,FFh,FFh,FFh,00h,FFh,00h,FFh,FFh,FFh,BCh,BCh,42h,FEh
	DB	02h,FEh,FCh,FCh,FFh,FFh,01h,FFh,01h,FFh,C1h,FFh,41h,7Fh,41h,7Fh
	DB	00h,FFh,80h,FFh,C0h,FFh,60h,7Fh,31h,3Fh,1Fh,1Fh,0Fh,0Fh,00h,00h
	DB	06h,FEh,0Ch,FCh,18h,F8h,70h,F0h,E0h,E0h,80h,80h,00h,00h,00h,00h
	DB	30h,3Fh,18h,1Fh,0Ch,0Fh,06h,07h,03h,03h,01h,01h,00h,00h,00h,00h
	DB	00h,FFh,01h,FFh,03h,FFh,02h,FEh,84h,FCh,FCh,FCh,78h,78h,00h,00h
	DB	30h,3Fh,18h,1Fh,0Ch,0Fh,07h,07h,00h,00h,00h,00h,00h,00h,00h,00h
	DB	06h,FEh,0Ch,FCh,38h,F8h,E0h,E0h,00h,00h,00h,00h,00h,00h,00h,00h
	DB	80h,FFh,80h,FFh,40h,7Fh,60h,7Fh,21h,3Fh,37h,3Fh,1Ch,1Ch,00h,00h
	DB	0Ch,FCh,18h,F8h,30h,F0h,60h,E0h,C0h,C0h,00h,00h,00h,00h,00h,00h
	DB	41h,7Fh,81h,FFh,03h,FFh,83h,FFh,63h,7Fh,36h,3Fh,1Dh,1Dh,00h,00h
	DB	0Ch,FFh,0Ch,FFh,0Ah,FBh,0Ah,FBh,0Ah,FBh,0Ah,FBh,F1h,F1h,00h,00h
	DB	21h,FFh,30h,FFh,30h,FFh,10h,FFh,1Ch,FFh,14h,F7h,E4h,E7h,03h,03h
	DB	C1h,FFh,C1h,FFh,01h,FFh,01h,FFh,02h,FEh,02h,FEh,04h,FCh,F8h,F8h
	DB	00h,00h,10h,10h,2Fh,3Fh,20h,3Fh,27h,3Fh,20h,3Fh,27h,3Fh,24h,3Fh
	DB	00h,00h,01h,01h,FEh,FFh,00h,FFh,FBh,FFh,01h,FFh,3Fh,FFh,03h,FFh
	DB	80h,80h,40h,C0h,20h,E0h,10h,F0h,20h,E0h,20h,E0h,20h,E0h,20h,E0h
	DB	00h,00h,40h,40h,BFh,FFh,80h,FFh,9Ch,FFh,95h,FFh,90h,FFh,93h,FFh
	DB	02h,02h,05h,07h,F8h,FFh,00h,FFh,FCh,FFh,CCh,FFh,04h,FFh,CCh,FFh
	DB	00h,00h,01h,01h,81h,81h,41h,C1h,87h,87h,89h,8Fh,84h,87h,82h,83h
	DB	C0h,C0h,20h,E0h,17h,F7h,18h,FFh,3Fh,FFh,65h,FFh,60h,FFh,04h,FFh
	DB	01h,01h,02h,03h,FCh,FFh,00h,FFh,FFh,FFh,FEh,FFh,00h,FFh,FEh,FFh
	DB	00h,00h,80h,80h,40h,C0h,20h,E0h,C0h,C0h,40h,C0h,20h,E0h,40h,C0h
	DB	24h,3Fh,24h,3Fh,24h,3Fh,24h,3Fh,24h,3Fh,24h,3Fh,24h,3Fh,24h,3Fh
	DB	F3h,FFh,03h,FFh,F3h,FFh,03h,FFh,FFh,FFh,01h,FFh,FFh,FFh,00h,FFh
	DB	20h,E0h,20h,E0h,20h,E0h,20h,E0h,20h,E0h,20h,E0h,10h,F0h,10h,F0h
	DB	93h,FFh,90h,FFh,93h,FFh,93h,FFh,90h,FFh,97h,FFh,9Fh,FFh,90h,FFh
	DB	CCh,FFh,0Ch,FFh,CCh,FFh,CCh,FFh,0Ch,FFh,DCh,FFh,ECh,FFh,04h,FFh
	DB	81h,81h,81h,81h,86h,87h,88h,8Fh,88h,8Fh,87h,87h,45h,C7h,44h,C7h
	DB	0Ch,FFh,3Ch,FFh,64h,FFh,10h,FFh,70h,FFh,3Ch,FFh,0Ch,FFh,20h,FFh
	DB	FEh,FFh,00h,FFh,FEh,FFh,FFh,FFh,00h,FFh,49h,FFh,49h,FFh,00h,FFh
	DB	40h,C0h,40h,C0h,40h,C0h,20h,E0h,10h,F0h,20h,E0h,20h,E0h,20h,E0h
	DB	25h,3Fh,2Dh,3Fh,2Ah,3Fh,5Ah,7Fh,52h,7Fh,B3h,FFh,4Ch,4Ch,00h,00h
	DB	FEh,FFh,B6h,FFh,DAh,FFh,4Ah,FFh,4Ch,FFh,6Ch,FFh,93h,93h,00h,00h
	DB	10h,F0h,0Ch,FCh,4Ah,FEh,43h,FFh,63h,FFh,A6h,BFh,19h,19h,00h,00h
	DB	9Eh,FFh,A6h,E7h,A8h,EFh,46h,C7h,3Eh,BFh,C0h,FFh,3Fh,3Fh,00h,00h
	DB	7Ah,FBh,52h,F3h,09h,F9h,7Dh,FDh,72h,FEh,01h,FFh,FEh,FEh,00h,00h
	DB	44h,C7h,34h,F7h,2Ch,FFh,0Dh,FFh,8Bh,FFh,95h,F5h,60h,60h,00h,00h
	DB	20h,FFh,30h,FFh,2Ah,EFh,32h,FFh,36h,FFh,6Ah,FBh,91h,91h,00h,00h
	DB	49h,FFh,49h,FFh,49h,FFh,49h,FFh,5Ah,FFh,A1h,A1h,00h,00h,00h,00h
	DB	20h,E0h,20h,E0h,20h,E0h,20h,E0h,20h,E0h,40h,C0h,80h,80h,00h,00h

; Active 32x18 Title screen Firebird Phase 1 tilemap slice (576B)
TITLE_FIREBIRD_PHASE1_TILEMAP_ACTIVE:
	DB	00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
	DB	00h,41h,42h,43h,44h,45h,46h,47h,00h,00h,00h,48h,49h,4Ah,4Bh,00h
	DB	00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
	DB	00h,4Ch,4Dh,4Eh,4Fh,50h,51h,52h,53h,54h,55h,56h,57h,58h,59h,5Ah
	DB	00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,01h,02h,03h,04h,05h
	DB	5Bh,5Ch,5Dh,00h,5Eh,5Fh,60h,61h,62h,63h,64h,65h,66h,67h,68h,69h
	DB	00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,06h,07h,08h,09h,0Ah
	DB	6Ah,6Bh,00h,00h,6Ch,49h,6Dh,6Eh,6Fh,70h,71h,72h,73h,74h,75h,76h
	DB	00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,0Bh,0Ch,0Dh,0Eh,0Fh
	DB	77h,00h,00h,00h,56h,57h,58h,59h,5Ah,78h,79h,7Ah,7Bh,7Ch,7Dh,7Eh
	DB	00h,00h,00h,00h,00h,00h,00h,00h,00h,10h,11h,12h,13h,14h,15h,16h
	DB	00h,00h,00h,7Fh,65h,66h,67h,68h,69h,80h,81h,82h,83h,84h,85h,86h
	DB	00h,00h,00h,00h,00h,00h,00h,00h,00h,17h,18h,19h,1Ah,1Bh,1Ch,00h
	DB	00h,00h,00h,71h,72h,73h,74h,75h,41h,42h,43h,44h,45h,46h,47h,2Fh
	DB	00h,00h,00h,00h,00h,1Dh,1Eh,1Fh,00h,20h,21h,22h,23h,00h,00h,00h
	DB	00h,00h,78h,79h,7Ah,7Bh,7Ch,7Dh,4Ch,4Dh,4Eh,4Fh,50h,51h,52h,53h
	DB	00h,00h,00h,00h,00h,00h,24h,25h,26h,00h,00h,27h,28h,00h,00h,00h
	DB	00h,00h,87h,88h,89h,7Bh,8Ah,5Bh,5Ch,00h,00h,00h,8Bh,60h,61h,00h
	DB	00h,00h,00h,00h,00h,29h,2Ah,2Bh,2Ch,00h,00h,00h,00h,00h,00h,00h
	DB	00h,8Ch,8Dh,8Eh,8Fh,90h,91h,92h,00h,00h,93h,00h,00h,94h,95h,96h
	DB	00h,00h,00h,00h,00h,2Dh,2Eh,00h,2Fh,30h,31h,32h,00h,00h,00h,00h
	DB	00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,97h,98h,99h
	DB	00h,00h,00h,00h,00h,00h,00h,00h,00h,17h,33h,34h,35h,B5h,00h,00h
	DB	00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,B6h
	DB	00h,00h,00h,00h,00h,00h,00h,00h,00h,36h,37h,38h,39h,3Ah,3Bh,00h
	DB	00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
	DB	00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,3Ch,3Dh,3Eh,3Fh,40h,30h
	DB	00h,00h,00h,9Ah,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,9Bh,9Ch
	DB	00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,17h
	DB	33h,9Dh,00h,9Eh,9Fh,A0h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
	DB	00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,36h
	DB	37h,38h,A1h,A2h,A3h,A4h,A5h,A6h,A7h,A8h,A9h,00h,00h,00h,00h,AAh
	DB	00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
	DB	3Ch,3Dh,00h,00h,00h,ABh,ACh,ADh,AEh,AFh,B0h,B1h,ACh,B2h,B3h,B4h
	DB	00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
	DB	00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h

; Active 32x18 Title screen Firebird Phase 2 tilemap slice (576B)
TITLE_FIREBIRD_PHASE2_TILEMAP_ACTIVE:
	DB	00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
	DB	00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
	DB	00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
	DB	00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
	DB	00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
	DB	00h,00h,00h,16h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
	DB	00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
	DB	00h,00h,17h,18h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
	DB	00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
	DB	00h,19h,1Ah,1Bh,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
	DB	00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
	DB	1Ch,1Dh,1Eh,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
	DB	00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,01h
	DB	1Fh,20h,21h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
	DB	00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,02h,03h,04h
	DB	22h,23h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
	DB	00h,00h,00h,00h,00h,00h,00h,00h,00h,05h,06h,00h,00h,07h,08h,09h
	DB	24h,25h,00h,00h,00h,00h,00h,00h,00h,2Fh,30h,31h,00h,00h,00h,00h
	DB	00h,00h,00h,00h,00h,00h,00h,00h,00h,0Ah,0Bh,0Ch,0Dh,0Eh,0Fh,10h
	DB	26h,00h,00h,00h,00h,00h,00h,00h,32h,33h,00h,34h,35h,00h,00h,00h
	DB	00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,11h,12h,6Fh,70h
	DB	27h,28h,29h,2Ah,2Bh,2Ch,2Dh,2Eh,36h,37h,38h,39h,3Ah,00h,00h,00h
	DB	00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,13h,14h
	DB	3Bh,3Ch,3Dh,3Eh,3Fh,40h,41h,42h,43h,44h,45h,71h,46h,47h,48h,00h
	DB	00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,15h
	DB	49h,4Ah,4Bh,4Ch,4Dh,4Eh,4Fh,50h,51h,2Ch,2Dh,2Eh,52h,53h,54h,55h
	DB	00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
	DB	56h,57h,58h,00h,59h,5Ah,5Bh,5Ch,5Dh,40h,41h,42h,5Eh,5Fh,00h,00h
	DB	00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
	DB	00h,00h,60h,00h,00h,00h,61h,62h,63h,64h,65h,66h,67h,68h,69h,6Ah
	DB	00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
	DB	00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,6Bh,6Ch,6Dh,6Eh,00h
	DB	00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
	DB	00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
	DB	00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
	DB	00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h

; 12x4 sequential tilemap (48B) for Publisher Emblem Box 1 (Kadokawa Shoten)
PUBLISHER_EMBLEM_BOX1_TILEMAP_12X4:
	DB	01h,02h,03h,04h,05h,06h,07h,08h,09h,0Ah,0Bh,0Ch
	DB	0Dh,0Eh,0Fh,10h,11h,12h,13h,14h,15h,16h,17h,18h
	DB	19h,1Ah,1Bh,1Ch,1Dh,1Eh,1Fh,20h,21h,22h,23h,24h
	DB	25h,26h,27h,28h,29h,2Ah,2Bh,2Ch,2Dh,2Eh,2Fh,30h

; 9x3 sequential tilemap (27B) for Publisher Emblem Box 2 (Tezuka Production)
PUBLISHER_EMBLEM_BOX2_TILEMAP_9X3:
	DB	31h,32h,33h,34h,35h,36h,37h,38h,39h
	DB	3Ah,3Bh,3Ch,3Dh,3Eh,3Fh,40h,41h,42h
	DB	43h,44h,45h,46h,47h,48h,49h,4Ah,4Bh

; 34-glyph (22h) 8x8 1bpp English lowercase & punctuation dialogue slice (272B)
MAIN_FONT_ENGLISH_LOWERCASE_1BPP:
	DB	00h,00h,00h,00h,00h,00h,00h,00h
	DB	00h,60h,60h,60h,40h,40h,00h,40h
	DB	00h,36h,12h,24h,00h,00h,00h,00h
	DB	00h,30h,10h,20h,00h,00h,00h,00h
	DB	00h,00h,00h,00h,00h,30h,10h,20h
	DB	00h,00h,00h,00h,00h,00h,30h,30h
	DB	00h,00h,30h,30h,00h,30h,30h,00h
	DB	00h,3Eh,63h,63h,0Eh,08h,00h,08h
	DB	00h,1Ch,36h,63h,63h,7Fh,63h,63h
	DB	00h,7Eh,63h,63h,7Eh,63h,63h,7Eh
	DB	00h,3Eh,63h,60h,60h,60h,63h,3Eh
	DB	00h,7Ch,66h,63h,63h,63h,66h,7Ch
	DB	00h,7Fh,60h,60h,7Eh,60h,60h,7Fh
	DB	00h,7Fh,60h,60h,7Eh,60h,60h,60h
	DB	00h,3Eh,63h,60h,67h,63h,63h,3Fh
	DB	00h,63h,63h,63h,7Fh,63h,63h,63h
	DB	00h,3Ch,18h,18h,18h,18h,18h,3Ch
	DB	00h,1Fh,06h,06h,06h,06h,66h,3Ch
	DB	00h,63h,66h,6Ch,78h,7Ch,6Eh,67h
	DB	00h,60h,60h,60h,60h,60h,60h,7Fh
	DB	00h,63h,77h,7Fh,7Fh,6Bh,63h,63h
	DB	00h,63h,73h,7Bh,7Fh,6Fh,67h,63h
	DB	00h,3Eh,63h,63h,63h,63h,63h,3Eh
	DB	00h,7Eh,63h,63h,63h,7Eh,60h,60h
	DB	00h,3Eh,63h,63h,63h,6Fh,66h,3Dh
	DB	00h,7Eh,63h,63h,62h,7Ch,66h,63h
	DB	00h,3Eh,63h,60h,3Eh,03h,63h,3Eh
	DB	00h,7Eh,18h,18h,18h,18h,18h,18h
	DB	00h,63h,63h,63h,63h,63h,63h,3Eh
	DB	00h,63h,63h,63h,63h,36h,1Ch,08h
	DB	00h,63h,63h,6Bh,6Bh,7Fh,77h,22h
	DB	00h,63h,76h,3Ch,1Ch,1Eh,37h,63h
	DB	00h,66h,66h,7Eh,3Ch,18h,18h,18h
	DB	00h,7Fh,07h,0Eh,1Ch,38h,70h,7Fh

; English Title/Ending FIREBIRD and FIN 80-tile 2bpp tileset (1,280B)
FIREBIRD_LOGO_2BPP_TILES:
	DB	00h,00h,00h,00h,3Fh,3Fh,20h,3Fh,20h,3Fh,30h,3Fh,10h,1Fh,10h,1Fh
	DB	00h,00h,00h,00h,FFh,FFh,00h,FFh,00h,FFh,00h,FFh,00h,FFh,FFh,FFh
	DB	00h,00h,00h,00h,FFh,FFh,30h,FFh,30h,FFh,38h,FFh,28h,EFh,A8h,EFh
	DB	00h,00h,00h,00h,FFh,FFh,18h,FFh,18h,FFh,3Ch,FFh,24h,E7h,24h,E7h
	DB	00h,00h,00h,00h,FFh,FFh,00h,FFh,00h,FFh,00h,FFh,00h,FFh,1Fh,FFh
	DB	00h,00h,00h,00h,F8h,F8h,04h,FCh,02h,FEh,02h,FEh,02h,FEh,02h,FEh
	DB	00h,00h,00h,00h,EFh,EFh,28h,EFh,28h,EFh,2Ch,EFh,24h,E7h,A4h,E7h
	DB	00h,00h,00h,00h,1Fh,1Fh,10h,1Fh,10h,1Fh,18h,1Fh,08h,0Fh,08h,0Fh
	DB	00h,00h,00h,00h,FFh,FFh,08h,FFh,18h,FFh,10h,FFh,30h,FFh,67h,FFh
	DB	00h,00h,00h,00h,E0h,E0h,10h,F0h,08h,F8h,08h,F8h,04h,FCh,04h,FCh
	DB	10h,1Fh,10h,1Fh,10h,1Fh,10h,1Fh,10h,1Fh,10h,1Fh,10h,1Fh,10h,1Fh
	DB	80h,80h,80h,80h,80h,80h,BCh,BCh,C2h,FEh,81h,FFh,39h,FFh,6Dh,FFh
	DB	68h,6Fh,28h,2Fh,08h,0Fh,08h,0Fh,08h,0Fh,08h,0Fh,08h,0Fh,08h,0Fh
	DB	24h,E7h,24h,E7h,24h,E7h,24h,E7h,24h,E7h,24h,E7h,24h,E7h,24h,E7h
	DB	10h,F0h,10h,F0h,10h,F0h,10h,F0h,11h,F1h,16h,F7h,18h,FFh,10h,FFh
	DB	82h,FEh,82h,FEh,82h,FEh,82h,FEh,02h,FEh,02h,FEh,04h,FCh,18h,F8h
	DB	64h,67h,24h,27h,04h,07h,04h,07h,04h,07h,04h,07h,04h,07h,04h,07h
	DB	10h,F0h,10h,F0h,10h,F0h,11h,F1h,16h,F7h,18h,FFh,10h,FFh,23h,FFh
	DB	82h,FEh,82h,FEh,82h,FEh,04h,FCh,08h,F8h,30h,F0h,0Ch,FCh,82h,FEh
	DB	08h,0Fh,08h,0Fh,08h,0Fh,08h,0Fh,08h,0Fh,08h,0Fh,08h,0Fh,08h,0Fh
	DB	E4h,FCh,C8h,F8h,C8h,F8h,D8h,F8h,9Ch,FCh,92h,FEh,81h,FFh,81h,FFh
	DB	84h,FCh,84h,FCh,42h,7Eh,42h,7Eh,42h,7Eh,42h,7Eh,42h,7Eh,42h,7Eh
	DB	45h,FFh,42h,FEh,A4h,BCh,98h,98h,80h,80h,80h,80h,80h,80h,80h,80h
	DB	22h,FFh,45h,FDh,43h,FFh,41h,FFh,21h,FFh,12h,FEh,1Ch,FCh,10h,F0h
	DB	08h,F8h,08h,F8h,08h,F8h,04h,FCh,84h,FCh,82h,FEh,82h,FEh,81h,FFh
	DB	45h,FFh,42h,FEh,A4h,BCh,98h,98h,80h,80h,80h,80h,FFh,FFh,00h,FFh
	DB	04h,07h,04h,07h,04h,07h,04h,07h,24h,27h,64h,67h,A4h,E7h,24h,E7h
	DB	44h,FCh,42h,FEh,41h,FFh,21h,FFh,12h,FEh,1Ch,FCh,1Fh,FFh,00h,FFh
	DB	42h,7Eh,21h,3Fh,21h,3Fh,20h,3Fh,20h,3Fh,40h,7Fh,80h,FFh,01h,FFh
	DB	08h,0Fh,08h,0Fh,08h,0Fh,88h,8Fh,88h,8Fh,88h,8Fh,88h,8Fh,08h,0Fh
	DB	C2h,FEh,A4h,BCh,98h,98h,80h,80h,80h,80h,80h,80h,7Fh,FFh,00h,FFh
	DB	42h,7Eh,42h,7Eh,42h,7Eh,42h,7Eh,42h,7Eh,82h,FEh,02h,FEh,02h,FEh
	DB	30h,3Fh,20h,3Fh,20h,3Fh,3Fh,3Fh,00h,00h,00h,00h,00h,00h,00h,00h
	DB	C0h,C0h,40h,C0h,40h,C0h,C0h,C0h,00h,00h,00h,00h,00h,00h,00h,00h
	DB	18h,1Fh,10h,1Fh,10h,1Fh,1Fh,1Fh,00h,00h,00h,00h,00h,00h,00h,00h
	DB	3Ch,FFh,18h,FFh,18h,FFh,FFh,FFh,00h,00h,00h,00h,00h,00h,00h,00h
	DB	18h,F8h,08h,F8h,08h,F8h,F8h,F8h,00h,00h,00h,00h,00h,00h,00h,00h
	DB	41h,7Fh,40h,7Fh,40h,7Fh,20h,3Fh,10h,1Fh,0Fh,0Fh,00h,00h,00h,00h
	DB	30h,3Fh,A0h,BFh,A0h,BFh,7Fh,FFh,20h,E0h,E0h,E0h,00h,00h,00h,00h
	DB	00h,FFh,00h,FFh,00h,FFh,FFh,FFh,00h,00h,00h,00h,00h,00h,00h,00h
	DB	2Ch,EFh,28h,EFh,28h,EFh,EFh,EFh,00h,00h,00h,00h,00h,00h,00h,00h
	DB	01h,FFh,02h,FEh,0Ch,FCh,F0h,F0h,00h,00h,00h,00h,00h,00h,00h,00h
	DB	04h,FCh,04h,FCh,18h,F8h,E0h,E0h,00h,00h,00h,00h,00h,00h,00h,00h
	DB	00h,1Ch,00h,36h,00h,63h,00h,63h,00h,7Fh,00h,63h,00h,63h,00h,00h
	DB	00h,7Eh,00h,63h,00h,63h,00h,7Eh,00h,63h,00h,63h,00h,7Eh,00h,00h
	DB	00h,3Eh,00h,63h,00h,60h,00h,60h,00h,60h,00h,63h,00h,3Eh,00h,00h
	DB	00h,7Ch,00h,66h,00h,63h,00h,63h,00h,63h,00h,66h,00h,7Ch,00h,00h
	DB	00h,7Fh,00h,60h,00h,60h,00h,7Eh,00h,60h,00h,60h,00h,7Fh,00h,00h
	DB	00h,7Fh,00h,60h,00h,60h,00h,7Eh,00h,60h,00h,60h,00h,60h,00h,00h
	DB	00h,3Eh,00h,63h,00h,60h,00h,67h,00h,63h,00h,63h,00h,3Fh,00h,00h
	DB	00h,63h,00h,63h,00h,63h,00h,7Fh,00h,63h,00h,63h,00h,63h,00h,00h
	DB	00h,3Ch,00h,18h,00h,18h,00h,18h,00h,18h,00h,18h,00h,3Ch,00h,00h
	DB	00h,1Fh,00h,06h,00h,06h,00h,06h,00h,06h,00h,66h,00h,3Ch,00h,00h
	DB	00h,63h,00h,66h,00h,6Ch,00h,78h,00h,7Ch,00h,6Eh,00h,67h,00h,00h
	DB	00h,60h,00h,60h,00h,60h,00h,60h,00h,60h,00h,60h,00h,7Fh,00h,00h
	DB	00h,63h,00h,77h,00h,7Fh,00h,7Fh,00h,6Bh,00h,63h,00h,63h,00h,00h
	DB	00h,63h,00h,73h,00h,7Bh,00h,7Fh,00h,6Fh,00h,67h,00h,63h,00h,00h
	DB	00h,3Eh,00h,63h,00h,63h,00h,63h,00h,63h,00h,63h,00h,3Eh,00h,00h
	DB	00h,7Eh,00h,63h,00h,63h,00h,63h,00h,7Eh,00h,60h,00h,60h,00h,00h
	DB	00h,3Eh,00h,63h,00h,63h,00h,63h,00h,6Fh,00h,66h,00h,3Dh,00h,00h
	DB	00h,7Eh,00h,63h,00h,63h,00h,62h,00h,7Ch,00h,66h,00h,63h,00h,00h
	DB	00h,3Eh,00h,63h,00h,60h,00h,3Eh,00h,03h,00h,63h,00h,3Eh,00h,00h
	DB	00h,7Eh,00h,18h,00h,18h,00h,18h,00h,18h,00h,18h,00h,18h,00h,00h
	DB	00h,63h,00h,63h,00h,63h,00h,63h,00h,63h,00h,63h,00h,3Eh,00h,00h
	DB	00h,63h,00h,63h,00h,63h,00h,63h,00h,36h,00h,1Ch,00h,08h,00h,00h
	DB	00h,63h,00h,63h,00h,6Bh,00h,6Bh,00h,7Fh,00h,77h,00h,22h,00h,00h
	DB	00h,63h,00h,76h,00h,3Ch,00h,1Ch,00h,1Eh,00h,37h,00h,63h,00h,00h
	DB	00h,66h,00h,66h,00h,7Eh,00h,3Ch,00h,18h,00h,18h,00h,18h,00h,00h
	DB	00h,7Fh,00h,07h,00h,0Eh,00h,1Ch,00h,38h,00h,70h,00h,7Fh,00h,00h

; Reserve tile 46h: the original logo data contains 69 tiles, not 70.
	DS	0010h,00h

; Tiles 47h..50h complete the original English translation's FIN lettering.
; F/I reuse the existing logo tiles; these masks preserve the original FIN pixels.
ENDING_FIN_EXTRA_TILES_2BPP:
	DB	00h,00h,00h,00h,00h,00h,00h,E7h,00h,E7h,00h,C3h,00h,C1h,00h,C1h
	DB	00h,00h,00h,00h,00h,00h,00h,C0h,00h,E0h,00h,F0h,00h,F0h,00h,F8h
	DB	00h,00h,00h,00h,00h,00h,00h,7Eh,00h,7Eh,00h,3Ch,00h,3Ch,00h,3Ch
	DB	00h,C1h,00h,C1h,00h,C1h,00h,C1h,00h,C1h,00h,C1h,00h,C1h,00h,C1h
	DB	00h,FCh,00h,FCh,00h,FEh,00h,FFh,00h,FFh,00h,FFh,00h,EFh,00h,E7h
	DB	00h,3Ch,00h,3Ch,00h,3Ch,00h,3Ch,00h,3Ch,00h,BCh,00h,FCh,00h,FCh
	DB	00h,E7h,00h,E3h,00h,E1h,00h,E1h,00h,E0h,00h,E0h,00h,E0h,00h,E0h
	DB	00h,FCh,00h,FCh,00h,FCh,00h,FCh,00h,FCh,00h,7Ch,00h,7Ch,00h,3Ch
	DB	00h,C1h,00h,E3h,00h,E3h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
	DB	00h,3Ch,00h,3Eh,00h,3Eh,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h

; 18x4 tilemap (72B) for English FIREBIRD logo box
FIREBIRD_LOGO_TILEMAP_18X4:
	DB	01h,02h,03h,04h,05h,06h,01h,02h,07h,05h,06h,08h,04h,05h,06h,01h,09h,0Ah
	DB	0Bh,0Ch,0Dh,0Eh,0Fh,10h,0Bh,0Ch,11h,12h,13h,14h,0Eh,0Fh,10h,0Bh,15h,16h
	DB	0Bh,17h,14h,0Eh,18h,19h,0Bh,1Ah,1Bh,1Ch,1Dh,1Eh,0Eh,18h,19h,0Bh,1Fh,20h
	DB	21h,22h,23h,24h,25h,26h,27h,28h,29h,28h,2Ah,23h,24h,25h,26h,27h,28h,2Bh

; English title/ending subtitle: 16 tile indices spelling "THE PHOENIX SAGA".
PHOENIX_SAGA_SUBTITLE_TILEMAP_16X1:
	DB	3Fh,33h,30h,00h,3Bh,33h,3Ah,30h,39h,34h,43h,00h,3Eh,2Ch,32h,2Ch

; Complete 48x32 FIN from the original English ending, centered at X=68h.
ENDING_FIN_TILEMAP_6X4:
	DB	01h,02h,03h,47h,48h,49h
	DB	0Bh,0Ch,0Dh,4Ah,4Bh,4Ch
	DB	0Bh,17h,0Dh,4Ah,4Dh,4Eh
	DB	21h,22h,23h,4Fh,25h,50h

	DS	7D4Bh - $,FFh
	DS	7D4Bh - $,FFh
%else

; Title screen Firebird Phase 1 (6443h) 182-tile 1bpp tileset (6368h-6917h, 40h + 40h + 36h
; = B6h tiles x 8B = 1456B -> VRAM 8000h tiles 01h..B6h, colors 0/C).
TITLE_FIREBIRD_PHASE1_TILES_1BPP:
	DB	00h,00h,02h,0Ch,19h,13h,36h,2Fh
	DB	00h,00h,30h,47h,9Eh,78h,E0h,80h
	DB	00h,00h,FCh,80h,00h,00h,00h,07h
	DB	00h,00h,00h,00h,00h,00h,F8h,FEh
	DB	00h,00h,10h,10h,10h,31h,61h,E3h
	DB	6Fh,7Eh,7Ch,FCh,F8h,F8h,F1h,F3h
	DB	00h,04h,03h,00h,3Ch,FFh,C3h,01h
	DB	1Fh,7Ch,C0h,00h,00h,00h,81h,81h
	DB	FFh,3Fh,1Fh,3Fh,7Dh,F0h,C0h,80h
	DB	C3h,83h,C7h,C7h,E7h,77h,36h,16h
	DB	73h,76h,7Ch,7Ch,7Ch,38h,39h,39h
	DB	01h,0Fh,3Fh,67h,C3h,87h,8Fh,0Ch
	DB	C3h,C3h,C6h,C6h,86h,87h,0Fh,0Fh
	DB	00h,1Ch,7Fh,F7h,C1h,80h,80h,F0h
	DB	1Eh,0Eh,0Eh,8Eh,84h,C4h,44h,40h
	DB	00h,00h,01h,07h,0Eh,0Eh,1Ch,1Ch
	DB	06h,01h,E0h,18h,04h,06h,02h,03h
	DB	39h,1Dh,9Dh,9Fh,4Fh,4Fh,67h,23h
	DB	0Ch,18h,18h,18h,18h,9Ch,8Eh,CFh
	DB	0Fh,0Fh,0Fh,1Eh,1Eh,1Eh,3Ah,F3h
	DB	F0h,1Ch,0Ch,0Ch,0Ch,98h,70h,00h
	DB	60h,24h,24h,64h,6Dh,6Dh,FDh,FBh
	DB	1Ch,0Ch,0Eh,0Eh,06h,07h,07h,07h
	DB	31h,7Dh,C7h,81h,80h,BCh,FFh,C7h
	DB	38h,9Fh,8Fh,C1h,78h,0Eh,03h,81h
	DB	E3h,71h,B8h,F8h,3Ch,1Eh,8Eh,8Eh
	DB	E3h,F1h,F1h,F0h,70h,78h,58h,58h
	DB	01h,C7h,FFh,7Ch,00h,00h,07h,0Fh
	DB	00h,00h,00h,03h,1Eh,70h,00h,00h
	DB	00h,00h,00h,F8h,1Fh,03h,00h,00h
	DB	00h,00h,00h,00h,00h,C0h,F0h,38h
	DB	07h,07h,0Fh,0Fh,0Eh,1Dh,1Fh,38h
	DB	83h,81h,01h,01h,03h,FFh,FFh,E0h
	DB	C1h,C1h,C1h,C1h,C3h,83h,07h,0Fh
	DB	CEh,CEh,DCh,BDh,FBh,F7h,FFh,DFh
	DB	00h,00h,07h,1Fh,18h,30h,20h,00h
	DB	18h,0Eh,87h,F3h,7Ch,1Fh,07h,00h
	DB	00h,00h,80h,E1h,FFh,1Fh,FFh,FFh
	DB	1Fh,7Ch,F1h,01h,83h,E3h,F3h,39h
	DB	3Fh,E1h,C0h,8Ch,86h,86h,86h,CCh
	DB	06h,18h,30h,60h,60h,60h,60h,70h
	DB	00h,00h,00h,00h,00h,03h,0Fh,1Ch
	DB	00h,00h,07h,3Fh,FCh,E0h,01h,06h
	DB	07h,7Fh,FFh,C1h,00h,3Fh,E3h,00h
	DB	38h,3Fh,0Fh,00h,00h,00h,00h,00h
	DB	70h,E0h,80h,00h,00h,00h,00h,00h
	DB	0Fh,3Fh,C1h,00h,00h,00h,00h,00h
	DB	FFh,FFh,FFh,F7h,7Bh,39h,3Ch,1Ch
	DB	F0h,7Ch,1Fh,87h,C0h,E0h,F8h,7Eh
	DB	7Fh,07h,FFh,FFh,7Ch,00h,00h,00h
	DB	1Fh,07h,00h,00h,00h,00h,00h,00h
	DB	C0h,F8h,FFh,3Fh,0Fh,03h,41h,80h
	DB	07h,1Fh,FFh,FFh,F3h,F6h,E6h,C6h
	DB	03h,03h,03h,01h,01h,00h,00h,00h
	DB	01h,81h,81h,81h,C0h,E0h,70h,38h
	DB	00h,00h,01h,81h,C3h,FFh,3Eh,00h
	DB	C6h,C6h,C6h,C7h,C3h,C3h,63h,61h
	DB	6Fh,73h,30h,1Ch,8Fh,81h,C0h,E0h
	DB	01h,E0h,FFh,0Fh,03h,FBh,1Fh,00h
	DB	0Eh,03h,00h,00h,00h,00h,00h,00h
	DB	00h,F0h,00h,00h,00h,00h,00h,00h
	DB	70h,30h,18h,1Fh,0Fh,01h,00h,00h
	DB	F8h,3Eh,0Fh,1Fh,FFh,FCh,00h,00h
	DB	01h,0Fh,FFh,FFh,E0h,00h,00h,00h
	DB	00h,00h,00h,01h,03h,06h,0Ch,31h
	DB	1Fh,7Fh,E0h,80h,00h,1Ch,7Fh,FFh
	DB	80h,E0h,F8h,38h,1Ch,1Ch,0Ch,0Eh
	DB	00h,00h,00h,00h,03h,07h,0Eh,1Ch
	DB	00h,00h,1Fh,FFh,F0h,87h,1Fh,3Ch
	DB	00h,00h,80h,F0h,FEh,FFh,03h,00h
	DB	00h,00h,00h,00h,00h,80h,F0h,3Fh
	DB	00h,00h,00h,01h,07h,0Fh,1Ch,38h
	DB	00h,07h,7Fh,F0h,C0h,00h,01h,07h
	DB	00h,C0h,FCh,3Eh,07h,3Fh,FFh,81h
	DB	00h,00h,00h,00h,00h,C0h,F0h,FEh
	DB	03h,06h,0Ch,18h,E0h,00h,00h,3Fh
	DB	8Fh,07h,07h,0Fh,0Fh,1Bh,F7h,CFh
	DB	8Eh,8Eh,8Ch,9Ch,98h,90h,21h,23h
	DB	38h,38h,71h,73h,E3h,E7h,CFh,DCh
	DB	71h,F7h,ECh,F0h,C0h,87h,3Fh,F8h
	DB	F8h,FEh,0Fh,01h,00h,C0h,FCh,7Fh
	DB	03h,00h,80h,E0h,78h,1Fh,07h,80h
	DB	F0h,0Eh,00h,00h,00h,00h,F0h,FFh
	DB	00h,00h,00h,00h,00h,00h,00h,C1h
	DB	00h,00h,01h,01h,03h,0Fh,3Fh,FEh
	DB	70h,E0h,E0h,C0h,C0h,80h,87h,1Fh
	DB	0Eh,0Ch,0Ch,06h,00h,7Fh,FFh,FFh
	DB	00h,00h,00h,00h,00h,00h,F8h,FFh
	DB	1Fh,01h,00h,00h,00h,00h,00h,C3h
	DB	F0h,FFh,1Fh,07h,03h,07h,1Eh,F8h
	DB	07h,1Fh,78h,E0h,C7h,CEh,9Ch,98h
	DB	F8h,00h,07h,FCh,C1h,1Fh,7Fh,FCh
	DB	17h,6Eh,9Ch,39h,F2h,C6h,0Dh,3Fh
	DB	B7h,FFh,FCh,F9h,F7h,FFh,F3h,CEh
	DB	C0h,00h,00h,E0h,FCh,FFh,C3h,00h
	DB	07h,01h,00h,00h,00h,80h,E0h,78h
	DB	F0h,FCh,7Fh,1Fh,07h,00h,00h,00h
	DB	0Fh,00h,80h,F0h,FFh,FFh,1Fh,00h
	DB	FFh,7Fh,01h,1Fh,FFh,FCh,E0h,02h
	DB	FCh,F9h,E6h,CCh,10h,20h,60h,40h
	DB	7Eh,E0h,00h,00h,00h,00h,0Fh,3Fh
	DB	00h,00h,00h,00h,00h,FFh,FFh,C0h
	DB	3Fh,03h,00h,03h,7Fh,FEh,E0h,00h
	DB	FFh,FFh,FEh,F0h,C0h,00h,03h,0Fh
	DB	E1h,83h,07h,0Eh,38h,F0h,C0h,00h
	DB	19h,39h,3Bh,33h,33h,33h,37h,7Fh
	DB	F0h,E3h,C7h,CFh,8Fh,9Fh,9Fh,8Fh
	DB	98h,30h,60h,C1h,87h,8Fh,1Ch,38h
	DB	1Eh,C7h,FCh,3Eh,07h,3Fh,FFh,81h
	DB	00h,E0h,FEh,3Fh,03h,C0h,F0h,FEh
	DB	00h,00h,0Fh,FFh,FCh,00h,00h,00h
	DB	0Ch,78h,E1h,83h,06h,0Eh,1Dh,3Fh
	DB	81h,87h,1Fh,3Eh,7Ch,F8h,E0h,C0h
	DB	FCh,E0h,80h,00h,00h,01h,0Fh,7Fh
	DB	00h,00h,00h,00h,1Fh,FFh,F8h,00h
	DB	00h,01h,0Fh,FFh,F0h,00h,00h,00h
	DB	3Ch,E0h,80h,E0h,70h,38h,38h,38h
	DB	01h,01h,01h,03h,03h,03h,07h,07h
	DB	7Fh,7Fh,77h,77h,67h,67h,67h,6Fh
	DB	FFh,FFh,FEh,F8h,E7h,FFh,FFh,FFh
	DB	81h,0Fh,3Fh,FFh,FFh,FFh,F0h,80h
	DB	F8h,E0h,FFh,FFh,FFh,07h,00h,00h
	DB	00h,00h,80h,F0h,FFh,FFh,0Fh,00h
	DB	00h,00h,00h,01h,0Fh,FEh,F0h,00h
	DB	70h,60h,E0h,C0h,80h,00h,00h,00h
	DB	06h,0Eh,0Eh,1Ch,18h,39h,73h,E7h
	DB	7Eh,1Dh,3Fh,FCh,F8h,F0h,E0h,C0h
	DB	F8h,E0h,80h,00h,00h,00h,00h,00h
	DB	0Fh,3Fh,30h,60h,40h,40h,00h,00h
	DB	C0h,FCh,7Fh,07h,01h,00h,00h,00h
	DB	00h,00h,00h,F0h,FFh,3Fh,03h,00h
	DB	00h,00h,00h,00h,87h,FFh,FFh,1Fh
	DB	01h,07h,1Fh,FCh,F1h,8Fh,FFh,F0h
	DB	C7h,8Fh,3Fh,7Ch,F8h,E0h,80h,00h
	DB	FEh,F8h,F0h,E0h,81h,03h,0Fh,1Fh
	DB	00h,00h,00h,1Fh,FFh,FFh,F8h,C0h
	DB	00h,00h,FFh,FFh,FFh,00h,00h,00h
	DB	00h,01h,0Eh,3Ch,F0h,C1h,01h,03h
	DB	80h,00h,00h,62h,19h,CCh,EEh,E6h
	DB	F0h,C7h,FFh,FFh,FFh,FEh,FCh,F8h
	DB	FEh,F8h,E0h,C0h,81h,07h,1Fh,7Eh
	DB	00h,00h,0Fh,7Fh,F8h,E0h,80h,07h
	DB	00h,7Ch,FFh,81h,00h,00h,7Fh,FFh
	DB	00h,00h,F0h,FFh,1Fh,07h,80h,F0h
	DB	03h,07h,1Fh,FEh,FCh,E0h,01h,0Fh
	DB	19h,3Bh,37h,37h,7Fh,7Fh,FFh,FFh
	DB	7Fh,E0h,80h,00h,00h,00h,00h,00h
	DB	1Fh,03h,00h,00h,01h,0Fh,3Fh,7Ch
	DB	80h,FEh,7Fh,03h,F0h,FEh,8Fh,01h
	DB	00h,00h,F0h,FFh,3Fh,03h,80h,F0h
	DB	F0h,E1h,CFh,BFh,FFh,FFh,FEh,FFh
	DB	00h,FCh,FFh,FFh,E1h,80h,7Ch,FFh
	DB	3Fh,03h,80h,F0h,FFh,3Fh,07h,00h
	DB	01h,E0h,F8h,3Eh,0Fh,C3h,F0h,F8h
	DB	FFh,FFh,F8h,C0h,0Fh,FFh,FFh,FEh
	DB	E0h,00h,01h,1Fh,FFh,FFh,FFh,3Fh
	DB	86h,E1h,F8h,3Eh,0Fh,03h,41h,80h
	DB	FCh,FEh,FFh,FFh,FFh,7Fh,1Fh,07h
	DB	1Fh,0Fh,07h,07h,83h,C1h,E0h,E0h
	DB	FFh,DFh,E7h,F0h,F8h,FCh,FFh,7Fh
	DB	E0h,E0h,C0h,C0h,80h,00h,00h,00h
	DB	01h,00h,00h,00h,00h,00h,00h,00h
	DB	F0h,F8h,7Ch,3Ch,0Eh,07h,03h,00h
	DB	1Fh,07h,01h,00h,00h,80h,E0h,FCh
	DB	F0h,FFh,FFh,1Fh,00h,00h,00h,00h
	DB	00h,00h,F0h,FFh,3Fh,00h,00h,00h
	DB	00h,00h,00h,80h,F8h,00h,00h,00h
	DB	3Fh,00h,00h,00h,00h,00h,00h,1Fh
	DB	FFh,7Fh,03h,00h,00h,00h,7Eh,FFh
	DB	1Fh,7Fh,FFh,FFh,1Fh,7Ch,E0h,03h
	DB	7Fh,1Fh,03h,00h,00h,00h,00h,00h
	DB	C0h,FCh,FFh,3Fh,03h,00h,00h,00h
	DB	00h,03h,FFh,FFh,FCh,00h,00h,00h
	DB	1Fh,FFh,FEh,E0h,00h,00h,00h,00h
	DB	FFh,E0h,00h,00h,00h,00h,00h,00h
	DB	83h,00h,00h,00h,00h,00h,00h,00h
	DB	FFh,1Fh,03h,00h,00h,00h,00h,00h
	DB	00h,00h,F0h,FFh,FFh,0Fh,00h,00h
	DB	00h,00h,07h,FFh,FFh,FCh,00h,00h
	DB	1Fh,FFh,FFh,F8h,C0h,00h,00h,00h
	DB	FCh,DEh,CFh,E7h,F1h,F0h,F8h,FCh
	DB	C0h,F8h,FFh,FFh,FFh,FFh,FFh,FFh

; 72 zero bytes (6918h-695Fh = 9 x 8B all-zero 1bpp tile slots B7h..BFh) rounding the Title
; Firebird Phase 1 1bpp tileset allocation (6368h-695Fh, 191 slots for 01h..BFh) up to
; 6960h.
TITLE_FIREBIRD_PHASE1_UNUSED_TILE_SLOTS_ZERO:
	DS	0048h,00h

; Title screen Firebird Phase 2 (6458h) 113-tile 2bpp tileset (6960h-706Fh, 40h + 31h = 71h
; tiles x 16B = 1808B -> VRAM 8000h tiles 01h..71h, colors 0/7/C/F).
TITLE_FIREBIRD_PHASE2_TILES_2BPP:
	DB	00h,FFh,01h,DFh,03h,9Fh,03h,3Fh,07h,3Fh,07h,3Fh,0Fh,7Ch,1Bh,7Bh
	DB	00h,4Ch,00h,CFh,00h,C7h,00h,83h,00h,80h,00h,01h,00h,87h,07h,FFh
	DB	00h,3Fh,02h,FFh,06h,FFh,0Ch,BDh,1Ch,79h,3Ch,F0h,FAh,E2h,C6h,84h
	DB	1Bh,FBh,17h,F6h,30h,F0h,37h,F7h,2Fh,EFh,6Fh,EEh,68h,E0h,6Fh,EFh
	DB	00h,30h,00h,6Fh,0Fh,FFh,1Fh,F8h,1Eh,FEh,1Fh,F1h,3Fh,E1h,F3h,E3h
	DB	00h,30h,00h,BCh,80h,DFh,C0h,FFh,C0h,7Fh,C0h,7Fh,80h,F8h,C0h,FEh
	DB	1Fh,FEh,3Fh,F8h,3Fh,F8h,38h,78h,1Fh,7Fh,1Fh,7Eh,0Ch,7Ch,0Fh,7Fh
	DB	DDh,18h,BAh,02h,06h,04h,EDh,C9h,DDh,19h,2Bh,23h,E7h,C7h,EEh,8Eh
	DB	5Fh,5Fh,DFh,DFh,DCh,C0h,BFh,BFh,BFh,BFh,7Eh,00h,7Fh,7Fh,FFh,FCh
	DB	01h,00h,00h,E0h,00h,FEh,00h,FFh,00h,3Fh,00h,8Fh,00h,F6h,00h,FFh
	DB	F0h,7Fh,FEh,1Fh,1Fh,03h,03h,E0h,00h,FCh,00h,FFh,00h,1Fh,00h,C7h
	DB	00h,CEh,00h,FFh,F0h,FFh,FFh,1Fh,3Fh,03h,0Fh,80h,01h,F0h,00h,FEh
	DB	00h,FCh,00h,FBh,00h,FFh,07h,FFh,FDh,F9h,F3h,03h,8Fh,00h,39h,00h
	DB	1Fh,FFh,3Fh,FCh,FFh,F9h,FFh,FFh,DFh,9Fh,BFh,3Ch,7Ch,70h,FFh,FFh
	DB	9Dh,1Ch,7Bh,73h,F7h,E7h,EFh,C8h,DFh,1Fh,3Fh,3Fh,FFh,C7h,FFh,F0h
	DB	FCh,00h,FFh,FCh,FBh,C3h,FFh,07h,FFh,F0h,FFh,E3h,FFh,07h,FFh,3Fh
	DB	03h,C3h,01h,F8h,00h,FCh,00h,FFh,00h,3Fh,00h,0Fh,00h,07h,00h,07h
	DB	FFh,FFh,FFh,FFh,7Fh,1Fh,1Fh,0Fh,0Fh,C7h,07h,E3h,03h,F1h,01h,F8h
	DB	FFh,3Fh,3Eh,0Eh,0Fh,83h,03h,F0h,01h,FCh,00h,3Eh,00h,0Fh,00h,07h
	DB	FFh,FDh,7Fh,1Eh,9Fh,8Fh,CFh,C7h,E7h,E3h,F3h,71h,79h,38h,3Ch,9Ch
	DB	1Eh,C6h,07h,63h,03h,19h,01h,FCh,00h,FEh,00h,FFh,00h,CFh,00h,3Fh
	DB	00h,47h,00h,0Eh,00h,9Dh,00h,39h,08h,7Bh,18h,F3h,30h,E7h,70h,C7h
	DB	00h,FFh,01h,FFh,03h,FEh,07h,FCh,0Eh,F8h,19h,F9h,37h,F7h,7Fh,F8h
	DB	E0h,8Bh,C8h,1Bh,98h,33h,30h,66h,70h,C6h,E0h,8Fh,C0h,1Bh,88h,3Ah
	DB	00h,CFh,01h,FFh,03h,FFh,07h,FFh,0Fh,FFh,1Fh,FCh,3Ch,F0h,7Fh,FEh
	DB	FEh,E0h,E0h,81h,FDh,F1h,FBh,E0h,F7h,80h,E0h,00h,1Fh,1Fh,BFh,30h
	DB	10h,76h,70h,E4h,E0h,8Dh,80h,1Fh,00h,7Fh,60h,E7h,C0h,8Fh,00h,1Fh
	DB	00h,CFh,01h,DFh,03h,DFh,07h,BFh,0Fh,BFh,1Fh,FEh,3Eh,F8h,7Fh,FFh
	DB	FFh,F0h,FCh,C0h,C1h,01h,FEh,F8h,F8h,C0h,E7h,07h,1Fh,1Eh,EFh,88h
	DB	70h,60h,07h,04h,FEh,F8h,F8h,80h,00h,03h,F0h,C3h,E0h,07h,00h,0Fh
	DB	FFh,F8h,FEh,E0h,E0h,80h,FFh,F8h,FEh,E0h,F0h,00h,01h,01h,FCh,E0h
	DB	C0h,00h,1Fh,1Eh,FFh,F0h,78h,60h,03h,00h,FEh,F8h,FCh,C1h,00h,01h
	DB	00h,3Fh,80h,3Fh,00h,3Fh,00h,7Fh,00h,7Eh,00h,FCh,00h,FBh,00h,FFh
	DB	F8h,80h,E0h,00h,04h,00h,FCh,F0h,F9h,81h,E0h,00h,01h,01h,FBh,E3h
	DB	78h,41h,E0h,83h,00h,03h,F8h,C3h,E0h,83h,08h,03h,F0h,C7h,C0h,07h
	DB	F0h,C0h,C7h,07h,0Fh,0Fh,E0h,C0h,DFh,0Fh,3Fh,3Ch,E0h,80h,7Eh,7Ch
	DB	10h,07h,E0h,CFh,00h,0Fh,60h,0Fh,C0h,1Fh,00h,1Fh,00h,3Eh,00h,7Ch
	DB	FCh,E0h,C2h,01h,FCh,E3h,F0h,C3h,00h,07h,F8h,87h,F0h,8Fh,C0h,3Fh
	DB	3Ch,FFh,FFh,C3h,F1h,9Ch,FCh,7Eh,FEh,83h,E7h,63h,FBh,F9h,3Dh,1Ch
	DB	00h,E1h,00h,8Fh,80h,FFh,80h,7Fh,78h,3Fh,FFh,FFh,9Fh,83h,81h,E0h
	DB	00h,FCh,00h,F3h,00h,FFh,03h,FCh,33h,C2h,F8h,E3h,E0h,FFh,FCh,3Bh
	DB	00h,FFh,03h,FCh,33h,C2h,38h,23h,80h,3Fh,00h,FFh,00h,FFh,77h,86h
	DB	00h,FFh,18h,21h,BDh,31h,00h,FFh,00h,FFh,00h,FFh,00h,FFh,80h,3Fh
	DB	00h,FFh,00h,FFh,C0h,9Fh,9Ch,19h,09h,F1h,00h,FFh,00h,FFh,00h,FFh
	DB	00h,FFh,00h,FFh,00h,FFh,00h,FFh,C0h,9Fh,99h,13h,13h,E3h,0Fh,FEh
	DB	01h,FFh,07h,FEh,0Ch,F8h,38h,F3h,60h,C7h,C0h,9Fh,80h,3Fh,00h,7Fh
	DB	00h,17h,00h,6Eh,00h,9Ch,00h,38h,00h,F1h,00h,C7h,00h,1Fh,01h,FFh
	DB	00h,47h,00h,0Fh,00h,1Fh,00h,7Fh,00h,FFh,03h,FFh,30h,F0h,80h,8Fh
	DB	00h,B7h,00h,FEh,00h,F8h,00h,F0h,00h,FFh,80h,FFh,30h,3Fh,0Ch,CFh
	DB	00h,FFh,00h,FFh,00h,FFh,03h,FFh,06h,FCh,1Ch,F9h,30h,E3h,E0h,CFh
	DB	0Ch,FCh,30h,F3h,C0h,CFh,80h,3Fh,00h,7Ch,00h,F8h,00h,F0h,00h,C0h
	DB	06h,F3h,03h,F9h,03h,39h,01h,1Ch,01h,1Ch,00h,0Eh,00h,0Eh,00h,0Eh
	DB	00h,F7h,00h,F7h,00h,F7h,80h,FFh,80h,FFh,C0h,7Fh,C0h,7Eh,C0h,7Eh
	DB	80h,1Fh,00h,7Fh,00h,FEh,00h,F8h,00h,F0h,00h,E1h,00h,87h,00h,3Fh
	DB	00h,80h,00h,00h,00h,00h,00h,07h,00h,3Fh,00h,FFh,01h,FEh,09h,F1h
	DB	00h,00h,00h,0Fh,00h,FFh,00h,FFh,04h,F8h,26h,C4h,30h,27h,80h,3Eh
	DB	00h,0Eh,01h,1Ch,01h,FCh,03h,F9h,76h,93h,EFh,E6h,1Ah,9Ch,60h,7Fh
	DB	C0h,7Ch,80h,FDh,80h,FBh,00h,F7h,00h,FFh,00h,7Fh,60h,4Fh,4Eh,89h
	DB	DEh,CEh,EEh,66h,76h,33h,BBh,9Bh,BBh,99h,DBh,CDh,ECh,EDh,EBh,6Bh
	DB	E0h,7Eh,DFh,5Fh,47h,67h,7Ch,7Ch,E3h,E2h,00h,1Fh,00h,FFh,00h,FFh
	DB	3Fh,0Ch,CEh,C6h,B7h,83h,03h,79h,C1h,DCh,10h,16h,04h,E5h,01h,F9h
	DB	63h,44h,00h,7Fh,C0h,9Fh,18h,93h,93h,E3h,C1h,7Eh,40h,3Fh,A0h,BFh
	DB	38h,23h,33h,C2h,02h,FCh,00h,FFh,80h,3Fh,38h,33h,13h,E3h,07h,FFh
	DB	00h,FFh,00h,7Fh,61h,4Fh,4Fh,8Bh,0Fh,FEh,7Ch,F8h,F0h,E3h,80h,0Fh
	DB	1Ch,F8h,78h,F3h,E0h,C7h,C0h,9Fh,00h,3Fh,F0h,87h,26h,C4h,1Ch,F8h
	DB	C0h,9Fh,80h,1Fh,30h,E7h,30h,C7h,0Dh,F9h,79h,B1h,F2h,DEh,C0h,BFh
	DB	00h,FFh,02h,FCh,13h,E2h,98h,93h,E0h,FFh,80h,7Fh,00h,7Eh,C1h,9Ch
	DB	4Ch,89h,60h,4Fh,00h,7Eh,01h,F1h,0Eh,CFh,30h,3Fh,40h,7Fh,80h,FFh
	DB	01h,F9h,06h,C7h,30h,3Fh,80h,FFh,00h,FFh,00h,FFh,00h,FFh,00h,FFh
	DB	0Ch,F1h,03h,FFh,01h,FEh,00h,FFh,00h,FFh,00h,FFh,00h,FFh,3Fh,FFh
	DB	00h,FFh,80h,3Fh,00h,3Fh,70h,E7h,20h,C7h,0Eh,FCh,04h,F8h,00h,FFh
	DB	00h,FFh,00h,FFh,00h,FFh,00h,FFh,00h,FFh,00h,FFh,C0h,9Fh,98h,13h
	DB	78h,3Ch,30h,9Fh,98h,CFh,CCh,E7h,CCh,67h,24h,37h,12h,DBh,09h,EDh
	DB	C0h,FFh,3Ch,3Fh,03h,C3h,00h,FCh,00h,FFh,00h,FFh,00h,FFh,00h,FFh
	DB	00h,FEh,00h,FFh,F0h,FFh,1Fh,1Fh,00h,C0h,00h,FFh,00h,E0h,00h,F8h
	DB	50h,5Fh,2Fh,AFh,1Fh,D7h,F7h,F3h,02h,1Bh,01h,FDh,00h,7Eh,00h,07h
	DB	3Eh,FCh,F0h,E1h,C0h,8Fh,00h,3Fh,F0h,E7h,26h,C4h,84h,F8h,40h,7Fh
	DB	3Bh,33h,11h,E2h,00h,FFh,00h,FFh,00h,FFh,00h,FFh,E4h,CCh,4Eh,88h
	DB	B0h,23h,00h,3Fh,00h,FFh,00h,FFh,00h,FFh,4Ch,CCh,E6h,88h,00h,FFh
	DB	C0h,1Fh,80h,1Fh,38h,F3h,10h,E3h,07h,FEh,02h,FCh,E0h,CFh,48h,8Fh
	DB	9Bh,19h,16h,F2h,0Dh,E5h,0Ch,E7h,18h,4Fh,18h,4Fh,98h,8Fh,38h,93h
	DB	C0h,C0h,00h,3Fh,00h,FFh,00h,FFh,00h,FFh,00h,FFh,00h,FFh,00h,FFh
	DB	F0h,FFh,0Ch,0Fh,03h,F0h,00h,FFh,00h,FFh,00h,FFh,08h,F1h,4Ch,89h
	DB	13h,E2h,02h,FCh,00h,FFh,C0h,3Fh,20h,DFh,00h,FFh,00h,FFh,00h,FFh
	DB	00h,7Fh,60h,4Fh,40h,8Fh,00h,FFh,00h,FFh,00h,FEh,00h,FCh,00h,F0h
	DB	04h,F6h,01h,F9h,00h,FCh,00h,FFh,00h,FFh,00h,FFh,00h,FFh,00h,7Ch
	DB	80h,FFh,40h,7Fh,A0h,BFh,50h,5Fh,0Fh,EFh,04h,F4h,02h,FBh,01h,7Dh
	DB	00h,FFh,00h,FFh,00h,E3h,00h,FCh,00h,FFh,E0h,1Fh,00h,FFh,00h,FFh
	DB	30h,BFh,08h,4Fh,02h,33h,00h,0Ch,00h,C7h,00h,F3h,00h,FCh,00h,3Fh
	DB	00h,FFh,00h,FFh,00h,FFh,80h,FFh,20h,3Fh,0Eh,CFh,01h,F1h,00h,7Eh
	DB	00h,FFh,00h,FFh,00h,FFh,00h,FFh,00h,FFh,00h,FFh,E0h,FFh,1Eh,1Fh
	DB	0Eh,FCh,04h,F8h,01h,FFh,00h,FFh,00h,FFh,00h,FFh,00h,FFh,00h,FFh
	DB	30h,93h,37h,9Eh,B2h,9Ch,B0h,9Fh,18h,8Fh,18h,CFh,0Ch,C7h,07h,E3h
	DB	00h,FFh,02h,FCh,13h,E2h,F8h,93h,60h,7Fh,11h,E2h,9Bh,13h,E0h,9Fh
	DB	60h,CFh,40h,7Fh,00h,7Fh,00h,FFh,00h,F8h,00h,3Fh,80h,3Fh,00h,FFh
	DB	80h,FFh,00h,FFh,00h,3Fh,00h,07h,00h,01h,00h,80h,00h,C0h,00h,C0h
	DB	01h,E1h,00h,FEh,00h,FFh,00h,FFh,00h,0Fh,00h,00h,00h,00h,00h,C0h
	DB	F0h,FFh,1Fh,1Fh,01h,E1h,00h,FEh,00h,FFh,00h,FFh,00h,1Fh,00h,00h
	DB	00h,F8h,80h,FFh,FEh,FFh,07h,07h,00h,F8h,00h,FFh,00h,FFh,00h,1Fh
	DB	3Bh,33h,11h,E2h,00h,FFh,F8h,FFh,0Fh,0Fh,00h,E0h,00h,FFh,00h,FFh
	DB	B1h,23h,00h,3Fh,00h,FFh,00h,FFh,C0h,FFh,3Eh,3Fh,01h,81h,00h,FCh
	DB	80h,9Fh,80h,1Fh,38h,F3h,13h,E3h,01h,FEh,00h,FFh,80h,FFh,70h,7Fh
	DB	00h,FFh,00h,FFh,00h,FFh,80h,3Fh,32h,24h,27h,C6h,00h,FFh,00h,FFh
	DB	00h,FFh,00h,FFh,02h,FCh,27h,C6h,70h,67h,00h,7Fh,00h,FFh,00h,FFh
	DB	09h,F1h,4Ch,89h,60h,4Fh,00h,7Fh,00h,FFh,00h,FEh,00h,F8h,00h,E0h
	DB	80h,3Fh,00h,FFh,00h,F8h,00h,E0h,00h,80h,00h,00h,00h,00h,00h,03h
	DB	0Ch,8Fh,03h,F3h,00h,FCh,00h,7Fh,00h,0Fh,00h,01h,00h,00h,00h,F0h
	DB	00h,FFh,00h,FFh,80h,FFh,60h,7Eh,18h,8Fh,03h,F0h,00h,1Fh,00h,01h
	DB	00h,FFh,00h,F8h,00h,C0h,00h,00h,00h,E3h,C0h,FFh,00h,00h,00h,FFh
	DB	00h,00h,00h,00h,00h,03h,00h,1Fh,01h,FFh,C0h,C0h,00h,3Fh,00h,FEh
	DB	FFh,FFh,FFh,FFh,FFh,FFh,FFh,FFh,FFh,FFh,FFh,FFh,FFh,FFh,FFh,FFh
	DB	FFh,FCh,FFh,81h,FFh,FFh,FFh,FEh,FFh,FDh,FFh,FEh,FFh,FDh,FFh,FEh
	DB	80h,FFh,00h,FFh,00h,FFh,00h,FFh,00h,FFh,00h,FFh,00h,FFh,00h,FFh

; 224 zero bytes (7070h-714Fh = 14 x 16B all-zero 2bpp tile slots 72h..7Fh) rounding the
; Title Firebird Phase 2 2bpp tileset allocation (6960h-714Fh, 127 slots for 01h..7Fh) up to
; 7150h.
TITLE_FIREBIRD_PHASE2_UNUSED_TILE_SLOTS_ZERO:
	DS	00E0h,00h

; Title & Ending Kadokawa Shoten / Tezuka Production publisher emblem (6468h) 75-tile 2bpp
; tileset (7150h-75FFh, 40h + 0Bh = 4Bh tiles x 16B = 1200B -> VRAM 8000h tiles 01h..4Bh,
; colors 0/7/C/F).
PUBLISHER_LOGO_CREDITS_TILES_2BPP:
	DB	00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,0Ch,0Ch,12h,1Eh,21h,3Fh
	DB	00h,00h,07h,07h,08h,0Fh,08h,0Fh,08h,0Fh,08h,0Fh,08h,0Fh,08h,0Fh
	DB	00h,00h,E0h,E0h,10h,F0h,10h,F0h,10h,F0h,10h,F0h,10h,F0h,10h,F0h
	DB	00h,00h,00h,00h,00h,00h,20h,20h,50h,70h,48h,78h,84h,FCh,82h,FEh
	DB	00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,01h,01h,06h,07h,08h,0Fh
	DB	00h,00h,00h,00h,00h,00h,3Fh,3Fh,C0h,FFh,00h,FFh,00h,FFh,00h,FFh
	DB	00h,00h,00h,00h,00h,00h,F8h,F8h,06h,FEh,01h,FFh,00h,FFh,00h,FFh
	DB	00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,80h,80h,40h,C0h,20h,E0h
	DB	00h,00h,00h,00h,0Fh,0Fh,10h,1Fh,10h,1Fh,10h,1Fh,10h,1Fh,10h,1Fh
	DB	0Fh,0Fh,10h,1Fh,F0h,FFh,00h,FFh,00h,FFh,3Fh,FFh,3Fh,FFh,00h,FFh
	DB	C0h,C0h,20h,E0h,3Fh,FFh,00h,FFh,00h,FFh,FCh,FFh,FCh,FFh,00h,FFh
	DB	00h,00h,00h,00h,F0h,F0h,08h,F8h,08h,F8h,08h,F8h,08h,F8h,08h,F8h
	DB	40h,7Fh,80h,FFh,C0h,FFh,60h,7Fh,30h,3Fh,18h,1Fh,0Dh,0Fh,07h,07h
	DB	88h,8Fh,48h,CFh,28h,EFh,28h,EFh,48h,CFh,D0h,DFh,90h,9Fh,10h,1Fh
	DB	11h,F1h,12h,F3h,14h,F7h,14h,F7h,16h,F7h,0Bh,FBh,09h,F9h,08h,F8h
	DB	01h,FFh,03h,FFh,02h,FEh,06h,FEh,0Ch,FCh,18h,F8h,B0h,F0h,E0h,E0h
	DB	08h,0Fh,10h,1Fh,10h,1Fh,20h,3Fh,21h,3Fh,41h,7Fh,41h,7Fh,42h,7Eh
	DB	00h,FFh,38h,FFh,68h,EFh,C8h,CFh,88h,8Fh,08h,0Fh,08h,0Fh,08h,0Fh
	DB	00h,FFh,30h,FFh,2Ch,EFh,26h,E7h,23h,E3h,21h,E1h,21h,E1h,20h,E0h
	DB	10h,F0h,08h,F8h,08h,F8h,04h,FCh,04h,FCh,02h,FEh,82h,FEh,82h,FEh
	DB	10h,1Fh,10h,1Fh,10h,1Fh,10h,1Fh,10h,1Fh,10h,1Fh,10h,1Fh,10h,1Fh
	DB	00h,FFh,3Fh,FFh,3Fh,FFh,00h,FFh,00h,FFh,3Fh,FFh,3Fh,FFh,00h,FFh
	DB	00h,FFh,FCh,FFh,FCh,FFh,00h,FFh,00h,FFh,FFh,FFh,FFh,FFh,00h,FFh
	DB	08h,F8h,08h,F8h,08h,F8h,08h,F8h,08h,F8h,F0h,F0h,FCh,FCh,02h,FEh
	DB	02h,02h,00h,00h,00h,00h,00h,00h,03h,03h,0Ch,0Fh,30h,3Fh,C0h,FFh
	DB	20h,3Fh,20h,3Fh,40h,7Fh,80h,FFh,00h,FFh,00h,FFh,01h,FFh,03h,FFh
	DB	04h,FCh,04h,FCh,02h,FEh,01h,FFh,00h,FFh,80h,FFh,C0h,FFh,60h,7Fh
	DB	40h,40h,00h,00h,00h,00h,00h,00h,80h,80h,60h,E0h,18h,F8h,07h,FFh
	DB	42h,7Eh,42h,7Eh,42h,7Eh,42h,7Eh,41h,7Fh,40h,7Fh,60h,7Fh,20h,3Fh
	DB	10h,1Fh,10h,1Fh,10h,1Fh,20h,3Fh,C0h,FFh,00h,FFh,01h,FFh,03h,FFh
	DB	20h,E0h,40h,C0h,40h,C0h,40h,C0h,81h,81h,86h,87h,F8h,FFh,00h,FFh
	DB	82h,FEh,82h,FEh,82h,FEh,82h,FEh,02h,FEh,02h,FEh,06h,FEh,04h,FCh
	DB	10h,1Fh,10h,1Fh,10h,1Fh,10h,1Fh,10h,1Fh,2Fh,3Fh,24h,3Ch,43h,7Fh
	DB	00h,FFh,3Fh,FFh,3Fh,FFh,00h,FFh,00h,FFh,FFh,FFh,F7h,F7h,08h,FFh
	DB	00h,FFh,FFh,FFh,FFh,FFh,00h,FFh,00h,FFh,FFh,FFh,BCh,BCh,42h,FEh
	DB	02h,FEh,FCh,FCh,FFh,FFh,01h,FFh,01h,FFh,C1h,FFh,41h,7Fh,41h,7Fh
	DB	00h,FFh,80h,FFh,C0h,FFh,60h,7Fh,31h,3Fh,1Fh,1Fh,0Fh,0Fh,00h,00h
	DB	06h,FEh,0Ch,FCh,18h,F8h,70h,F0h,E0h,E0h,80h,80h,00h,00h,00h,00h
	DB	30h,3Fh,18h,1Fh,0Ch,0Fh,06h,07h,03h,03h,01h,01h,00h,00h,00h,00h
	DB	00h,FFh,01h,FFh,03h,FFh,02h,FEh,84h,FCh,FCh,FCh,78h,78h,00h,00h
	DB	30h,3Fh,18h,1Fh,0Ch,0Fh,07h,07h,00h,00h,00h,00h,00h,00h,00h,00h
	DB	06h,FEh,0Ch,FCh,38h,F8h,E0h,E0h,00h,00h,00h,00h,00h,00h,00h,00h
	DB	80h,FFh,80h,FFh,40h,7Fh,60h,7Fh,21h,3Fh,37h,3Fh,1Ch,1Ch,00h,00h
	DB	0Ch,FCh,18h,F8h,30h,F0h,60h,E0h,C0h,C0h,00h,00h,00h,00h,00h,00h
	DB	41h,7Fh,81h,FFh,03h,FFh,83h,FFh,63h,7Fh,36h,3Fh,1Dh,1Dh,00h,00h
	DB	0Ch,FFh,0Ch,FFh,0Ah,FBh,0Ah,FBh,0Ah,FBh,0Ah,FBh,F1h,F1h,00h,00h
	DB	21h,FFh,30h,FFh,30h,FFh,10h,FFh,1Ch,FFh,14h,F7h,E4h,E7h,03h,03h
	DB	C1h,FFh,C1h,FFh,01h,FFh,01h,FFh,02h,FEh,02h,FEh,04h,FCh,F8h,F8h
	DB	00h,00h,10h,10h,2Fh,3Fh,20h,3Fh,27h,3Fh,20h,3Fh,27h,3Fh,24h,3Fh
	DB	00h,00h,01h,01h,FEh,FFh,00h,FFh,FBh,FFh,01h,FFh,3Fh,FFh,03h,FFh
	DB	80h,80h,40h,C0h,20h,E0h,10h,F0h,20h,E0h,20h,E0h,20h,E0h,20h,E0h
	DB	00h,00h,40h,40h,BFh,FFh,80h,FFh,9Ch,FFh,95h,FFh,90h,FFh,93h,FFh
	DB	02h,02h,05h,07h,F8h,FFh,00h,FFh,FCh,FFh,CCh,FFh,04h,FFh,CCh,FFh
	DB	00h,00h,01h,01h,81h,81h,41h,C1h,87h,87h,89h,8Fh,84h,87h,82h,83h
	DB	C0h,C0h,20h,E0h,17h,F7h,18h,FFh,3Fh,FFh,65h,FFh,60h,FFh,04h,FFh
	DB	01h,01h,02h,03h,FCh,FFh,00h,FFh,FFh,FFh,FEh,FFh,00h,FFh,FEh,FFh
	DB	00h,00h,80h,80h,40h,C0h,20h,E0h,C0h,C0h,40h,C0h,20h,E0h,40h,C0h
	DB	24h,3Fh,24h,3Fh,24h,3Fh,24h,3Fh,24h,3Fh,24h,3Fh,24h,3Fh,24h,3Fh
	DB	F3h,FFh,03h,FFh,F3h,FFh,03h,FFh,FFh,FFh,01h,FFh,FFh,FFh,00h,FFh
	DB	20h,E0h,20h,E0h,20h,E0h,20h,E0h,20h,E0h,20h,E0h,10h,F0h,10h,F0h
	DB	93h,FFh,90h,FFh,93h,FFh,93h,FFh,90h,FFh,97h,FFh,9Fh,FFh,90h,FFh
	DB	CCh,FFh,0Ch,FFh,CCh,FFh,CCh,FFh,0Ch,FFh,DCh,FFh,ECh,FFh,04h,FFh
	DB	81h,81h,81h,81h,86h,87h,88h,8Fh,88h,8Fh,87h,87h,45h,C7h,44h,C7h
	DB	0Ch,FFh,3Ch,FFh,64h,FFh,10h,FFh,70h,FFh,3Ch,FFh,0Ch,FFh,20h,FFh
	DB	FEh,FFh,00h,FFh,FEh,FFh,FFh,FFh,00h,FFh,49h,FFh,49h,FFh,00h,FFh
	DB	40h,C0h,40h,C0h,40h,C0h,20h,E0h,10h,F0h,20h,E0h,20h,E0h,20h,E0h
	DB	25h,3Fh,2Dh,3Fh,2Ah,3Fh,5Ah,7Fh,52h,7Fh,B3h,FFh,4Ch,4Ch,00h,00h
	DB	FEh,FFh,B6h,FFh,DAh,FFh,4Ah,FFh,4Ch,FFh,6Ch,FFh,93h,93h,00h,00h
	DB	10h,F0h,0Ch,FCh,4Ah,FEh,43h,FFh,63h,FFh,A6h,BFh,19h,19h,00h,00h
	DB	9Eh,FFh,A6h,E7h,A8h,EFh,46h,C7h,3Eh,BFh,C0h,FFh,3Fh,3Fh,00h,00h
	DB	7Ah,FBh,52h,F3h,09h,F9h,7Dh,FDh,72h,FEh,01h,FFh,FEh,FEh,00h,00h
	DB	44h,C7h,34h,F7h,2Ch,FFh,0Dh,FFh,8Bh,FFh,95h,F5h,60h,60h,00h,00h
	DB	20h,FFh,30h,FFh,2Ah,EFh,32h,FFh,36h,FFh,6Ah,FBh,91h,91h,00h,00h
	DB	49h,FFh,49h,FFh,49h,FFh,49h,FFh,5Ah,FFh,A1h,A1h,00h,00h,00h,00h
	DB	20h,E0h,20h,E0h,20h,E0h,20h,E0h,20h,E0h,40h,C0h,80h,80h,00h,00h

; Top 2 blank (00h) 32-column rows (7600h-763Fh, 2 x 32B = 64B, rows 0..1) of the 32x27
; (0x360-byte) Title Firebird Phase 1 full-screen tilemap canvas (7600h-795Fh); skipped by
; Bank 00 5A8Fh which starts copying at row 2 (7640h).
TITLE_FIREBIRD_PHASE1_TILEMAP_TOP_MARGIN_ZERO:
	DB	00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
	DB	00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
	DB	00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
	DB	00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h

; Active 32x18 Title screen Firebird Phase 1 tilemap slice (7640h-787Fh, 18 x 32B = 576B,
; rows 2..19 of the 32x27 canvas, referencing tile IDs 00h..B6h from 6443h), rendered to
; VRAM by Bank 00 5A8Fh (LD HL,7640h ; LD BC,2012h ; LD DE,0028h ; CALL 58C3h).
TITLE_FIREBIRD_PHASE1_TILEMAP_ACTIVE:
	DB	00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
	DB	00h,41h,42h,43h,44h,45h,46h,47h,00h,00h,00h,48h,49h,4Ah,4Bh,00h
	DB	00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
	DB	00h,4Ch,4Dh,4Eh,4Fh,50h,51h,52h,53h,54h,55h,56h,57h,58h,59h,5Ah
	DB	00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,01h,02h,03h,04h,05h
	DB	5Bh,5Ch,5Dh,00h,5Eh,5Fh,60h,61h,62h,63h,64h,65h,66h,67h,68h,69h
	DB	00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,06h,07h,08h,09h,0Ah
	DB	6Ah,6Bh,00h,00h,6Ch,49h,6Dh,6Eh,6Fh,70h,71h,72h,73h,74h,75h,76h
	DB	00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,0Bh,0Ch,0Dh,0Eh,0Fh
	DB	77h,00h,00h,00h,56h,57h,58h,59h,5Ah,78h,79h,7Ah,7Bh,7Ch,7Dh,7Eh
	DB	00h,00h,00h,00h,00h,00h,00h,00h,00h,10h,11h,12h,13h,14h,15h,16h
	DB	00h,00h,00h,7Fh,65h,66h,67h,68h,69h,80h,81h,82h,83h,84h,85h,86h
	DB	00h,00h,00h,00h,00h,00h,00h,00h,00h,17h,18h,19h,1Ah,1Bh,1Ch,00h
	DB	00h,00h,00h,71h,72h,73h,74h,75h,41h,42h,43h,44h,45h,46h,47h,2Fh
	DB	00h,00h,00h,00h,00h,1Dh,1Eh,1Fh,00h,20h,21h,22h,23h,00h,00h,00h
	DB	00h,00h,78h,79h,7Ah,7Bh,7Ch,7Dh,4Ch,4Dh,4Eh,4Fh,50h,51h,52h,53h
	DB	00h,00h,00h,00h,00h,00h,24h,25h,26h,00h,00h,27h,28h,00h,00h,00h
	DB	00h,00h,87h,88h,89h,7Bh,8Ah,5Bh,5Ch,00h,00h,00h,8Bh,60h,61h,00h
	DB	00h,00h,00h,00h,00h,29h,2Ah,2Bh,2Ch,00h,00h,00h,00h,00h,00h,00h
	DB	00h,8Ch,8Dh,8Eh,8Fh,90h,91h,92h,00h,00h,93h,00h,00h,94h,95h,96h
	DB	00h,00h,00h,00h,00h,2Dh,2Eh,00h,2Fh,30h,31h,32h,00h,00h,00h,00h
	DB	00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,97h,98h,99h
	DB	00h,00h,00h,00h,00h,00h,00h,00h,00h,17h,33h,34h,35h,B5h,00h,00h
	DB	00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,B6h
	DB	00h,00h,00h,00h,00h,00h,00h,00h,00h,36h,37h,38h,39h,3Ah,3Bh,00h
	DB	00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
	DB	00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,3Ch,3Dh,3Eh,3Fh,40h,30h
	DB	00h,00h,00h,9Ah,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,9Bh,9Ch
	DB	00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,17h
	DB	33h,9Dh,00h,9Eh,9Fh,A0h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
	DB	00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,36h
	DB	37h,38h,A1h,A2h,A3h,A4h,A5h,A6h,A7h,A8h,A9h,00h,00h,00h,00h,AAh
	DB	00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
	DB	3Ch,3Dh,00h,00h,00h,ABh,ACh,ADh,AEh,AFh,B0h,B1h,ACh,B2h,B3h,B4h
	DB	00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
	DB	00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h

; Bottom 7 blank (00h) 32-column rows (7880h-795Fh, 7 x 32B = 224B, rows 20..26) completing
; the 32x27 (864-byte) Title Firebird Phase 1 full-screen tilemap canvas (7600h-795Fh).
TITLE_FIREBIRD_PHASE1_TILEMAP_BOTTOM_MARGIN_ZERO:
	DB	00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
	DB	00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
	DB	00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
	DB	00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
	DB	00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
	DB	00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
	DB	00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
	DB	00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
	DB	00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
	DB	00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
	DB	00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
	DB	00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
	DB	00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
	DB	00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h

; Top 2 blank (00h) 32-column rows (7960h-799Fh, 2 x 32B = 64B, rows 0..1) of the 32x27
; (0x360-byte) Title Firebird Phase 2 full-screen tilemap canvas (7960h-7CBFh); skipped by
; Bank 00 5AA6h which starts copying at row 2 (79A0h).
TITLE_FIREBIRD_PHASE2_TILEMAP_TOP_MARGIN_ZERO:
	DB	00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
	DB	00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
	DB	00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
	DB	00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h

; Active 32x18 Title screen Firebird Phase 2 tilemap slice (79A0h-7BDFh, 18 x 32B = 576B,
; rows 2..19 of the 32x27 canvas, referencing tile IDs 00h..71h from 6458h), rendered to
; VRAM by Bank 00 5AA6h (LD HL,79A0h ; LD BC,2012h ; LD DE,0028h ; CALL 58C3h).
TITLE_FIREBIRD_PHASE2_TILEMAP_ACTIVE:
	DB	00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
	DB	00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
	DB	00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
	DB	00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
	DB	00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
	DB	00h,00h,00h,16h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
	DB	00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
	DB	00h,00h,17h,18h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
	DB	00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
	DB	00h,19h,1Ah,1Bh,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
	DB	00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
	DB	1Ch,1Dh,1Eh,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
	DB	00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,01h
	DB	1Fh,20h,21h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
	DB	00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,02h,03h,04h
	DB	22h,23h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
	DB	00h,00h,00h,00h,00h,00h,00h,00h,00h,05h,06h,00h,00h,07h,08h,09h
	DB	24h,25h,00h,00h,00h,00h,00h,00h,00h,2Fh,30h,31h,00h,00h,00h,00h
	DB	00h,00h,00h,00h,00h,00h,00h,00h,00h,0Ah,0Bh,0Ch,0Dh,0Eh,0Fh,10h
	DB	26h,00h,00h,00h,00h,00h,00h,00h,32h,33h,00h,34h,35h,00h,00h,00h
	DB	00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,11h,12h,6Fh,70h
	DB	27h,28h,29h,2Ah,2Bh,2Ch,2Dh,2Eh,36h,37h,38h,39h,3Ah,00h,00h,00h
	DB	00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,13h,14h
	DB	3Bh,3Ch,3Dh,3Eh,3Fh,40h,41h,42h,43h,44h,45h,71h,46h,47h,48h,00h
	DB	00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,15h
	DB	49h,4Ah,4Bh,4Ch,4Dh,4Eh,4Fh,50h,51h,2Ch,2Dh,2Eh,52h,53h,54h,55h
	DB	00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
	DB	56h,57h,58h,00h,59h,5Ah,5Bh,5Ch,5Dh,40h,41h,42h,5Eh,5Fh,00h,00h
	DB	00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
	DB	00h,00h,60h,00h,00h,00h,61h,62h,63h,64h,65h,66h,67h,68h,69h,6Ah
	DB	00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
	DB	00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,6Bh,6Ch,6Dh,6Eh,00h
	DB	00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
	DB	00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
	DB	00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
	DB	00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h

; Bottom 7 blank (00h) 32-column rows (7BE0h-7CBFh, 7 x 32B = 224B, rows 20..26) completing
; the 32x27 (864-byte) Title Firebird Phase 2 full-screen tilemap canvas (7960h-7CBFh).
TITLE_FIREBIRD_PHASE2_TILEMAP_BOTTOM_MARGIN_ZERO:
	DB	00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
	DB	00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
	DB	00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
	DB	00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
	DB	00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
	DB	00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
	DB	00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
	DB	00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
	DB	00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
	DB	00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
	DB	00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
	DB	00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
	DB	00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
	DB	00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h

; 64 zero bytes (7CC0h-7CFFh = 2 x 32B blank rows) aligning the end of the two 32x27 title
; screen tilemap canvases (7600h-7CBFh) to 7D00h.
TITLE_TILEMAPS_ALIGNMENT_PADDING_ZERO:
	DS	0040h,00h

; 12x4 sequential tilemap (7D00h-7D2Fh, 48B, tile IDs 01h..30h from 6468h) for Publisher
; Emblem Box 1 (Kadokawa Shoten), rendered by Bank 00 5AC4h (LD HL,7D00h ; LD BC,0C04h ;
; CALL 58E5h) on both Title (5AB2h) and Ending (Bank 06 AE77h).
PUBLISHER_EMBLEM_BOX1_TILEMAP_12X4:
	DB	01h,02h,03h,04h,05h,06h,07h,08h,09h,0Ah,0Bh,0Ch
	DB	0Dh,0Eh,0Fh,10h,11h,12h,13h,14h,15h,16h,17h,18h
	DB	19h,1Ah,1Bh,1Ch,1Dh,1Eh,1Fh,20h,21h,22h,23h,24h
	DB	25h,26h,27h,28h,29h,2Ah,2Bh,2Ch,2Dh,2Eh,2Fh,30h

; 9x3 sequential tilemap (7D30h-7D4Ah, 27B, tile IDs 31h..4Bh from 6468h) for Publisher
; Emblem Box 2 (Tezuka Production), rendered by Bank 00 5ACDh (LD HL,7D30h ; LD BC,0903h ;
; CALL 58E5h) on both Title (5AB2h) and Ending (Bank 06 AE77h).
PUBLISHER_EMBLEM_BOX2_TILEMAP_9X3:
	DB	31h,32h,33h,34h,35h,36h,37h,38h,39h
	DB	3Ah,3Bh,3Ch,3Dh,3Eh,3Fh,40h,41h,42h
	DB	43h,44h,45h,46h,47h,48h,49h,4Ah,4Bh

%endif

; Shared 6+20 kanji bank (6 white teleporter kanji + 20 dark-red inventory/tablet kanji) and
; 6 large 16x16 UI cells 1bpp source (1BD4Bh-1C14Ah, 1024B = 128 x 8x8 1bpp tiles = 32 x
; 16x16 cells total, unpacked to VRAM C800h-D7FFh by Descriptor 63A3h cmds 63A5h..63E5h,
; with sub-slices 7DCBh-7E2Ah & 7ECBh-7F32h also loaded by Compass Descriptor 62A5h): Bank
; 13 part 1 (693B = 7D4Bh-7FFFh; continues across page boundary into Bank 14 1C000h-1C14Ah).
SHARED_KANJI_AND_LARGE_UI_TILES_1BPP_PART1:
	DB	00h,00h,01h,09h,19h,13h,07h,3Dh,00h,00h,80h,D8h,B0h,C0h,7Ch,98h
	DB	00h,00h,04h,3Fh,0Ch,0Ch,04h,3Ch,00h,00h,08h,FCh,8Ch,88h,98h,D8h
	DB	00h,00h,1Bh,3Fh,1Bh,3Fh,00h,1Fh,00h,00h,40h,E8h,7Ch,D8h,D8h,D8h
	DB	00h,00h,10h,1Fh,19h,19h,19h,19h,00h,00h,18h,FCh,98h,98h,98h,98h
	DB	00h,00h,01h,01h,01h,1Fh,00h,06h,00h,00h,80h,C0h,98h,FCh,00h,40h
	DB	00h,00h,01h,11h,1Fh,18h,19h,09h,00h,00h,80h,88h,FCh,00h,80h,C0h
	DB	00h,00h,09h,3Fh,0Ch,3Fh,2Dh,3Fh,00h,00h,00h,90h,78h,80h,08h,FCh
	DB	00h,00h,11h,19h,19h,1Fh,11h,11h,00h,00h,80h,C0h,90h,F8h,80h,80h

; 1bpp kanji mask slice loaded by Bank 04 COMPASS_SCREEN_GFX_DESCRIPTOR
COMPASS_KANJI_MASK_ROW1_1BPP:
	DB	00h,00h,08h,3Fh,0Ch,3Fh,2Dh,3Fh,00h,00h,30h,30h,60h,C0h,7Ch,48h
	DB	00h,00h,00h,20h,38h,34h,36h,33h,00h,00h,00h,58h,FCh,D8h,D8h,98h
	DB	00h,00h,09h,1Fh,0Bh,0Bh,0Bh,3Fh,00h,00h,08h,FCh,6Ch,68h,70h,F8h
	DB	00h,00h,00h,34h,1Fh,08h,1Ch,2Ch,00h,00h,00h,08h,FCh,60h,60h,60h
	DB	00h,00h,03h,1Fh,00h,3Fh,06h,16h,00h,00h,70h,E8h,68h,FCh,60h,60h
	DB	00h,00h,10h,1Ah,3Fh,1Bh,32h,1Eh,00h,00h,00h,08h,FCh,48h,50h,30h
	DB	00h,00h,00h,00h,10h,10h,18h,1Fh,01h,03h,03h,03h,03h,03h,03h,FFh
	DB	00h,C0h,E0h,C0h,C0h,C0h,C0h,FFh,00h,00h,00h,00h,00h,00h,0Ch,FEh
	DB	01h,09h,1Bh,13h,0Eh,38h,00h,00h,C8h,9Ch,F0h,60h,3Ch,18h,00h,00h
	DB	1Ch,0Eh,1Ah,10h,21h,02h,00h,00h,50h,70h,70h,F8h,9Ch,0Ch,00h,00h
	DB	1Bh,1Fh,1Bh,1Fh,19h,1Bh,00h,00h,70h,30h,70h,78h,5Ch,8Ch,00h,00h
	DB	1Fh,18h,18h,18h,18h,10h,00h,00h,F8h,18h,18h,18h,38h,18h,00h,00h
	DB	07h,06h,0Ch,08h,10h,00h,00h,00h,30h,18h,1Ch,0Ch,0Ch,00h,00h,00h
	DB	09h,09h,1Bh,12h,1Fh,27h,00h,00h,80h,20h,10h,38h,DCh,0Ch,00h,00h
	DB	2Dh,3Fh,0Dh,3Fh,0Dh,0Ch,00h,00h,30h,20h,50h,C8h,FCh,CCh,00h,00h
	DB	21h,0Fh,01h,01h,01h,3Fh,00h,00h,A0h,F0h,80h,80h,88h,FCh,00h,00h

; 1bpp kanji mask slice loaded by Bank 04 COMPASS_SCREEN_GFX_DESCRIPTOR
COMPASS_KANJI_MASK_ROW2_1BPP:
	DB	2Dh,3Fh,0Ch,3Fh,0Dh,0Eh,00h,00h,58h,58h,98h,98h,18h,10h,00h,00h
	DB	31h,32h,3Ch,30h,3Fh,30h,00h,00h,98h,D8h,78h,18h,F8h,18h,00h,00h
	DB	07h,0Dh,0Bh,13h,27h,03h,00h,00h,6Ch,6Ch,6Ch,78h,60h,60h,00h,00h
	DB	05h,1Ch,2Ch,2Ch,1Ch,37h,00h,00h,F8h,60h,60h,60h,68h,FCh,00h,00h
	DB	1Fh,16h,16h,1Fh,3Eh,18h,00h,00h,E0h,60h,F0h,34h,3Ch,1Ch,00h,00h
	DB	0Dh,36h,16h,16h,36h,23h,00h,00h,FCh,94h,C8h,4Ch,14h,F8h,00h,00h
	DB	1Fh,38h,78h,78h,F9h,70h,00h,00h,FFh,00h,00h,00h,FFh,FFh,00h,00h
	DB	FFh,00h,00h,06h,FFh,FFh,00h,00h,FFh,0Eh,1Ch,18h,20h,80h,00h,00h
	DB	00h,00h,00h,1Fh,03h,03h,03h,1Fh,00h,00h,10h,F8h,1Ch,18h,18h,18h
	DB	00h,00h,01h,01h,01h,3Fh,0Ch,0Ch,00h,00h,80h,C0h,98h,FCh,00h,00h
	DB	00h,00h,10h,18h,1Ah,3Fh,1Ah,12h,00h,00h,00h,00h,98h,FCh,D8h,D8h
	DB	00h,00h,0Ch,0Fh,0Ch,0Ch,0Fh,0Ch,00h,00h,30h,F8h,30h,30h,F0h,30h
	DB	00h,00h,04h,05h,0Ch,1Ah,27h,0Ch,00h,00h,10h,F8h,00h,08h,FCh,30h
	DB	00h,00h,00h,3Fh,08h,0Ah,1Fh,16h,00h,00h,18h,FCh,C0h,E8h,DCh,D0h
	DB	00h,00h,00h,3Fh,03h,03h,03h,1Fh,00h,00h,10h,F8h,00h,00h,20h,F0h
	DB	00h,00h,01h,11h,1Fh,36h,06h,0Ch,00h,00h,00h,88h,FCh,68h,68h,78h
	DB	00h,00h,01h,01h,01h,01h,3Fh,07h,00h,00h,80h,C0h,88h,9Ch,B0h,E0h
	DB	00h,00h,24h,3Fh,36h,36h,3Eh,36h,00h,00h,88h,FCh,D8h,D8h,F8h,D8h
	DB	00h,00h,01h,01h,3Fh,03h,06h,1Fh,00h,00h,80h,98h,FCh,40h,20h,F8h
	DB	00h,00h,01h,13h,1Fh

	DEPHASE

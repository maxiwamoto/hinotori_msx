; Physical Bank 08 (ROM 10000h-11FFFh): Continuation of RLE sprite patterns and shared stone/inventory 4bpp UI tiles
	PHASE	8000h

	IF	HINOTORI_ENHANCED = 00h

; Unreferenced 4A8Dh-format RLE sprite stream #14 (0FFFCh-100F7h, 252B total -> 0100h = 8 x
; 16x16 patterns): Bank 08 part 2 (248B at 8000h-80F7h, 00h-terminated).
ORPHANED_SPRITE_RLE_14_7FFC_PART2:
	DB	FBh,FEh,64h,3Eh,4Eh,7Eh,3Fh,FCh,FDh,F9h,F9h,FDh,FEh,F4h,FCh,FEh
	DB	E3h,F9h,FDh,FFh,6Eh,28h,7Ch,F4h,EEh,FAh,74h,BEh,EAh,FCh,7Ch,D9h
	DB	E7h,FEh,DCh,FAh,FAh,B2h,F7h,E7h,0Fh,3Fh,17h,33h,F9h,6Ch,CCh,FEh
	DB	DDh,87h,83h,A1h,72h,38h,7Ch,ECh,BAh,B6h,FCh,FAh,EEh,9Eh,87h,0Fh
	DB	EFh,9Fh,7Bh,3Fh,9Ah,99h,98h,18h,35h,6Dh,7Dh,2Ah,04h,34h,70h,90h
	DB	10h,B0h,E0h,80h,00h,00h,80h,80h,40h,40h,C0h,80h,00h,9Dh,84h,0Eh
	DB	EEh,FBh,6Dh,37h,96h,97h,97h,17h,2Ah,5Bh,5Bh,2Eh,04h,D4h,90h,70h
	DB	F0h,50h,E0h,80h,00h,00h,80h,80h,C0h,C0h,40h,80h,06h,00h,90h,01h
	DB	03h,0Fh,1Fh,37h,37h,27h,27h,37h,1Fh,17h,00h,00h,03h,0Fh,7Fh,04h
	DB	FFh,87h,EFh,F2h,FEh,F7h,FDh,FEh,FFh,05h,00h,B6h,01h,03h,0Eh,16h
	DB	3Ch,2Ch,3Ch,3Ch,3Eh,1Eh,1Eh,00h,00h,03h,0Fh,7Eh,DDh,15h,17h,3Ah
	DB	3Ch,3Fh,3Fh,7Fh,7Fh,77h,7Eh,1Bh,1Fh,39h,70h,7Ch,7Eh,7Fh,37h,14h
	DB	3Eh,2Fh,77h,5Fh,2Eh,7Dh,57h,FEh,FFh,7Fh,BFh,9Fh,9Dh,BFh,7Eh,7Fh
	DB	FEh,FFh,03h,BFh,A2h,9Fh,0Fh,17h,1Fh,37h,6Fh,43h,41h,50h,3Bh,1Ch
	DB	3Eh,37h,5Dh,6Dh,3Fh,5Fh,77h,3Fh,BFh,5Dh,A3h,9Eh,9Bh,AEh,6Fh,67h
	DB	F7h,33h,F8h,F6h,D8h,EEh,FFh,00h

; Unreferenced (orphaned) 4A8Dh-format RLE sprite stream #15 (00h-terminated, 235B packed ->
; 0100h = 8 x 16x16 patterns = 4 OR-color sprite frames).
ORPHANED_SPRITE_RLE_15_80F8:
	DB	88h,2Ch,1Ch,14h,1Bh,1Fh,19h,0Fh,07h,08h,00h,89h,7Bh,7Ah,FAh,FBh
	DB	F1h,DDh,B6h,DDh,08h,07h,00h,88h,2Bh,1Bh,1Bh,14h,19h,16h,09h,07h
	DB	08h,00h,89h,BDh,FEh,76h,F5h,EFh,F7h,EFh,D5h,08h,09h,00h,83h,E0h
	DB	FFh,FFh,03h,7Fh,88h,3Fh,1Bh,A3h,2Bh,F7h,5Fh,3Fh,7Fh,04h,00h,9Ch
	DB	C0h,F8h,FCh,F6h,F6h,F2h,F2h,F6h,FCh,F8h,F8h,FCh,00h,00h,E0h,FFh
	DB	EDh,DEh,F2h,EEh,FDh,FFh,7Fh,FFh,7Fh,FDh,F7h,AAh,04h,00h,99h,C0h
	DB	78h,24h,3Ah,1Ah,1Eh,9Eh,9Ah,34h,28h,38h,7Ch,BFh,FFh,FFh,FEh,FCh
	DB	65h,3Fh,4Eh,7Fh,3Fh,FDh,FCh,F8h,03h,FCh,CDh,FEh,DEh,FAh,F7h,FDh
	DB	FAh,FFh,F5h,72h,E0h,80h,80h,40h,40h,60h,20h,FCh,7Dh,D9h,E2h,FCh
	DB	DDh,FBh,FBh,B3h,F7h,E6h,0Fh,3Fh,1Bh,33h,FBh,C2h,BEh,B6h,FFh,9Bh
	DB	0Eh,7Dh,F7h,F2h,E0h,80h,80h,C0h,C0h,E0h,E0h,1Eh,EEh,9Eh,7Fh,3Fh
	DB	9Eh,9Bh,98h,18h,35h,6Dh,7Dh,2Ah,04h,00h,00h,20h,20h,60h,E0h,20h
	DB	40h,C0h,80h,80h,40h,40h,C0h,80h,03h,00h,85h,1Dh,EDh,FDh,6Ch,2Ch
	DB	03h,97h,95h,17h,2Ah,5Bh,5Bh,2Eh,04h,00h,00h,E0h,E0h,A0h,20h,E0h
	DB	C0h,C0h,80h,80h,C0h,C0h,40h,80h,03h,00h,00h

; Unreferenced (orphaned) 4A8Dh-format RLE sprite stream #16 (00h-terminated, 107B packed ->
; 0080h = 4 x 16x16 patterns = 2 OR-color sprite frames).
ORPHANED_SPRITE_RLE_16_81E3:
	DB	08h,00h,88h,01h,03h,03h,1Fh,36h,33h,6Bh,49h,08h,00h,88h,C0h,E0h
	DB	ECh,FEh,3Eh,7Fh,7Eh,FCh,08h,00h,88h,01h,03h,03h,1Eh,2Fh,2Fh,5Fh
	DB	7Fh,08h,00h,90h,C0h,E0h,ECh,BAh,E2h,E1h,CAh,CCh,BDh,DFh,5Fh,2Bh
	DB	17h,0Fh,0Dh,09h,03h,0Fh,86h,1Fh,7Fh,7Fh,1Fh,07h,F8h,03h,F0h,03h
	DB	F8h,83h,48h,68h,BCh,04h,FEh,A2h,F8h,C0h,FFh,AFh,6Fh,37h,1Ch,0Eh
	DB	0Bh,0Fh,0Fh,08h,0Fh,1Ch,7Fh,7Fh,1Fh,07h,88h,10h,30h,D0h,08h,38h
	DB	E8h,78h,78h,B4h,46h,CEh,B6h,C6h,F8h,C0h,00h

; Unreferenced (orphaned) 4A8Dh-format RLE sprite stream #17 (00h-terminated, 101B packed ->
; 0080h = 4 x 16x16 patterns = 2 OR-color sprite frames).
ORPHANED_SPRITE_RLE_17_824E:
	DB	0Ah,00h,86h,01h,03h,1Fh,37h,56h,B3h,0Ah,00h,86h,C0h,E0h,ECh,FEh
	DB	3Eh,7Fh,0Ah,00h,86h,01h,03h,1Fh,2Ah,6Bh,CFh,0Ah,00h,91h,C0h,E0h
	DB	ECh,BAh,E2h,E1h,BBh,B9h,B5h,E7h,9Fh,6Fh,1Fh,13h,24h,3Ch,3Ch,03h
	DB	7Fh,B2h,3Fh,0Fh,7Eh,FCh,F8h,F0h,F8h,F8h,FCh,E4h,12h,1Eh,7Fh,FFh
	DB	FFh,FEh,F8h,80h,FFh,DFh,F7h,A7h,F9h,68h,1Eh,1Fh,3Ch,3Ch,24h,5Bh
	DB	47h,7Fh,3Fh,0Fh,CAh,CCh,98h,30h,C8h,08h,3Ch,FCh,1Eh,1Eh,73h,EDh
	DB	F1h,FEh,F8h,80h,00h

; Unreferenced (orphaned) 768-byte raw 16x16 sprite pattern block (24 x 32B = 12 two-plane
; OR-color 16x16 multi-sprite boss/character cells) immediately preceding active Boss 1
; resource dir#19 (85B3h).
ORPHANED_SPRITE_RAW_82B3:
	DB	00h,00h,0Eh,19h,23h,2Fh,7Fh,5Eh,4Eh,C6h,87h,9Eh,A3h,87h,8Ch,4Bh
	DB	01h,03h,13h,16h,BDh,BFh,79h,5Eh,7Fh,BFh,FFh,EDh,EDh,7Fh,FFh,FFh
	DB	00h,00h,0Eh,1Fh,3Dh,32h,75h,7Eh,7Eh,FAh,FBh,FFh,FFh,FEh,FFh,7Fh
	DB	01h,03h,13h,17h,BFh,BEh,7Fh,5Fh,5Fh,ECh,8Eh,DAh,FFh,DEh,FFh,FEh
	DB	3Ch,18h,30h,38h,3Fh,1Fh,1Fh,3Fh,7Fh,7Fh,7Fh,FFh,FFh,FFh,FFh,FBh
	DB	67h,41h,41h,E3h,FFh,FFh,FEh,DCh,DFh,EFh,FFh,FEh,FCh,F8h,F0h,F8h
	DB	3Fh,17h,2Fh,27h,30h,1Fh,1Bh,2Dh,68h,68h,58h,DDh,9Ch,8Ch,94h,DAh
	DB	DFh,BFh,BEh,5Dh,E2h,EDh,F3h,D7h,5Bh,7Ch,FBh,B3h,2Fh,3Fh,3Fh,3Fh
	DB	73h,03h,01h,03h,06h,0Dh,1Bh,37h,6Fh,DFh,BFh,FFh,FFh,1Fh,07h,00h
	DB	3Fh,5Eh,3Ah,ADh,ACh,D9h,F3h,E3h,CFh,FFh,FFh,FFh,FFh,FFh,FFh,7Fh
	DB	73h,03h,01h,03h,07h,0Eh,1Ch,38h,71h,E3h,C7h,8Fh,FFh,1Fh,07h,00h
	DB	DFh,BEh,FEh,FFh,FFh,7Fh,7Fh,FFh,FFh,FFh,FFh,FFh,FFh,FFh,FFh,7Fh
	DB	00h,80h,91h,D1h,79h,FCh,3Ch,FEh,FFh,FDh,FFh,E7h,F7h,FFh,FFh,FFh
	DB	F0h,F8h,FCh,9Ch,54h,F4h,6Eh,67h,F7h,FBh,BFh,CDh,FEh,3Eh,CCh,FCh
	DB	00h,80h,91h,D1h,F9h,FCh,FCh,FEh,BBh,57h,D1h,3Bh,3Fh,7Bh,BFh,7Fh
	DB	F0h,B8h,0Ch,E4h,FCh,FCh,72h,79h,F9h,3Dh,D5h,F3h,FAh,DEh,FCh,FCh
	DB	F3h,C1h,C1h,E3h,FFh,FFh,7Ch,39h,FBh,E7h,F7h,7Fh,FFh,FFh,FFh,3Fh
	DB	8Eh,87h,C3h,C7h,FEh,FEh,FEh,FFh,FFh,FFh,FFh,FFh,FEh,FEh,BFh,FFh
	DB	FDh,FEh,3Eh,9Dh,42h,B7h,CCh,E9h,DAh,3Ch,DCh,F8h,C0h,90h,F8h,F0h
	DB	7Eh,7Bh,3Dh,B9h,C2h,BEh,C2h,E3h,43h,07h,1Dh,13h,32h,FAh,A1h,D9h
	DB	F4h,27h,39h,1Eh,8Fh,FCh,E9h,CFh,C4h,E2h,F3h,F1h,F9h,FCh,FFh,F0h
	DB	E9h,52h,ECh,E0h,A0h,60h,F0h,FCh,FEh,FEh,7Eh,7Eh,7Ch,E0h,C0h,00h
	DB	FBh,3Ch,3Fh,1Fh,8Fh,FFh,FFh,FFh,FFh,FDh,FCh,FEh,FEh,FFh,FFh,F0h
	DB	EFh,DEh,6Ch,E0h,E0h,E0h,F0h,FCh,FEh,FEh,FEh,FEh,FCh,E0h,C0h,00h
	DB	00h,0Fh,1Dh,33h,27h,2Bh,6Fh,4Eh,CEh,8Bh,9Fh,AEh,85h,87h,4Fh,39h
	DB	00h,00h,01h,83h,93h,96h,3Dh,3Fh,59h,DEh,7Fh,BFh,FFh,FDh,6Dh,FFh
	DB	00h,0Fh,1Fh,3Ch,39h,3Eh,7Fh,76h,F2h,FFh,FEh,F5h,FBh,FFh,7Ch,3Fh
	DB	00h,00h,01h,83h,93h,97h,3Fh,3Eh,5Fh,DFh,DFh,ECh,8Eh,DAh,FFh,DEh
	DB	1Fh,1Fh,38h,30h,70h,70h,FBh,FFh,FFh,FFh,FFh,FFh,7Bh,79h,FDh,FFh
	DB	FFh,FFh,4Fh,47h,C1h,E3h,FFh,FFh,FEh,FCh,F6h,FFh,FEh,FCh,FEh,FEh
	DB	17h,19h,37h,2Fh,6Fh,6Fh,D4h,BBh,9Fh,9Ch,8Ch,CEh,4Ah,59h,85h,9Bh
	DB	FFh,DEh,BFh,BFh,3Eh,5Dh,E2h,EDh,33h,3Bh,3Fh,DBh,4Fh,0Fh,87h,87h
	DB	97h,CCh,78h,11h,32h,29h,27h,26h,19h,37h,60h,60h,71h,3Fh,0Fh,00h
	DB	C5h,F2h,F2h,F3h,69h,C7h,FEh,FEh,BFh,3Fh,7Fh,FFh,FFh,FFh,FFh,FFh
	DB	F7h,FFh,7Fh,1Eh,3Dh,37h,3Bh,3Fh,1Fh,3Fh,7Fh,7Fh,7Fh,3Fh,0Fh,00h
	DB	FFh,FFh,7Fh,7Fh,EFh,C7h,FFh,FFh,FFh,FFh,FFh,FFh,FFh,FFh,FFh,FFh
	DB	00h,00h,00h,80h,90h,D1h,79h,FCh,3Ch,FEh,FEh,FDh,FFh,E7h,F7h,FFh
	DB	00h,00h,00h,70h,F8h,9Ch,4Ch,AEh,7Eh,7Eh,47h,E3h,7Bh,CDh,F9h,FAh
	DB	00h,00h,00h,80h,90h,D1h,F9h,FCh,FCh,FEh,BAh,57h,D1h,3Bh,3Fh,7Bh
	DB	00h,00h,00h,70h,98h,E4h,F4h,FEh,7Ah,72h,79h,FDh,BDh,F3h,FFh,FEh
	DB	FFh,FFh,F9h,F1h,C3h,EFh,FFh,FFh,7Fh,3Fh,77h,FFh,3Fh,1Fh,0Fh,3Fh
	DB	8Ch,FEh,FFh,FFh,FFh,7Fh,FEh,FEh,FEh,FCh,FCh,FEh,FEh,FFh,3Fh,BFh
	DB	BFh,7Dh,FEh,FEh,3Fh,9Fh,58h,B2h,DEh,DCh,FDh,DEh,E7h,F9h,FFh,F9h
	DB	74h,82h,FBh,C5h,BDh,65h,C2h,62h,22h,A4h,1Ch,5Eh,B6h,F1h,29h,A9h
	DB	F3h,E1h,A0h,30h,99h,CFh,FFh,FDh,7Ah,7Bh,BCh,BEh,DFh,EFh,FFh,F8h
	DB	5Bh,CEh,C0h,60h,F0h,B0h,18h,B8h,7Ch,DEh,2Eh,2Eh,1Eh,FCh,E0h,00h
	DB	FCh,FEh,BFh,3Fh,9Fh,4Fh,7Fh,3Fh,BFh,9Fh,DFh,CFh,EFh,FFh,FFh,F8h
	DB	DFh,4Eh,40h,A0h,90h,50h,F8h,F8h,FCh,BEh,DEh,DEh,FEh,FCh,E0h,00h
	ENDIF

; Active RLE sprite resource dir#19(id=1Bh) at CPU 85B3h (698B packed -> 0300h = 24 x 16x16
; patterns).
SPRITE_RES_DIR19_85B3:
	DB	05h,00h,9Bh,01h,02h,02h,06h,1Bh,28h,36h,6Fh,67h,61h,73h,00h,01h
	DB	0Fh,7Bh,E7h,2Fh,7Eh,1Fh,77h,E1h,70h,79h,CFh,8Fh,17h,1Fh,05h,00h
	DB	A3h,01h,03h,03h,05h,1Ch,37h,2Dh,56h,5Bh,5Fh,4Dh,00h,01h,0Fh,76h
	DB	9Fh,D5h,8Fh,E6h,9Ah,1Fh,AFh,B6h,48h,8Fh,1Ch,13h,3Fh,72h,5Eh,FFh
	DB	FEh,27h,37h,1Eh,08h,00h,02h,1Fh,87h,1Eh,8Dh,8Fh,0Fh,0Eh,1Dh,3Fh
	DB	04h,7Fh,8Bh,3Fh,07h,00h,2Dh,7Eh,6Ah,BFh,F7h,3Ah,29h,1Eh,08h,00h
	DB	02h,10h,87h,11h,8Ah,8Fh,09h,09h,1Fh,3Fh,04h,7Fh,DBh,3Fh,07h,00h
	DB	E0h,BEh,BBh,E9h,1Ch,FDh,AFh,DAh,F9h,B3h,E3h,F6h,FEh,BFh,5Ch,F8h
	DB	00h,00h,F8h,FCh,96h,0Bh,0Dh,9Dh,FDh,FBh,FAh,72h,3Ah,1Eh,9Dh,B9h
	DB	E0h,7Eh,DDh,DEh,EFh,B7h,DDh,EDh,EFh,5Ch,FDh,6Ah,BEh,45h,ABh,17h
	DB	00h,00h,F8h,14h,6Ah,F5h,F7h,67h,17h,EDh,F6h,4Eh,26h,1Ah,93h,A7h
	DB	F0h,50h,89h,07h,0Fh,FBh,FDh,FDh,BDh,D3h,FFh,FFh,FDh,FBh,FFh,3Fh
	DB	BDh,9Fh,9Fh,9Eh,1Eh,1Ah,1Eh,0Ch,03h,00h,03h,80h,02h,00h,98h,EFh
	DB	AFh,76h,F9h,FFh,F5h,E3h,E3h,B3h,DFh,EFh,E5h,E3h,E5h,F3h,3Fh,ABh
	DB	9Dh,9Bh,9Ah,1Eh,16h,1Ah,0Ch,03h,00h,03h,80h,02h,00h,C0h,0Fh,15h
	DB	18h,29h,21h,23h,37h,3Fh,72h,5Eh,FFh,FEh,27h,37h,1Eh,00h,00h,F8h
	DB	E7h,43h,CBh,27h,3Fh,B6h,F3h,73h,93h,99h,8Fh,0Fh,1Ah,1Fh,0Fh,1Ah
	DB	17h,36h,3Fh,3Dh,29h,3Dh,7Eh,6Ah,BFh,F7h,3Ah,29h,1Eh,00h,00h,F8h
	DB	3Fh,BFh,36h,DFh,E5h,5Fh,BEh,7Eh,9Dh,96h,89h,0Fh,17h,11h,10h,00h
	DB	84h,1Fh,1Eh,1Dh,0Eh,03h,0Fh,84h,0Bh,08h,1Dh,3Fh,03h,7Fh,82h,3Ch
	DB	1Fh,10h,00h,A0h,10h,11h,12h,09h,0Fh,0Ch,08h,0Ch,0Fh,1Bh,3Fh,7Ch
	DB	78h,78h,3Fh,1Fh,00h,E0h,B0h,BEh,E9h,1Ch,FCh,ADh,DAh,FDh,B8h,F1h
	DB	E3h,F7h,FDh,F8h,05h,00h,9Bh,E0h,90h,18h,08h,08h,8Ch,D4h,F6h,D6h
	DB	CFh,EDh,00h,E0h,70h,DEh,DFh,EFh,B7h,DEh,EDh,EAh,57h,EEh,DDh,6Bh
	DB	3Fh,17h,05h,00h,CBh,E0h,70h,E8h,F8h,F8h,7Ch,ACh,5Ah,AAh,B1h,D7h
	DB	F0h,A0h,11h,0Bh,0Fh,FFh,5Dh,5Bh,FFh,FFh,FEh,F8h,70h,70h,E0h,80h
	DB	BDh,F9h,DBh,F2h,3Ah,1Eh,1Dh,B9h,BDh,3Fh,3Eh,1Eh,1Eh,1Ah,1Eh,0Ch
	DB	EFh,5Fh,EEh,F5h,FFh,FDh,DBh,D7h,FFh,FFh,7Eh,78h,F0h,F0h,E0h,80h
	DB	ABh,D7h,E5h,CEh,36h,1Ah,13h,A7h,ABh,3Dh,3Ah,1Ah,1Eh,16h,1Ah,0Ch
	DB	09h,00h,02h,01h,02h,03h,02h,07h,81h,06h,03h,00h,8Dh,03h,0Ch,19h
	DB	33h,77h,CFh,8Fh,17h,06h,17h,BBh,DFh,9Fh,09h,00h,02h,01h,02h,02h
	DB	83h,05h,04h,05h,03h,00h,A7h,03h,0Fh,16h,2Dh,7Bh,BAh,77h,EDh,FFh
	DB	EAh,5Eh,B9h,74h,05h,0Bh,1Bh,11h,11h,1Ah,1Bh,1Fh,73h,5Fh,FFh,FEh
	DB	27h,37h,1Eh,00h,5Fh,FFh,DEh,CDh,4Fh,CFh,8Eh,9Dh,3Fh,7Fh,03h,FFh
	DB	9Dh,3Fh,07h,00h,06h,0Dh,1Ch,1Eh,1Eh,15h,1Eh,1Fh,7Fh,6Bh,BFh,F7h
	DB	3Ah,29h,1Eh,00h,B3h,30h,D1h,4Ah,CFh,49h,89h,9Fh,3Fh,7Fh,03h,FFh
	DB	D7h,3Fh,07h,00h,00h,01h,7Fh,E7h,C2h,E6h,BFh,BDh,EAh,1Eh,FEh,ADh
	DB	DFh,FFh,BEh,F8h,3Ch,F6h,FAh,3Dh,1Dh,9Dh,3Bh,FBh,FEh,BAh,F2h,FAh
	DB	7Eh,7Eh,BCh,BCh,00h,01h,7Eh,9Ah,3Dh,DFh,6Ah,D2h,DFh,EDh,B5h,DEh
	DB	E9h,EBh,5Fh,E7h,3Ch,CEh,26h,C3h,E7h,6Bh,EDh,1Fh,72h,A6h,CEh,D6h
	DB	7Ah,76h,B4h,BCh,F0h,50h,89h,07h,0Fh,FBh,FDh,FDh,BDh,D3h,FFh,FFh
	DB	FDh,FBh,FFh,3Fh,B4h,BCh,98h,80h,07h,00h,03h,80h,02h,00h,94h,CFh
	DB	AFh,76h,F9h,FFh,F5h,E3h,E3h,B3h,DFh,EFh,E5h,E3h,E5h,F3h,3Fh,ACh
	DB	B4h,98h,80h,07h,00h,03h,80h,02h,00h,00h

; Active RLE sprite resource dir#1A(id=1Dh) at CPU 886Dh (940B packed -> 0400h = 32 x 16x16
; patterns).
SPRITE_RES_DIR1A_886D:
	DB	8Dh,00h,07h,1Eh,3Fh,7Fh,FFh,E7h,CAh,91h,F3h,7Fh,3Fh,0Fh,03h,00h
	DB	87h,FFh,DFh,FEh,FEh,FBh,FBh,FDh,05h,FFh,91h,7Ch,7Fh,FFh,FFh,00h
	DB	07h,19h,20h,5Ch,BFh,FFh,FFh,FEh,CFh,67h,3Eh,0Fh,03h,00h,90h,FFh
	DB	32h,C5h,25h,0Ch,1Fh,97h,95h,B2h,3Bh,79h,FFh,5Bh,53h,A6h,BFh,04h
	DB	00h,03h,01h,02h,00h,82h,03h,07h,03h,0Fh,82h,07h,00h,08h,FFh,81h
	DB	7Fh,07h,FFh,04h,00h,03h,01h,02h,00h,82h,03h,07h,03h,0Fh,8Dh,07h
	DB	00h,DFh,CFh,A3h,A0h,38h,1Fh,0Fh,9Eh,7Ch,C1h,E3h,06h,FFh,9Ch,7Fh
	DB	3Fh,3Fh,6Fh,EFh,5Fh,FBh,3Bh,F7h,EFh,FEh,1Eh,CAh,67h,BFh,80h,70h
	DB	ECh,FEh,FFh,FFh,E7h,53h,89h,CFh,FEh,FCh,78h,03h,00h,9Dh,FFh,A4h
	DB	D0h,D2h,9Bh,7Bh,F3h,95h,E5h,CBh,93h,F6h,FAh,FEh,BDh,5Dh,80h,F0h
	DB	1Ch,82h,3Dh,7Eh,FEh,FFh,7Fh,F3h,E6h,FCh,78h,03h,00h,87h,FFh,F3h
	DB	C7h,07h,9Fh,FFh,3Fh,08h,FFh,83h,FCh,00h,00h,07h,80h,81h,C0h,04h
	DB	E0h,94h,C0h,00h,9Bh,BFh,FDh,FCh,78h,F0h,20h,C0h,C1h,C1h,63h,7Fh
	DB	3Bh,03h,87h,FCh,00h,00h,07h,80h,81h,C0h,04h,E0h,81h,C0h,04h,00h
	DB	96h,01h,07h,1Dh,3Eh,3Fh,7Fh,FFh,E7h,CAh,91h,F3h,7Fh,3Fh,00h,00h
	DB	7Fh,DFh,EEh,FEh,7Bh,BBh,FDh,05h,FFh,82h,FCh,7Fh,03h,00h,A3h,01h
	DB	06h,1Bh,21h,20h,5Eh,BFh,BFh,FFh,FEh,CFh,66h,3Fh,00h,00h,7Fh,B2h
	DB	15h,C5h,ACh,4Fh,07h,25h,A2h,B3h,B9h,7Fh,DBh,53h,1Ch,01h,01h,03h
	DB	07h,07h,03h,0Fh,81h,3Fh,04h,7Fh,82h,1Fh,00h,08h,FFh,81h,F8h,06h
	DB	FFh,B1h,7Fh,1Ch,01h,01h,02h,04h,04h,08h,08h,0Ch,3Fh,77h,63h,60h
	DB	70h,1Fh,00h,A6h,BFh,9Fh,CFh,63h,60h,38h,1Fh,78h,FFh,DFh,9Fh,3Fh
	DB	FFh,FFh,7Fh,00h,00h,FFh,7Eh,3Fh,3Fh,6Fh,EFh,5Fh,FBh,3Bh,F7h,EFh
	DB	FFh,1Eh,CAh,03h,00h,9Dh,E0h,98h,E4h,FEh,FEh,FFh,FFh,E7h,53h,89h
	DB	CFh,FEh,FCh,00h,00h,FFh,A5h,D0h,D2h,9Bh,7Bh,F3h,95h,E5h,CBh,93h
	DB	F7h,FAh,FEh,03h,00h,86h,E0h,78h,9Ch,02h,40h,BDh,03h,FEh,8Dh,7Fh
	DB	F3h,E6h,FCh,67h,BFh,FFh,F3h,C7h,07h,9Fh,FFh,0Fh,06h,FFh,87h,F0h
	DB	78h,80h,80h,C0h,E0h,E0h,03h,F0h,81h,FCh,04h,FEh,A1h,F8h,00h,BDh
	DB	5Dh,99h,BFh,FEh,FEh,7Ch,F8h,0Eh,FFh,FBh,F9h,FCh,FFh,FFh,F0h,78h
	DB	80h,80h,40h,20h,20h,10h,10h,30h,FCh,EEh,C6h,06h,0Eh,F8h,04h,00h
	DB	8Ch,07h,1Eh,3Fh,7Fh,FFh,E7h,CAh,91h,F3h,7Fh,3Fh,0Fh,03h,00h,87h
	DB	FFh,DFh,FEh,FEh,FBh,FBh,FDh,05h,FFh,82h,7Ch,7Fh,03h,00h,8Ch,07h
	DB	19h,20h,5Ch,BFh,FFh,FFh,FEh,CFh,67h,3Eh,0Fh,03h,00h,94h,FFh,32h
	DB	C5h,25h,0Ch,1Fh,97h,95h,B2h,3Bh,79h,FFh,5Bh,53h,00h,01h,01h,03h
	DB	07h,07h,03h,0Fh,81h,3Fh,04h,7Fh,82h,1Fh,00h,08h,FFh,81h,F8h,06h
	DB	FFh,B1h,7Fh,00h,01h,01h,02h,04h,04h,08h,08h,0Ch,3Fh,77h,63h,60h
	DB	70h,1Fh,00h,A6h,BFh,9Fh,CFh,63h,60h,38h,1Fh,78h,FFh,DFh,9Fh,3Fh
	DB	FFh,FFh,7Fh,00h,00h,F8h,7Fh,39h,3Eh,6Fh,EFh,5Fh,FBh,3Bh,F7h,EFh
	DB	FFh,1Fh,CBh,04h,00h,89h,80h,C0h,E0h,30h,D0h,F8h,C8h,F4h,FCh,03h
	DB	FEh,02h,00h,8Eh,F8h,A7h,D6h,D9h,98h,7Ah,F3h,95h,E5h,CAh,93h,F7h
	DB	FBh,FFh,04h,00h,95h,80h,40h,E0h,D0h,20h,98h,38h,CCh,84h,3Ah,7Ch
	DB	ECh,67h,BFh,FFh,F3h,C7h,07h,9Fh,FFh,0Fh,06h,FFh,87h,F0h,EEh,C2h
	DB	B1h,B9h,DDh,F7h,03h,F0h,81h,FCh,04h,FEh,A1h,F8h,00h,BDh,5Dh,99h
	DB	BFh,FEh,FEh,7Ch,F8h,0Eh,FFh,FBh,F9h,FCh,FFh,FFh,F0h,DEh,FEh,DFh
	DB	CFh,FBh,37h,10h,10h,30h,FCh,EEh,C6h,06h,0Eh,F8h,05h,00h,89h,01h
	DB	03h,07h,06h,0Fh,0Fh,1Fh,3Bh,3Dh,03h,7Fh,02h,00h,87h,0Fh,7Fh,9Eh
	DB	EEh,FBh,FBh,7Dh,05h,FFh,82h,FCh,FFh,04h,00h,A2h,01h,02h,07h,05h
	DB	08h,0Ch,12h,24h,22h,5Ch,7Eh,76h,00h,00h,0Fh,72h,E5h,1Dh,8Ch,4Fh
	DB	87h,05h,22h,B3h,F9h,7Fh,5Bh,D3h,77h,43h,9Fh,BBh,BFh,E7h,03h,0Fh
	DB	81h,3Fh,04h,7Fh,82h,1Fh,00h,08h,FFh,81h,F8h,06h,FFh,C0h,7Fh,7Bh
	DB	7Fh,F3h,E6h,FEh,E4h,08h,08h,0Ch,3Fh,77h,63h,60h,70h,1Fh,00h,A6h
	DB	BFh,9Fh,CFh,63h,60h,38h,1Fh,78h,FFh,DFh,9Fh,3Fh,FFh,FFh,7Fh,00h
	DB	00h,FFh,7Fh,3Fh,3Fh,6Fh,EFh,5Fh,FBh,3Bh,F7h,EFh,FEh,1Eh,CAh,00h
	DB	00h,80h,70h,ECh,FEh,FFh,FFh,E7h,53h,89h,CFh,FEh,FCh,78h,03h,00h
	DB	A7h,FFh,A4h,D0h,D2h,9Bh,7Bh,F3h,95h,E5h,CBh,93h,F6h,FAh,FEh,00h
	DB	00h,80h,F0h,1Ch,82h,3Dh,7Eh,FEh,FFh,7Fh,F3h,E6h,FCh,78h,00h,67h
	DB	BFh,FFh,F3h,C7h,07h,9Fh,FFh,0Fh,06h,FFh,87h,F0h,00h,80h,80h,C0h
	DB	E0h,E0h,03h,F0h,81h,FCh,04h,FEh,A2h,F8h,00h,BDh,5Dh,99h,BFh,FEh
	DB	FEh,7Ch,F8h,0Eh,FFh,FBh,F9h,FCh,FFh,FFh,F0h,00h,80h,80h,40h,20h
	DB	20h,10h,10h,30h,FCh,EEh,C6h,06h,0Eh,F8h,00h,00h

; Active RLE sprite resource dir#1B(id=1Ch) at CPU 8C19h (455B packed -> 0220h = 17 x 16x16
; patterns).
SPRITE_RES_DIR1B_8C19:
	DB	06h,00h,05h,01h,82h,03h,07h,03h,0Fh,84h,07h,1Bh,3Eh,6Eh,07h,FFh
	DB	85h,FAh,F6h,F6h,FEh,FFh,06h,00h,05h,01h,98h,03h,07h,09h,0Bh,0Bh
	DB	07h,1Eh,3Dh,75h,DEh,A7h,DEh,BFh,3Fh,5Fh,5Fh,97h,2Dh,6Dh,FDh,FBh
	DB	0Fh,07h,03h,04h,07h,81h,03h,08h,00h,93h,FEh,FFh,FFh,FBh,FFh,FFh
	DB	CFh,C7h,E7h,FFh,7Fh,7Fh,3Eh,1Fh,07h,00h,0Bh,05h,02h,03h,05h,82h
	DB	04h,03h,08h,00h,A0h,F1h,FBh,EFh,EFh,BFh,9Bh,B6h,FEh,FFh,E5h,6Eh
	DB	68h,39h,1Ch,07h,00h,F0h,3Ch,12h,1Dh,3Bh,FDh,F6h,FBh,EDh,EEh,B6h
	DB	B7h,DBh,DFh,DCh,E1h,04h,00h,02h,80h,9Ah,C0h,40h,40h,C0h,40h,40h
	DB	70h,C8h,A8h,E8h,F0h,FCh,FEh,FFh,D7h,BBh,FDh,F6h,DBh,FDh,EFh,EEh
	DB	B6h,B7h,BFh,7Fh,04h,00h,02h,80h,06h,C0h,9Eh,F0h,F8h,D8h,58h,C3h
	DB	EFh,7Ah,7Eh,7Ch,70h,20h,31h,F3h,DBh,FBh,1Fh,1Eh,FCh,F0h,00h,E8h
	DB	E8h,D0h,50h,50h,D0h,E0h,C0h,80h,80h,06h,00h,9Ah,3Fh,7Fh,FFh,ABh
	DB	BFh,AFh,DFh,CEh,6Ch,B4h,3Dh,EBh,EAh,1Ch,F0h,00h,58h,58h,70h,F0h
	DB	F0h,70h,60h,C0h,80h,80h,0Ch,00h,05h,01h,82h,03h,07h,03h,0Fh,84h
	DB	07h,1Bh,3Eh,6Eh,07h,FFh,85h,FAh,F6h,F6h,FEh,FFh,06h,00h,05h,01h
	DB	98h,03h,07h,09h,0Bh,0Bh,07h,1Eh,3Dh,75h,DEh,A7h,DEh,BFh,3Fh,5Fh
	DB	5Fh,97h,2Dh,6Dh,FDh,FBh,0Fh,07h,03h,04h,07h,81h,03h,08h,00h,88h
	DB	FEh,FFh,FFh,FBh,FFh,CFh,C7h,EFh,03h,FFh,88h,7Fh,7Eh,3Fh,1Fh,07h
	DB	0Bh,05h,02h,03h,05h,82h,04h,03h,08h,00h,A0h,F1h,F9h,EFh,EFh,9Fh
	DB	B2h,FEh,F7h,E8h,EFh,EBh,69h,7Dh,3Fh,1Ch,07h,F0h,3Ch,12h,1Dh,3Bh
	DB	FDh,F6h,FBh,EDh,EEh,B6h,B7h,DBh,DFh,DCh,E1h,04h,00h,02h,80h,9Ah
	DB	C0h,40h,40h,C0h,40h,40h,70h,C8h,A8h,E8h,F0h,FCh,FEh,FFh,D7h,BBh
	DB	FDh,F6h,DBh,FDh,EFh,EEh,B6h,B7h,BFh,7Fh,04h,00h,02h,80h,06h,C0h
	DB	8Dh,F0h,F8h,D8h,58h,C3h,CFh,FAh,7Eh,7Ch,20h,31h,F3h,CBh,03h,FFh
	DB	8Fh,1Fh,FEh,9Ch,F0h,E8h,E8h,D0h,50h,50h,D0h,E0h,C0h,C0h,80h,80h
	DB	05h,00h,9Bh,3Fh,7Fh,7Fh,ABh,BFh,DFh,CEh,7Ch,BCh,E8h,E8h,C9h,F3h
	DB	E2h,7Ch,F0h,58h,58h,70h,F0h,F0h,70h,60h,40h,C0h,80h,80h,0Bh,00h
	DB	83h,07h,3Fh,7Fh,04h,FFh,83h,7Fh,3Fh,07h,06h,00h,83h,E0h,FCh,FEh
	DB	04h,FFh,83h,FEh,FCh,E0h,00h

; Active RLE sprite resource dir#1C(id=1Fh) at CPU 8DE0h (706B packed -> 0300h = 24 x 16x16
; patterns).
SPRITE_RES_DIR1C_8DE0:
	DB	83h,03h,07h,06h,03h,0Fh,8Dh,1Fh,37h,27h,2Fh,6Fh,7Fh,5Fh,7Dh,77h
	DB	33h,C0h,30h,FDh,04h,FEh,F1h,DBh,EBh,F8h,EFh,FAh,FCh,FDh,FFh,FFh
	DB	03h,06h,05h,09h,09h,0Ah,1Ah,3Eh,3Eh,33h,71h,43h,7Fh,55h,6Bh,2Fh
	DB	C0h,F0h,FDh,87h,3Fh,FFh,FDh,FFh,D4h,57h,76h,77h,73h,7Eh,7Fh,BDh
	DB	3Bh,5Fh,EFh,BFh,5Fh,FFh,A3h,42h,01h,00h,01h,03h,06h,0Ch,0Ch,18h
	DB	FDh,FEh,7Fh,BFh,9Fh,9Fh,7Fh,BEh,7Fh,FEh,FFh,7Fh,3Fh,1Fh,1Fh,3Fh
	DB	35h,69h,FFh,D9h,70h,BEh,E3h,43h,01h,00h,01h,02h,05h,0Bh,0Bh,17h
	DB	BFh,BFh,5Bh,A7h,9Fh,9Fh,EAh,ADh,64h,B5h,33h,B8h,D4h,F8h,EEh,CFh
	DB	24h,33h,7Fh,67h,64h,7Fh,3Fh,1Eh,08h,00h,8Bh,FFh,FCh,FBh,FAh,FAh
	DB	FBh,F1h,57h,7Fh,3Fh,1Ch,05h,00h,88h,3Bh,2Ch,63h,5Bh,5Bh,40h,23h
	DB	1Eh,08h,00h,8Bh,19h,7Bh,CDh,1Eh,36h,65h,EFh,7Dh,56h,2Bh,1Ch,08h
	DB	00h,8Dh,C0h,FCh,FFh,FFh,B7h,27h,37h,EFh,BFh,7Fh,7Fh,FFh,FFh,05h
	DB	00h,82h,80h,E0h,03h,F0h,86h,F8h,FCh,FEh,E6h,E6h,F6h,03h,00h,85h
	DB	C0h,FCh,E3h,7Ch,7Fh,04h,DFh,84h,9Fh,FFh,FEh,7Eh,05h,00h,FFh,80h
	DB	60h,B0h,D0h,D0h,D8h,D4h,A6h,3Ah,DAh,8Ah,7Fh,FFh,FFh,FEh,FCh,FEh
	DB	7Eh,2Eh,3Eh,7Fh,FEh,FCh,FCh,F8h,F8h,FDh,FEh,FCh,F6h,E2h,72h,3Fh
	DB	3Fh,1Fh,33h,33h,E2h,66h,7Ch,74h,EEh,FAh,FDh,FDh,FBh,B2h,CCh,FEh
	DB	FAh,DAh,F2h,F3h,C5h,0Fh,7Bh,17h,37h,F3h,C2h,E4h,CAh,DEh,4Eh,21h
	DB	31h,19h,2Dh,2Dh,FEh,DAh,DCh,FCh,FAh,B6h,9Fh,8Fh,07h,EFh,9Fh,7Bh
	DB	3Fh,9Eh,99h,18h,1Ch,3Dh,7Dh,7Fh,2Eh,04h,74h,BEh,FAh,14h,B0h,E0h
	DB	80h,00h,00h,80h,80h,40h,40h,C0h,80h,00h,91h,89h,06h,EFh,FBh,6Dh
	DB	37h,92h,97h,17h,13h,22h,4Fh,59h,2Ah,04h,DCh,FAh,FEh,F4h,8Bh,50h
	DB	E0h,80h,00h,00h,80h,80h,C0h,C0h,40h,80h,06h,00h,82h,01h,07h,03h
	DB	0Fh,86h,1Fh,3Fh,7Fh,7Fh,67h,67h,03h,00h,82h,03h,3Fh,03h,FFh,85h
	DB	EDh,F5h,FCh,F7h,FDh,03h,FEh,05h,00h,8Bh,01h,06h,0Dh,0Bh,0Bh,1Bh
	DB	2Bh,65h,44h,5Bh,59h,03h,00h,9Dh,03h,3Fh,C7h,3Fh,FEh,FFh,EAh,EBh
	DB	FBh,FBh,F9h,7Dh,7Fh,77h,3Fh,77h,67h,66h,FCh,FCh,98h,8Ch,C4h,47h
	DB	67h,3Fh,2Fh,77h,5Fh,03h,FFh,81h,7Fh,03h,3Fh,81h,7Fh,03h,FFh,ADh
	DB	BFh,3Fh,3Fh,1Fh,8Fh,4Bh,27h,4Bh,5Bh,5Ah,84h,8Ch,F8h,F4h,BCh,7Fh
	DB	5Bh,3Ah,3Eh,5Fh,6Dh,BFh,BEh,DFh,4Dh,33h,3Fh,2Eh,6Ch,E7h,B6h,31h
	DB	78h,F6h,D8h,EEh,FFh,2Eh,7Dh,57h,3Bh,1Fh,19h,0Fh,07h,08h,00h,04h
	DB	FDh,85h,F8h,FFh,BFh,1Fh,0Fh,07h,00h,88h,3Bh,5Fh,7Fh,34h,19h,16h
	DB	09h,07h,08h,00h,89h,9Ah,BBh,33h,72h,E7h,E2h,A9h,14h,0Fh,07h,00h
	DB	84h,03h,0Ch,3Fh,FFh,04h,7Fh,8Bh,DBh,93h,1Bh,F7h,5Fh,3Fh,3Fh,BFh
	DB	C0h,E0h,60h,03h,F0h,ADh,F8h,ECh,E4h,F4h,F6h,FEh,FAh,BEh,EEh,CCh
	DB	03h,0Fh,3Fh,E1h,DCh,FFh,FFh,BFh,BFh,6Eh,EEh,6Eh,EEh,CEh,DEh,FDh
	DB	C0h,60h,A0h,90h,90h,50h,58h,7Ch,7Ch,CCh,8Eh,C2h,FEh,AAh,D6h,F4h
	DB	FFh,7Fh,FEh,03h,FDh,87h,2Eh,BFh,3Fh,BDh,FDh,FCh,F8h,03h,FCh,88h
	DB	DCh,FAh,F7h,FDh,FAh,FFh,C5h,42h,05h,80h,03h,40h,98h,7Dh,BDh,FAh
	DB	E5h,FDh,BDh,DBh,5Bh,F3h,77h,E7h,0Fh,3Fh,1Bh,33h,F3h,ACh,96h,FFh
	DB	9Bh,0Eh,7Dh,C7h,C2h,05h,80h,03h,C0h,8Dh,BEh,3Eh,5Eh,BEh,9Eh,9Fh
	DB	DFh,BDh,39h,7Ah,FAh,FFh,1Eh,03h,00h,02h,20h,85h,60h,E0h,60h,C0h
	DB	C0h,05h,80h,04h,00h,8Dh,B9h,39h,7Dh,ADh,9Fh,96h,53h,A3h,27h,47h
	DB	97h,E5h,1Eh,03h,00h,02h,E0h,85h,A0h,60h,A0h,40h,C0h,05h,80h,04h
	DB	00h,00h

; Active RLE sprite resource dir#1D(id=20h) at CPU 90A2h (758B packed -> 0300h = 24 x 16x16
; patterns).
SPRITE_RES_DIR1D_90A2:
	DB	02h,00h,BBh,0Eh,13h,25h,2Bh,37h,2Eh,5Dh,77h,EDh,DFh,B1h,6Ch,E7h
	DB	B8h,01h,33h,5Bh,4Fh,4Bh,98h,53h,F4h,DBh,57h,97h,DDh,F9h,FDh,E5h
	DB	C6h,00h,00h,0Eh,1Dh,3Bh,36h,3Dh,3Eh,65h,4Eh,9Dh,BFh,FFh,73h,BFh
	DB	CFh,01h,32h,6Ah,75h,76h,EFh,7Fh,BFh,7Ch,BEh,FEh,FBh,BEh,03h,FFh
	DB	D9h,75h,2Fh,16h,21h,2Fh,37h,3Dh,7Eh,55h,2Eh,25h,5Ah,CDh,F5h,BDh
	DB	7Ah,4Bh,66h,B5h,BBh,DFh,FEh,5Fh,24h,19h,BCh,DFh,7Ch,F8h,F0h,B8h
	DB	E8h,7Bh,3Eh,19h,3Fh,3Eh,39h,23h,56h,6Bh,31h,3Ah,7Dh,BFh,8Eh,D6h
	DB	5Bh,F7h,FBh,FEh,DDh,E2h,FDh,7Bh,3Fh,1Eh,B7h,FBh,F7h,2Fh,7Fh,DFh
	DB	BFh,59h,33h,03h,05h,0Ah,0Bh,0Ch,16h,31h,72h,F9h,BFh,FDh,BBh,7Fh
	DB	03h,FFh,7Fh,7Eh,DFh,6Fh,77h,BBh,7Dh,7Eh,07h,FFh,97h,69h,33h,03h
	DB	07h,0Dh,0Ch,0Fh,1Fh,3Eh,7Dh,EFh,C3h,83h,C7h,7Fh,03h,5Fh,CFh,E6h
	DB	F3h,F9h,FCh,FEh,09h,FFh,FFh,00h,98h,ACh,DDh,CCh,6Eh,B4h,5Eh,B7h
	DB	D5h,D3h,77h,3Fh,6Eh,43h,D9h,70h,C8h,A4h,D4h,ECh,74h,3Ah,2Eh,37h
	DB	FBh,9Dh,F2h,ACh,D6h,F3h,CEh,00h,98h,B4h,65h,B4h,B2h,DCh,FAh,7Dh
	DB	FAh,FFh,BFh,FBh,FFh,FFh,E7h,70h,B8h,DCh,6Ch,BCh,7Ch,26h,32h,39h
	DB	CDh,E3h,FEh,DCh,EEh,FDh,FAh,BAh,96h,4Dh,BDh,F6h,FDh,7Ch,B9h,79h
	DB	76h,FDh,5Eh,31h,2Ah,1Eh,36h,BCh,94h,F4h,7Ch,8Ch,76h,BEh,67h,7Dh
	DB	F7h,AFh,7Dh,DEh,96h,BBh,FFh,C7h,EFh,FBh,77h,8Fh,7Dh,B4h,C9h,F9h
	DB	DFh,BEh,F1h,EFh,FDh,F9h,FDh,CCh,ECh,7Ch,8Ch,F4h,FEh,CEh,9Fh,97h
	DB	2Dh,5Dh,BBh,52h,9Ah,A5h,8Dh,D9h,E3h,79h,3Fh,1Fh,89h,8Ch,FEh,F9h
	DB	F0h,73h,F9h,FEh,03h,FFh,8Ah,F0h,EDh,CEh,FAh,ACh,B0h,50h,50h,38h
	DB	FEh,03h,FFh,8Fh,FEh,F8h,C0h,00h,FEh,7Fh,3Fh,1Fh,8Fh,8Fh,7Fh,3Fh
	DB	BFh,BFh,FEh,04h,FFh,FFh,F0h,EBh,CAh,F6h,ECh,F0h,B0h,B0h,F8h,FEh
	DB	BFh,1Fh,3Fh,FEh,F8h,C0h,00h,0Eh,13h,25h,2Bh,37h,2Eh,5Ch,74h,EEh
	DB	DFh,A7h,53h,2Fh,31h,6Ch,E5h,00h,00h,01h,B3h,DBh,4Fh,4Bh,98h,53h
	DB	F4h,DBh,57h,97h,DDh,F9h,FDh,0Eh,1Dh,3Bh,36h,3Dh,3Eh,64h,4Ch,9Eh
	DB	B3h,D9h,6Eh,3Fh,3Fh,73h,BBh,00h,00h,01h,B2h,EAh,75h,76h,EFh,7Fh
	DB	BFh,7Ch,BEh,FEh,FBh,BEh,FFh,BBh,5Ch,37h,2Fh,63h,76h,FDh,D2h,B5h
	DB	9Eh,AFh,5Bh,5Bh,69h,DDh,FFh,A6h,C3h,49h,6Eh,75h,FBh,BEh,FFh,F6h
	DB	E5h,7Ch,9Fh,2Ch,B8h,74h,AEh,C7h,7Fh,3Ah,32h,7Eh,7Dh,DBh,BFh,DEh
	DB	DDh,DDh,6Ah,6Ah,59h,ABh,A5h,9Bh,FFh,FFh,F7h,F3h,FEh,DDh,E3h,7Dh
	DB	3Bh,3Eh,F7h,FBh,DFh,4Fh,8Fh,D7h,B6h,75h,58h,38h,15h,2Ah,2Dh,32h
	DB	1Ch,37h,63h,77h,7Fh,3Fh,07h,00h,D1h,EEh,EFh,ADh,77h,CFh,FFh,7Bh
	DB	7Eh,06h,FFh,9Ch,3Fh,D7h,57h,6Fh,3Fh,1Eh,37h,33h,3Fh,1Fh,3Fh,7Ch
	DB	79h,7Fh,3Fh,07h,00h,EFh,F9h,F3h,F6h,FDh,CAh,FAh,FFh,BFh,3Fh,7Fh
	DB	04h,FFh,81h,3Fh,03h,00h,8Dh,98h,ACh,DCh,CDh,6Eh,B4h,5Eh,B7h,D5h
	DB	D3h,77h,3Fh,6Fh,03h,00h,8Dh,70h,C8h,A4h,D4h,ECh,7Ah,3Eh,6Dh,FBh
	DB	A7h,79h,D6h,FAh,03h,00h,8Dh,98h,B4h,64h,B5h,B2h,DCh,FAh,7Dh,FAh
	DB	FFh,BFh,FBh,FFh,03h,00h,FFh,70h,B8h,DCh,6Ch,BCh,76h,22h,73h,FFh
	DB	DDh,FFh,EEh,7Eh,C3h,99h,3Bh,97h,4Fh,BFh,FFh,F1h,DCh,76h,5Ah,FFh
	DB	7Fh,2Eh,11h,1Ah,7Eh,C6h,7Fh,BBh,DFh,7Fh,EDh,92h,ACh,5Ch,7Ch,B6h
	DB	B7h,ADh,3Dh,BEh,FFh,E7h,C7h,EFh,FBh,77h,8Ch,7Eh,B7h,FBh,FFh,BFh
	DB	DEh,FDh,FFh,FFh,86h,FAh,FDh,E7h,E5h,49h,93h,6Eh,7Ch,BCh,F4h,AAh
	DB	B9h,B3h,2Bh,BAh,3Dh,F8h,B8h,F0h,D8h,CDh,FFh,FEh,FEh,7Fh,BFh,DFh
	DB	EFh,F7h,FBh,FFh,5Ah,CCh,C0h,A0h,70h,30h,98h,E8h,1Ch,0Eh,97h,CDh
	DB	BFh,DDh,FEh,C0h,FEh,FFh,B7h,7Fh,DFh,CFh,7Fh,3Fh,9Fh,CFh,E7h,F3h
	DB	F9h,FDh,FDh,FFh,D6h,4Ch,8Eh,40h,E0h,90h,D0h,F8h,F8h,ECh,FEh,FFh
	DB	F3h,C1h,E3h,FEh,C0h,00h

; Active RLE sprite resource dir#1F(id=24h) at CPU 9398h (79B packed -> 0080h = 4 x 16x16
; patterns).
SPRITE_RES_DIR1F_9398:
	DB	81h,00h,0Ah,01h,82h,05h,01h,03h,03h,81h,80h,0Ah,C0h,85h,C4h,C0h
	DB	E0h,E0h,E4h,11h,00h,0Fh,80h,82h,0Bh,03h,03h,07h,84h,17h,0Eh,0Eh
	DB	1Eh,03h,1Ch,8Dh,1Eh,0Eh,0Fh,03h,E0h,E8h,70h,70h,74h,70h,38h,38h
	DB	3Ch,03h,1Ch,84h,3Ch,38h,F8h,E0h,05h,01h,03h,03h,04h,07h,02h,03h
	DB	82h,01h,00h,05h,C0h,03h,E0h,04h,F0h,02h,E0h,82h,C0h,00h,00h

; Active RLE sprite resource dir#21(id=23h) at CPU 93E7h (66B packed -> 0040h = 2 x 16x16
; patterns).
SPRITE_RES_DIR21_93E7:
	DB	86h,00h,01h,07h,0Fh,1Fh,1Fh,03h,3Fh,02h,1Fh,83h,0Fh,07h,01h,03h
	DB	00h,8Dh,C0h,F0h,F8h,9Ch,8Ch,CEh,FEh,FEh,FCh,FCh,F8h,F0h,C0h,03h
	DB	00h,85h,01h,07h,0Eh,1Ch,18h,03h,38h,85h,1Ch,1Eh,0Fh,07h,01h,03h
	DB	00h,8Fh,C0h,30h,08h,64h,74h,32h,02h,06h,04h,0Ch,18h,F0h,C0h,00h
	DB	00h,00h

; Active RLE sprite resource dir#20(id=22h) at CPU 9429h (62B packed -> 0040h = 2 x 16x16
; patterns).
SPRITE_RES_DIR20_9429:
	DB	81h,10h,03h,38h,84h,7Ch,FEh,6Ch,68h,04h,64h,02h,68h,83h,50h,20h
	DB	08h,03h,1Ch,84h,3Eh,7Fh,36h,34h,04h,32h,02h,34h,8Ah,28h,10h,10h
	DB	28h,28h,38h,44h,BAh,7Ch,58h,04h,5Ch,02h,58h,8Ah,70h,20h,08h,14h
	DB	14h,1Ch,22h,5Dh,3Eh,2Ch,04h,2Eh,02h,2Ch,82h,38h,10h,00h

; Active RLE sprite resource dir#22(id=29h) at CPU 9467h (61B packed -> 0040h = 2 x 16x16
; patterns).
SPRITE_RES_DIR22_9467:
	DB	9Fh,00h,0Bh,13h,17h,1Fh,5Fh,5Fh,7Eh,3Fh,3Fh,0Fh,27h,1Fh,00h,03h
	DB	00h,E0h,80h,FCh,F2h,F8h,FEh,7Eh,3Fh,7Dh,FDh,FCh,F4h,E4h,E8h,80h
	DB	03h,00h,8Ah,01h,02h,02h,0Bh,0Bh,07h,13h,0Fh,00h,03h,07h,00h,8Ah
	DB	60h,80h,F8h,E4h,F0h,E8h,E8h,A0h,20h,40h,03h,00h,00h

; Active RLE sprite resource dir#23(id=25h) at CPU 94A4h (66B packed -> 0040h = 2 x 16x16
; patterns).
SPRITE_RES_DIR23_94A4:
	DB	C0h,00h,01h,1Dh,1Bh,1Dh,0Fh,3Fh,7Fh,3Fh,0Fh,1Fh,1Fh,1Dh,01h,00h
	DB	00h,80h,C0h,DCh,F4h,FCh,F8h,FEh,7Fh,FEh,E8h,F4h,FCh,DCh,C0h,80h
	DB	00h,00h,01h,1Dh,16h,13h,09h,3Fh,4Eh,3Eh,0Bh,17h,1Fh,1Dh,01h,00h
	DB	00h,80h,40h,DCh,3Ch,74h,68h,F6h,C5h,46h,B8h,ECh,F4h,5Ch,40h,80h
	DB	00h,00h

; Active RLE sprite resource dir#24(id=26h) at CPU 94E6h (66B packed -> 0040h = 2 x 16x16
; patterns).
SPRITE_RES_DIR24_94E6:
	DB	89h,07h,3Ch,6Bh,76h,7Ah,3Ch,1Bh,03h,01h,03h,00h,88h,20h,1Fh,0Eh
	DB	03h,C0h,70h,F8h,04h,03h,00h,A9h,80h,C0h,D8h,3Ch,5Eh,6Eh,D6h,3Ch
	DB	E0h,00h,00h,10h,20h,60h,60h,E0h,A1h,A3h,BBh,D4h,6Eh,5Eh,7Ch,38h
	DB	00h,00h,1Ch,3Eh,7Ah,76h,2Bh,DDh,C5h,85h,07h,06h,06h,04h,08h,00h
	DB	00h,00h

; Active RLE sprite resource dir#25(id=27h)/dir#26(id=28h) at CPU 9528h (65B packed -> 0040h
; = 2 x 16x16 patterns).
SPRITE_RES_DIR25_DIR26_9528:
	DB	8Eh,08h,18h,28h,28h,24h,13h,06h,04h,04h,06h,0Bh,F0h,44h,38h,04h
	DB	00h,AEh,1Ch,22h,0Fh,D0h,60h,A0h,20h,60h,C8h,24h,14h,14h,18h,10h
	DB	00h,01h,02h,02h,80h,C3h,A6h,BCh,44h,36h,03h,01h,01h,02h,05h,0Fh
	DB	F0h,20h,C0h,80h,80h,C0h,6Ch,A6h,3Bh,65h,C3h,01h,40h,C0h,80h,00h
	DB	00h

; Active RLE sprite resource dir#1E(id=21h) at CPU 9569h (103B packed -> 0080h = 4 x 16x16
; patterns).
SPRITE_RES_DIR1E_9569:
	DB	A0h,00h,02h,02h,04h,04h,02h,0Bh,0Bh,07h,07h,0Fh,0Dh,0Fh,0Fh,07h
	DB	01h,80h,40h,80h,90h,D0h,48h,68h,68h,F0h,F0h,F8h,D8h,F8h,78h,F0h
	DB	C0h,09h,00h,85h,02h,00h,02h,02h,01h,0Ah,00h,86h,40h,00h,60h,20h
	DB	E0h,C0h,03h,00h,87h,01h,04h,00h,05h,0Bh,0Bh,0Dh,03h,07h,02h,0Fh
	DB	8Bh,0Eh,07h,01h,20h,00h,A0h,B0h,90h,30h,60h,E8h,03h,F0h,85h,F8h
	DB	D8h,B8h,F0h,C0h,09h,00h,85h,01h,02h,02h,03h,01h,0Bh,00h,02h,20h
	DB	02h,60h,83h,C0h,00h,00h,00h
	IF	HINOTORI_ENHANCED

BANK08_ENHANCED_SPRITE_PADDING_FF:
	DS	95D0h - $,FFh
	ENDIF

; Bird/tablet message-box border frame (638Ah) 2bpp tiles (95D0h-98BFh, 47 x 16B = 752B ->
; dst=01h..2Fh; command 638Dh reads 48 tiles 95D0h-98CFh into dst=01h..30h, with tile 48 at
; 98C0h-98CFh immediately reloaded into dst=30h by command 6393h).
BIRD_MESSAGE_FRAME_TILES_2BPP_95D0:
	DB	02h,02h,04h,04h,0Ch,0Ch,08h,09h,19h,1Bh,11h,13h,32h,36h,26h,2Eh
	DB	21h,21h,44h,44h,88h,88h,90h,90h,00h,20h,22h,22h,04h,44h,4Ch,C8h
	DB	00h,00h,00h,00h,00h,00h,00h,00h,80h,80h,00h,00h,00h,00h,00h,00h
	DB	00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,03h,00h,03h,00h
	DB	00h,00h,06h,00h,16h,00h,38h,00h,D0h,00h,C0h,00h,00h,00h,00h,00h
	DB	00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,01h,01h
	DB	00h,00h,03h,03h,06h,06h,1Ch,1Ch,30h,30h,60h,60h,C0h,C0h,80h,80h
	DB	78h,78h,C0h,C0h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
	DB	00h,00h,00h,00h,02h,02h,04h,04h,08h,08h,08h,08h,10h,10h,10h,10h
	DB	00h,00h,00h,00h,00h,00h,00h,00h,18h,18h,07h,07h,F0h,30h,3Ch,0Ch
	DB	00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,E0h,E0h,18h,18h
	DB	00h,00h,00h,00h,01h,01h,01h,01h,03h,03h,07h,07h,06h,06h,0Dh,0Dh
	DB	64h,6Dh,C8h,D9h,99h,BBh,92h,B6h,25h,6Dh,5Bh,5Ah,B7h,F4h,6Eh,F8h
	DB	98h,90h,30h,20h,62h,40h,C0h,80h,C8h,00h,90h,00h,20h,00h,41h,00h
	DB	00h,00h,00h,00h,01h,00h,0Bh,00h,1Dh,00h,68h,00h,60h,00h,80h,00h
	DB	0Ch,00h,2Ch,00h,70h,00h,A0h,00h,00h,00h,00h,00h,00h,00h,1Fh,1Fh
	DB	00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,01h,01h,7Eh,7Eh,80h,80h
	DB	03h,03h,06h,06h,0Ch,0Ch,18h,18h,70h,70h,C0h,C0h,00h,00h,00h,00h
	DB	00h,00h,00h,00h,00h,00h,00h,00h,01h,01h,0Bh,03h,32h,02h,36h,06h
	DB	20h,20h,60h,60h,C6h,C0h,96h,80h,38h,00h,50h,00h,80h,00h,02h,02h
	DB	0Fh,03h,C3h,C0h,30h,30h,0Ch,0Eh,02h,03h,00h,00h,00h,00h,00h,00h
	DB	86h,86h,E1h,71h,F8h,0Ch,3Eh,03h,0Fh,80h,87h,E0h,23h,38h,09h,0Eh
	DB	61h,00h,18h,80h,46h,60h,21h,38h,9Ah,9Ch,C7h,66h,FFh,00h,FFh,00h
	DB	00h,00h,00h,00h,40h,00h,A0h,00h,50h,00h,A8h,00h,D4h,00h,EAh,00h
	DB	00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,01h,01h,03h,03h,07h,07h
	DB	1Ah,1Fh,37h,3Fh,6Fh,7Fh,FEh,FFh,FDh,FFh,FBh,FEh,F7h,FDh,FFh,FAh
	DB	DCh,F0h,B9h,E0h,72h,C0h,ECh,80h,D9h,00h,F3h,00h,CEh,00h,BCh,00h
	DB	89h,00h,06h,00h,26h,00h,58h,00h,98h,00h,23h,03h,44h,44h,90h,90h
	DB	80h,00h,03h,03h,0Ch,0Ch,30h,30h,C0h,C0h,00h,00h,00h,00h,02h,00h
	DB	E0h,E0h,00h,00h,00h,00h,00h,00h,00h,00h,18h,00h,5Eh,00h,E1h,00h
	DB	00h,00h,00h,00h,01h,00h,0Bh,00h,1Dh,00h,68h,00h,60h,00h,9Ah,00h
	DB	00h,00h,00h,00h,20h,00h,F5h,00h,2Eh,00h,04h,00h,08h,00h,5Dh,00h
	DB	00h,00h,02h,00h,97h,00h,FAh,00h,91h,01h,06h,06h,0Ch,0Ch,30h,30h
	DB	CCh,0Ch,D8h,18h,30h,30h,61h,61h,83h,83h,04h,04h,0Ah,08h,17h,00h
	DB	0Ch,0Ch,38h,38h,60h,60h,80h,80h,00h,00h,C0h,00h,C0h,00h,00h,00h
	DB	7Fh,8Ch,9Fh,EEh,EFh,F7h,FBh,FFh,7Fh,6Fh,3Fh,31h,0Fh,08h,03h,00h
	DB	FDh,00h,FFh,80h,FFh,60h,BFh,F8h,FFh,FFh,EDh,FFh,FFh,3Fh,FEh,00h
	DB	00h,00h,00h,80h,80h,C0h,C0h,60h,E1h,FDh,F2h,F3h,85h,A7h,1Bh,5Fh
	DB	0Bh,0Fh,1Fh,1Fh,6Fh,7Fh,BFh,FEh,7Fh,FCh,FFh,F0h,FEh,C0h,FDh,00h
	DB	FFh,E0h,FEh,D0h,FFh,80h,FFh,40h,FDh,03h,B6h,0Eh,DDh,3Dh,3Fh,FFh
	DB	73h,03h,CCh,0Ch,B3h,33h,6Ch,ECh,91h,99h,62h,72h,84h,E4h,1Ah,9Ah
	DB	40h,40h,85h,80h,0Eh,00h,34h,00h,30h,00h,C7h,07h,D0h,10h,65h,40h
	DB	97h,00h,FAh,00h,90h,00h,0Fh,0Eh,F1h,F0h,16h,00h,BEh,00h,D0h,00h
	DB	45h,00h,2Eh,00h,74h,00h,AEh,0Eh,81h,01h,00h,00h,03h,03h,0Ch,0Ch
	DB	DFh,00h,02h,00h,00h,00h,1Fh,1Fh,E0h,E0h,9Ch,9Ch,03h,03h,00h,00h
	DB	EBh,00h,40h,00h,03h,03h,FCh,FCh,00h,00h,00h,00h,FFh,FFh,00h,00h
	DB	64h,60h,CFh,C0h,04h,00h,04h,04h,30h,30h,C0h,C0h,00h,00h,01h,01h

; Bird/tablet message-box border frame (638Ah) 2bpp tiles (98C0h-9A0Fh, 21 x 16B = 336B ->
; dst=30h..44h, with first tile 98C0h-98CFh shared with end of 638Dh).
BIRD_MESSAGE_FRAME_TILES_2BPP_98C0:
	DB	BAh,00h,D0h,00h,80h,00h,00h,00h,00h,00h,1Dh,1Dh,70h,70h,C0h,C0h
	DB	00h,00h,00h,00h,7Fh,40h,7Fh,60h,00h,00h,00h,00h,00h,00h,00h,00h
	DB	F0h,01h,06h,0Eh,FDh,F9h,FAh,03h,07h,03h,07h,04h,03h,03h,00h,00h
	DB	2Fh,BFh,7Fh,7Eh,BFh,FCh,FFh,F8h,FFh,F0h,FFh,C0h,FFh,FCh,0Fh,0Fh
	DB	F1h,07h,F7h,0Fh,EEh,1Fh,FCh,1Fh,F9h,1Ch,FFh,00h,FDh,00h,FBh,C0h
	DB	9Ch,DEh,B9h,F9h,36h,B7h,F8h,7Ch,63h,73h,8Ch,EEh,F0h,78h,C1h,01h
	DB	65h,64h,8Bh,88h,31h,30h,C6h,C6h,48h,00h,FDh,00h,4Bh,00h,01h,00h
	DB	7Eh,00h,A4h,00h,00h,00h,7Fh,7Fh,00h,00h,00h,00h,B1h,01h,0Eh,0Eh
	DB	80h,00h,00h,00h,03h,03h,CCh,CCh,19h,19h,60h,60h,80h,80h,52h,00h
	DB	30h,30h,C0h,C0h,00h,00h,00h,00h,E0h,E0h,1Fh,1Fh,00h,00h,00h,00h
	DB	00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,FFh,FFh,00h,00h
	DB	00h,00h,00h,00h,00h,00h,00h,00h,03h,03h,7Ch,7Ch,80h,80h,00h,00h
	DB	03h,03h,0Eh,0Eh,18h,18h,60h,60h,80h,80h,00h,00h,02h,00h,07h,00h
	DB	00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,C0h,00h,C0h,00h,00h,00h
	DB	C0h,C0h,3Fh,3Fh,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
	DB	70h,70h,80h,80h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
	DB	BFh,00h,12h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
	DB	48h,00h,FDh,00h,4Bh,00h,01h,00h,00h,00h,00h,00h,00h,00h,00h,00h
	DB	04h,00h,2Eh,00h,F5h,00h,20h,00h,00h,00h,00h,00h,00h,00h,00h,00h
	DB	00h,00h,90h,00h,FAh,00h,97h,00h,02h,00h,00h,00h,00h,00h,00h,00h
	DB	1Ah,00h,58h,00h,E0h,00h,40h,00h,00h,00h,00h,00h,00h,00h,00h,00h

; Bird/tablet message-box border frame (638Ah) 2bpp accent tiles (9A10h-9A2Fh, 2 x 16B = 32B
; -> dst=45h..46h, colors 0/D/B/C).
BIRD_MESSAGE_FRAME_TILES_2BPP_9A10:
	DB	07h,07h,03h,03h,01h,01h,00h,00h,00h,00h,04h,00h,16h,00h,1Fh,00h
	DB	30h,00h,E6h,06h,4Fh,0Bh,DBh,13h,52h,12h,0Ch,0Ch,60h,60h,40h,40h

; Shared stone/inventory UI base graphics (63A3h cmd 63EBh, VRAM D800h) raw-4bpp tiles
; (9A30h-9DAFh, 28 x 32B = 896B -> dst=80h..9Bh; command 63EBh reads 32 tiles 9A30h-9E2Fh,
; overlapping the first 4 tiles 9DB0h-9E2Fh of command 63F1h).
STONE_INVENTORY_UI_TILES_4BPP_9A30:
	DB	00h,00h,00h,00h,00h,00h,0Fh,FFh,00h,00h,FEh,EEh,00h,0Fh,EEh,EEh
	DB	00h,AAh,EEh,EEh,0Fh,EAh,EEh,EEh,F6h,EAh,AAh,A9h,FEh,AAh,EAh,AFh
	DB	00h,00h,00h,00h,F0h,00h,00h,00h,EFh,00h,00h,00h,EEh,FFh,F0h,00h
	DB	EFh,EEh,EFh,00h,FEh,EEh,EEh,F0h,FEh,EEh,EEh,F0h,9Eh,EEh,EEh,EFh
	DB	00h,00h,00h,0Fh,00h,00h,00h,FAh,00h,00h,0Fh,AAh,0Fh,F0h,0Fh,AAh
	DB	FAh,AAh,FFh,AAh,0Fh,AAh,AAh,FAh,00h,FAh,AAh,AAh,00h,0Fh,FAh,AAh
	DB	F0h,00h,00h,00h,AFh,00h,00h,00h,AAh,F0h,00h,00h,AAh,F0h,0Fh,F0h
	DB	AAh,FFh,AAh,AFh,AFh,AAh,AAh,F0h,AAh,AAh,AFh,00h,AAh,AFh,F0h,00h
	DB	00h,00h,00h,FFh,00h,00h,FFh,66h,00h,0Fh,96h,FFh,00h,0Fh,96h,FFh
	DB	00h,00h,F9h,66h,00h,FFh,6Fh,FFh,00h,F6h,99h,FFh,0Fh,66h,99h,99h
	DB	FFh,00h,00h,00h,66h,FFh,00h,00h,FFh,66h,F0h,00h,FFh,66h,F0h,00h
	DB	66h,FFh,00h,00h,FFh,F6h,FFh,00h,FFh,96h,6Fh,00h,99h,66h,66h,F0h
	DB	00h,00h,0Fh,F0h,00h,00h,00h,0Fh,00h,00h,00h,F8h,00h,00h,0Fh,FFh
	DB	00h,00h,FFh,AAh,00h,0Fh,AAh,FFh,00h,0Fh,AAh,FAh,00h,FAh,AAh,AAh
	DB	00h,FFh,00h,00h,0Fh,00h,00h,00h,F8h,F0h,00h,00h,FFh,8Fh,00h,00h
	DB	AAh,AFh,F0h,00h,AFh,8Ah,AFh,00h,AAh,8Eh,AFh,00h,AAh,AEh,EAh,F0h
	DB	00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,0Fh
	DB	00h,00h,FFh,FFh,00h,FFh,99h,99h,0Fh,99h,66h,C6h,0Fh,96h,CCh,C6h
	DB	00h,00h,FFh,F0h,0Fh,FFh,F6h,FFh,F9h,66h,96h,6Fh,96h,C6h,69h,FFh
	DB	99h,66h,99h,F0h,AAh,99h,99h,F0h,69h,A9h,99h,F0h,66h,AFh,9Fh,00h
	DB	00h,FFh,FFh,FFh,0Fh,EEh,EEh,EEh,F9h,66h,66h,66h,F6h,66h,66h,66h
	DB	F6h,66h,66h,66h,F6h,66h,66h,66h,F6h,66h,66h,66h,F9h,66h,66h,66h
	DB	FFh,FFh,FFh,00h,EEh,EEh,EEh,F0h,66h,66h,66h,6Fh,66h,66h,66h,6Fh
	DB	66h,66h,66h,9Fh,66h,66h,69h,9Fh,66h,66h,66h,6Fh,66h,66h,66h,6Fh
	DB	00h,00h,00h,0Fh,00h,00h,0Fh,FFh,00h,00h,F6h,F6h,00h,0Fh,6Fh,6Eh
	DB	00h,0Fh,6Fh,66h,00h,FFh,F9h,66h,00h,F6h,F9h,99h,0Fh,F6h,F9h,FFh
	DB	FFh,F0h,00h,00h,FEh,EFh,FFh,00h,6Fh,99h,F6h,F0h,CFh,6Eh,CFh,6Fh
	DB	EFh,96h,EFh,6Fh,FFh,F9h,6Fh,EFh,FEh,EFh,9Fh,EFh,6Eh,CEh,FFh,EFh
	DB	06h,66h,66h,66h,6Eh,EEh,EEh,EEh,6Eh,66h,66h,66h,6Eh,66h,66h,66h
	DB	6Eh,66h,66h,66h,6Eh,66h,66h,66h,6Eh,66h,66h,66h,6Eh,66h,66h,66h
	DB	66h,66h,66h,60h,EEh,EEh,EEh,9Fh,66h,66h,66h,9Fh,66h,66h,66h,9Fh
	DB	66h,66h,66h,9Fh,66h,66h,66h,9Fh,66h,66h,66h,9Fh,66h,66h,66h,9Fh
	DB	00h,00h,00h,FFh,00h,00h,FFh,EEh,00h,FFh,EAh,EEh,FFh,EEh,EEh,AEh
	DB	F9h,EEh,EEh,EAh,F9h,9Eh,EAh,AAh,F9h,99h,EAh,EAh,0Fh,99h,9Eh,AAh
	DB	F0h,00h,00h,00h,EFh,00h,00h,00h,EEh,F0h,00h,00h,AAh,EFh,00h,00h
	DB	AEh,AEh,F0h,00h,AAh,AEh,EFh,00h,EAh,EEh,EEh,F0h,EEh,AEh,EEh,6Fh
	DB	00h,00h,00h,00h,00h,00h,00h,00h,00h,FFh,F0h,00h,0Fh,E6h,6Fh,00h
	DB	F6h,6Eh,66h,FFh,F6h,66h,E6h,6Fh,F6h,66h,6Eh,66h,0Fh,96h,66h,E6h
	DB	00h,00h,00h,00h,00h,00h,00h,00h,0Fh,00h,00h,00h,FEh,F0h,00h,00h
	DB	6Eh,FFh,F0h,00h,66h,EEh,EFh,00h,F6h,66h,6Eh,F0h,6Fh,66h,66h,EFh
	DB	00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
	DB	00h,00h,00h,0Fh,00h,00h,00h,FCh,00h,00h,0Fh,AAh,00h,00h,FCh,88h
	DB	00h,00h,0Fh,F0h,00h,0Fh,F9h,EFh,0Fh,CCh,8Fh,9Fh,FCh,88h,C8h,F0h
	DB	C8h,8Ch,CCh,F0h,88h,CCh,C8h,00h,ACh,CCh,8Fh,00h,AAh,C8h,F0h,00h
	DB	00h,00h,00h,FFh,00h,00h,FFh,6Eh,00h,0Fh,6Eh,ECh,00h,F6h,ECh,CCh
	DB	0Fh,6Eh,CCh,CCh,0Fh,6Ch,CCh,CCh,F6h,EEh,CCh,CCh,F6h,ECh,CCh,CCh
	DB	FFh,00h,00h,00h,E6h,FFh,00h,00h,EEh,E6h,F0h,00h,CCh,CEh,6Fh,00h
	DB	CCh,CCh,E6h,F0h,CCh,CCh,CEh,F0h,CCh,CCh,CEh,6Fh,CCh,CCh,EEh,6Fh
	DB	00h,0Fh,FFh,FFh,00h,F6h,66h,66h,00h,0Fh,6Fh,FFh,00h,0Fh,6Fh,FFh
	DB	00h,0Fh,6Fh,FFh,00h,00h,F6h,FFh,00h,00h,0Fh,6Ah,00h,00h,00h,F6h
	DB	FFh,FFh,FFh,00h,66h,66h,66h,F0h,FFh,EEh,EFh,00h,FFh,EFh,EFh,00h
	DB	FFh,FFh,EFh,00h,FEh,FEh,F0h,00h,AAh,EFh,00h,00h,AEh,F0h,00h,00h
	DB	00h,00h,00h,00h,00h,00h,0Fh,FFh,00h,0Fh,F8h,88h,00h,F8h,88h,88h
	DB	0Fh,88h,88h,88h,0Fh,88h,88h,8Fh,0Fh,88h,88h,AAh,0Fh,88h,88h,AAh
	DB	00h,00h,00h,00h,FFh,F0h,00h,00h,88h,8Fh,F0h,00h,88h,F8h,8Fh,00h
	DB	FFh,88h,88h,F0h,FFh,88h,88h,F0h,F8h,88h,88h,F0h,88h,88h,88h,F0h

; Shared stone/inventory UI base graphics (63A3h cmd 63F1h, VRAM DC00h) 32-tile raw-4bpp
; block (11DB0h-121AFh, 1024B total -> dst=A0h..BFh; first 4 tiles 9DB0h-9E2Fh also read as
; dst=9Ch..9Fh by cmd 63EBh): Bank 08 part 1 (592B = 18.5 tiles; continues across page
; boundary into Bank 09 12000h-121AFh).
STONE_INVENTORY_UI_TILES_4BPP_9DB0_PART1:
	DB	FEh,AEh,EEh,AFh,F6h,AEh,E9h,9Fh,0Fh,99h,99h,FFh,00h,FFh,FFh,0Fh
	DB	00h,00h,00h,0Fh,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
	DB	9Ah,EEh,EAh,EFh,AAh,AEh,AAh,AFh,AEh,AAh,AEh,AFh,9Eh,EAh,EEh,EFh
	DB	99h,EAh,EEh,F0h,F9h,EAh,E9h,F0h,0Fh,99h,9Fh,00h,00h,FFh,F0h,00h
	DB	00h,FAh,AAh,AAh,0Fh,AAh,AAh,FAh,0Fh,FFh,FFh,FAh,00h,00h,00h,FAh
	DB	00h,00h,00h,FAh,00h,00h,0Fh,AAh,00h,00h,0Fh,FFh,00h,00h,00h,00h
	DB	AAh,AAh,AFh,00h,AFh,AAh,AAh,F0h,AFh,FFh,FFh,00h,AFh,00h,00h,00h
	DB	AFh,00h,00h,00h,AAh,F0h,00h,00h,FFh,00h,00h,00h,00h,00h,00h,00h
	DB	0Fh,66h,69h,99h,0Fh,66h,66h,66h,0Fh,F6h,66h,66h,00h,FFh,96h,66h
	DB	00h,F9h,9Fh,99h,00h,0Fh,99h,99h,00h,00h,FFh,99h,00h,00h,00h,FFh
	DB	66h,66h,66h,F0h,66h,66h,66h,F0h,66h,66h,69h,F0h,66h,66h,9Fh,00h
	DB	99h,99h,9Fh,00h,99h,99h,F0h,00h,99h,FFh,00h,00h,FFh,00h,00h,00h
	DB	00h,FAh,AAh,AAh,00h,FAh,AFh,FAh,00h,0Fh,AFh,FAh,00h,0Fh,AAh,AAh
	DB	00h,00h,FFh,AFh,00h,00h,00h,FFh,00h,00h,00h,00h,00h,00h,00h,00h
	DB	AAh,AEh,EAh,F0h,AAh,F8h,AAh,F0h,AAh,FFh,AFh,00h,FAh,AAh,AFh,00h
	DB	9Fh,AFh,F0h,00h,FFh,F0h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
	DB	F9h,96h,CCh,66h,F9h,96h,66h,66h,F9h,F9h,F6h,66h,0Fh,99h,9Fh,66h
	DB	0Fh,99h,99h,99h,00h,F9h,99h,99h,00h,0Fh,F9h,99h,00h,00h,0Fh,FFh
	DB	66h,99h,F0h,00h,66h,9Fh,AAh,00h,66h,9Fh,00h,A0h,69h,9Fh,AAh,00h
	DB	99h,FAh,A0h,00h,99h,FAh,AAh,00h,FFh,00h,AAh,AAh,00h,00h,00h,00h
	DB	F9h,96h,66h,66h,F9h,66h,66h,66h,F6h,66h,66h,66h,F6h,66h,66h,66h
	DB	F6h,66h,66h,66h,F9h,66h,66h,66h,0Fh,99h,99h,99h,00h,FFh,FFh,FFh
	DB	66h,66h,66h,6Fh,66h,66h,66h,6Fh,66h,66h,66h,9Fh,66h,66h,69h,9Fh
	DB	66h,66h,66h,6Fh,66h,66h,66h,9Fh,99h,99h,99h,F0h,FFh,FFh,FFh,00h
	DB	F9h,F6h,9Fh,F9h,F6h,F9h,9Fh,99h,F6h,F9h,9Fh,99h,F6h,9Fh,9Fh,99h
	DB	F9h,99h,FFh,FFh,0Fh,99h,99h,96h,00h,FFh,99h,99h,00h,00h,FFh,FFh
	DB	66h,EEh,FEh,6Fh,66h,66h,FEh,F0h,99h,6Fh,E6h,F0h,9Fh,F6h,6Fh,00h
	DB	F6h,66h,9Fh,00h,69h,99h,F0h,00h,9Fh,FFh,00h,00h,F0h,00h,00h,00h
	DB	6Eh,66h,66h,66h,6Eh,66h,66h,66h,6Eh,66h,66h,66h,6Eh,66h,66h,66h
	DB	6Eh,66h,66h,66h,6Eh,66h,66h,66h,69h,99h,99h,99h,0Fh,FFh,FFh,FFh
	DB	66h,66h,66h,9Fh,66h,66h,66h,9Fh,66h,66h,66h,9Fh,66h,66h,66h,9Fh
	DB	66h,66h,66h,9Fh,66h,66h,66h,9Fh,99h,99h,99h,9Fh,FFh,FFh,FFh,F0h
	DB	0Fh,F9h,99h,EEh,0Fh,9Fh,99h,9Eh,00h,F9h,F9h,99h,00h,0Fh,9Fh,99h
	DB	00h,00h,F9h,F9h,00h,00h,0Fh,9Fh,00h,00h,00h,F9h,00h,00h,00h,0Fh
	DB	EEh,EAh,66h,6Fh,EEh,6Ah,66h,6Fh,E6h,6Ah,66h,F0h,E6h,6Ah,FFh,F0h
	DB	E6h,FFh,66h,F0h,FFh,9Ah,FFh,00h,E6h,FFh,00h,00h,FFh,00h,00h,00h
	DB	00h,F9h,66h,6Eh,00h,0Fh,96h,66h,00h,00h,F9h,6Fh,00h,00h,0Fh,9Fh

	DEPHASE

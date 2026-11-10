; Physical Bank 12 (ROM 18000h-19FFFh): Ending Scene 2 tiles, route strip-control streams, and common gameplay tiles
	PHASE	A000h

; Ending Scene 2 (632Ch) 29-tile 2bpp block (17F70h-1813Fh, 464B total): Bank 12 part 2
; (320B = remaining 20 tiles).
ENDING_SCENE2_TILES_2BPP_9F70_PART2:
	DB	00h,00h,00h,00h,00h,00h,02h,03h,08h,0Fh,10h,1Fh,40h,7Fh,00h,FFh
	DB	18h,1Fh,60h,7Fh,80h,FFh,01h,FFh,03h,FFh,0Fh,FFh,1Fh,FFh,3Fh,FFh
	DB	00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,01h,01h,06h,07h
	DB	00h,00h,00h,00h,01h,01h,06h,07h,10h,1Fh,60h,7Fh,80h,FFh,03h,FFh
	DB	18h,1Fh,60h,7Fh,80h,FFh,03h,FFh,0Fh,FFh,3Eh,FEh,F8h,FFh,E0h,FFh
	DB	00h,00h,00h,00h,00h,80h,80h,E0h,70h,7Ch,0Eh,0Fh,01h,01h,00h,00h
	DB	00h,00h,00h,00h,00h,00h,00h,00h,07h,07h,78h,7Fh,80h,FFh,00h,FFh
	DB	00h,00h,00h,00h,00h,00h,00h,00h,C0h,C0h,30h,F0h,0Ch,FCh,04h,FCh
	DB	00h,FFh,00h,FFh,7Fh,FFh,FFh,FFh,80h,98h,00h,FFh,00h,FFh,00h,FFh
	DB	02h,FEh,02h,FEh,81h,FFh,C1h,FFh,E1h,FFh,61h,7Fh,31h,BFh,31h,BFh
	DB	31h,FFh,31h,FFh,31h,FFh,21h,BFh,60h,FEh,42h,FEh,C2h,FEh,86h,FEh
	DB	61h,FFh,E2h,FFh,C2h,FFh,C4h,FFh,C9h,FFh,8Ah,FFh,95h,FFh,98h,FEh
	DB	00h,01h,00h,0Fh,03h,3Fh,04h,7Ch,0Ch,FCh,18h,F8h,78h,F8h,F0h,F0h
	DB	00h,FFh,C0h,C0h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
	DB	00h,C0h,40h,70h,10h,1Ch,08h,0Eh,02h,03h,00h,01h,00h,00h,00h,00h
	DB	00h,00h,00h,1Ch,30h,3Eh,38h,3Fh,1Ch,1Fh,0Fh,0Fh,01h,01h,00h,00h
	DB	00h,00h,00h,00h,00h,00h,00h,80h,00h,E0h,00h,F8h,F8h,FFh,1Fh,1Fh
	DB	00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,01h,03h,FFh,F8h,F8h
	DB	00h,08h,08h,18h,00h,10h,10h,30h,20h,60h,80h,80h,00h,00h,00h,00h
	DB	00h,20h,20h,31h,10h,11h,09h,0Bh,05h,07h,02h,07h,00h,04h,04h,0Ch

; Ending Scene 2 (632Ch) 22-tile 2bpp block (A140h-A29Fh, 22 x 16B = 352B -> dst=78h..8Dh,
; colors 0/1/A/E).
ENDING_SCENE2_TILES_2BPP_A140:
	DB	F8h,FCh,F0h,F8h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
	DB	80h,80h,E0h,E0h,E0h,F0h,E0h,F0h,70h,78h,70h,78h,30h,38h,08h,08h
	DB	00h,80h,80h,C0h,80h,C0h,3Ch,3Ch,3Ch,3Eh,1Ch,1Eh,1Eh,1Fh,06h,07h
	DB	08h,1Bh,0Dh,1Dh,06h,6Eh,03h,EFh,F1h,F7h,00h,03h,00h,01h,00h,00h
	DB	78h,7Ch,F8h,F8h,F0h,F8h,F0h,F0h,C0h,C0h,80h,80h,00h,00h,00h,00h
	DB	08h,08h,18h,18h,3Ch,3Ch,38h,3Ch,78h,7Ch,78h,78h,F0h,F8h,60h,70h
	DB	08h,08h,1Ch,1Ch,1Ch,1Ch,3Ch,3Eh,3Ch,3Eh,18h,1Ch,18h,1Ch,08h,08h
	DB	00h,00h,00h,00h,07h,07h,1Eh,1Fh,1Eh,1Fh,3Ch,3Eh,38h,38h,C0h,C0h
	DB	04h,04h,02h,02h,27h,27h,17h,17h,16h,17h,38h,38h,BFh,BFh,5Eh,5Eh
	DB	D0h,DCh,E0h,E0h,7Ch,FCh,10h,78h,80h,80h,F0h,F0h,F8h,F8h,78h,F8h
	DB	92h,B6h,89h,DBh,45h,6Fh,21h,3Fh,10h,1Fh,08h,0Fh,04h,07h,00h,03h
	DB	00h,00h,00h,00h,00h,00h,03h,03h,1Fh,1Fh,64h,7Fh,88h,ECh,11h,D9h
	DB	00h,00h,07h,07h,78h,7Fh,C0h,FCh,00h,F0h,40h,60h,80h,C0h,00h,80h
	DB	00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,08h,0Fh,2Fh,3Fh
	DB	00h,00h,00h,00h,00h,00h,00h,03h,00h,1Fh,07h,FFh,78h,F8h,C0h,C0h
	DB	90h,F0h,20h,E0h,10h,F0h,10h,30h,10h,10h,00h,20h,00h,00h,00h,00h
	DB	22h,B3h,44h,66h,08h,6Ch,10h,5Ch,00h,58h,00h,10h,00h,10h,00h,00h
	DB	00h,00h,00h,00h,00h,00h,00h,00h,10h,3Ch,FCh,FEh,7Fh,7Fh,3Ch,3Ch
	DB	00h,00h,00h,00h,00h,00h,00h,00h,10h,1Ch,5Dh,7Fh,FEh,FEh,3Ch,3Ch
	DB	00h,00h,00h,00h,00h,00h,08h,1Eh,1Fh,3Fh,FFh,FFh,1Eh,1Eh,00h,00h
	DB	07h,1Fh,1Fh,3Fh,3Eh,3Eh,78h,78h,C0h,C0h,00h,00h,00h,00h,00h,00h
	DB	00h,00h,00h,00h,1Eh,1Fh,3Ch,3Eh,7Ch,7Eh,78h,7Ch,E0h,F0h,00h,00h

; Ending Scene 2 (632Ch) 14-tile 2bpp block (A2A0h-A37Fh, 14 x 16B = 224B -> dst=8Eh..9Bh,
; colors 0/6/D/E).
ENDING_SCENE2_TILES_2BPP_A2A0:
	DB	01h,01h,00h,00h,01h,00h,06h,00h,08h,04h,10h,08h,20h,10h,40h,20h
	DB	0Fh,10h,0Fh,10h,8Fh,90h,CFh,F0h,DEh,E1h,06h,01h,00h,01h,00h,00h
	DB	80h,01h,C0h,00h,FFh,00h,E0h,00h,67h,87h,61h,91h,62h,9Ch,40h,AFh
	DB	00h,00h,00h,00h,80h,00h,38h,40h,E6h,E8h,F1h,F2h,78h,78h,8Fh,0Fh
	DB	67h,87h,37h,C7h,1Bh,E3h,08h,70h,8Ch,30h,84h,38h,C6h,18h,C6h,18h
	DB	DEh,1Eh,9Ch,1Ch,9Ch,1Ch,28h,08h,A8h,88h,98h,A8h,0Ch,14h,0Eh,16h
	DB	E6h,08h,E6h,08h,E6h,08h,E6h,08h,EEh,00h,ECh,00h,EEh,02h,CEh,06h
	DB	34h,C1h,35h,C0h,39h,C0h,73h,80h,72h,80h,75h,81h,69h,81h,E2h,02h
	DB	39h,02h,F1h,02h,F3h,04h,E7h,00h,8Eh,00h,18h,00h,60h,00h,07h,07h
	DB	00h,00h,40h,00h,20h,40h,00h,20h,08h,10h,3Fh,33h,7Ah,7Ch,7Ch,7Dh
	DB	70h,0Fh,78h,07h,78h,07h,BCh,83h,BCh,83h,BEh,81h,DEh,C1h,DEh,C1h
	DB	41h,4Eh,80h,81h,80h,80h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
	DB	10h,EFh,10h,CFh,90h,4Fh,80h,5Fh,80h,5Eh,14h,AAh,35h,B8h,B8h,B8h
	DB	70h,30h,00h,00h,00h,00h,02h,00h,00h,00h,00h,00h,00h,00h,00h,00h

; Ending Scene 2 (632Ch) 1-tile 2bpp block (A380h-A38Fh, 16B -> dst=9Ch, colors 0/6/A/E).
ENDING_SCENE2_TILES_2BPP_A380:
	DB	00h,38h,08h,38h,08h,18h,08h,08h,00h,00h,80h,00h,C0h,00h,40h,00h

; Ending Scene 2 (632Ch) 6-tile 2bpp block (A390h-A3EFh, 6 x 16B = 96B -> dst=9Dh..A2h,
; colors 0/6/A/E).
ENDING_SCENE2_TILES_2BPP_A390:
	DB	02h,01h,06h,00h,0Ch,00h,30h,00h,E0h,09h,08h,0Fh,07h,07h,00h,00h
	DB	4Fh,C0h,4Fh,C0h,2Fh,E0h,27h,E0h,27h,E0h,93h,F0h,12h,31h,00h,33h
	DB	88h,F8h,10h,70h,10h,F0h,20h,E0h,23h,E0h,CFh,C0h,80h,80h,00h,00h
	DB	CEh,0Eh,DCh,1Eh,9Ch,1Eh,3Ch,3Eh,38h,3Ch,38h,38h,60h,60h,80h,80h
	DB	69h,00h,73h,00h,3Bh,00h,1Fh,00h,0Eh,00h,02h,3Eh,00h,6Ch,04h,7Ch
	DB	03h,00h,03h,00h,01h,00h,C1h,C0h,30h,70h,88h,98h,44h,CCh,22h,66h

; Ending Scene 2 (632Ch) 3-tile 2bpp block (A3F0h-A41Fh, 3 x 16B = 48B -> dst=A3h..A5h,
; colors 0/A/D/E).
ENDING_SCENE2_TILES_2BPP_A3F0:
	DB	00h,80h,00h,80h,00h,00h,00h,00h,0Eh,06h,03h,01h,01h,00h,07h,07h
	DB	0Fh,8Eh,1Eh,7Ch,3Eh,3Ch,3Ch,3Bh,70h,73h,00h,00h,00h,00h,00h,00h
	DB	13h,1Eh,19h,1Eh,0Ch,0Fh,0Eh,0Fh,06h,06h,06h,06h,0Ch,0Ch,3Ch,38h

; 12-byte negative-offset wraparound pre-roll strip selector header (0Bh..00h, duplicating
; the bottom 12 strips A450h-A45Bh of the loop) immediately preceding A42Ch; read via signed
; arithmetic shift (SRA H; RR L x2 at Bank 00 59E6h-59F3h) when initial screen prefill
; (59ADh-59DAh) steps scroll row HL negative before (C300h)=A42Ch.
NORMAL_ROUTE_STRIP_PRE_ROLL_HEADER:
	DB	0Bh,0Ah,09h,08h,07h,06h,05h,04h,03h,02h,01h,00h

; Shared normal-route (routes 0..17, C300h=A42Ch from table 57DDh) strip selector stream
; (51B total): 48 descending strip indices 2Fh..00h (A42Ch-A45Bh), followed by FFh loop
; control byte (A45Ch) and DW 0000h 16-bit wrap target scroll row (A45Dh-A45Eh, consumed by
; Bank 00 580Eh: INC HL; LD A,(HL); INC HL; LD H,(HL); LD L,A; LD (C302h),HL).
NORMAL_ROUTE_STRIP_SELECTOR_STREAM:
	DB	2Fh,2Eh,2Dh,2Ch,2Bh,2Ah,29h,28h,27h,26h,25h,24h,23h,22h,21h,20h
	DB	1Fh,1Eh,1Dh,1Ch,1Bh,1Ah,19h,18h,17h,16h,15h,14h,13h,12h,11h,10h
	DB	0Fh,0Eh,0Dh,0Ch,0Bh,0Ah,09h,08h,07h,06h,05h,04h,03h,02h,01h,00h
	DB	FFh,00h,00h

; Boss-arena strip selector stream A (A45Fh-A46Ah, 12 strip indices for static 12-strip boss
; screen), pointed to by 57DDh for Bosses 1, 2, 4, and 6.
BOSS_STRIP_SELECTOR_STREAM_A:
	DB	09h,08h,07h,06h,05h,04h,03h,02h,01h,00h,00h,FCh

; Boss-arena strip selector stream B (A46Bh-A476h, 12 strip indices for static 12-strip boss
; screen), pointed to by 57DDh for Bosses 3 and 5.
BOSS_STRIP_SELECTOR_STREAM_B:
	DB	09h,08h,07h,06h,05h,04h,03h,02h,0Bh,0Ah,00h,FCh

; Stage 4 (6100h) 19-tile 3bpp background block (A477h-A63Eh, 19 x 24B = 456B ->
; dst=01h..13h, attr=00h).
STAGE4_TILES_3BPP_A477:
	DB	00h,00h,00h,04h,00h,00h,00h,00h,00h,22h,02h,02h
	DB	00h,00h,00h,00h,00h,00h,11h,10h,10h,00h,00h,00h
	DB	00h,00h,00h,08h,00h,00h,00h,00h,00h,02h,00h,00h
	DB	00h,00h,00h,00h,00h,00h,20h,00h,00h,00h,00h,00h
	DB	00h,00h,00h,00h,00h,00h,01h,01h,01h,00h,00h,00h
	DB	00h,00h,00h,00h,00h,00h,18h,18h,00h,18h,08h,08h
	DB	1Fh,07h,07h,07h,1Bh,03h,03h,0Ch,00h,01h,06h,00h
	DB	00h,03h,00h,00h,01h,00h,00h,00h,00h,00h,00h,00h
	DB	F8h,EFh,E8h,F8h,E4h,E0h,8Fh,70h,00h,04h,9Fh,04h
	DB	00h,06h,00h,00h,00h,00h,00h,01h,00h,00h,00h,00h
	DB	00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
	DB	F0h,00h,00h,FFh,F0h,F0h,0Fh,FFh,0Fh,00h,0Fh,00h
	DB	00h,00h,00h,00h,00h,00h,00h,00h,00h,03h,00h,00h
	DB	3Fh,03h,03h,FCh,0Fh,0Ch,F0h,7Ch,70h,00h,70h,00h
	DB	00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,07h,00h
	DB	07h,F8h,00h,FFh,07h,07h,F8h,F0h,F0h,00h,00h,00h
	DB	00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,80h,00h
	DB	F0h,08h,00h,F8h,E4h,E0h,1Ch,1Fh,1Ch,03h,03h,03h
	DB	00h,01h,00h,01h,00h,00h,03h,00h,00h,03h,01h,01h
	DB	07h,01h,01h,0Eh,02h,03h,3Eh,02h,03h,FEh,06h,07h
	DB	07h,01h,01h,03h,04h,00h,07h,18h,00h,1Fh,60h,00h
	DB	FFh,03h,03h,FFh,FBh,FBh,07h,FFh,07h,01h,0Eh,00h
	DB	E0h,F8h,E0h,C0h,D0h,C0h,E0h,D0h,C0h,F0h,EEh,E0h
	DB	FEh,E1h,E0h,7Fh,70h,F0h,FFh,F1h,71h,BEh,BAh,7Ah
	DB	0Fh,73h,03h,07h,19h,01h,01h,0Fh,01h,01h,03h,01h
	DB	03h,01h,01h,0Fh,01h,01h,1Fh,03h,03h,3Fh,07h,07h
	DB	F9h,FFh,E1h,FBh,7Fh,63h,7Fh,3Fh,3Fh,3Fh,04h,04h
	DB	11h,00h,00h,04h,00h,00h,3Ch,00h,00h,7Eh,00h,00h
	DB	BBh,BBh,DCh,FFh,FFh,98h,FFh,FFh,FCh,FFh,E7h,E7h
	DB	FFh,07h,07h,60h,00h,00h,3Fh,00h,00h,74h,00h,00h
	DB	00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
	DB	00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
	DB	B9h,BFh,78h,F9h,FFh,38h,FCh,FFh,7Ch,FEh,FFh,FEh
	DB	FFh,CFh,CFh,87h,7Fh,07h,03h,CCh,00h,20h,87h,00h
	DB	F9h,FFh,18h,D1h,FFh,10h,13h,FFh,10h,33h,7Fh,31h
	DB	FFh,FFh,FFh,F8h,F7h,F0h,E0h,DCh,C0h,80h,70h,00h
	DB	C1h,FFh,C1h,E7h,FEh,E6h,FFh,FEh,FEh,FEh,F9h,F8h
	DB	FEh,F0h,F0h,FFh,66h,66h,39h,FFh,39h,00h,5Fh,00h

; Stage 4 (6100h) 19-tile 3bpp background block (A63Fh-A806h, 19 x 24B = 456B ->
; dst=14h..26h, attr=00h).
STAGE4_TILES_3BPP_A63F:
	DB	FEh,0Eh,0Fh,3Ch,DDh,1Eh,1Ch,7Dh,1Eh,18h,0Ah,0Dh
	DB	3Dh,0Dh,0Eh,7Fh,0Fh,0Ch,7Eh,1Fh,1Eh,3Fh,4Fh,0Fh
	DB	FCh,FCh,1Ch,F8h,F0h,10h,F8h,F5h,10h,7Ch,FBh,18h
	DB	7Fh,FCh,1Ch,FFh,F9h,39h,FEh,FCh,3Ch,F8h,FCh,F8h
	DB	01h,00h,00h,03h,01h,01h,06h,02h,03h,1Ch,04h,07h
	DB	38h,18h,1Fh,31h,11h,1Eh,73h,33h,3Ch,E7h,67h,78h
	DB	FCh,7Fh,60h,78h,7Fh,40h,F0h,FFh,C0h,E0h,FEh,E1h
	DB	71h,FFh,70h,3Bh,7Fh,38h,0Eh,3Fh,0Eh,07h,1Fh,07h
	DB	9Eh,98h,78h,CEh,CCh,3Ch,E7h,E4h,1Ch,73h,F2h,0Eh
	DB	73h,F2h,0Eh,39h,F9h,07h,19h,F9h,07h,DDh,FDh,C3h
	DB	CFh,FFh,41h,E1h,FDh,63h,E3h,FFh,23h,F6h,FFh,16h
	DB	FCh,FEh,0Ch,7Eh,FCh,0Ch,1Fh,FCh,1Ch,3Fh,FEh,3Eh
	DB	0Eh,1Eh,0Fh,3Ch,0Dh,0Eh,0Ch,15h,06h,18h,0Ah,0Dh
	DB	1Dh,2Dh,0Eh,3Bh,5Bh,1Ch,72h,93h,1Ch,E6h,27h,38h
	DB	FEh,FCh,FCh,F8h,FCh,78h,F8h,F6h,70h,FCh,F3h,30h
	DB	7Eh,F1h,30h,7Fh,F8h,78h,FEh,FBh,FAh,FCh,FEh,FCh
	DB	8Fh,EFh,81h,CDh,FDh,C1h,FBh,FFh,E3h,FFh,FFh,FFh
	DB	07h,FBh,03h,00h,8Fh,00h,00h,03h,00h,80h,00h,00h
	DB	FBh,FBh,FCh,FBh,FBh,FCh,FFh,FFh,F8h,38h,DFh,18h
	DB	1Ch,2Eh,0Ch,07h,1Bh,03h,03h,0Dh,01h,00h,03h,00h
	DB	9Fh,BFh,10h,9Fh,FFh,10h,3Fh,FFh,20h,3Eh,BFh,20h
	DB	7Ch,7Fh,70h,FFh,FFh,FFh,FFh,30h,30h,30h,CFh,00h
	DB	F9h,FFh,C1h,F1h,FFh,C1h,F1h,7Fh,41h,43h,7Fh,43h
	DB	7Eh,7Fh,7Eh,38h,3Eh,38h,10h,08h,00h,00h,00h,00h
	DB	9Fh,FFh,1Fh,9Fh,FFh,1Fh,1Fh,FCh,1Ch,3Fh,F8h,38h
	DB	3Ch,F3h,30h,F8h,F4h,F0h,F0h,28h,20h,38h,C0h,00h
	DB	DCh,FFh,C0h,C4h,FFh,C0h,E2h,FFh,E0h,F0h,FFh,F0h
	DB	FFh,7Fh,7Fh,BFh,5Fh,1Fh,0Fh,F7h,07h,03h,1Ch,00h
	DB	FFh,FFh,98h,FFh,FFh,C9h,7Fh,FFh,7Fh,1Fh,FCh,1Ch
	DB	78h,F7h,70h,E0h,DEh,C0h,80h,F0h,80h,00h,C0h,00h
	DB	DFh,FFh,C0h,DFh,FFh,C0h,EFh,FFh,E0h,FBh,FFh,F9h
	DB	3Fh,3Fh,3Fh,0Fh,0Fh,0Fh,00h,00h,00h,00h,00h,00h
	DB	FEh,FFh,06h,FCh,FFh,04h,FCh,FEh,8Ch,FCh,FEh,9Ch
	DB	F8h,FCh,F8h,F8h,FCh,78h,F0h,FCh,70h,F8h,FCh,38h
	DB	1Fh,FFh,1Fh,1Fh,7Fh,1Fh,1Fh,3Fh,1Fh,0Fh,3Fh,0Fh
	DB	0Fh,3Fh,0Fh,06h,1Eh,07h,02h,1Eh,03h,06h,3Eh,07h
	DB	E0h,F8h,E0h,F0h,C8h,40h,F8h,E4h,60h,FCh,F2h,70h
	DB	7Eh,F9h,38h,7Fh,F8h,38h,3Fh,FCh,3Ch,7Fh,FCh,7Ch

; Stage 4 (6100h) 34-tile 3bpp solid terrain block (A807h-AB36h, 34 x 24B = 816B ->
; dst=27h..48h, attr=05h).
STAGE4_TILES_3BPP_A807:
	DB	00h,00h,00h,00h,00h,00h,00h,00h,00h,01h,01h,01h
	DB	03h,03h,03h,07h,07h,06h,0Fh,0Fh,0Ch,1Fh,1Fh,1Ch
	DB	00h,00h,00h,00h,00h,00h,00h,00h,00h,80h,80h,80h
	DB	F8h,F0h,F0h,FCh,FCh,3Ch,FEh,FEh,1Eh,FBh,FFh,1Bh
	DB	00h,00h,00h,80h,80h,80h,80h,80h,80h,C0h,C0h,C0h
	DB	C0h,C0h,C0h,70h,60h,E0h,70h,70h,F0h,B0h,B0h,70h
	DB	00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
	DB	80h,80h,80h,C0h,C0h,C0h,40h,C0h,40h,40h,C0h,40h
	DB	40h,C0h,40h,E0h,E0h,E0h,E0h,E0h,60h,F0h,F0h,70h
	DB	F0h,F0h,D0h,F0h,F0h,90h,F0h,F0h,90h,F0h,F0h,90h
	DB	00h,00h,00h,01h,01h,01h,01h,01h,01h,05h,01h,01h
	DB	0Bh,03h,03h,12h,12h,13h,3Ah,3Ah,3Bh,3Eh,3Eh,2Fh
	DB	01h,01h,01h,03h,03h,03h,06h,06h,07h,0Ah,0Ah,0Fh
	DB	0Ah,0Ah,0Fh,1Ah,1Ah,1Fh,12h,12h,1Fh,12h,12h,1Fh
	DB	2Dh,2Dh,37h,2Dh,2Dh,37h,2Dh,2Dh,37h,25h,25h,3Fh
	DB	26h,26h,3Fh,26h,26h,3Bh,36h,36h,3Bh,16h,16h,1Bh
	DB	16h,16h,1Bh,16h,16h,1Bh,16h,16h,1Bh,16h,16h,1Bh
	DB	16h,16h,1Bh,16h,16h,1Bh,16h,16h,1Bh,16h,16h,1Bh
	DB	15h,17h,19h,35h,37h,39h,37h,37h,3Bh,27h,27h,3Ah
	DB	2Bh,2Fh,32h,6Fh,6Fh,76h,DFh,DFh,E6h,D7h,DFh,E6h
	DB	1Dh,1Fh,1Ch,3Dh,3Fh,34h,7Dh,7Fh,74h,7Ch,7Fh,64h
	DB	DEh,DFh,E6h,DEh,DFh,E6h,BFh,BFh,CDh,BFh,BFh,C9h
	DB	13h,13h,1Dh,3Bh,3Bh,3Dh,37h,37h,3Bh,27h,27h,3Ah
	DB	27h,27h,3Ah,6Fh,6Fh,76h,CFh,CFh,F6h,CFh,CFh,F6h
	DB	D8h,D8h,38h,D8h,D8h,38h,F8h,F8h,18h,ECh,E8h,18h
	DB	ECh,ECh,1Ch,FCh,FCh,0Ch,FCh,FCh,0Ch,FCh,FCh,0Ch
	DB	7Ch,FCh,1Ch,7Eh,FCh,1Ch,7Ah,FEh,1Ah,F2h,FAh,96h
	DB	B6h,FEh,92h,B5h,FDh,93h,95h,FDh,93h,D7h,FFh,D1h
	DB	C7h,C7h,C7h,EFh,EFh,EFh,7Fh,7Fh,FAh,7Fh,7Fh,F2h
	DB	7Fh,7Fh,E4h,6Fh,6Fh,D4h,CFh,CFh,F4h,8Fh,8Fh,F4h
	DB	C6h,C6h,C6h,EFh,EFh,EFh,FFh,FFh,7Dh,FFh,FFh,3Dh
	DB	FFh,FFh,39h,FFh,FFh,19h,FBh,FFh,19h,FBh,FFh,19h
	DB	F8h,F8h,18h,F8h,F8h,18h,78h,F8h,18h,7Ch,F8h,08h
	DB	7Ch,FCh,0Ch,7Ch,FCh,0Ch,7Ch,FCh,0Ch,7Ch,FCh,0Ch
	DB	7Ch,FCh,1Ch,7Eh,FEh,1Ah,7Eh,FEh,1Ah,7Eh,FEh,1Ah
	DB	7Eh,FEh,1Ah,7Bh,FFh,19h,7Bh,FFh,19h,7Bh,FFh,09h
	DB	C7h,C7h,C7h,2Ch,6Ch,AFh,39h,79h,BFh,B2h,F2h,3Fh
	DB	B4h,F4h,3Fh,38h,F9h,3Eh,73h,F3h,7Fh,66h,E6h,7Fh
	DB	18h,18h,18h,35h,35h,3Dh,E6h,E6h,FFh,8Ch,8Ch,F7h
	DB	0Ch,0Ch,F7h,14h,1Ch,E7h,2Dh,3Dh,CEh,E9h,F9h,0Eh
	DB	FFh,FFh,FFh,3Ch,3Eh,FDh,9Ch,9Eh,FDh,4Dh,4Fh,FCh
	DB	2Dh,2Fh,FCh,1Ch,9Fh,7Ch,CEh,CFh,FEh,66h,67h,FEh
	DB	18h,18h,18h,ACh,ACh,BCh,67h,67h,FFh,31h,31h,EFh
	DB	30h,30h,EFh,28h,38h,E7h,B4h,BCh,73h,97h,9Fh,70h
	DB	98h,98h,98h,BCh,BCh,BCh,ECh,FCh,E4h,EEh,FEh,E6h
	DB	4Eh,FEh,42h,E6h,FEh,62h,E7h,FFh,23h,E3h,FFh,21h
	DB	00h,00h,00h,0Ch,0Ch,0Ch,16h,1Eh,12h,76h,7Eh,72h
	DB	B6h,FEh,B2h,B7h,FFh,93h,97h,FFh,91h,DBh,FBh,D9h
	DB	F8h,F8h,F8h,FCh,FCh,FCh,8Eh,EEh,9Eh,83h,F3h,8Fh
	DB	4Fh,FFh,41h,E6h,FEh,61h,E6h,FFh,20h,E2h,FFh,20h
	DB	1Fh,1Fh,1Fh,71h,7Fh,71h,C3h,FFh,C3h,86h,FFh,86h
	DB	8Eh,FFh,8Eh,7Eh,FFh,76h,6Ah,FBh,66h,6Fh,FFh,63h
	DB	78h,78h,78h,8Ch,8Ch,FCh,1Eh,1Eh,FEh,3Fh,3Fh,FFh
	DB	7Bh,7Bh,FCh,F1h,F1h,FEh,E1h,E1h,FEh,E0h,E0h,FFh
	DB	07h,07h,07h,0Eh,0Eh,0Fh,3Ch,3Ch,3Fh,F8h,F8h,FFh
	DB	F8h,F8h,FFh,F0h,F0h,7Fh,F8h,F8h,7Fh,FCh,FCh,3Fh
	DB	00h,00h,00h,81h,81h,81h,42h,42h,C3h,7Ch,7Ch,FFh
	DB	2Dh,2Dh,FFh,27h,27h,FFh,27h,27h,FFh,22h,22h,FFh
	DB	01h,01h,01h,9Bh,9Bh,9Bh,EFh,EFh,FEh,C7h,C7h,FCh
	DB	8Fh,8Fh,FCh,1Fh,1Fh,F8h,3Fh,3Fh,FBh,FDh,FDh,FEh
	DB	C0h,C0h,C0h,F9h,F9h,F9h,9Fh,9Fh,7Fh,CFh,CFh,3Fh
	DB	C3h,C3h,3Fh,E1h,E1h,1Fh,E0h,E0h,9Fh,F8h,F8h,67h
	DB	E3h,E3h,E3h,F6h,F6h,B7h,FCh,FCh,9Fh,BEh,FEh,8Fh
	DB	FFh,FFh,C3h,DFh,FFh,C1h,E7h,FFh,E0h,63h,7Fh,E0h
	DB	E0h,E0h,E0h,70h,70h,F0h,3Ch,3Ch,FCh,1Fh,1Fh,FFh
	DB	1Fh,1Fh,FFh,0Fh,0Fh,FEh,1Fh,1Fh,FEh,3Fh,3Fh,FCh
	DB	1Eh,1Eh,1Eh,31h,31h,3Fh,78h,78h,7Fh,FCh,FCh,FFh
	DB	DEh,DEh,3Fh,8Fh,8Fh,7Fh,87h,87h,7Fh,07h,07h,FFh

; Stage 4 (6100h) 36-tile 2bpp solid terrain block (AB37h-AD76h, 36 x 16B = 576B ->
; dst=49h..6Ch, attr=05h).
STAGE4_TILES_2BPP_AB37:
	DB	F1h,CDh,FBh,9Dh,F7h,BBh,E6h,BBh,E2h,B3h,EAh,F3h,CAh,F3h,CAh,F3h
	DB	DBh,C8h,D9h,C8h,DCh,CCh,5Ch,44h,7Eh,66h,7Eh,66h,6Ah,66h,6Fh,63h
	DB	FBh,38h,B9h,38h,BCh,3Ch,7Ch,64h,7Eh,66h,7Eh,66h,6Ah,66h,6Fh,63h
	DB	1Fh,FFh,0Fh,FFh,87h,7Ch,87h,7Eh,C3h,3Fh,C1h,BFh,E0h,DFh,F0h,4Fh
	DB	FFh,F1h,FFh,F8h,1Fh,FCh,CFh,3Eh,F6h,0Eh,FFh,F3h,EFh,EFh,73h,E3h
	DB	87h,80h,63h,60h,F0h,30h,F9h,19h,FFh,1Fh,7Eh,0Eh,7Eh,1Eh,FDh,FCh
	DB	FFh,FCh,F3h,77h,70h,73h,F8h,FBh,18h,19h,8Eh,6Eh,8Fh,7Fh,0Fh,FFh
	DB	9Fh,98h,9Fh,98h,9Fh,98h,DFh,D8h,5Fh,58h,F7h,70h,F6h,30h,F2h,30h
	DB	FDh,23h,7Fh,BBh,7Fh,9Fh,3Fh,CFh,3Fh,CFh,3Fh,CDh,3Fh,CDh,7Fh,9Dh
	DB	E1h,FFh,F0h,EFh,F0h,FFh,B8h,BFh,BCh,9Bh,BEh,9Dh,9Fh,8Eh,9Fh,87h
	DB	8Fh,F8h,19h,F6h,18h,F7h,30h,EFh,21h,FEh,21h,FEh,23h,FDh,B3h,FDh
	DB	FFh,C3h,FFh,E1h,7Fh,F0h,7Fh,F8h,2Fh,FCh,27h,FFh,27h,FFh,27h,FBh
	DB	9Fh,79h,FFh,E1h,FFh,C2h,FFh,E4h,FFh,BCh,FFh,9Bh,FFh,DEh,FCh,FFh
	DB	E0h,1Fh,F0h,FFh,9Ch,7Fh,0Fh,FEh,03h,FFh,81h,7Fh,E0h,DFh,F0h,6Fh
	DB	63h,FFh,31h,F7h,19h,FBh,0Ch,FCh,C6h,3Eh,F3h,FFh,EDh,EFh,73h,E3h
	DB	87h,FBh,C6h,FBh,E6h,5Bh,77h,E9h,7Fh,B1h,3Fh,F1h,3Fh,F9h,3Fh,FCh
	DB	F8h,FFh,F8h,FFh,70h,FFh,30h,FFh,18h,FFh,18h,FFh,08h,FFh,08h,FFh
	DB	FDh,33h,7Fh,BBh,7Fh,9Fh,3Fh,CFh,3Fh,CFh,3Fh,CDh,3Fh,CDh,7Fh,9Dh
	DB	B3h,F0h,D9h,E8h,E2h,7Ah,E0h,3Fh,B0h,7Fh,90h,7Fh,98h,7Fh,88h,FFh
	DB	1Fh,FEh,1Fh,FEh,1Fh,FFh,1Fh,F7h,1Fh,F7h,1Fh,F3h,1Fh,F1h,3Fh,F1h
	DB	08h,FFh,8Dh,7Eh,C7h,3Eh,C7h,3Eh,E7h,9Fh,FFh,C3h,FEh,E7h,FCh,FFh
	DB	FBh,3Dh,F9h,3Fh,F9h,7Ah,F8h,FBh,DCh,FFh,8Ch,FFh,0Ch,FDh,04h,FDh
	DB	8Ch,FFh,8Eh,FFh,C6h,BDh,C7h,BEh,C3h,BFh,E1h,DFh,71h,EFh,30h,EFh
	DB	3Fh,F1h,37h,EBh,27h,DBh,27h,DAh,07h,FAh,0Fh,F0h,FFh,00h,FFh,00h
	DB	FCh,3Fh,FFh,1Fh,DFh,27h,C7h,3Bh,83h,7Eh,03h,FEh,07h,FEh,07h,FCh
	DB	04h,FDh,E6h,FEh,F2h,FEh,B3h,7Fh,9Bh,7Fh,89h,7Fh,C5h,3Fh,C3h,3Fh
	DB	38h,F7h,1Ch,FBh,1Eh,F9h,0Fh,7Ch,0Fh,7Ch,8Fh,BEh,87h,9Eh,C7h,CFh
	DB	C7h,3Fh,E7h,1Fh,E7h,1Fh,62h,1Eh,76h,0Eh,76h,0Eh,36h,86h,96h,C6h
	DB	F7h,0Fh,FFh,0Dh,F7h,1Bh,F6h,3Bh,E2h,33h,EAh,73h,CAh,F3h,CAh,F3h
	DB	CBh,B8h,C9h,B8h,ACh,9Ch,44h,5Ch,76h,6Eh,76h,6Eh,6Ah,66h,6Fh,63h
	DB	91h,8Fh,90h,8Fh,88h,87h,C8h,C7h,4Ch,43h,E6h,61h,E6h,20h,E2h,20h
	DB	FCh,C0h,FCh,40h,FEh,60h,FFh,20h,FFh,30h,FFh,18h,FFh,0Dh,FFh,07h
	DB	FFh,E3h,DFh,C0h,8Fh,80h,CFh,C0h,4Fh,40h,E7h,60h,E6h,20h,E2h,20h
	DB	FCh,E0h,F8h,C0h,F9h,81h,F7h,07h,C5h,05h,88h,08h,38h,38h,59h,48h
	DB	7Ch,0Fh,7Ch,1Fh,79h,1Eh,F1h,9Eh,B3h,9Ch,B3h,9Ch,93h,9Ch,D3h,DCh
	DB	93h,90h,9Bh,88h,99h,88h,89h,88h,89h,88h,DCh,DCh,FCh,FCh,7Fh,7Fh

; Stage 4 (6100h) 4-tile 3bpp solid terrain block (AD77h-ADD6h, 4 x 24B = 96B ->
; dst=6Dh..70h normal and dst=90h..93h mirrored, attr=05h).
STAGE4_TILES_3BPP_AD77:
	DB	00h,00h,00h,00h,00h,00h,60h,60h,60h,D0h,F0h,D0h
	DB	C8h,F8h,88h,E8h,F8h,88h,E4h,FCh,84h,F2h,FEh,82h
	DB	00h,00h,00h,00h,00h,00h,60h,60h,60h,90h,90h,F0h
	DB	D8h,D8h,E8h,C8h,C8h,F8h,ECh,ECh,F4h,EEh,EEh,F6h
	DB	00h,00h,00h,00h,00h,00h,00h,00h,00h,60h,60h,60h
	DB	78h,70h,70h,DCh,DCh,FCh,CAh,CAh,BEh,C9h,C9h,BFh
	DB	00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
	DB	70h,70h,70h,D8h,D8h,F8h,CCh,CCh,BCh,EEh,EEh,96h

; Stage 4 (6100h) 31-tile 2bpp solid terrain block (ADD7h-AFC6h, 31 x 16B = 496B ->
; dst=71h..8Fh normal and dst=94h..B2h mirrored, attr=05h).
STAGE4_TILES_2BPP_ADD7:
	DB	9Ch,1Fh,36h,3Fh,EEh,F7h,B6h,C5h,76h,85h,F7h,04h,EFh,0Ch,EEh,08h
	DB	DCh,1Fh,18h,9Fh,39h,BFh,B2h,3Fh,B4h,3Fh,38h,3Eh,73h,7Fh,66h,7Fh
	DB	CEh,08h,CDh,09h,9Fh,17h,9Eh,1Fh,3Ch,3Bh,30h,3Fh,70h,6Fh,C0h,FCh
	DB	ECh,FFh,C8h,EFh,91h,DFh,11h,DDh,11h,9Dh,23h,BBh,23h,3Bh,47h,77h
	DB	91h,E1h,67h,87h,DEh,1Dh,DCh,1Bh,BDh,32h,3Bh,34h,76h,68h,7Ch,60h
	DB	85h,F7h,0Dh,EFh,0Bh,CDh,93h,1Dh,A3h,3Fh,67h,7Bh,C7h,FBh,C7h,FBh
	DB	FDh,C1h,F9h,C1h,F7h,87h,E7h,86h,EEh,8Dh,CEh,89h,DFh,98h,9Fh,18h
	DB	87h,FBh,0Bh,F3h,03h,F3h,13h,E3h,27h,C7h,67h,87h,CEh,0Fh,DCh,1Fh
	DB	FFh,38h,CFh,ECh,0Eh,CEh,1Fh,DFh,18h,98h,71h,76h,F1h,FEh,F0h,FFh
	DB	07h,07h,0Eh,0Eh,3Ch,3Eh,F8h,FFh,F8h,FFh,70h,7Fh,78h,7Fh,BCh,3Fh
	DB	E0h,FFh,E0h,FFh,E0h,FFh,C0h,FFh,C0h,FFh,C0h,7Fh,C0h,7Fh,60h,BFh
	DB	BFh,3Fh,5Eh,9Eh,5Ch,9Ch,5Ch,9Dh,ACh,2Fh,24h,27h,44h,57h,44h,77h
	DB	60h,BFh,21h,FEh,21h,FEh,B1h,7Eh,F3h,BCh,FFh,F8h,CFh,CCh,C3h,F3h
	DB	44h,77h,44h,77h,44h,7Fh,44h,7Fh,44h,7Fh,C0h,FFh,C0h,FFh,C0h,FFh
	DB	89h,F1h,84h,F8h,06h,F8h,02h,FCh,02h,FCh,06h,F8h,1Fh,E0h,7Fh,80h
	DB	E0h,DFh,E0h,DFh,60h,4Fh,68h,6Fh,7Ch,7Bh,3Fh,38h,3Fh,3Ch,1Fh,1Fh
	DB	93h,FCh,13h,FCh,33h,FCh,27h,F9h,67h,FBh,4Eh,F6h,CFh,F6h,8Dh,F4h
	DB	8Ch,F7h,1Ch,E7h,14h,E7h,14h,E7h,14h,A7h,14h,A7h,15h,A6h,1Dh,2Eh
	DB	8Dh,F4h,8Dh,F4h,9Dh,E4h,9Ch,E4h,9Eh,E6h,9Eh,E6h,BFh,CDh,3Fh,C9h
	DB	39h,DEh,31h,DEh,70h,9Fh,60h,BFh,61h,BEh,61h,BEh,63h,BDh,23h,BDh
	DB	27h,BBh,26h,3Ah,4Eh,76h,4Fh,75h,DFh,EDh,9Bh,EDh,9Bh,EDh,BBh,DCh
	DB	D9h,39h,F9h,19h,EBh,1Bh,FAh,0Ah,FCh,0Ch,7Ch,0Ch,76h,0Eh,7Eh,06h
	DB	FEh,86h,BFh,87h,DBh,47h,DBh,47h,DBh,47h,9Fh,83h,9Bh,87h,1Fh,03h
	DB	68h,18h,68h,18h,7Ah,0Ah,6Ah,1Ah,7Bh,09h,7Bh,09h,7Bh,09h,7Dh,0Ch
	DB	7Dh,0Ch,7Ch,1Ch,7Ah,1Ah,F2h,96h,B6h,92h,B5h,93h,95h,93h,D7h,D1h
	DB	8Fh,B3h,DFh,B9h,EFh,DDh,67h,DDh,47h,CDh,56h,CEh,52h,CEh,52h,CEh
	DB	9Fh,81h,9Fh,80h,8Fh,80h,CFh,C0h,4Fh,40h,E7h,60h,E6h,20h,E2h,20h
	DB	3Dh,73h,75h,33h,57h,31h,D6h,31h,F2h,11h,D3h,30h,71h,10h,71h,10h
	DB	3Fh,03h,3Fh,01h,3Fh,01h,3Fh,01h,3Fh,01h,3Fh,01h,3Fh,01h,9Fh,81h
	DB	3Dh,4Eh,2Bh,4Dh,4Bh,8Dh,D5h,19h,95h,18h,2Fh,32h,2Bh,32h,DBh,E0h
	DB	DFh,E4h,97h,A4h,67h,04h,4Fh,08h,8Eh,88h,FEh,F8h,FDh,F1h,FDh,E1h

; Stage 4 (6100h) 6-tile raw-4bpp block (AFC7h-B086h, 6 x 32B = 192B -> dst=F0h..F5h,
; attr=05h).
STAGE4_TILES_4BPP_AFC7:
	DB	FFh,88h,88h,88h,FFh,88h,88h,88h,FFh,F8h,98h,88h,FFh,F8h,88h,88h
	DB	F4h,FFh,F8h,88h,34h,4Fh,F9h,88h,33h,44h,FFh,9Fh,33h,44h,4Fh,3Fh
	DB	88h,88h,8Ch,FFh,88h,88h,8Ch,FFh,88h,88h,8Ch,FFh,88h,88h,8Ch,FFh
	DB	8Fh,88h,8Fh,F1h,88h,F8h,FFh,F1h,88h,F1h,1Fh,11h,FFh,FFh,11h,11h
	DB	F8h,88h,88h,88h,F8h,88h,88h,88h,FFh,88h,98h,88h,22h,F8h,88h,88h
	DB	12h,FFh,FFh,88h,12h,2Fh,FFh,F8h,11h,12h,FFh,FFh,11h,2Fh,FFh,F2h
	DB	88h,88h,8Ch,FFh,88h,88h,8Ch,FFh,88h,88h,8Fh,FFh,88h,8Fh,FFh,F5h
	DB	8Fh,FFh,F5h,54h,8Fh,F5h,55h,44h,FFh,F5h,44h,4Fh,2Fh,54h,44h,FFh
	DB	F4h,4Fh,FFh,FFh,F3h,44h,4Fh,FFh,4Fh,34h,45h,FFh,4Fh,34h,45h,FFh
	DB	4Fh,34h,45h,FFh,F3h,34h,44h,FFh,F3h,34h,45h,FFh,33h,34h,44h,FFh
	DB	FFh,FFh,F5h,54h,55h,4Fh,55h,54h,54h,4Fh,55h,55h,54h,F5h,55h,55h
	DB	54h,F5h,55h,54h,54h,F5h,55h,54h,54h,F5h,55h,4Fh,53h,F5h,55h,4Fh

; Shared normal-stage (6271h) 13-tile 2bpp block (B087h-B156h, 13 x 16B = 208B ->
; dst=C0h..CCh, attr=05h).
COMMON_NORMAL_TILES_2BPP_B087:
	DB	31h,73h,31h,73h,F1h,F3h,EEh,EFh,E0h,E1h,E0h,E1h,F1h,F1h,FFh,FFh
	DB	FFh,FFh,F1h,F1h,86h,86h,FFh,FFh,10h,10h,10h,FFh,16h,16h,F9h,FDh
	DB	88h,84h,88h,84h,88h,84h,88h,84h,88h,84h,88h,C6h,C6h,FFh,FFh,FFh
	DB	FFh,FFh,00h,01h,00h,01h,00h,01h,00h,00h,00h,00h,00h,00h,00h,00h
	DB	FFh,FFh,80h,80h,80h,80h,80h,80h,00h,00h,00h,00h,00h,00h,00h,00h
	DB	00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
	DB	00h,01h,00h,01h,FFh,FFh,FFh,FFh,FFh,FFh,FFh,FFh,FFh,FFh,FFh,FFh
	DB	80h,80h,80h,80h,FFh,FFh,FFh,FFh,FFh,FFh,FFh,FFh,FFh,FFh,FFh,FFh
	DB	FFh,FFh,8Ch,9Ch,8Ch,9Ch,8Eh,9Eh,8Eh,9Eh,8Ch,9Ch,8Ch,9Ch,8Ch,9Ch
	DB	8Ch,9Ch,8Ch,9Ch,8Ch,9Ch,8Ch,9Ch,8Ch,9Ch,8Ch,9Ch,8Eh,9Eh,8Eh,9Eh
	DB	8Ch,9Ch,8Ch,9Ch,8Fh,9Fh,77h,7Fh,07h,0Fh,07h,0Fh,8Fh,8Fh,FFh,FFh
	DB	FFh,FFh,31h,73h,31h,73h,71h,73h,71h,73h,31h,73h,31h,73h,31h,73h
	DB	31h,73h,31h,73h,31h,73h,31h,73h,31h,73h,31h,73h,71h,73h,71h,73h

; Shared normal-stage (6271h, attr=00h, and Stage 2 6074h, attr=20h) 7-tile 2bpp block
; (B157h-B1C6h, 7 x 16B = 112B -> dst=CDh..D3h).
COMMON_NORMAL_TILES_2BPP_B157:
	DB	FFh,FFh,FFh,FFh,FFh,FFh,FFh,FFh,FFh,FFh,FFh,FFh,FFh,FFh,FFh,FFh
	DB	FFh,FFh,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,FFh,FFh
	DB	00h,00h,04h,00h,20h,00h,00h,00h,01h,00h,40h,00h,10h,00h,80h,00h
	DB	00h,00h,22h,22h,12h,12h,0Eh,0Eh,0Ah,0Ah,11h,11h,62h,62h,84h,84h
	DB	00h,00h,C2h,C2h,34h,34h,08h,08h,10h,10h,E0h,E0h,20h,20h,10h,10h
	DB	FFh,FFh,FFh,FFh,FFh,FFh,00h,00h,00h,FFh,FFh,FFh,FFh,FFh,FFh,FFh
	DB	FFh,FFh,FFh,FFh,FFh,FFh,FFh,FFh,FFh,FFh,00h,FFh,00h,00h,FFh,FFh

; Shared normal-stage (6271h, attr=00h, and Stage 2 6074h, attr=20h) 3-tile 2bpp block
; (B1C7h-B1F6h, 3 x 16B = 48B -> dst=D4h..D6h normal and dst=D7h..D9h mirrored).
COMMON_NORMAL_TILES_2BPP_B1C7:
	DB	FFh,FFh,FFh,FFh,FFh,FFh,80h,80h,80h,BFh,9Fh,BFh,9Fh,BFh,9Fh,BFh
	DB	9Fh,BFh,9Fh,BFh,9Fh,BFh,9Fh,BFh,9Fh,BFh,9Fh,BFh,9Fh,BFh,9Fh,BFh
	DB	9Fh,BFh,9Fh,BFh,9Fh,BFh,9Fh,BFh,9Fh,BFh,80h,BFh,80h,80h,FFh,FFh

; Shared normal-stage (6271h) 15-tile 2bpp block (B1F7h-B2E6h, 15 x 16B = 240B ->
; dst=DAh..E8h, attr=05h).
COMMON_NORMAL_TILES_2BPP_B1F7:
	DB	FFh,FFh,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,FFh,FFh
	DB	00h,00h,04h,00h,20h,00h,00h,00h,01h,00h,40h,00h,10h,00h,80h,00h
	DB	03h,03h,C2h,C2h,34h,34h,08h,08h,10h,10h,E0h,E0h,20h,20h,10h,10h
	DB	00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
	DB	FFh,FFh,FFh,FFh,FFh,FFh,FEh,FEh,FCh,FCh,F0h,F0h,D0h,D0h,C8h,C8h
	DB	FFh,FFh,FFh,FFh,FFh,FFh,1Fh,3Fh,07h,1Fh,03h,0Fh,03h,07h,03h,07h
	DB	C0h,C0h,C2h,C0h,C0h,C0h,C0h,C0h,81h,80h,84h,80h,84h,80h,80h,80h
	DB	03h,07h,03h,07h,03h,07h,03h,07h,03h,07h,03h,07h,03h,07h,03h,07h
	DB	C0h,C0h,C4h,C0h,C2h,C0h,C8h,C0h,80h,80h,80h,80h,88h,80h,81h,80h
	DB	80h,80h,82h,80h,80h,80h,80h,80h,81h,80h,84h,80h,84h,80h,80h,80h
	DB	C0h,C0h,80h,80h,80h,80h,82h,82h,C4h,C4h,F0h,F0h,E0h,E0h,C0h,C0h
	DB	80h,80h,80h,80h,88h,80h,80h,80h,80h,80h,84h,80h,82h,80h,90h,80h
	DB	80h,80h,84h,80h,80h,80h,81h,80h,80h,80h,A2h,A0h,C2h,C0h,C0h,C0h
	DB	C0h,C0h,C0h,C0h,C8h,C8h,D0h,D0h,F0h,F0h,E0h,E0h,F8h,F8h,BFh,BFh
	DB	03h,07h,03h,07h,03h,07h,03h,07h,03h,07h,03h,07h,07h,07h,FDh,FFh

; Shared normal-stage (6271h, attr=00h, and Stage 2 6074h, attr=20h) 3-tile 2bpp block
; (B2E7h-B316h, 3 x 16B = 48B -> dst=E9h..EBh).
COMMON_NORMAL_TILES_2BPP_B2E7:
	DB	FFh,FFh,FFh,FFh,FFh,FFh,FFh,FFh,00h,00h,00h,00h,00h,00h,00h,00h
	DB	24h,20h,A0h,20h,10h,10h,18h,18h,24h,24h,44h,44h,FFh,FFh,FFh,FFh
	DB	00h,00h,04h,00h,00h,00h,10h,00h,10h,00h,04h,00h,FFh,FFh,FFh,FFh

; Shared normal-stage (6271h) 2-tile 2bpp block (B317h-B336h, 2 x 16B = 32B -> dst=ECh..EDh
; normal and dst=EEh..EFh mirrored, attr=05h).
COMMON_NORMAL_TILES_2BPP_B317:
	DB	FFh,FFh,C0h,C0h,80h,80h,80h,80h,80h,80h,C0h,C0h,A0h,A0h,9Fh,9Fh
	DB	80h,80h,80h,80h,80h,80h,80h,80h,80h,80h,C0h,C0h,C0h,C0h,E0h,E0h

; Boss stages (61B3h) 25-tile 3bpp solid terrain block (B337h-B58Eh, 25 x 24B = 600B ->
; dst=01h..19h, attr=05h).
BOSS_STAGE_TILES_3BPP_B337:
	DB	3Fh,7Fh,BFh,7Fh,FFh,7Dh,FFh,FEh,D7h,FFh,FFh,FFh
	DB	FFh,FFh,FAh,FFh,FFh,FEh,FFh,7Eh,D5h,FDh,9Dh,F8h
	DB	F9h,F0h,A8h,F3h,C0h,70h,D1h,B0h,C0h,BCh,E8h,34h
	DB	BFh,07h,BAh,DFh,CFh,D7h,FFh,6Fh,D7h,F7h,47h,B7h
	DB	FFh,CFh,FFh,FFh,7Fh,E3h,FFh,9Fh,FBh,FFh,FFh,DFh
	DB	FFh,FFh,EDh,FFh,FFh,FFh,FFh,FFh,EFh,FFh,FFh,FEh
	DB	79h,79h,00h,DFh,DFh,80h,FBh,DFh,F8h,FFh,FFh,FEh
	DB	FFh,FFh,BFh,FFh,FFh,DEh,FFh,FFh,FDh,FFh,FFh,0Fh
	DB	FEh,FEh,F8h,FCh,FCh,E0h,FCh,F8h,C4h,FEh,F0h,CEh
	DB	FFh,F4h,CBh,FFh,A1h,DEh,FFh,F1h,8Fh,FFh,FBh,A5h
	DB	9Fh,6Fh,63h,F7h,17h,01h,5Fh,0Fh,00h,4Fh,4Fh,00h
	DB	9Fh,8Fh,10h,FFh,0Fh,F0h,EFh,EFh,00h,FFh,D7h,E8h
	DB	FFh,FFh,B3h,FFh,FFh,F3h,FFh,F5h,BBh,FDh,D5h,FCh
	DB	FEh,FEh,CEh,FFh,FFh,F5h,FFh,FEh,F1h,3Fh,75h,BFh
	DB	FFh,EFh,F5h,FFh,EFh,F3h,FFh,D7h,EBh,FFh,3Fh,C6h
	DB	FFh,FFh,3Fh,FFh,FFh,1Fh,FFh,FFh,3Dh,FFh,FFh,77h
	DB	FFh,FFh,CFh,77h,E7h,93h,BBh,7Bh,48h,DFh,1Fh,0Ch
	DB	1Fh,0Fh,1Dh,BFh,8Fh,3Dh,9Fh,1Fh,86h,FFh,FFh,07h
	DB	FEh,FEh,97h,FFh,FFh,1Dh,F7h,F3h,33h,FDh,CFh,7Dh
	DB	FFh,FFh,BFh,DCh,CFh,0Ch,76h,16h,36h,DEh,DFh,DCh
	DB	FFh,FFh,0Eh,FFh,FFh,4Dh,FEh,F9h,B9h,FFh,E0h,60h
	DB	FFh,ECh,D0h,E7h,C2h,E0h,E1h,C1h,A0h,F3h,C1h,B3h
	DB	FCh,F8h,FCh,FFh,FFh,F7h,7Fh,BFh,BFh,AFh,47h,4Fh
	DB	E6h,03h,06h,DBh,0Bh,1Bh,DFh,1Dh,DFh,DDh,DDh,CDh
	DB	FFh,C3h,BFh,FFh,EBh,9Fh,FFh,FBh,8Fh,F9h,F9h,D1h
	DB	FDh,F9h,74h,FFh,FFh,78h,FFh,FFh,6Dh,FFh,FFh,F7h
	DB	EDh,ECh,CDh,D3h,D0h,C3h,9Fh,89h,9Fh,3Fh,1Ch,3Fh
	DB	7Bh,59h,33h,FFh,E7h,19h,FFh,FFh,C3h,FFh,FFh,DFh
	DB	FFh,FFh,FFh,FFh,FFh,C1h,FFh,FBh,74h,F9h,F1h,C8h
	DB	F8h,E0h,98h,FFh,EFh,10h,FFh,FFh,C7h,FFh,FFh,EFh
	DB	FFh,FFh,FFh,FFh,FFh,FFh,FFh,FFh,7Fh,FFh,FFh,3Fh
	DB	7Eh,7Fh,1Eh,7Eh,7Fh,1Eh,FCh,BFh,5Ch,F8h,FFh,B8h
	DB	FEh,FEh,F8h,FCh,FCh,E0h,FCh,F8h,C4h,FEh,F0h,CEh
	DB	FFh,F4h,CBh,FFh,B9h,C6h,FFh,FFh,81h,FFh,FFh,A1h
	DB	9Fh,6Fh,63h,F7h,17h,01h,57h,07h,00h,4Fh,47h,08h
	DB	9Fh,8Fh,10h,FFh,1Fh,E0h,FFh,FFh,00h,FFh,FFh,C0h
	DB	FFh,FFh,B3h,FFh,FFh,F3h,FFh,F5h,BBh,7Fh,DCh,77h
	DB	7Fh,FFh,4Eh,FFh,FFh,F5h,FFh,FEh,F1h,EFh,F5h,EFh
	DB	FFh,FFh,E5h,FFh,FFh,E3h,FFh,D7h,EAh,FFh,3Eh,C7h
	DB	FFh,FDh,3Fh,FFh,FFh,1Fh,FFh,FFh,3Fh,FFh,FFh,7Fh
	DB	FFh,B3h,CFh,FFh,FBh,8Fh,FFh,FBh,8Fh,FFh,FDh,D3h
	DB	FFh,FFh,70h,FFh,FFh,78h,FFh,FFh,6Dh,FFh,FFh,F7h
	DB	DFh,CDh,DEh,FFh,D1h,EEh,FFh,ABh,DDh,FFh,7Fh,9Ch
	DB	FFh,DDh,33h,FFh,F7h,09h,FFh,FFh,C3h,FCh,FFh,DCh
	DB	FFh,FFh,BFh,FFh,FFh,BFh,FFh,FFh,F5h,FFh,FEh,CBh
	DB	FFh,FFh,EBh,FFh,FBh,EFh,FFh,FFh,EFh,FFh,EFh,FFh
	DB	FFh,FFh,74h,FDh,FFh,30h,FFh,BFh,EAh,FFh,DFh,B2h
	DB	FFh,EFh,D5h,FFh,EFh,DBh,FFh,FFh,E7h,FFh,FFh,FFh
	DB	02h,7Fh,82h,02h,FFh,00h,29h,FEh,01h,0Bh,FFh,0Bh
	DB	5Fh,FFh,5Ah,7Fh,FFh,7Eh,FFh,7Eh,D5h,FDh,9Dh,F8h

; Boss stages (61B3h) 10-tile 3bpp background block (B58Fh-B67Eh, 10 x 24B = 240B ->
; dst=20h..29h, attr=00h; tail 4 tiles B61Fh-B67Eh also mirrored -> dst=2Ah..2Dh).
BOSS_STAGE_TILES_3BPP_B58F:
	DB	0Ch,0Fh,7Ch,1Eh,9Eh,3Fh,7Bh,7Fh,9Bh,9Fh,9Fh,9Fh
	DB	C0h,CCh,C3h,E8h,EFh,E8h,FEh,EFh,FEh,F8h,FFh,F8h
	DB	FFh,FFh,FFh,FFh,FFh,FFh,7Fh,FFh,7Fh,FFh,FFh,FEh
	DB	FFh,FDh,FEh,FFh,FBh,FFh,FFh,F7h,FCh,6Eh,FBh,6Ch
	DB	83h,BCh,C3h,07h,7Ch,83h,0Fh,FEh,05h,1Fh,FDh,0Eh
	DB	17h,F0h,07h,3Bh,F9h,1Ah,FFh,FDh,8Ah,3Eh,ACh,12h
	DB	AFh,1Fh,9Fh,3Fh,07h,0Bh,8Fh,07h,89h,FFh,07h,F9h
	DB	FFh,EFh,50h,FFh,FFh,E2h,FFh,EFh,F2h,FFh,FFh,E2h
	DB	2Fh,EFh,20h,FBh,FBh,F0h,FFh,FBh,FFh,FFh,FFh,FFh
	DB	FFh,FFh,FFh,80h,FFh,80h,DCh,FFh,DCh,62h,E2h,7Fh
	DB	7Fh,7Fh,0Ah,FFh,FFh,0Dh,FFh,FFh,93h,FFh,FFh,FFh
	DB	FFh,FFh,FFh,EFh,EFh,FFh,3Fh,7Fh,BFh,4Fh,FFh,4Fh
	DB	73h,FCh,73h,FFh,FCh,FBh,1Fh,9Eh,75h,1Fh,FDh,0Eh
	DB	17h,D0h,27h,3Bh,B9h,5Ah,FFh,FDh,8Ah,BEh,ACh,92h
	DB	B0h,0Ch,83h,6Ch,10h,13h,35h,09h,09h,99h,01h,81h
	DB	E3h,E0h,43h,FFh,F0h,EFh,FFh,E2h,FDh,FFh,FEh,E1h
	DB	EFh,EFh,E0h,FBh,FBh,F0h,FFh,FBh,FFh,FFh,FFh,FFh
	DB	FFh,FFh,FFh,64h,7Dh,E6h,3Ch,3Fh,FCh,38h,3Fh,F8h
	DB	3Fh,3Fh,08h,FFh,FFh,09h,FFh,FFh,93h,FEh,FEh,FFh
	DB	FFh,FFh,FFh,FFh,FFh,FFh,03h,E3h,1Fh,01h,F9h,07h

; Boss stages (61B3h) 25-tile 2bpp background block (B67Fh-B80Eh, 25 x 16B = 400B ->
; dst=30h..48h, attr=00h).
BOSS_STAGE_TILES_2BPP_B67F:
	DB	FBh,05h,A3h,5Fh,0Fh,FFh,FFh,FFh,FEh,FFh,FFh,F8h,FBh,1Ch,CFh,3Ch
	DB	FFh,00h,C8h,37h,A7h,D8h,FCh,FFh,CFh,3Fh,F8h,07h,FFh,00h,FCh,03h
	DB	C6h,39h,11h,EFh,C3h,3Fh,1Fh,FFh,FFh,F7h,FFh,ECh,BBh,7Ch,37h,F8h
	DB	7Fh,F8h,FFh,CCh,FFh,C7h,FFh,FFh,3Fh,CFh,FBh,07h,FEh,01h,FFh,00h
	DB	8Fh,7Ch,9Eh,7Fh,3Fh,DBh,7Fh,FFh,FCh,F3h,FFh,E0h,FFh,00h,FFh,00h
	DB	01h,FFh,3Fh,FFh,FFh,E3h,FEh,E7h,7Fh,FEh,8Fh,7Fh,E7h,1Fh,CFh,3Fh
	DB	FFh,E0h,DFh,E0h,FFh,80h,7Dh,82h,FFh,00h,72h,8Dh,87h,FFh,FFh,FDh
	DB	FDh,02h,F1h,0Eh,96h,69h,F0h,0Fh,80h,7Fh,67h,FFh,FBh,FCh,EFh,70h
	DB	FCh,03h,F8h,07h,27h,DFh,FFh,FFh,FFh,87h,7Fh,F7h,DFh,2Fh,F7h,0Bh
	DB	1Fh,FFh,7Fh,FEh,FDh,CEh,FFh,84h,BFh,42h,C7h,BBh,FFh,F3h,FFh,FFh
	DB	FFh,FEh,2Fh,D3h,FDh,02h,FFh,00h,FFh,00h,FFh,00h,9Eh,E1h,E4h,FBh
	DB	FFh,70h,F8h,FFh,9Eh,7Fh,EFh,1Fh,CFh,3Eh,8Fh,7Ch,3Fh,F8h,FFh,F0h
	DB	FBh,05h,BBh,45h,47h,BBh,FEh,FFh,BFh,5Fh,EFh,1Fh,E3h,1Fh,F9h,07h
	DB	FFh,C3h,FFh,80h,FFh,00h,FFh,00h,FFh,00h,7Fh,80h,FFh,80h,BFh,C0h
	DB	FFh,FFh,DFh,3Eh,EFh,1Eh,E7h,1Fh,F3h,0Fh,FAh,05h,FFh,00h,FBh,04h
	DB	E7h,F8h,F3h,7Ch,DCh,3Bh,FFh,8Fh,FEh,FFh,7Dh,E6h,3Fh,FCh,3Fh,F8h
	DB	FFh,F7h,FFh,FFh,FFh,FFh,FFh,73h,FFh,48h,72h,8Dh,87h,FFh,FFh,FDh
	DB	FFh,3Fh,FFh,1Fh,BFh,7Fh,FFh,3Fh,AFh,5Fh,7Fh,EFh,FFh,FFh,EFh,7Fh
	DB	FFh,FFh,FFh,FFh,FFh,FFh,FFh,DFh,FFh,FEh,9Fh,7Fh,E7h,1Fh,CFh,3Fh
	DB	FFh,07h,FFh,07h,FFh,03h,FFh,03h,FFh,07h,FFh,0Fh,FFh,1Fh,FFh,1Fh
	DB	FFh,FFh,FFh,FFh,FFh,FFh,FFh,FFh,FFh,FFh,FFh,FFh,FFh,7Ch,FFh,00h
	DB	7Fh,FFh,FFh,DFh,FFh,FFh,FFh,FFh,7Fh,BFh,FFh,EFh,FFh,3Fh,FFh,7Fh
	DB	FCh,03h,F8h,07h,27h,DFh,FFh,FFh,FFh,F7h,FFh,F7h,FFh,FFh,F7h,EBh
	DB	FFh,FFh,FFh,FFh,BFh,FFh,FFh,67h,F9h,07h,67h,FFh,FBh,FCh,EFh,70h
	DB	FFh,FFh,FFh,FFh,FFh,FFh,FFh,FFh,FFh,FFh,FFh,FFh,FFh,FFh,FFh,FFh

; Boss stages (61B3h) 13-tile 2bpp solid terrain block (B80Fh-B8DEh, 13 x 16B = 208B ->
; dst=51h..5Dh, attr=05h).
BOSS_STAGE_TILES_2BPP_B80F:
	DB	FFh,FFh,FFh,00h,00h,FFh,FFh,FFh,FFh,FFh,FFh,FFh,FFh,FFh,FFh,FFh
	DB	FFh,FFh,FFh,FFh,FFh,FFh,00h,FFh,FFh,00h,FFh,FFh,FFh,FFh,FFh,FFh
	DB	FFh,FFh,FFh,00h,FFh,00h,FFh,00h,FFh,00h,FFh,00h,FFh,00h,FFh,FFh
	DB	00h,FFh,FFh,00h,FFh,00h,FFh,02h,FFh,04h,FFh,0Ch,FFh,7Eh,FFh,FFh
	DB	00h,FFh,FFh,00h,FFh,00h,FFh,00h,FFh,42h,FFh,03h,FFh,32h,FFh,FFh
	DB	00h,FFh,FFh,00h,FFh,00h,FFh,00h,FFh,00h,FFh,00h,FFh,00h,FFh,FFh
	DB	FFh,FFh,FFh,FFh,FFh,CFh,FFh,86h,FFh,84h,FFh,80h,FFh,80h,FFh,80h
	DB	FFh,88h,FFh,90h,FFh,E0h,FFh,A0h,FFh,C0h,FFh,84h,FFh,81h,FFh,88h
	DB	FFh,80h,FFh,80h,FFh,80h,FFh,80h,FFh,80h,FFh,80h,FFh,80h,FFh,80h
	DB	FFh,80h,FFh,80h,FFh,88h,FFh,8Ah,FFh,84h,FFh,84h,FFh,C8h,FFh,FFh
	DB	FDh,03h,FFh,23h,FFh,07h,FFh,09h,FFh,25h,FFh,05h,FFh,03h,FFh,FFh
	DB	FDh,03h,FDh,03h,FDh,03h,FDh,03h,FDh,03h,FDh,03h,FDh,03h,FDh,03h
	DB	FDh,07h,FDh,43h,FDh,4Bh,FDh,33h,FDh,1Bh,FFh,0Dh,FFh,11h,FDh,23h

; Boss stages (61B3h) 18-tile raw-4bpp solid terrain block (B8DFh-BB1Eh, 18 x 32B = 576B ->
; dst=5Eh..6Fh, attr=05h; sub-slice BA3Fh-BA9Eh [3 tiles] also mirrored -> dst=70h..72h).
BOSS_STAGE_TILES_4BPP_B8DF:
	DB	FFh,FFh,FFh,FFh,FFh,F3h,3Fh,FFh,FFh,33h,3Fh,FFh,FFh,33h,5Fh,F8h
	DB	FFh,33h,5Fh,F8h,F5h,35h,5Fh,F8h,F3h,33h,5Fh,F8h,F3h,F3h,3Fh,F8h
	DB	42h,FFh,FFh,F8h,2Fh,FFh,FFh,F8h,FFh,3Fh,3Fh,F8h,FFh,FFh,FFh,F8h
	DB	FFh,FFh,FFh,F8h,FFh,FFh,FFh,F8h,5Fh,3Fh,3Fh,F8h,F5h,5Fh,FFh,F8h
	DB	FFh,FFh,FFh,F8h,FFh,F3h,3Fh,F8h,FFh,33h,3Fh,F8h,FFh,33h,5Fh,F8h
	DB	FFh,33h,5Fh,F8h,F5h,33h,3Fh,F8h,F3h,33h,3Fh,FFh,F3h,F3h,3Fh,FFh
	DB	CFh,FFh,3Fh,22h,CFh,FFh,FFh,3Fh,CFh,FFh,01h,FFh,CFh,F5h,FFh,FFh
	DB	CFh,FFh,FFh,FFh,CFh,F1h,FFh,FFh,CFh,FFh,0Fh,F0h,CFh,FFh,FFh,3Fh
	DB	CFh,F5h,FFh,53h,CFh,F3h,55h,53h,CFh,F5h,F5h,3Fh,CFh,FFh,FFh,33h
	DB	CFh,FFh,33h,5Fh,CFh,F3h,53h,3Fh,FFh,F3h,33h,FFh,FFh,FFh,FFh,22h
	DB	FFh,FFh,FFh,FFh,FFh,FFh,FFh,FFh,88h,88h,CCh,FFh,88h,88h,8Ch,CFh
	DB	88h,88h,88h,CFh,88h,88h,88h,CFh,88h,88h,88h,CFh,88h,88h,88h,CFh
	DB	FFh,F0h,FFh,05h,FFh,F3h,00h,55h,CFh,F5h,F5h,5Fh,CFh,FFh,FFh,55h
	DB	CFh,FFh,30h,5Fh,CFh,F5h,53h,3Fh,CFh,F3h,33h,FFh,CFh,FFh,FFh,FFh
	DB	4Fh,FFh,FFh,FFh,FFh,88h,88h,88h,F8h,88h,88h,88h,F8h,88h,88h,88h
	DB	F8h,88h,88h,88h,F8h,88h,88h,88h,8Fh,88h,88h,88h,F8h,FFh,FFh,FFh
	DB	FFh,F8h,CCh,CCh,FFh,F8h,88h,88h,FFh,F8h,88h,88h,FFh,F8h,88h,88h
	DB	FFh,F8h,88h,88h,FFh,F8h,88h,88h,FFh,FFh,88h,88h,FFh,FFh,FFh,FFh
	DB	FFh,FFh,FFh,F8h,88h,88h,88h,88h,88h,88h,88h,88h,88h,88h,88h,88h
	DB	88h,88h,88h,88h,88h,88h,88h,88h,88h,88h,88h,8Fh,FFh,FFh,FFh,FFh
	DB	F8h,CFh,FFh,FFh,F8h,CFh,FFh,FFh,F8h,CFh,FFh,FFh,F8h,CFh,FFh,FFh
	DB	F8h,CFh,FFh,FFh,F8h,CFh,FFh,FFh,F8h,CFh,FFh,FFh,F8h,CFh,FFh,FFh
	DB	FFh,FFh,FFh,FFh,F8h,88h,88h,88h,F8h,CCh,CCh,CCh,F8h,CFh,FFh,FFh
	DB	F8h,CFh,FFh,FFh,F8h,CFh,FFh,FFh,F8h,CFh,FFh,FFh,F8h,CFh,FFh,FFh
	DB	F8h,CFh,FFh,FFh,F8h,CFh,FFh,FFh,F8h,CFh,FFh,FFh,F8h,CCh,CCh,CCh
	DB	F8h,88h,88h,88h,FFh,FFh,FFh,FFh,FFh,FFh,FFh,FFh,FFh,FFh,FFh,FFh
	DB	F8h,F3h,FFh,3Fh,88h,FFh,FFh,FFh,88h,FFh,FFh,3Fh,88h,FFh,F5h,F2h
	DB	88h,FFh,33h,F2h,88h,FFh,FFh,FFh,8Fh,F3h,FFh,FFh,FFh,F5h,2Fh,FFh
	DB	FFh,FFh,FFh,F4h,88h,88h,88h,FFh,88h,88h,88h,8Fh,88h,88h,88h,8Fh
	DB	88h,88h,88h,8Fh,88h,88h,88h,8Fh,88h,88h,88h,F8h,FFh,FFh,FFh,8Fh
	DB	CCh,CCh,8Fh,FFh,88h,88h,8Fh,FFh,88h,88h,8Fh,FFh,88h,88h,8Fh,FFh
	DB	88h,88h,8Fh,FFh,88h,88h,8Fh,FFh,88h,88h,FFh,FFh,FFh,FFh,FFh,FFh
	DB	8Fh,FFh,FFh,FFh,88h,88h,88h,88h,88h,88h,88h,88h,88h,88h,88h,88h
	DB	88h,88h,88h,88h,88h,88h,88h,88h,F8h,88h,88h,88h,FFh,FFh,FFh,FFh
	DB	FFh,FFh,FCh,8Fh,FFh,FFh,FCh,8Fh,FFh,FFh,FCh,8Fh,FFh,FFh,FCh,8Fh
	DB	FFh,FFh,FCh,8Fh,FFh,FFh,FCh,8Fh,FFh,FFh,FCh,8Fh,FFh,FFh,FCh,8Fh

; Common VRAM C000h (63F9h) 4-tile 3bpp block (BB1Fh-BB7Eh, 96B -> dst=1Ch..1Fh).
COMMON_PAGE_C000_TILES_3BPP_BB1F:
	DB	FFh,FFh,FFh,FFh,FFh,FFh,FFh,1Fh,FFh,FFh,0Fh,BFh
	DB	BFh,4Fh,9Fh,9Fh,63h,9Fh,DFh,A1h,D7h,EFh,C1h,F3h
	DB	FFh,FFh,FFh,FFh,FFh,FFh,FFh,FEh,FFh,FFh,FCh,FEh
	DB	FEh,F8h,FDh,FFh,E0h,FFh,FEh,C1h,E2h,E4h,81h,DEh
	DB	FFh,C0h,FFh,FFh,80h,E1h,FFh,0Eh,B0h,DFh,07h,68h
	DB	CFh,20h,DFh,77h,03h,FFh,1Fh,83h,67h,83h,49h,B7h
	DB	FFh,FFh,FFh,FFh,3Fh,FFh,FFh,0Fh,3Fh,FFh,C7h,0Fh
	DB	FFh,F3h,07h,FFh,39h,C3h,FFh,D9h,E3h,FFh,E8h,F5h

; Common VRAM C000h (63F9h) 4-tile 3bpp block (BB7Fh-BBDEh, 96B -> dst=3Ch..3Fh).
COMMON_PAGE_C000_TILES_3BPP_BB7F:
	DB	E5h,D0h,EFh,EFh,D0h,EFh,F3h,ECh,F1h,FBh,F4h,F9h
	DB	F9h,F6h,F8h,FDh,FAh,FCh,FCh,FAh,FDh,FEh,FDh,FEh
	DB	C4h,03h,FCh,C2h,1Dh,62h,61h,0Eh,F1h,B1h,46h,A9h
	DB	E1h,02h,DDh,E1h,16h,C9h,D3h,0Ch,73h,D2h,0Dh,72h
	DB	DBh,21h,DFh,7Fh,00h,D7h,27h,50h,ACh,05h,EAh,14h
	DB	88h,56h,A9h,F0h,0Bh,F4h,C5h,30h,CBh,8Fh,60h,92h
	DB	FFh,F0h,FDh,FFh,F0h,FDh,FFh,78h,FDh,FFh,38h,7Dh
	DB	FFh,18h,BDh,FFh,18h,BDh,7Fh,12h,F9h,FFh,02h,D9h

; Common VRAM C000h (63F9h) 4-tile 3bpp block (BBDFh-BC3Eh, 96B -> dst=5Ch..5Fh).
COMMON_PAGE_C000_TILES_3BPP_BBDF:
	DB	FFh,FEh,FFh,FFh,FEh,FFh,FFh,FFh,FFh,FFh,FFh,FFh
	DB	FFh,FEh,FFh,FFh,FEh,FFh,FFh,FCh,FFh,FFh,F9h,FEh
	DB	6Ch,83h,7Ch,F3h,24h,FBh,BCh,52h,BDh,BDh,58h,BEh
	DB	39h,D4h,3Ah,BCh,C2h,35h,FCh,A2h,75h,F2h,41h,EEh
	DB	53h,80h,6Eh,4Fh,20h,DCh,BFh,00h,F9h,43h,00h,FFh
	DB	BFh,02h,7Fh,87h,1Bh,67h,0Fh,31h,CFh,19h,E2h,1Dh
	DB	FFh,02h,89h,AFh,01h,DBh,1Bh,85h,73h,13h,CDh,33h
	DB	27h,DBh,27h,CFh,33h,CFh,9Fh,63h,9Fh,BFh,43h,B7h

; Common VRAM C000h (63F9h) 4-tile 3bpp block (BC3Fh-BC9Eh, 96B -> dst=7Ch..7Fh).
COMMON_PAGE_C000_TILES_3BPP_BC3F:
	DB	FCh,F8h,FFh,FDh,F0h,FFh,FBh,F0h,FFh,FFh,F5h,FBh
	DB	FFh,F5h,FBh,FBh,F5h,FBh,FBh,F5h,FBh,FFh,FBh,FFh
	DB	F3h,40h,EFh,E3h,C4h,FBh,C7h,80h,FFh,C7h,88h,F7h
	DB	CDh,B2h,CDh,CBh,B7h,C8h,EBh,D7h,E8h,EBh,D7h,E8h
	DB	E4h,01h,FAh,0Ch,C1h,32h,06h,C0h,39h,86h,60h,99h
	DB	C2h,20h,DDh,C0h,20h,DFh,C0h,31h,CEh,61h,9Ah,65h
	DB	A7h,43h,BFh,C7h,23h,DFh,C7h,33h,CFh,E7h,51h,EBh
	DB	E3h,54h,E9h,F1h,6Ch,F3h,F1h,6Eh,F1h,FFh,F1h,FFh

; Common VRAM C000h (63F9h) 4-tile 3bpp block (BC9Fh-BCFEh, 96B -> dst=9Ch..9Fh).
COMMON_PAGE_C000_TILES_3BPP_BC9F:
	DB	FFh,FFh,FFh,FFh,FFh,FFh,FFh,FFh,FFh,FFh,FFh,FFh
	DB	FFh,FFh,FFh,FFh,FEh,FFh,FFh,FCh,FFh,FFh,FCh,FFh
	DB	F7h,CBh,F4h,FFh,E0h,FFh,FFh,E0h,FFh,F3h,8Ch,F3h
	DB	FBh,00h,FDh,C7h,00h,FFh,83h,00h,FDh,03h,0Ch,F3h
	DB	61h,9Eh,61h,E6h,19h,E6h,FCh,C2h,FDh,F9h,C4h,FAh
	DB	F0h,68h,F7h,F0h,29h,F6h,F9h,34h,FBh,F9h,66h,F9h
	DB	FFh,FFh,FFh,FFh,7Fh,FFh,FFh,7Fh,FFh,FFh,7Fh,FFh
	DB	FFh,7Fh,FFh,FFh,7Fh,FFh,FFh,FFh,FFh,FFh,7Fh,FFh

; Common VRAM C000h (63F9h) 4-tile 3bpp block (BCFFh-BD5Eh, 96B -> dst=BCh..BFh).
COMMON_PAGE_C000_TILES_3BPP_BCFF:
	DB	FFh,FCh,FFh,FFh,FCh,FFh,FFh,FCh,FFh,FFh,FEh,FFh
	DB	FFh,FFh,FFh,FFh,FFh,FFh,FFh,FFh,FFh,FFh,FFh,FFh
	DB	9Fh,20h,DFh,FFh,00h,FFh,FFh,00h,FFh,FFh,00h,FFh
	DB	FFh,C0h,FFh,FFh,F8h,FFh,FFh,FCh,FFh,FFh,FEh,FFh
	DB	F8h,06h,F9h,F6h,00h,FFh,F0h,00h,FFh,F1h,00h,FEh
	DB	F0h,08h,F7h,F8h,07h,F8h,FFh,00h,FFh,FFh,03h,FFh
	DB	FFh,3Fh,FFh,7Fh,3Fh,FFh,7Fh,3Fh,FFh,7Fh,3Fh,FFh
	DB	7Fh,BFh,7Fh,FFh,7Fh,FFh,FFh,7Fh,FFh,FFh,FFh,FFh

; Common VRAM 0000h (6423h) 2-tile raw-4bpp block (BD5Fh-BD9Eh, 64B -> dst=1Ah..1Bh).
COMMON_PAGE0000_TILES_4BPP_BD5F:
	DB	00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
	DB	00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,0Ah,A0h
	DB	0Ah,AAh,00h,00h,0Ah,AAh,0Ah,A0h,AEh,EAh,AAh,AAh,AEh,EEh,EAh,A0h
	DB	ACh,CEh,A0h,00h,ACh,AAh,00h,00h,AAh,00h,00h,00h,A0h,00h,00h,00h

; Common VRAM 0000h (6423h) 2-tile raw-4bpp block (BD9Fh-BDDEh, 64B -> dst=3Ah..3Bh).
COMMON_PAGE0000_TILES_4BPP_BD9F:
	DB	00h,00h,0Ah,AAh,00h,00h,0Ah,EEh,00h,00h,0Ah,CEh,00h,0Ah,0Ah,AAh
	DB	00h,0Ah,AAh,00h,00h,0Ah,CAh,A0h,00h,AAh,A0h,00h,0Ah,00h,00h,00h
	DB	AAh,A0h,00h,00h,AAh,A0h,00h,00h,AAh,00h,00h,00h,00h,00h,00h,00h
	DB	00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h

; Common VRAM 4000h (6430h) 3-tile raw-4bpp block (BDDFh-BE3Eh, 96B -> dst=1Dh..1Fh).
COMMON_PAGE4000_TILES_4BPP_BDDF:
	DB	00h,FFh,FFh,FFh,00h,F8h,88h,88h,00h,F8h,88h,88h,00h,F8h,88h,88h
	DB	00h,F8h,88h,88h,00h,F8h,88h,88h,FFh,F8h,88h,88h,FCh,F8h,88h,88h
	DB	FFh,FFh,FFh,FFh,88h,88h,88h,88h,88h,88h,88h,88h,88h,88h,88h,88h
	DB	88h,88h,88h,88h,88h,88h,88h,88h,88h,88h,88h,88h,88h,88h,88h,88h
	DB	FFh,FFh,FFh,00h,88h,88h,CFh,00h,88h,88h,CFh,00h,88h,88h,CFh,00h
	DB	88h,88h,CFh,00h,88h,88h,CFh,00h,88h,88h,CFh,FFh,88h,88h,CFh,CFh

; Common VRAM 4000h (6430h) 3-tile raw-4bpp block (BE3Fh-BE9Eh, 96B -> dst=3Dh..3Fh).
COMMON_PAGE4000_TILES_4BPP_BE3F:
	DB	F8h,F8h,88h,88h,F8h,F8h,88h,88h,F8h,FCh,CCh,CCh,FFh,FFh,FFh,FFh
	DB	FFh,F8h,88h,88h,FFh,FFh,FFh,FFh,FFh,F9h,8Fh,FFh,FFh,F8h,CFh,88h
	DB	88h,88h,88h,88h,88h,88h,88h,88h,CCh,CCh,CCh,CCh,FFh,FFh,FFh,FFh
	DB	88h,88h,88h,88h,FFh,FFh,FFh,FFh,FFh,F9h,8Fh,FFh,89h,F8h,8Fh,88h
	DB	88h,88h,CFh,CFh,88h,8Ch,CFh,CFh,CCh,CCh,CFh,CFh,FFh,FFh,FFh,CFh
	DB	88h,88h,8Fh,CFh,FFh,FFh,FFh,CFh,FFh,F9h,8Fh,CFh,89h,F8h,CFh,CFh

; Common VRAM 4000h (6430h cmd 643Ch) 3-tile raw-4bpp block (BE9Fh-BEFEh, 96B ->
; dst=5Dh..5Fh; ends with 88 88 88 8F FF FF FF at BEFEh).
COMMON_PAGE4000_TILES_4BPP_BE9F:
	DB	FFh,F8h,CFh,FFh,FFh,F8h,CFh,FFh,F8h,FFh,FFh,88h,F8h,88h,88h,88h
	DB	FCh,CCh,CCh,CCh,FFh,FFh,FFh,FFh,F8h,88h,88h,88h,FFh,FFh,FFh,FFh
	DB	FFh,F8h,CFh,FFh,FFh,FFh,FFh,FFh,88h,88h,88h,88h,88h,88h,88h,88h
	DB	CCh,CCh,CCh,CCh,FFh,FFh,FFh,FFh,88h,88h,88h,88h,FFh,FFh,FFh,FFh
	DB	FFh,F8h,CFh,CFh,FFh,F8h,CFh,CFh,88h,FFh,FFh,CFh,88h,88h,8Ch,CFh
	DB	CCh,CCh,CCh,CFh,FFh,FFh,FFh,FFh,88h,88h,88h,8Fh,FFh,FFh,FFh,FFh

; 257 bytes (BEFFh-BFFFh) of unused FFh bank tail padding immediately following the final
; byte (BEFEh) of Descriptor 6430h's last 3-tile raw-4bpp load.
BANK12_UNUSED_TAIL_PADDING_FF:
	DS	0101h,FFh

	DEPHASE

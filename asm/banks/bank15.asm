; Physical Bank 15 (ROM 1E000h-1FFFFh): Sound effects, BGM MML tracks, jingles & pause chime
	PHASE	A000h

; Remaining 90 bytes (A000h..A059h) of SFX 14h continuing seamlessly from Bank 14
; 9FE6h..9FFFh (byte A000h=20h completes tone period $020 started at 9FFEh..9FFFh)
SFX14_STREAM_BANK15_PART:
	DB	20h,B0h,1Fh,13h,A0h,20h,90h,20h,1Fh,80h,20h,10h,C0h,1Eh,B0h,1Dh
	DB	13h,A0h,1Eh,90h,1Eh,1Fh,80h,1Eh,10h,C0h,1Dh,B0h,1Ch,13h,A0h,1Dh
	DB	10h,C0h,1Bh,B0h,1Ah,13h,A0h,1Bh,90h,19h,10h,C0h,16h,A0h,16h,80h
	DB	16h,20h,04h,23h,01h,A0h,16h,80h,16h,70h,16h,20h,04h,23h,01h,90h
	DB	16h,70h,16h,50h,16h,20h,03h,23h,01h,80h,16h,60h,16h,40h,16h,20h
	DB	03h,23h,01h,70h,16h,50h,16h,30h,16h,FFh

; SFX 15h (raw PSG effect, 49B; triggered in Bank 02 89A1h)
SFX15_STREAM:
	DB	FEh,00h,22h,03h,B0h,30h,B0h,40h,20h,08h,22h,03h,A0h,30h,A0h,40h
	DB	20h,08h,22h,03h,70h,30h,70h,40h,20h,08h,22h,03h,60h,30h,60h,40h
	DB	20h,08h,22h,03h,50h,30h,50h,40h,20h,08h,22h,03h,40h,30h,40h,40h
	DB	FFh

; SFX 16h (1-byte FFh null/unused SFX slot)
SFX16_NULL_STREAM:
	DB	FFh

; SFX 17h (raw PSG effect, 57B; triggered in Bank 02 96F5h)
SFX17_STREAM:
	DB	FEh,00h,22h,01h,A0h,45h,A0h,40h,A0h,3Ah,A0h,30h,A0h,28h,A0h,50h
	DB	A0h,45h,A0h,40h,A0h,3Ah,A0h,30h,A0h,28h,A0h,54h,A0h,4Ah,A0h,45h
	DB	A0h,40h,A0h,3Ah,A0h,30h,A0h,28h,A0h,20h,A0h,1Ah,90h,21h,80h,19h
	DB	70h,22h,60h,18h,50h,28h,40h,17h,FFh

; SFX 18h (raw PSG menu/item/damage effect, 47B; triggered in Bank 01
; 7F2Ah/7F35h/7F48h/7F50h/7F58h/7FA6h)
SFX18_STREAM:
	DB	FEh,00h,22h,01h,80h,1Bh,80h,45h,A0h,40h,B0h,38h,B0h,31h,00h,00h
	DB	80h,31h,B0h,50h,90h,51h,70h,50h,00h,00h,B0h,50h,90h,38h,70h,30h
	DB	00h,00h,80h,38h,B0h,28h,90h,29h,70h,28h,50h,28h,40h,28h,FFh

; SFX 19h (raw PSG effect, 65B; triggered in Bank 01 728Ah / Bank 03 BC89h)
SFX19_STREAM:
	DB	FEh,00h,22h,01h,C1h,10h,C1h,00h,C1h,10h,C0h,F0h,C0h,E0h,C0h,DEh
	DB	20h,05h,22h,01h,A1h,10h,A0h,F0h,A0h,E0h,A0h,DFh,20h,03h,22h,01h
	DB	81h,10h,80h,F0h,80h,E0h,80h,DEh,20h,04h,22h,01h,71h,10h,70h,F0h
	DB	70h,E0h,70h,DEh,20h,04h,22h,01h,61h,10h,60h,F0h,60h,E0h,60h,DEh
	DB	FFh

; SFX 1Ah (raw PSG effect, 109B; triggered in Bank 02 98CBh)
SFX1A_STREAM:
	DB	FEh,00h,22h,01h,C2h,00h,E3h,00h,F5h,A0h,23h,01h,18h,E0h,4Ah,10h
	DB	C0h,3Ah,20h,01h,23h,01h,18h,D0h,2Ah,10h,B0h,32h,20h,0Ah,23h,01h
	DB	13h,C0h,4Ah,10h,A0h,3Ah,20h,01h,23h,01h,13h,B0h,2Ah,10h,90h,32h
	DB	20h,0Ah,23h,01h,13h,A0h,4Ah,10h,80h,3Ah,20h,01h,23h,01h,13h,90h
	DB	2Ah,10h,70h,32h,20h,0Ah,23h,01h,12h,80h,4Ah,10h,60h,3Ah,20h,01h
	DB	23h,01h,12h,70h,2Ah,10h,50h,32h,20h,0Ah,23h,01h,12h,60h,4Ah,10h
	DB	40h,3Ah,20h,01h,23h,01h,12h,50h,2Ah,10h,30h,32h,FFh

; SFX 1Bh (1-byte FFh null/unused SFX slot)
SFX1B_NULL_STREAM:
	DB	FFh

; SFX 1Ch (raw PSG boss effect, 19B; triggered in Bank 03 B55Fh)
SFX1C_STREAM:
	DB	FEh,00h,21h,01h,10h,D0h,B0h,A0h,23h,01h,90h,0Fh,80h,11h,21h,03h
	DB	13h,A0h,FFh

; SFX 1Dh (raw PSG boss attack effect, 53B; triggered in Bank 03 B58Bh/B830h/BAC7h)
SFX1D_STREAM:
	DB	FEh,00h,23h,01h,1Fh,C1h,80h,10h,E1h,00h,D1h,30h,C1h,60h,B1h,80h
	DB	A1h,A0h,1Ah,B1h,00h,10h,A1h,30h,91h,60h,81h,80h,71h,A0h,15h,91h
	DB	00h,10h,81h,30h,71h,60h,61h,80h,51h,A0h,71h,00h,61h,30h,51h,60h
	DB	41h,80h,31h,A0h,FFh

; SFX 1Eh (raw PSG boss effect, 80B; triggered in Bank 03 B66Dh)
SFX1E_STREAM:
	DB	FEh,00h,23h,01h,10h,E0h,15h,1Ah,A0h,35h,10h,E0h,80h,20h,02h,22h
	DB	01h,D1h,00h,D1h,A0h,D2h,50h,D3h,00h,D4h,A0h,D5h,50h,C1h,00h,D2h
	DB	00h,C4h,00h,C8h,00h,91h,04h,92h,08h,94h,10h,98h,20h,B1h,00h,B2h
	DB	00h,B4h,00h,B8h,00h,81h,08h,82h,10h,84h,18h,88h,20h,A1h,00h,A2h
	DB	00h,A3h,00h,A4h,00h,A8h,00h,71h,08h,72h,20h,74h,18h,78h,20h,FFh

; SFX 1Fh (raw PSG effect, 29B; triggered in Bank 03 AD32h)
SFX1F_STREAM:
	DB	FEh,00h,22h,02h,A0h,2Ah,80h,2Ah,A0h,35h,80h,35h,22h,05h,A0h,23h
	DB	80h,24h,70h,23h,60h,24h,50h,23h,40h,24h,30h,23h,FFh

; SFX 20h (raw PSG effect, 47B)
SFX20_STREAM:
	DB	FEh,00h,22h,02h,A0h,2Ah,90h,2Ah,A0h,35h,90h,35h,A0h,2Ah,90h,2Ah
	DB	A0h,35h,90h,35h,80h,2Ah,22h,05h,A0h,23h,90h,24h,90h,23h,80h,24h
	DB	70h,23h,22h,06h,60h,24h,50h,23h,22h,07h,40h,24h,30h,23h,FFh

; SFX 21h (raw PSG effect, 49B; triggered in Bank 01 667Ch)
SFX21_STREAM:
	DB	FEh,00h,23h,02h,10h,D0h,60h,11h,D0h,30h,D0h,18h,D0h,30h,10h,C0h
	DB	40h,11h,C0h,20h,C0h,10h,C0h,20h,10h,B0h,30h,11h,B0h,18h,B0h,0Ch
	DB	B0h,18h,10h,A0h,30h,11h,90h,10h,80h,0Ch,70h,10h,60h,30h,50h,10h
	DB	FFh

; SFX 23h (raw PSG effect, 132B; triggered in Bank 02 8089h)
SFX23_STREAM:
	DB	FEh,00h

SND_LOOP_A2BA:
	DB	23h,01h,10h,C0h,3Eh,1Fh,C3h,40h,A0h,00h,90h,00h,80h,00h,74h,D0h
	DB	60h,00h
	DB	FEh,03h	; Audio loop 3x
	DW	SND_LOOP_A2BA

SND_LOOP_A2D0:
	DB	23h,01h,10h,C0h,3Eh,1Fh,C3h,40h,A0h,00h,90h,00h,80h,00h,74h,D0h
	DB	FEh,02h	; Audio loop 2x
	DW	SND_LOOP_A2D0
	DB	23h,01h,1Ah,E1h,A0h,22h,01h,D2h,A0h,D3h,50h,C4h,A0h,20h,01h,23h
	DB	01h,D2h,A0h,22h,01h,C4h,00h,C5h,00h,B5h,50h,A5h,A0h,96h,00h,86h
	DB	50h,76h,A0h,67h,00h,57h,50h,47h,A0h,38h,00h,38h,50h,38h,A0h,39h
	DB	00h,39h,50h,23h,01h,C1h,A0h,22h,01h,B2h,A0h,A3h,50h,94h,A0h,20h
	DB	01h,23h,01h,A2h,A0h,22h,01h,94h,00h,95h,00h,85h,50h,75h,A0h,66h
	DB	00h,56h,50h,46h,A0h,37h,00h,FFh

; SFX 25h (raw PSG short blip, 13B; triggered in Bank 02 89C5h)
SFX25_STREAM:
	DB	FEh,00h

SND_LOOP_A33E:
	DB	22h,02h,B0h,35h,B0h,1Ah
	DB	FEh,08h	; Audio loop 8x
	DW	SND_LOOP_A33E
	DB	FFh

; SFX 26h (1-byte FFh null/unused SFX slot)
SFX26_NULL_STREAM:
	DB	FFh

; SFX 27h (raw PSG long effect, 143B; triggered in Bank 03 BDAFh)
SFX27_STREAM:
	DB	FEh,00h,23h,02h,10h,90h,30h,22h,02h,90h,0Fh,23h,02h,A0h,50h,22h
	DB	02h,A0h,0Fh,23h,02h,11h,B0h,10h,22h,02h,B0h,0Fh,23h,02h,C0h,28h
	DB	22h,02h,C0h,0Fh,23h,02h,12h,D0h,65h,22h,02h,D0h,0Fh,23h,02h,D0h
	DB	3Ah,22h,02h,D0h,0Fh,23h,02h,D0h,4Ch,22h,02h,D0h,0Fh,23h,02h,D0h
	DB	1Fh,22h,02h,D0h,0Fh,23h,02h,D0h,61h,22h,02h,D0h,0Fh,23h,02h,C0h
	DB	22h,22h,02h,C0h,0Fh,23h,02h,C0h,10h,22h,02h,C0h,0Fh,23h,02h,C0h
	DB	44h,22h,02h,C0h,0Fh,23h,02h,15h,B0h,32h,22h,02h,B0h,0Fh,23h,02h
	DB	17h,B0h,27h,22h,02h,B0h,0Fh,23h,02h,19h,A0h,16h,22h,02h,A0h,0Fh
	DB	23h,02h,1Dh,90h,48h,22h,02h,90h,0Fh,23h,02h,1Fh,90h,12h,FFh

; SFX 28h (raw PSG long effect, 139B; triggered in Bank 01 7EFBh)
SFX28_STREAM:
	DB	FEh,00h,22h,01h,A0h,90h,B0h,88h,C0h,40h,C0h,48h,C0h,66h,D0h,33h
	DB	A0h,18h,A0h,1Ah,C0h,20h,C0h,22h,B0h,26h,A0h,22h,90h,21h,22h,02h
	DB	80h,20h,70h,20h,60h,20h,50h,20h,40h,20h,22h,01h,30h,20h,B0h,33h
	DB	80h,18h,80h,1Ah,A0h,20h,A0h,22h,90h,26h,80h,22h,70h,21h,22h,02h
	DB	60h,20h,50h,20h,40h,20h,30h,20h,22h,01h,90h,33h,70h,18h,70h,1Ah
	DB	90h,20h,90h,22h,80h,26h,70h,22h,60h,21h,22h,02h,50h,20h,40h,20h
	DB	22h,04h,30h,20h,22h,01h,80h,33h,50h,18h,50h,1Ah,70h,20h,70h,22h
	DB	60h,26h,50h,22h,40h,21h,20h,08h,30h,20h,22h,01h,60h,33h,40h,18h
	DB	40h,1Ah,50h,20h,50h,22h,40h,26h,30h,21h,FFh

; SFX 29h (raw PSG boss effect, 45B; triggered in Bank 03 B1B2h)
SFX29_STREAM:
	DB	FEh,00h,23h,01h,10h,B0h,33h,B0h,31h,C0h,2Dh,10h,D0h,33h,E0h,31h
	DB	D0h,2Fh,D0h,2Eh,D0h,2Ch,D0h,28h,23h,01h,C0h,00h,C0h,28h,C0h,00h
	DB	B0h,27h,B0h,00h,B0h,28h,B0h,00h,B0h,28h,A0h,1Eh,FFh

; SFX 2Ah (raw PSG boss effect, 111B; triggered in Bank 03 B3E2h)
SFX2A_STREAM:
	DB	FEh,00h,22h,01h,D2h,00h,E3h,00h,D2h,00h,C1h,30h,B1h,00h,A1h,00h
	DB	91h,00h,81h,00h,71h,00h,C2h,00h,D3h,00h,C2h,00h,B1h,30h,A1h,00h
	DB	91h,00h,81h,00h,71h,00h,61h,00h,B2h,00h,C3h,00h,B2h,00h,A1h,30h
	DB	91h,00h,81h,00h,71h,00h,61h,00h,51h,00h,A2h,00h,B3h,00h,A2h,00h
	DB	91h,30h,81h,00h,71h,00h,61h,00h,51h,00h,41h,00h,92h,00h,A3h,00h
	DB	92h,00h,81h,30h,71h,00h,61h,00h,51h,00h,41h,00h,31h,00h,82h,00h
	DB	93h,00h,82h,00h,71h,30h,61h,00h,51h,00h,41h,00h,31h,00h,FFh

; SFX 2Bh (raw PSG boss effect, 25B; base ID in Bank 03 BB11h)
SFX2B_STREAM:
	DB	FEh,00h,22h,01h,90h,D0h,B0h,D0h,A0h,9Ah,A0h,A0h,90h,B0h,90h,B5h
	DB	90h,BAh,80h,C0h,80h,CAh,80h,DAh,FFh

; SFX 2Ch (1-byte FFh null/unused SFX slot)
SFX2C_NULL_STREAM:
	DB	FFh

; SFX 2Dh (1-byte FFh null/unused SFX slot)
SFX2D_NULL_STREAM:
	DB	FFh

; SFX 30h (raw PSG effect, 44B)
SFX30_STREAM:
	DB	FEh,00h,22h,01h,B1h,80h,C2h,80h,D3h,00h,D4h,00h,D5h,00h,20h,03h
	DB	23h,01h,1Ch,C0h,3Eh,C0h,52h,C0h,3Ch,C0h,50h,C0h,3Ah,C0h,4Eh,C0h
	DB	38h,C0h,4Ch,C0h,38h,C0h,4Ch,A0h,00h,C0h,35h,FFh

; SFX 31h (raw PSG effect, 106B; triggered in Bank 03 AE23h)
SFX31_STREAM:
	DB	FEh,00h,23h,01h,1Ah,E3h,00h,15h,C0h,38h,13h,C0h,4Ch,C0h,38h,C0h
	DB	4Eh,1Ah,D2h,00h,22h,01h,D4h,00h,20h,03h,23h,01h,1Ah,C1h,00h,22h
	DB	01h,D1h,20h,C1h,50h,C1h,80h,B1h,20h,B1h,90h,A1h,10h,A0h,E0h,20h
	DB	03h,23h,01h,1Ah,C1h,00h,22h,01h,C4h,00h,20h,03h,22h,01h,C1h,20h
	DB	B1h,50h,B1h,80h,A1h,20h,A1h,90h,91h,10h,90h,E0h,20h,03h,23h,01h
	DB	1Ah,A2h,00h,22h,01h,A4h,00h,20h,03h,22h,01h,B1h,20h,B1h,50h,A1h
	DB	80h,A1h,20h,91h,90h,91h,10h,80h,E0h,FFh

; SFX 32h (1-byte FFh null/unused SFX slot)
SFX32_NULL_STREAM:
	DB	FFh

; SFX 33h (raw PSG cassette cue tone, 111B; triggered in Bank 09 BEEFh)
SFX33_CASSETTE_CUE_STREAM:
	DB	FEh,00h,22h,01h,C1h,60h,C1h,00h,C0h,80h,C0h,40h,C0h,20h,22h,01h
	DB	C1h,40h,C0h,F0h,C0h,78h,C0h,3Ch,C0h,1Eh,22h,01h,C1h,20h,C0h,E3h
	DB	C0h,73h,C0h,3Ah,C0h,1Dh,22h,01h,C1h,00h,C0h,D8h,C0h,6Ch,C0h,36h
	DB	C0h,1Bh,22h,01h,C0h,F0h,C0h,CAh,C0h,64h,C0h,32h,C0h,19h,20h,03h
	DB	22h,01h,71h,40h,90h,F0h,90h,CAh,90h,64h,90h,32h,90h,19h,20h,04h
	DB	22h,01h,51h,40h,70h,F0h,70h,CAh,70h,64h,70h,32h,70h,19h,20h,04h
	DB	22h,01h,31h,40h,50h,F0h,50h,CAh,50h,64h,50h,32h,50h,19h,FFh

; SFX 34h (MML musical chime on Channel 3, 57B; triggered in Bank 06 AE49h/BA84h/BBBCh)
SFX34_MML_CHIME_STREAM:
	DB	EFh,D3h,FAh,00h,E3h,70h,B0h,E2h,20h,50h,70h,B0h,E1h,20h,50h,B0h
	DB	E0h,20h,50h,70h,D3h,F8h,00h,E1h,B0h,E0h,20h,50h,70h,D3h,F7h,00h
	DB	E1h,B0h,E0h,20h,50h,70h,D3h,F5h,00h,E1h,B0h,E0h,20h,50h,70h,D3h
	DB	F3h,00h,E1h,B0h,E0h,20h,50h,70h,FFh

; SFX 35h (1-byte FFh null/unused SFX slot)
SFX35_NULL_STREAM:
	DB	FFh

; SFX 36h (raw PSG high-priority effect, 47B; triggered in Bank 00 4838h / Bank 09 BEE5h)
SFX36_STREAM:
	DB	FEh,00h,22h,03h,A1h,40h,C0h,A0h,D0h,50h,D0h,48h,D0h,6Ah,C0h,35h
	DB	B0h,A0h,90h,50h,22h,05h,B0h,28h,B0h,35h,A0h,28h,90h,35h,80h,28h
	DB	90h,35h,70h,28h,60h,35h,50h,28h,50h,35h,40h,28h,40h,35h,FFh

; BGM 37h (Yamato / Main Stage) Ch0 main MML track (321B, loops infinitely to A6A9h)
BGM37_YAMATO_CH0_TRACK:
	DB	EFh,D4h,FAh,23h,ECh,52h,E2h,41h,71h,91h,B1h,E1h,21h,41h,71h,91h
	DB	F9h,13h,E1h,41h,21h,01h,23h,71h,9Bh,E2h,91h,B1h,E1h,01h,21h

BGM37_YAMATO_CH0_LOOP:
	DB	D8h,F9h,13h,ECh,52h,E1h,49h,D4h,C1h,41h,21h,01h,E2h,B1h,E1h,01h
	DB	FEh,FFh	; Call audio subroutine
	DW	BGM37_YAMATO_CH0_SUB0
	DB	E2h,41h,71h,91h,B1h,E1h,21h,41h,71h,91h,D8h,ECh,52h,E1h,49h,D4h
	DB	C1h,91h,41h,21h,01h,11h
	DB	FEh,FFh	; Call audio subroutine
	DW	BGM37_YAMATO_CH0_SUB0
	DB	F9h,14h,E5h,91h,E4h,90h,90h,E5h,71h,E4h,70h,70h,E5h,41h,E4h,40h
	DB	40h,E5h,71h,E4h,70h,70h,E9h,01h,85h,90h,EFh,D1h,F7h,00h,E2h,50h
	DB	60h,70h,80h,D4h,F9h,13h,ECh,52h,E2h,91h,B3h,E1h,03h,E2h,93h,B3h
	DB	E1h,03h,E2h,B9h,B1h,E1h,03h,23h,E2h,B3h,E1h,03h,23h,09h,01h,23h
	DB	43h,03h,23h,43h,D8h,7Bh,D4h,C1h,51h,41h,21h,01h,E2h,9Bh,71h,99h
	DB	91h,B1h,E1h,01h,E2h,91h,B7h,E1h,27h,E2h,81h,B1h,E1h,21h,51h,21h
	DB	51h,81h,B1h
	DB	FEh,FFh	; Call audio subroutine
	DW	BGM37_YAMATO_CH0_SUB1
	DB	E1h,7Fh,51h,41h,51h,21h,4Fh,51h,01h,E2h,91h,E1h,51h,71h,21h,E2h
	DB	B1h,E1h,71h
	DB	FEh,FFh	; Call audio subroutine
	DW	BGM37_YAMATO_CH0_SUB1
	DB	E1h,71h,71h,21h,E2h,B1h,E1h,81h,81h,21h,E2h,B1h,E1h,81h,81h,21h
	DB	E2h,B1h
	DB	FEh,FFh	; Call audio subroutine
	DW	BGM37_YAMATO_CH0_SUB2
	DB	9Fh
	DB	FEh,FFh	; Call audio subroutine
	DW	BGM37_YAMATO_CH0_SUB3
	DB	9Fh
	DB	FEh,FFh	; Call audio subroutine
	DW	BGM37_YAMATO_CH0_SUB4
	DB	C1h,79h,51h,41h,51h,21h,4Fh,51h,01h,E2h,91h,E1h,51h,71h,21h,E2h
	DB	B1h,E1h,71h
	DB	FEh,FFh	; Call audio subroutine
	DW	BGM37_YAMATO_CH0_SUB2
	DB	F7h,13h,91h,E0h,01h,E1h,91h,71h,F9h,13h,97h
	DB	FEh,FFh	; Call audio subroutine
	DW	BGM37_YAMATO_CH0_SUB3
	DB	F7h,13h,91h,E0h,01h,E1h,91h,71h,F9h,13h,97h
	DB	FEh,FFh	; Call audio subroutine
	DW	BGM37_YAMATO_CH0_SUB4
	DB	21h,E2h,B1h,E1h,81h,81h,21h,E2h,B1h,E1h,81h,81h,21h,E2h,B1h,FBh
	DB	13h,E4h,C1h,41h,21h,01h,E5h,B1h,E4h,01h,E5h,71h,81h
	DB	FEh,FEh	; Audio infinite loop
	DW	BGM37_YAMATO_CH0_LOOP

; BGM 37h Ch0 subroutine 0 (25B, called via FE FF from A6B9h/A6D3h)
BGM37_YAMATO_CH0_SUB0:
	DB	23h,01h,E2h,9Fh,E1h,41h,21h,01h,E2h,B1h,E1h,01h,23h,01h,E2h,9Dh
	DB	E1h,01h,E2h,B5h,71h,45h,B1h,99h,FFh

; BGM 37h Ch0 subroutine 1 (45B, called via FE FF from A73Ah/A751h)
BGM37_YAMATO_CH0_SUB1:
	DB	ECh,52h,E1h,91h,91h,F8h,13h,91h,91h,F5h,03h,91h,91h,F9h,13h,71h
	DB	99h,01h,21h,41h,71h,91h,91h,F8h,13h,91h,91h,F5h,03h,91h,91h,F9h
	DB	13h,71h,99h,01h,21h,41h,51h,71h,71h,21h,E2h,B1h,FFh

; BGM 37h Ch0 subroutine 2 (10B, called via FE FF from A767h/A788h)
BGM37_YAMATO_CH0_SUB2:
	DB	ECh,52h,E1h,91h,E0h,01h,E1h,91h,71h,FFh

; BGM 37h Ch0 subroutine 3 (11B, called via FE FF from A76Ch/A797h)
BGM37_YAMATO_CH0_SUB3:
	DB	01h,21h,41h,71h,91h,E0h,01h,E1h,91h,71h,FFh

; BGM 37h Ch0 subroutine 4 (13B, called via FE FF from A771h/A7A6h)
BGM37_YAMATO_CH0_SUB4:
	DB	01h,21h,41h,51h,71h,71h,21h,E2h,B1h,E1h,71h,71h,FFh

; BGM 37h (Yamato / Main Stage) Ch1 main MML track (386B, loops infinitely to A84Eh)
BGM37_YAMATO_CH1_TRACK:
	DB	EFh,D4h,FBh,13h,E4h,41h,71h,91h,B1h,E3h,21h,41h,71h,91h,E4h,93h
	DB	91h,73h,71h,5Bh,71h,70h,70h,E3h,71h,E4h,71h

BGM37_YAMATO_CH1_LOOP:
	DB	FEh,FFh	; Call audio subroutine
	DW	BGM37_YAMATO_CH1_SUB0
	DB	41h,71h,91h,B1h,E3h,21h,41h,71h,91h
	DB	FEh,FFh	; Call audio subroutine
	DW	BGM37_YAMATO_CH1_SUB0
	DB	91h,E3h,90h,90h,E4h,71h,E3h,70h,70h,E4h,41h,E3h,40h,40h,E4h,71h
	DB	E3h,70h,70h,E4h,51h,E3h,01h,51h,E4h,51h,51h,51h,51h,51h,51h,51h
	DB	E3h,01h,51h,E4h,51h,51h,51h,60h,60h,71h,E3h,21h,71h,E4h,71h,71h
	DB	71h,71h,71h,71h,71h,E3h,21h,71h,E4h,71h,71h,71h,80h,80h,91h,91h
	DB	E3h,41h,91h,E4h,91h,91h,91h,91h,91h,91h,E3h,41h,91h,E4h,91h,91h
	DB	91h,A0h,B0h,E3h,01h,01h,E2h,01h,E3h,01h,01h,01h,01h,01h,01h,01h
	DB	E2h,01h,E3h,01h,01h,E4h,B1h,91h,71h,51h,E3h,01h,51h,E4h,51h,51h
	DB	51h,51h,51h,51h,51h,E3h,01h,51h,E4h,51h,51h,51h,61h,71h,71h,E3h
	DB	71h,E4h,71h,71h,71h,71h,71h,81h,81h,E3h,82h,E4h,80h,81h,81h,E3h
	DB	81h,E4h,81h
	DB	FEh,FFh	; Call audio subroutine
	DW	BGM37_YAMATO_CH1_SUB1
	DB	71h,E3h,71h,E4h,71h,71h,70h,70h,E3h,73h,E4h,81h,80h,80h,E3h,82h
	DB	E4h,80h,91h,91h,E3h,91h,E4h,91h,91h,91h,E3h,91h,E4h,71h,51h,51h
	DB	E3h,51h,E4h,61h,71h,71h,E3h,71h,E4h,81h
	DB	FEh,FFh	; Call audio subroutine
	DW	BGM37_YAMATO_CH1_SUB1
	DB	70h,70h,E3h,73h,E4h,81h,80h,80h,E3h,81h,E4h,81h,81h,80h,80h,E3h
	DB	81h,E4h,81h

SND_LOOP_A937:
	DB	E4h,91h,E3h,91h
	DB	FEh,07h	; Audio loop 7x
	DW	SND_LOOP_A937
	DB	E4h,71h,E3h,71h

SND_LOOP_A943:
	DB	E4h,51h,E3h,51h
	DB	FEh,07h	; Audio loop 7x
	DW	SND_LOOP_A943
	DB	E4h,61h,E3h,61h

SND_LOOP_A94F:
	DB	E4h,71h,E3h,71h
	DB	FEh,06h	; Audio loop 6x
	DW	SND_LOOP_A94F
	DB	E4h,81h,E3h,81h,E4h,81h,E3h,81h

SND_LOOP_A95F:
	DB	E4h,91h,E3h,91h
	DB	FEh,03h	; Audio loop 3x
	DW	SND_LOOP_A95F
	DB	E4h,71h,E3h,71h,E4h,51h,E3h,51h,E4h,51h,61h,E4h,71h,E3h,71h,E4h
	DB	71h,E3h,71h

SND_LOOP_A97A:
	DB	E4h,91h,E3h,91h
	DB	FEh,07h	; Audio loop 7x
	DW	SND_LOOP_A97A
	DB	E4h,71h,E3h,71h

SND_LOOP_A986:
	DB	E4h,51h,E3h,51h
	DB	FEh,07h	; Audio loop 7x
	DW	SND_LOOP_A986
	DB	E4h,61h,E3h,61h

SND_LOOP_A992:
	DB	E4h,71h,E3h,71h
	DB	FEh,04h	; Audio loop 4x
	DW	SND_LOOP_A992

SND_LOOP_A99A:
	DB	E4h,81h,E3h,81h
	DB	FEh,04h	; Audio loop 4x
	DW	SND_LOOP_A99A
	DB	E9h,01h,A1h,EFh,E3h,41h,21h,01h,E4h,B1h,E3h,01h,E4h,71h,81h
	DB	FEh,FEh	; Audio infinite loop
	DW	BGM37_YAMATO_CH1_LOOP

; BGM 37h Ch1 subroutine 0 (91B, called via FE FF from A84Eh/A85Bh)
BGM37_YAMATO_CH1_SUB0:
	DB	FBh,13h,E4h,91h,91h,E3h,91h,E4h,91h,91h,91h,E3h,91h,E4h,91h,91h
	DB	91h,E3h,91h,E4h,91h,91h,90h,90h,E3h,91h,E4h,91h,51h,51h,E3h,51h
	DB	E4h,51h,51h,51h,E3h,51h,E4h,51h,51h,51h,E3h,51h,E4h,51h,51h,50h
	DB	50h,E3h,01h,51h,E4h,71h,71h,E3h,71h,E4h,71h,71h,71h,E3h,71h,E4h
	DB	71h,71h,70h,70h,E3h,73h,E4h,71h,70h,70h,E3h,82h,E4h,80h,91h,91h
	DB	E3h,91h,E4h,91h,91h,91h,E3h,91h,E4h,91h,FFh

; BGM 37h Ch1 subroutine 1 (59B, called via FE FF from A8F2h/A920h)
BGM37_YAMATO_CH1_SUB1:
	DB	E4h,91h,91h,E3h,91h,E4h,91h,91h,91h,E3h,91h,E4h,91h,91h,91h,E3h
	DB	91h,E4h,91h,91h,90h,90h,E3h,91h,E4h,71h,51h,51h,E3h,51h,E4h,51h
	DB	51h,51h,E3h,51h,E4h,51h,51h,51h,E3h,51h,E4h,51h,51h,50h,50h,E3h
	DB	51h,E4h,61h,71h,71h,E3h,71h,E4h,71h,71h,FFh

; BGM 37h (Yamato / Main Stage) Ch2 percussion+bass MML track using Macro Set 1 (441B, loops
; to AA6Dh)
BGM37_YAMATO_CH2_TRACK:
	DB	EFh,D4h,E9h,01h,10h,10h,21h,21h,21h,80h,80h,81h,81h,91h,EFh,F9h
	DB	13h,ECh,52h,E1h,01h,E2h,B1h,91h,B3h,E1h,41h,5Bh,E9h,01h,21h,21h
	DB	A1h,B1h

BGM37_YAMATO_CH2_LOOP:
	DB	EFh,D8h,F7h,03h,ECh,52h,E1h,09h,D4h,C2h,E8h,41h,21h,01h,E2h,B1h
	DB	E1h,01h,23h,00h,EFh,ECh,52h,E2h,5Fh,C0h,E8h,E1h,41h,21h,01h,E2h
	DB	B1h,E1h,01h,23h,00h,EFh,ECh,52h,E2h,2Dh,C0h,E8h,E1h,01h,E2h,B5h
	DB	71h,45h,B1h,99h,F7h,34h,E2h,41h,71h,91h,B1h,E1h,21h,41h,71h,90h
	DB	D8h,F7h,03h,ECh,52h,E1h,09h,E8h,D4h,C3h,91h,41h,21h,01h,11h,23h
	DB	EFh,ECh,52h,E2h,5Fh,C1h,E8h,E1h,41h,21h,01h,E2h,B1h,E1h,01h,23h
	DB	EFh,ECh,52h,E2h,2Dh,C2h,E8h,E1h,01h,E2h,B5h,71h,45h,B1h,96h,EFh
	DB	E9h,01h,01h,20h,20h,01h,20h,20h,81h,91h,21h,21h,E9h,01h,01h,01h
	DB	12h,EFh,D1h,F8h,00h,E2h,00h,10h,20h,30h,D4h,F9h,13h,ECh,52h,E2h
	DB	51h,73h,93h,53h,73h,93h,79h,71h,93h,B3h,73h,93h,B3h,99h,91h,B3h
	DB	E1h,03h,E2h,93h,B3h,E1h,03h,D8h,4Bh,D4h,C1h,21h,01h,E2h,B1h,91h
	DB	5Bh,41h,59h,51h,71h,91h,51h,77h,B7h,51h,81h,B1h,E1h,21h,E2h,B1h
	DB	E1h,21h,51h,81h
	DB	FEh,FFh	; Call audio subroutine
	DW	BGM37_YAMATO_CH2_SUB0
	DB	E1h,2Fh,21h,01h,21h,E2h,B1h,E1h,0Fh,01h,E2h,91h,51h,E1h,01h,21h
	DB	E2h,B1h,71h,E1h,21h
	DB	FEh,FFh	; Call audio subroutine
	DW	BGM37_YAMATO_CH2_SUB0
	DB	E1h,21h,21h,E2h,B1h,71h,E1h,21h,21h,E2h,B1h,81h,E1h,21h,21h,E2h
	DB	B1h,81h,E8h,F8h,13h,ECh,52h,E1h,C0h,91h,E0h,01h,E1h,91h,71h,9Fh
	DB	01h,21h,41h,71h,91h,E0h,01h,E1h,91h,71h,9Fh,01h,21h,41h,51h,71h
	DB	71h,21h,E2h,B0h,EFh,F9h,13h,E1h,21h,21h,C1h,29h,F7h,00h,20h,F8h
	DB	13h,E8h,51h,41h,51h,21h,4Eh,EFh,F8h,03h,E1h,01h,E2h,91h,51h,E1h
	DB	01h,21h,E2h,B1h,71h,E1h,21h,E8h,F7h,03h,ECh,52h,E2h,B0h,E1h,71h
	DB	91h,E0h,01h,E1h,91h,71h,F5h,03h,E1h,91h,E0h,01h,E1h,91h,71h,F7h
	DB	03h,E1h,97h,01h,21h,41h,71h,91h,E0h,01h,E1h,91h,71h,F5h,03h,91h
	DB	E0h,01h,E1h,91h,71h,F7h,03h,E1h,97h,01h,21h,40h,EFh,F8h,03h,21h
	DB	21h,E2h,B1h,71h,E1h,21h,21h,E2h,B1h,71h,E1h,21h,21h,E2h,B1h,81h
	DB	E1h,21h,21h,E2h,B1h,81h,D4h,E9h,01h,01h,30h,30h,01h,01h,81h,01h
	DB	91h,91h
	DB	FEh,FEh	; Audio infinite loop
	DW	BGM37_YAMATO_CH2_LOOP

; BGM 37h Ch2 subroutine 0 (49B, called via FE FF from AB31h/AB4Ah)
BGM37_YAMATO_CH2_SUB0:
	DB	ECh,52h,E1h,41h,41h,F9h,13h,41h,41h,F6h,03h,41h,41h,F9h,13h,21h
	DB	49h,E2h,91h,B1h,E1h,01h,41h,51h,51h,F8h,13h,51h,51h,F5h,03h,51h
	DB	51h,F9h,13h,41h,59h,E2h,91h,B1h,E1h,01h,21h,21h,21h,E2h,B1h,71h
	DB	FFh

; BGM 3Ah (Future / Space Stage) Ch0 main MML track (330B, loops infinitely to AC4Eh)
BGM3A_FUTURE_CH0_TRACK:
	DB	EFh,D7h,FAh,04h,E2h,70h,90h,A0h,E1h,20h,30h,90h,70h,20h,30h,20h
	DB	E2h,A0h,90h,E1h,20h,E2h,A0h,90h,70h

BGM3A_FUTURE_CH0_LOOP:
	DB	FAh,02h,E1h,70h,50h,20h,00h,E2h,70h,F7h,01h,E1h,70h,50h,20h,00h
	DB	E2h,70h,F6h,00h,E1h,70h,50h,20h,00h,E2h,70h,E9h,01h,A0h,A3h,EFh
	DB	D1h,F7h,00h,E2h,70h,70h,70h,70h,70h,70h,80h,80h,80h,80h,90h,90h
	DB	90h,A0h,A0h,B0h,B0h,E1h,00h,00h,10h,10h,20h,20h,30h,40h,50h,60h
	DB	70h,D7h,F8h,03h,ECh,33h,E1h,77h,EFh,F9h,02h,50h
	DB	FEh,FFh	; Call audio subroutine
	DW	BGM3A_FUTURE_CH0_SUB0
	DB	20h,F7h,01h,50h
	DB	FEh,FFh	; Call audio subroutine
	DW	BGM3A_FUTURE_CH0_SUB0
	DB	20h,F5h,00h,50h
	DB	FEh,FFh	; Call audio subroutine
	DW	BGM3A_FUTURE_CH0_SUB0
	DB	20h,F3h,00h,50h
	DB	FEh,FFh	; Call audio subroutine
	DW	BGM3A_FUTURE_CH0_SUB0
	DB	20h
	DB	FEh,02h	; Audio loop 2x
	DW	BGM3A_FUTURE_CH0_LOOP
	DB	F9h,02h,E2h,A0h,E1h,00h,10h,80h,50h,F8h,02h,E3h,A0h,E2h,50h,A0h
	DB	F6h,01h,E2h,A0h,E1h,00h,10h,80h,50h,F8h,02h,E3h,A0h,E2h,50h,A0h
	DB	F5h,00h,E2h,A0h,E1h,00h,10h,80h,F7h,01h,E2h,B2h,B0h,A2h,A0h,F9h
	DB	03h,ECh,33h,53h,F9h,02h,E1h,B3h,90h,40h,00h,E2h,90h,F7h,02h,E1h
	DB	B3h,90h,40h,00h,E2h,90h,F9h,02h,E1h,A3h,80h,30h,E2h,B0h,80h,F7h
	DB	02h,E1h,A3h,80h,30h,E2h,B0h,80h,FAh,02h,E2h,71h,F5h,00h,71h,F8h
	DB	01h,71h,F4h,00h,71h,F9h,02h,A1h,F5h,00h,A1h,F8h,01h,A1h,F4h,00h
	DB	A1h,FAh,02h,E1h,11h,F5h,00h,11h,F8h,01h,11h,F4h,00h,11h,F9h,02h
	DB	E2h,41h,F5h,00h,41h,F8h,01h,41h,F4h,00h,41h,FAh,02h,E1h,70h,40h
	DB	10h,E2h,A0h,F8h,01h,E1h,70h,40h,10h,E2h,A0h,F6h,00h,E1h,70h,40h
	DB	10h,E2h,A0h,F5h,00h,E1h,70h,40h,10h,E2h,A0h,F8h,02h,E1h,00h,E2h
	DB	30h,60h,90h,B0h,20h,50h,80h,A0h,20h,50h,70h,EFh,30h,40h,50h,60h
	DB	FEh,FEh	; Audio infinite loop
	DW	BGM3A_FUTURE_CH0_LOOP

; BGM 3Ah Ch0 subroutine 0 (9B, called via FE FF)
BGM3A_FUTURE_CH0_SUB0:
	DB	70h,20h,00h,E2h,70h,50h,E1h,50h,FFh

; BGM 3Ah (Future / Space Stage) Ch1 main MML track (106B, loops infinitely to ADA0h)
BGM3A_FUTURE_CH1_TRACK:
	DB	EFh,D7h,F7h,10h,E2h,C1h,70h,90h,A0h,E1h,20h,30h,90h,70h,20h,30h
	DB	20h,E2h,A0h,90h,E1h,20h,E2h,A0h

BGM3A_FUTURE_CH1_LOOP:
	DB	FEh,FFh	; Call audio subroutine
	DW	BGM3A_FUTURE_CH1_SUB0
	DB	10h,E4h,42h,53h,63h,50h,60h,70h,80h
	DB	FEh,02h	; Audio loop 2x
	DW	BGM3A_FUTURE_CH1_LOOP

SND_LOOP_ADB1:
	DB	E4h,A0h,A0h,E3h,50h,A0h
	DB	FEh,04h	; Audio loop 4x
	DW	SND_LOOP_ADB1
	DB	E4h,A2h,A0h,E3h,42h,40h,32h,30h,E4h,A3h

SND_LOOP_ADC5:
	DB	E4h,90h,90h,E3h,40h,90h
	DB	FEh,04h	; Audio loop 4x
	DW	SND_LOOP_ADC5

SND_LOOP_ADCF:
	DB	E4h,80h,80h,E3h,30h,80h
	DB	FEh,03h	; Audio loop 3x
	DW	SND_LOOP_ADCF
	DB	E4h,80h,80h,E3h,80h,60h
	DB	FEh,FFh	; Call audio subroutine
	DW	BGM3A_FUTURE_CH1_SUB0
	DB	11h,80h,60h,72h,E4h,70h,63h,50h,60h,70h,80h
	DB	FEh,FEh	; Audio infinite loop
	DW	BGM3A_FUTURE_CH1_LOOP

; BGM 3Ah Ch1 subroutine 0 (32B, called via FE FF)
BGM3A_FUTURE_CH1_SUB0:
	DB	F9h,03h,E4h,73h,E3h,13h,03h,63h,53h,E4h,B3h,A3h,E3h,43h,33h,E4h
	DB	90h,E3h,30h,E4h,91h,81h,E3h,40h,30h,20h,E4h,A0h,B0h,E3h,00h,FFh

; BGM 3Ah (Future / Space Stage) Ch2 percussion+bass MML track (306B, loops infinitely to
; AE20h)
BGM3A_FUTURE_CH2_TRACK:
	DB	D7h,E9h,01h,20h,20h,71h,20h,20h,71h,81h,81h,20h,20h,81h

BGM3A_FUTURE_CH2_LOOP:
	DB	EFh,F8h,02h,E1h,20h,00h,E2h,90h,70h,20h,F5h,01h,E1h,20h,00h,E2h
	DB	90h,70h,20h,F5h,00h,E1h,20h,00h,E2h,90h,70h,20h,E9h,01h,10h,13h
	DB	EFh,D1h,F6h,00h,00h,00h,00h,00h,00h,00h,10h,10h,10h,10h,20h,20h
	DB	20h,30h,30h,40h,40h,50h,50h,60h,60h,70h,70h,80h,90h,A0h,B0h,E1h
	DB	00h,D7h,F7h,03h,ECh,33h,07h,EFh,F9h,02h,E8h,E1h,50h
	DB	FEh,FFh	; Call audio subroutine
	DW	BGM3A_FUTURE_CH2_SUB0
	DB	F7h,01h,50h
	DB	FEh,FFh	; Call audio subroutine
	DW	BGM3A_FUTURE_CH2_SUB0
	DB	F5h,00h,EFh,F6h,13h,E2h,10h,F8h,13h,E5h,42h,53h,63h,F8h,03h,50h
	DB	60h,70h,80h
	DB	FEh,02h	; Audio loop 2x
	DW	BGM3A_FUTURE_CH2_LOOP
	DB	F7h,00h,E2h,C0h,A0h,E1h,00h,10h,80h,50h,C2h,F5h,00h,E2h,A0h,E1h
	DB	00h,10h,80h,50h,C2h,F5h,00h,E2h,A0h,E1h,00h,10h,80h,50h,C1h,E9h
	DB	01h,A1h,A1h,EFh,F9h,03h,ECh,33h,A3h,F7h,02h,E8h,C0h,B3h,90h,40h
	DB	00h,E2h,90h,F6h,02h,E1h,B3h,90h,40h,00h,E2h,90h,F7h,02h,E1h,A3h
	DB	80h,30h,E2h,B0h,80h,F6h,02h,E1h,A3h,80h,30h,E2h,B0h,F8h,00h,E2h
	DB	C0h,71h,F4h,00h,71h,F8h,01h,71h,F4h,00h,71h,F8h,00h,A1h,F5h,00h
	DB	A1h,F8h,01h,A1h,F4h,00h,A1h,F8h,00h,E1h,11h,F4h,00h,11h,F8h,01h
	DB	11h,F4h,00h,11h,F8h,00h,E2h,41h,F4h,00h,41h,F8h,01h,41h,F4h,00h
	DB	40h,F9h,02h,E1h,70h,40h,10h,E2h,A0h,F8h,01h,E1h,70h,40h,10h,E2h
	DB	A0h,F6h,00h,E1h,70h,40h,10h,E2h,A0h,F5h,00h,E1h,70h,40h,10h,E2h
	DB	A0h,EFh,F9h,02h,ECh,33h,E1h,33h,23h,13h,EFh,E8h,E2h,30h,40h,50h
	DB	60h
	DB	FEh,FEh	; Audio infinite loop
	DW	BGM3A_FUTURE_CH2_LOOP

; BGM 3Ah Ch2 subroutine 0 (10B, called via FE FF)
BGM3A_FUTURE_CH2_SUB0:
	DB	70h,20h,00h,E2h,70h,50h,E1h,50h,20h,FFh

; BGM 3Dh (Taiko / Prehistoric Stage) Ch0 main MML track (76B, loops infinitely to AF5Bh)
BGM3D_TAIKO_CH0_TRACK:
	DB	EFh,D7h,F9h,03h,E1h,00h,10h,20h,30h,40h,50h,60h,C0h

BGM3D_TAIKO_CH0_LOOP:
	DB	FAh,14h,E2h,73h
	DB	FEh,FFh	; Call audio subroutine
	DW	BGM3D_TAIKO_CH0_SUB0
	DB	23h,52h,FAh,10h,71h,ECh,42h,FAh,14h,74h,EFh,C1h,E5h,70h
	DB	FEh,FFh	; Call audio subroutine
	DW	BGM3D_TAIKO_SHARED_SUB0
	DB	E2h,73h
	DB	FEh,FFh	; Call audio subroutine
	DW	BGM3D_TAIKO_CH0_SUB0
	DB	F9h,02h,70h,50h,20h,00h,F9h,04h,E2h,A1h,FAh,10h,71h,ECh,42h,FAh
	DB	14h,77h,F9h,04h,ECh,61h,E1h,AFh,EFh,97h,87h
	DB	FEh,FEh	; Audio infinite loop
	DW	BGM3D_TAIKO_CH0_LOOP

; BGM 3Dh Ch0 subroutine 0 (33B, called via FE FF)
BGM3D_TAIKO_CH0_SUB0:
	DB	A3h,E1h,03h,13h,ECh,52h,23h,EFh,E2h,72h,A2h,F8h,00h,E1h,A0h,E2h
	DB	A0h,E1h,A0h,E2h,A0h,E1h,A0h,FAh,14h,E2h,50h,73h,A3h,E1h,03h,13h
	DB	FFh

; BGM 3Dh (Taiko / Prehistoric Stage) Ch1 main MML track (153B, loops infinitely to AFCCh)
BGM3D_TAIKO_CH1_TRACK:
	DB	EFh,D7h,F9h,04h,E2h,80h,90h,A0h,B0h,E1h,00h,10h,20h,FBh,24h,E4h
	DB	50h

BGM3D_TAIKO_CH1_LOOP:
	DB	D7h,FCh,24h,E4h,70h,70h,A1h,E3h,00h,E4h,A0h,C0h,50h,70h,70h,A1h
	DB	F8h,03h,E3h,50h,60h,70h,FCh,24h,E4h,50h,70h,70h,A1h,E3h,00h,E4h
	DB	A0h,C0h,50h,70h,70h,A0h,C0h,90h,E3h,90h,E4h,80h,E3h,80h,E4h,70h
	DB	70h,A1h,E3h,00h,E4h,A0h,C0h,50h,70h,70h,A1h,F8h,03h,E3h,50h,60h
	DB	70h,FCh,24h,E4h,50h,70h,70h,A1h,E3h,00h,E4h,A0h,C0h,50h,70h,70h
	DB	21h,50h,E3h,50h,E4h,60h,E3h,60h
	DB	FEh,03h	; Audio loop 3x
	DW	BGM3D_TAIKO_CH1_LOOP
	DB	D7h,FBh,14h,E4h,A1h,E3h,A1h,E4h,A0h,A0h,E3h,A1h,E4h,A0h,A0h,E3h
	DB	A1h,E4h,A1h,E3h,A1h,E4h,91h,E3h,91h,E4h,90h,90h,E3h,91h,E4h,80h
	DB	80h,E3h,81h,E4h,80h,80h,E3h,81h
	DB	FEh,FEh	; Audio infinite loop
	DW	BGM3D_TAIKO_CH1_LOOP

; BGM 3Dh (Taiko / Prehistoric Stage) Ch2 percussion MML track (63B, loops infinitely to
; B062h)
BGM3D_TAIKO_CH2_TRACK:
	DB	D7h,E9h,01h,70h,70h,70h,70h,80h,80h,80h,80h,EFh,FAh,14h

BGM3D_TAIKO_CH2_LOOP:
	DB	E5h,70h
	DB	FEh,FFh	; Call audio subroutine
	DW	BGM3D_TAIKO_SHARED_SUB0
	DB	E9h,01h,B0h
	DB	FEh,FFh	; Call audio subroutine
	DW	BGM3D_TAIKO_CH2_SUB1
	DB	B0h,A0h,30h,B0h,30h,10h,B0h
	DB	FEh,FFh	; Call audio subroutine
	DW	BGM3D_TAIKO_CH2_SUB1
	DB	00h,A0h,30h,11h,00h,EFh,E5h,70h
	DB	FEh,FFh	; Call audio subroutine
	DW	BGM3D_TAIKO_SHARED_SUB0
	DB	F9h,04h,ECh,61h,E1h,5Fh,EFh,47h,37h
	DB	FEh,FEh	; Audio infinite loop
	DW	BGM3D_TAIKO_CH2_LOOP

; BGM 3Dh shared subroutine (86B, called via FE FF by both Ch0 @AF71h and Ch2 @B064h/B082h)
BGM3D_TAIKO_SHARED_SUB0:
	DB	70h,A1h,E4h,00h,E5h,A0h,C0h,50h,70h,70h,A1h,F8h,03h,E3h,A0h,E2h
	DB	00h,20h,FAh,14h,E5h,50h,70h,70h,A1h,E4h,00h,E5h,A0h,C0h,50h,70h
	DB	70h,A0h,C0h,90h,E4h,90h,E5h,80h,E4h,80h,E5h,70h,70h,A1h,E4h,00h
	DB	E5h,A0h,C0h,50h,70h,70h,A1h,F8h,03h,E3h,A0h,E2h,00h,20h,FAh,14h
	DB	E5h,50h,70h,70h,A1h,E4h,00h,E5h,A0h,C0h,50h,70h,70h,21h,50h,E4h
	DB	50h,E5h,60h,E4h,60h,FFh

; BGM 3Dh Ch2 percussion subroutine 1 (26B, called via FE FF from B06Bh/B076h)
BGM3D_TAIKO_CH2_SUB1:
	DB	B0h,10h,B0h,30h,B0h,00h,B0h,B0h,B0h,00h,B0h,30h,B0h,30h,30h,B0h
	DB	B0h,10h,B0h,30h,B0h,00h,B0h,B0h,90h,FFh

; BGM 40h (Hell / Underworld Stage) Ch0 main MML track using Macro Set 5 (191B, loops to
; B13Ah)
BGM40_HELL_CH0_TRACK:
	DB	EFh,D8h,E9h,05h

SND_LOOP_B107:
	DB	91h,A1h,21h,31h,91h,71h,91h,A1h,21h,31h,91h,71h
	DB	FEh,02h	; Audio loop 2x
	DW	SND_LOOP_B107
	DB	EFh,DCh,FBh,03h,E5h,9Fh,E4h,0Fh,3Fh,2Fh,D8h,FDh,24h,20h
	DB	FEh,FFh	; Call audio subroutine
	DW	BGM40_HELL_CH0_SUB0
	DB	E5h,90h,90h,A0h,A0h,E4h,20h
	DB	FEh,FFh	; Call audio subroutine
	DW	BGM40_HELL_CH0_SUB0
	DB	00h,00h,20h,20h,FDh,24h

BGM40_HELL_CH0_LOOP:
	DB	E5h,91h,FBh,24h,90h,90h,FDh,24h,91h,E4h,01h,FBh,24h,00h,00h,FDh
	DB	24h,01h,E5h,91h,FBh,24h,90h,90h,FDh,24h,91h,71h,FBh,24h,70h,70h
	DB	FDh,24h,71h,91h,FBh,24h,90h,90h,FDh,24h,91h,E4h,01h,FBh,24h,00h
	DB	00h,FDh,24h,01h,31h,FBh,24h,30h,30h,FDh,24h,31h,01h,FBh,24h,00h
	DB	00h,FDh,24h,01h,21h,FBh,24h,90h,A0h,FDh,24h,21h,21h,FBh,24h,90h
	DB	A0h,FDh,24h,21h,31h,FBh,24h,90h,A0h,FDh,24h,31h,31h,FBh,24h,90h
	DB	A0h,FDh,24h,31h,21h,FBh,24h,90h,A0h,FDh,24h,21h,21h,FBh,24h,90h
	DB	A0h,FDh,24h,21h,21h,FBh,24h,90h,A0h,FDh,24h,21h,21h,FBh,24h,30h
	DB	30h,FDh,24h,21h
	DB	FEh,FEh	; Audio infinite loop
; A2 changes only the low byte at ROM 1F1C0h: B13Ah becomes B1F0h inside Ch1.
; Main, A1 and Enhanced retain the correct Ch0 loop destination.
	IF	HINOTORI_A2
	DW	BGM40_HELL_CH1_TRACK + 001Ah
	ELSE
	DW	BGM40_HELL_CH0_LOOP
	ENDIF

; BGM 40h Ch0 subroutine 0 (20B, called via FE FF)
BGM40_HELL_CH0_SUB0:
	DB	20h,30h,30h,90h,90h,20h,20h,30h,30h,A0h,A0h,90h,90h,A0h,A0h,20h
	DB	20h,30h,30h,FFh

; BGM 40h (Hell / Underworld Stage) Ch1 main MML track (+1 detune, Macro Set 5, 86B, loops
; to B206h)
BGM40_HELL_CH1_TRACK:
	DB	EFh,E8h,D8h,E9h,05h,91h
	DB	FEh,FFh	; Call audio subroutine
	DW	BGM40_HELL_SHARED_SUB0
	DB	71h,91h,A1h,21h,31h,91h,71h,D4h,E9h,01h,71h,73h,70h,70h,81h,83h
	DB	81h,80h,80h,90h,90h,A3h,EFh,D8h,FBh,22h,E2h

SND_LOOP_B1FB:
	DB	91h,A1h,21h,31h,91h,71h
	DB	FEh,0Ch	; Audio loop 12x
	DW	SND_LOOP_B1FB
	DB	E8h

BGM40_HELL_CH1_LOOP:
	DB	91h
	DB	FEh,FFh	; Call audio subroutine
	DW	BGM40_HELL_SHARED_SUB0
	DB	E1h,21h,E2h,91h,A1h,21h,31h,91h,71h,21h,91h,E1h,21h,01h,E2h,71h
	DB	31h,91h
	DB	FEh,FFh	; Call audio subroutine
	DW	BGM40_HELL_SHARED_SUB0
	DB	71h,91h
	DB	FEh,FFh	; Call audio subroutine
	DW	BGM40_HELL_SHARED_SUB0
	DB	71h
	DB	FEh,FEh	; Audio infinite loop
	DW	BGM40_HELL_CH1_LOOP

; BGM 40h shared Macro Set 5 riff subroutine (11B, called via FE FF by both Ch1 and Ch2)
BGM40_HELL_SHARED_SUB0:
	DB	A1h,21h,31h,91h,71h,91h,A1h,21h,31h,91h,FFh

; BGM 40h (Hell / Underworld Stage) Ch2 main MML track (+1 detune, Macro Set 5, 119B, loops
; to B277h)
BGM40_HELL_CH2_TRACK:
	DB	EFh,E8h,D8h,E9h,05h,90h,A1h,91h
	DB	FEh,FFh	; Call audio subroutine
	DW	BGM40_HELL_SHARED_SUB0
	DB	A1h,91h,A1h,21h,31h,91h,71h,01h,A1h,21h,31h,90h,D4h,E9h,01h

SND_LOOP_B252:
	DB	A3h,EFh,F9h,20h,E2h,71h,93h,A3h,E9h,01h,A0h,A0h,A3h,EFh,E8h,31h
	DB	93h,73h
	DB	FEh,FFh	; Call audio subroutine
	DW	BGM40_HELL_CH2_SUB1
	DB	33h,93h,73h,93h,A3h,21h,E9h,01h,00h,00h,15h
	DB	FEh,02h	; Audio loop 2x
	DW	SND_LOOP_B252

BGM40_HELL_CH2_LOOP:
	DB	A1h,A1h,EFh,E2h,71h,93h,A3h,23h,33h,93h,73h,93h,A3h,23h,33h,91h
	DB	E9h,01h,A1h,A1h,EFh,E1h,21h,E2h,91h,E9h,01h,A1h,EFh,A3h,23h,33h
	DB	93h,73h,23h,93h,E1h,23h,03h,E2h,73h,33h
	DB	FEh,FFh	; Call audio subroutine
	DW	BGM40_HELL_CH2_SUB1
	DB	31h,E9h,01h,A1h,A1h
	DB	FEh,FEh	; Audio infinite loop
	DW	BGM40_HELL_CH2_LOOP

; BGM 40h Ch2 subroutine 1 (22B, called via FE FF)
BGM40_HELL_CH2_SUB1:
	DB	93h,A3h,23h,33h,93h,73h,93h,A3h,23h,33h,93h,73h,93h,A3h,23h,33h
	DB	93h,73h,93h,A3h,23h,FFh

; BGM 43h (Boss Battle) Ch0 main MML track (89B, loops infinitely to B2C4h)
BGM43_BOSS_CH0_TRACK:
	DB	EFh,D8h,FBh,25h,E2h,91h
	DB	FEh,FFh	; Call audio subroutine
	DW	BGM43_BOSS_SHARED_SUB0
	DB	F7h,13h,E2h,71h,E1h,01h,51h,F6h,00h,E2h,41h,ECh,4Eh,E3h,93h,EFh
	DB	FBh,25h,E2h,91h
	DB	FEh,FFh	; Call audio subroutine
	DW	BGM43_BOSS_SHARED_SUB0
	DB	F7h,13h,E2h,71h,E1h,01h,51h,F6h,00h,E2h,41h,ECh,46h,93h,FBh,21h
	DB	E2h,21h
	DB	FEh,FFh	; Call audio subroutine
	DW	BGM43_BOSS_CH0_SUB1
	DB	EFh,FBh,21h,01h,F7h,21h,01h,F5h,21h,00h,E9h,02h,70h
	DB	FEh,FFh	; Call audio subroutine
	DW	BGM43_BOSS_CH0_SUB2
	DB	EFh,FBh,21h,21h
	DB	FEh,FFh	; Call audio subroutine
	DW	BGM43_BOSS_CH0_SUB1
	DB	FEh,FFh	; Call audio subroutine
	DW	BGM43_BOSS_CH0_SUB2
	DB	FEh,FEh	; Audio infinite loop
	DW	BGM43_BOSS_CH0_TRACK

; BGM 43h shared subroutine (9B, called via FE FF by both Ch0 and Ch2)
BGM43_BOSS_SHARED_SUB0:
	DB	E1h,21h,71h,E2h,71h,E1h,01h,51h,FFh

; BGM 43h Ch0 echo subroutine 1 (10B, called via FE FF)
BGM43_BOSS_CH0_SUB1:
	DB	F7h,21h,21h,F5h,21h,20h,E9h,02h,90h,FFh

; BGM 43h Ch0 subroutine 2 (14B, called via FE FF)
BGM43_BOSS_CH0_SUB2:
	DB	EFh,FBh,21h,11h,F7h,21h,11h,F5h,21h,10h,E9h,02h,80h,FFh

; BGM 43h (Boss Battle) Ch1 main MML track (80B, loops infinitely to B33Eh)
BGM43_BOSS_CH1_TRACK:
	DB	FEh,FFh	; Call audio subroutine
	DW	BGM43_BOSS_CH1_SUB0
	DB	F8h,13h,E5h,71h,E4h,01h,51h,F6h,13h,E5h,71h,E4h,01h,51h
	DB	FEh,FFh	; Call audio subroutine
	DW	BGM43_BOSS_CH1_SUB0
	DB	F7h,13h,E5h,71h,E4h,01h,51h,F4h,13h,E5h,71h,E4h,01h,51h
	DB	FEh,FFh	; Call audio subroutine
	DW	BGM43_BOSS_CH1_SUB1
	DB	FBh,21h,E4h,70h,70h,F8h,21h,70h,70h,F9h,21h,E3h,70h,70h
	DB	FEh,FFh	; Call audio subroutine
	DW	BGM43_BOSS_CH1_SUB2
	DB	F9h,21h,E3h,80h,80h
	DB	FEh,FFh	; Call audio subroutine
	DW	BGM43_BOSS_CH1_SUB1
	DB	FEh,FFh	; Call audio subroutine
	DW	BGM43_BOSS_CH1_SUB2
	DB	F9h,21h,E3h,70h,80h
	DB	FEh,FEh	; Audio infinite loop
	DW	BGM43_BOSS_CH1_TRACK

; BGM 43h Ch1 bass subroutine 0 (15B, called via FE FF)
BGM43_BOSS_CH1_SUB0:
	DB	EFh,D8h,FBh,25h,E5h,91h,E4h,21h,71h,E5h,71h,E4h,01h,51h,FFh

; BGM 43h Ch1 subroutine 1 (15B, called via FE FF)
BGM43_BOSS_CH1_SUB1:
	DB	FBh,21h,E4h,90h,90h,F8h,21h,90h,90h,F9h,21h,E3h,90h,90h,FFh

; BGM 43h Ch1 subroutine 2 (10B, called via FE FF)
BGM43_BOSS_CH1_SUB2:
	DB	FBh,21h,E4h,80h,80h,F8h,21h,80h,80h,FFh

; BGM 43h (Boss Battle) Ch2 echo/harmony MML track (107B, loops infinitely to B3B8h)
BGM43_BOSS_CH2_TRACK:
	DB	EFh,D8h

BGM43_BOSS_CH2_LOOP:
	DB	F7h,02h,E2h,C2h,91h
	DB	FEh,FFh	; Call audio subroutine
	DW	BGM43_BOSS_SHARED_SUB0
	DB	F5h,02h,E2h,71h,E1h,01h,F6h,02h,ECh,53h,E1h,55h,00h,20h,EFh,F7h
	DB	02h,E2h,91h
	DB	FEh,FFh	; Call audio subroutine
	DW	BGM43_BOSS_SHARED_SUB0
	DB	F5h,02h,E2h,71h,E1h,01h,51h,F8h,01h,E2h,C0h,00h,70h,F9h,02h,E1h
	DB	70h,70h,F7h,02h,70h,70h,F5h,02h,71h,F9h,02h,50h,50h,F7h,02h,50h
	DB	50h,F5h,02h,51h,F9h,02h,60h,60h,F7h,02h,60h,60h,F5h,02h,61h,F9h
	DB	02h,70h,70h,F5h,02h,70h,70h,F3h,02h,71h,F9h,02h,80h,80h,F7h,02h
	DB	80h,80h,F5h,02h,81h
	DB	FEh,FEh	; Audio infinite loop
	DW	BGM43_BOSS_CH2_LOOP

; BGM 46h Ch0 intro MML section (110B); falls directly into Bgm49_StoryLoop_Ch0Track at
; B48Fh
BGM46_STORY_INTRO_CH0_TRACK:
	DB	EFh,E8h,D8h,F8h,03h,E4h,00h,E3h,0Dh,E4h,20h,E3h,2Fh,E4h,BEh,70h
	DB	97h,90h,F6h,04h,90h,F8h,04h,90h,F6h,04h,90h,F8h,04h,90h,F6h,04h
	DB	90h,F7h,04h,90h,F5h,04h,90h,F7h,04h,70h,F5h,04h,70h,F6h,04h,70h
	DB	F4h,04h,70h,F6h,04h,50h,F4h,04h,90h,F3h,04h,E3h,00h,F2h,04h,50h
	DB	50h,90h,E2h,00h,50h,90h,50h,00h,E3h,90h,F1h,04h,70h,B0h,E2h,20h
	DB	70h,B0h,70h,20h,E3h,B0h,DFh,CFh,D8h,F6h,02h,ECh,43h,E1h,C1h,97h
	DB	FAh,12h,E4h,90h,E3h,00h,40h,90h,E4h,70h,B0h,E3h,20h,70h

; BGM 49h Ch0 entry and shared 46h/49h Ch0 infinite loop body (61B, loops to B48Fh)
BGM49_STORY_LOOP_CH0_TRACK:
	DB	D8h,F9h,03h,ECh,52h,E0h,04h,F7h,03h,00h,F9h,03h,E1h,B0h,90h,B2h
	DB	F7h,03h,B0h,F9h,03h,72h,F7h,03h,70h,F9h,03h,74h,F7h,03h,70h,F9h
	DB	03h,40h,70h,95h,40h,70h,94h,F7h,03h,90h,F9h,03h,91h,B0h,90h,73h
	DB	71h,E0h,00h,E1h,B0h,9Bh,F7h,03h,91h
	DB	FEh,FEh	; Audio infinite loop
	DW	BGM49_STORY_LOOP_CH0_TRACK

; BGM 46h Ch1 intro MML section (143B); falls directly into Bgm49_StoryLoop_Ch1Track at
; B55Bh
BGM46_STORY_INTRO_CH1_TRACK:
	DB	EFh,D8h,F9h,03h,E1h,01h,E2h,71h,41h,01h,E1h,01h,E2h,71h,41h,01h
	DB	E1h,21h,E2h,91h,71h,21h,E1h,21h,E2h,91h,71h,21h,E2h,B1h,61h,41h
	DB	E3h,B1h,E2h,B1h,40h,60h,70h,90h,B0h,E1h,00h,ECh,43h,E2h,76h,F7h
	DB	02h,70h,D4h,F9h,03h,E3h,91h,F8h,03h,E2h,21h,F9h,03h,51h,F8h,03h
	DB	91h,F8h,03h,E1h,21h,F7h,03h,41h,F8h,03h,51h,F7h,03h,91h,E3h,91h
	DB	F6h,03h,E2h,21h,F5h,03h,51h,F4h,03h,91h,51h,F3h,03h,91h,F2h,03h
	DB	E1h,01h,F1h,03h,51h,D8h,F4h,00h,ECh,52h,E0h,05h,E1h,B0h,90h,F5h
	DB	02h,B3h,F6h,02h,73h,75h,F7h,02h,40h,70h,F8h,02h,95h,F9h,03h,40h
	DB	70h,95h,91h,B0h,90h,73h,71h,E0h,00h,E1h,B0h,9Bh,F7h,00h,91h

; BGM 49h Ch1 entry and shared 46h/49h Ch1 infinite loop body (80B, loops to B55Bh)
BGM49_STORY_LOOP_CH1_TRACK:
	DB	D8h,F9h,04h,E4h,51h,51h,E9h,01h,20h,EFh,51h,60h,71h,71h,E9h,01h
	DB	20h,EFh,70h,70h,30h,41h,41h,E9h,01h,20h,EFh,41h,40h,91h,90h,90h
	DB	E9h,01h,20h,EFh,70h,E9h,01h,20h,EFh,70h,51h,51h,E9h,01h,20h,EFh
	DB	51h,50h,71h,71h,E9h,01h,20h,EFh,70h,71h,91h,90h,90h,E9h,01h,20h
	DB	EFh,91h,90h,91h,90h,90h,E9h,01h,20h,EFh,71h,70h
	DB	FEh,FEh	; Audio infinite loop
	DW	BGM49_STORY_LOOP_CH1_TRACK

; BGM 46h Ch2 intro MML section (110B); falls directly into Bgm49_StoryLoop_Ch2Track at
; B619h
BGM46_STORY_INTRO_CH2_TRACK:
	DB	E8h,D8h,F6h,02h,E5h,02h,E1h,01h,E2h,71h,41h,01h,E1h,01h,E2h,71h
	DB	41h,01h,E1h,21h,E2h,91h,71h,21h,E1h,21h,E2h,91h,71h,21h,E2h,B1h
	DB	61h,41h,E3h,B1h,E2h,B1h,40h,60h,70h,F7h,02h,ECh,44h,E1h,45h,F6h
	DB	02h,41h,D4h,E3h,C2h,91h,E2h,21h,F5h,02h,51h,91h,E1h,21h,F4h,02h
	DB	41h,51h,F3h,02h,91h,E3h,91h,E2h,41h,F2h,02h,51h,90h,D8h,F3h,02h
	DB	ECh,42h,E0h,0Bh,F4h,02h,E1h,B0h,90h,F5h,02h,B3h,73h,75h,40h,70h
	DB	95h,40h,70h,95h,91h,B0h,90h,73h,71h,E0h,00h,E1h,B0h,9Ah

; BGM 49h Ch2 entry and shared 46h/49h Ch2 infinite loop body (137B, loops to B619h)
BGM49_STORY_LOOP_CH2_TRACK:
	DB	D8h,F9h,13h,E3h,50h,90h,E2h,00h,50h,F8h,13h,90h,50h,F9h,13h,00h
	DB	E3h,90h,70h,B0h,E2h,20h,70h,F8h,13h,B0h,F9h,13h,70h,20h,E3h,B0h
	DB	40h,70h,B0h,E2h,20h,70h,F8h,13h,B0h,E1h,00h,E2h,B0h,F9h,13h,E3h
	DB	B0h,E2h,00h,40h,F8h,13h,90h,F9h,13h,E3h,90h,E2h,00h,40h,F8h,13h
	DB	90h,F9h,13h,E3h,50h,90h,E2h,00h,50h,F8h,13h,90h,F9h,13h,50h,00h
	DB	E3h,90h,70h,B0h,E2h,20h,70h,F8h,13h,B0h,F9h,13h,70h,20h,E3h,B0h
	DB	90h,E2h,00h,40h,F8h,13h,90h,F9h,13h,E3h,90h,E2h,00h,40h,F8h,13h
	DB	90h,F9h,13h,E3h,90h,E2h,00h,40h,F8h,13h,90h,F9h,13h,E3h,70h,B0h
	DB	E2h,20h,F8h,13h,70h
	DB	FEh,FEh	; Audio infinite loop
	DW	BGM49_STORY_LOOP_CH2_TRACK

; Sound 4Ch Ch0 raw PSG infinite 9-frame beep loop (12B: FE 00 -> 22 01 C0 40 20 08 ->
; tail-recursive FE FF A4 B6; Ch1-2 use BF49h)
BGM4C_SUBSCREEN_BEEP_CH0_TRACK:
	DB	FEh,00h

BGM4C_SUBSCREEN_BEEP_LOOP_BODY:
	DB	22h,01h,C0h,40h,20h,08h
	DB	FEh,FFh	; Call audio subroutine
	DW	BGM4C_SUBSCREEN_BEEP_LOOP_BODY

; Shared raw PSG melody track (111B) for BGM 4Fh Ch0 (Bosses 1..5 Clear) and Jingle 52h Ch0
; (Final Boss Clear)
BGM4F_52_BOSS_CLEAR_SHARED_CH0_TRACK:
	DB	FEh,00h,22h,01h,C2h,80h,C2h,00h,C1h,A0h,C1h,60h,C1h,20h,C0h,E0h
	DB	C0h,A0h,C0h,70h,C0h,50h,C0h,30h,C0h,28h,C0h,20h,C0h,18h,C0h,10h
	DB	92h,00h,91h,A0h,91h,60h,91h,20h,90h,E0h,90h,A0h,90h,70h,90h,50h
	DB	90h,30h,90h,28h,90h,20h,90h,18h,90h,10h,52h,00h,51h,A0h,51h,60h
	DB	51h,20h,50h,E0h,50h,A0h,50h,70h,50h,50h,50h,30h,50h,28h,50h,20h
	DB	50h,18h,50h,10h,32h,00h,31h,A0h,31h,60h,31h,20h,30h,E0h,30h,A0h
	DB	30h,70h,30h,50h,30h,30h,30h,28h,30h,20h,30h,18h,30h,10h,FFh

; BGM 4Fh (Bosses 1..5 Clear) Ch1 raw PSG harmony track (115B)
BGM4F_BOSS_CLEAR_CH1_TRACK:
	DB	FEh,00h,22h,01h,00h,00h,00h,00h,C2h,81h,C2h,01h,C1h,A1h,C1h,61h
	DB	C1h,21h,C0h,E1h,C0h,A1h,C0h,71h,C0h,51h,C0h,31h,C0h,29h,C0h,21h
	DB	C0h,19h,C0h,11h,92h,01h,91h,A1h,91h,61h,91h,21h,90h,E1h,90h,A1h
	DB	90h,71h,90h,51h,90h,31h,90h,29h,90h,21h,90h,19h,90h,11h,52h,01h
	DB	51h,A1h,51h,61h,51h,21h,50h,E1h,50h,A1h,50h,71h,50h,51h,50h,31h
	DB	50h,29h,50h,21h,50h,19h,50h,11h,32h,01h,31h,A1h,31h,61h,31h,21h
	DB	30h,E1h,30h,A1h,30h,71h,30h,51h,30h,31h,30h,29h,30h,21h,30h,19h
	DB	30h,11h,FFh

; Shared raw PSG harmony track (119B) used as BGM 4Fh Ch2 and Jingle 52h Ch1
BGM4F_CH2_JINGLE52_CH1_SHARED_TRACK:
	DB	FEh,00h,22h,01h,00h,00h,00h,00h,00h,00h,00h,00h,C2h,82h,C2h,02h
	DB	C1h,A2h,C1h,62h,C1h,22h,C0h,E2h,C0h,A2h,C0h,72h,C0h,52h,C0h,32h
	DB	C0h,2Ah,C0h,22h,C0h,1Ah,C0h,12h,92h,02h,91h,A2h,91h,62h,91h,22h
	DB	90h,E2h,90h,A2h,90h,72h,90h,52h,90h,32h,90h,2Ah,90h,22h,90h,1Ah
	DB	90h,12h,52h,02h,51h,A2h,51h,62h,51h,22h,50h,E2h,50h,A2h,50h,72h
	DB	50h,52h,50h,32h,50h,2Ah,50h,22h,50h,1Ah,50h,12h,32h,02h,31h,A2h
	DB	31h,62h,31h,22h,30h,E2h,30h,A2h,30h,72h,30h,52h,30h,32h,30h,2Ah
	DB	30h,22h,30h,1Ah,30h,12h,FFh

; Jingle 52h (Final Boss Clear) Ch2 raw PSG counter-melody track (125B)
JINGLE52_FINAL_BOSS_CLEAR_CH2_TRACK:
	DB	FEh,00h,23h,01h,1Ah,E2h,00h,22h,01h,E4h,00h,20h,03h,22h,01h,B2h
	DB	20h,E1h,90h,E2h,00h,D1h,C0h,D2h,20h,D1h,E0h,C2h,40h,C2h,00h,20h
	DB	03h,23h,01h,1Ah,B2h,00h,22h,01h,B4h,00h,20h,03h,22h,01h,A2h,20h
	DB	D1h,90h,D2h,00h,C1h,C0h,C2h,20h,B1h,E0h,B2h,40h,A2h,00h,20h,03h
	DB	23h,01h,1Ah,82h,00h,22h,01h,84h,00h,20h,03h,22h,01h,92h,20h,A1h
	DB	90h,A2h,00h,91h,C0h,92h,20h,91h,E0h,82h,40h,82h,00h,20h,03h,23h
	DB	01h,1Ah,62h,00h,22h,01h,64h,00h,20h,03h,22h,01h,72h,20h,81h,90h
	DB	82h,00h,71h,C0h,72h,20h,71h,E0h,62h,40h,62h,00h,FFh

; Jingle 55h (Warp / Transition) shared Ch0 & Ch2 raw PSG track (59B)
JINGLE55_WARP_CH0_CH2_SHARED_TRACK:
	DB	FEh,00h

SND_LOOP_B886:
	DB	22h,02h,A5h,80h,A5h,70h,A5h,60h,A5h,50h,A5h,40h,A5h,30h,A5h,20h
	DB	A5h,10h,A5h,00h,A4h,F0h,A4h,E0h,A4h,D0h,A4h,C0h,A4h,B0h,A4h,A0h
	DB	A4h,90h,A4h,80h,A4h,70h,A4h,60h,A4h,50h,A4h,40h,A4h,30h,A4h,20h
	DB	A4h,10h,A4h,00h
	DB	FEh,04h	; Audio loop 4x
	DW	SND_LOOP_B886
	DB	FFh

; Jingle 55h (Warp / Transition) Ch1 raw PSG track (49B)
JINGLE55_WARP_CH1_TRACK:
	DB	FEh,00h

SND_LOOP_B8C1:
	DB	22h,02h,85h,86h,85h,76h,85h,66h,85h,56h,85h,46h,85h,36h,85h,26h
	DB	85h,16h,85h,06h,84h,A6h,84h,96h,84h,86h,84h,76h,84h,66h,84h,56h
	DB	84h,46h,84h,36h,84h,26h,84h,16h,84h,06h
	DB	FEh,04h	; Audio loop 4x
	DW	SND_LOOP_B8C1
	DB	FFh

; Jingle 58h shared Ch1 & Ch2 raw PSG fanfare accompaniment track (69B)
JINGLE58_FANFARE_CH1_CH2_SHARED_TRACK:
	DB	FEh,00h,22h,05h,A4h,1Ah,A4h,40h,94h,70h,94h,A0h,94h,D5h,85h,10h
	DB	94h,10h,94h,40h,84h,70h,84h,A0h,84h,D5h,75h,10h,84h,1Ah,84h,40h
	DB	74h,70h,74h,A0h,74h,D5h,75h,10h,65h,50h,65h,90h,65h,F0h,66h,30h
	DB	66h,C0h,67h,00h,67h,70h,68h,00h,58h,50h,58h,A0h,59h,00h,55h,50h
	DB	59h,A0h,4Ah,00h,FFh

; Unreferenced 1-byte FFh null-track stub between Jingle 58h (B8F0h..B934h) and Jingle 61h
; (B936h..B9BBh); slots 5Bh/5Eh point to BF49h instead
UNREFERENCED_NULL_TRACK_STUB_B935:
	DB	FFh

; Jingle 61h (Boot / Title Intro) Ch0 MML track (65B)
JINGLE61_BOOT_INTRO_CH0_TRACK:
	DB	EFh,D8h,FAh,12h,E4h,51h,51h,F9h,13h,51h,51h,FAh,12h,71h,71h,F9h
	DB	13h,71h,71h,FAh,12h,41h,41h,F9h,13h,41h,41h,FAh,12h,91h,91h,F9h
	DB	13h,91h,91h,FAh,12h,51h,51h,F9h,13h,51h,51h,FAh,12h,71h,71h,F9h
	DB	13h,71h,71h,FAh,12h,91h,91h,41h,F9h,11h,40h,40h,F9h,03h,E5h,99h
	DB	FFh

; Jingle 61h (Boot / Title Intro) Ch1 MML track (33B)
JINGLE61_BOOT_INTRO_CH1_TRACK:
	DB	EFh,D8h,F9h,13h,ECh,52h,E0h,05h,E1h,B0h,90h,B3h,73h,75h,40h,70h
	DB	95h,40h,70h,95h,91h,B0h,90h,73h,71h,E0h,00h,E1h,B0h,ECh,42h,9Fh
	DB	FFh

; Jingle 61h (Boot / Title Intro) Ch2 MML track (36B)
JINGLE61_BOOT_INTRO_CH2_TRACK:
	DB	EFh,D4h,C5h,D8h,F6h,02h,E8h,ECh,52h,E0h,05h,E1h,B0h,90h,B3h,73h
	DB	75h,40h,70h,95h,40h,70h,95h,91h,B0h,90h,73h,71h,E0h,00h,E1h,B0h
	DB	ECh,42h,9Ch,FFh

; Shared Ch0 raw PSG lead fanfare track (143B) for Jingle 58h and Jingle 64h (Opening
; Firebird)
JINGLE58_64_SHARED_CH0_TRACK:
	DB	FEh,00h,22h,03h,90h,6Bh,20h,01h,22h,03h,90h,50h,20h,01h,22h,03h
	DB	90h,48h,20h,01h,22h,03h,90h,36h,70h,36h,50h,36h,40h,36h,20h,02h
	DB	22h,03h,70h,6Bh,20h,01h,22h,03h,70h,50h,20h,01h,22h,03h,70h,48h
	DB	20h,01h,22h,03h,70h,36h,50h,36h,30h,36h,30h,36h,20h,02h,22h,03h
	DB	50h,6Bh,20h,01h,22h,03h,50h,50h,20h,01h,22h,03h,50h,48h,20h,01h
	DB	22h,03h,50h,36h,40h,36h,30h,36h,30h,36h,20h,02h,22h,03h,40h,6Bh
	DB	20h,01h,22h,03h,40h,50h,20h,01h,22h,03h,40h,48h,20h,01h,22h,03h
	DB	40h,36h,22h,09h,30h,36h,20h,02h,22h,03h,30h,6Bh,20h,01h,22h,03h
	DB	30h,50h,20h,01h,22h,03h,30h,48h,20h,01h,22h,03h,30h,36h,FFh

; Jingle 64h (Opening Firebird) Ch1 raw PSG track (87B)
JINGLE64_FIREBIRD_CH1_TRACK:
	DB	FEh,00h,22h,02h,A0h,20h,80h,20h,A0h,28h,80h,28h,A0h,1Bh,22h,04h
	DB	80h,1Bh,70h,1Bh,60h,1Bh,50h,1Bh,22h,02h,80h,20h,60h,20h,80h,28h
	DB	60h,28h,80h,1Bh,22h,04h,60h,1Bh,50h,1Bh,40h,1Bh,30h,1Bh,22h,02h
	DB	60h,20h,40h,20h,60h,28h,40h,28h,60h,1Bh,22h,04h,50h,1Bh,40h,1Bh
	DB	22h,0Ch,30h,1Bh,22h,02h,50h,20h,30h,20h,50h,28h,30h,28h,50h,1Bh
	DB	22h,04h,40h,1Bh,30h,1Bh,FFh

; Jingle 64h (Opening Firebird) Ch2 raw PSG track (45B)
JINGLE64_FIREBIRD_CH2_TRACK:
	DB	FEh,00h,22h,05h,94h,1Ah,94h,40h,84h,70h,84h,A0h,84h,D5h,75h,10h
	DB	75h,50h,75h,90h,75h,F0h,66h,30h,66h,C0h,67h,00h,67h,70h,68h,00h
	DB	58h,50h,58h,A0h,59h,00h,59h,50h,59h,A0h,5Ah,00h,FFh

; BGM/Jingle 67h (Ending Credits Theme) Ch0 main MML track (234B, loops infinitely to BAD4h)
BGM67_ENDING_CREDITS_CH0_TRACK:
	DB	EFh,D8h,FAh,13h,E1h

BGM67_ENDING_CREDITS_CH0_LOOP:
	DB	20h
	DB	FEh,FFh	; Call audio subroutine
	DW	BGM67_ENDING_CREDITS_SHARED_SUB0
	DB	EFh,E2h,71h
	DB	FEh,FFh	; Call audio subroutine
	DW	BGM67_ENDING_CREDITS_SHARED_SUB1
	DB	EFh,70h
	DB	FEh,FFh	; Call audio subroutine
	DW	BGM67_ENDING_CREDITS_SHARED_SUB2
	DB	EFh,70h,90h,A0h,70h,E1h,30h,30h,F6h,03h,31h,FAh,13h,ECh,43h,73h
	DB	EFh,50h,50h,F6h,03h,51h,FAh,13h,ECh,43h,93h,EFh,E1h,70h,F7h,03h
	DB	70h,FAh,13h,70h,70h,C0h,20h,C0h,ECh,61h,78h,EFh,51h,40h,20h,C0h
	DB	40h,ECh,41h,05h,EFh,00h,20h,40h,E2h,70h,E1h,01h,40h,ECh,61h,78h
	DB	EFh,70h,60h,70h,90h,D4h,E9h,03h,30h,70h,A0h,E9h,02h,30h,E9h,03h
	DB	70h,A0h,E9h,02h,30h,70h,A1h,71h,31h,E9h,03h,A1h,50h,90h,E9h,02h
	DB	00h,50h,E9h,03h,90h,E9h,02h,00h,50h,90h,EFh,ECh,33h,E0h,07h,EFh
	DB	D8h,E1h,70h,90h,B0h,ECh,41h,76h,EFh,61h,71h,91h,B2h,62h,ECh,51h
	DB	25h,EFh,20h,10h,20h,40h,21h,30h,ECh,71h,58h,EFh,50h,40h,50h,70h
	DB	ECh,42h,92h,EFh,42h,11h,ECh,42h,B2h,EFh,62h,31h,E1h,40h,41h,ECh
	DB	51h,B8h,EFh,B0h,90h,70h,60h,62h,B2h,62h,22h,ECh,41h,E2h,B3h,EFh
	DB	E1h,21h,20h,20h,C0h,E2h,A0h,C0h,ECh,51h,E1h,28h,EFh,41h,40h,40h
	DB	C0h,E2h,90h,C0h,E1h,40h,31h,30h,30h,C0h,E2h,80h,C0h,E1h,30h
	DB	FEh,FEh	; Audio infinite loop
	DW	BGM67_ENDING_CREDITS_CH0_LOOP

; BGM 67h shared Ch0/Ch1 MML subroutine 0 (9B)
BGM67_ENDING_CREDITS_SHARED_SUB0:
	DB	00h,E2h,B0h,E1h,00h,ECh,41h,25h,FFh

; BGM 67h shared Ch0/Ch1 MML subroutine 1 (10B)
BGM67_ENDING_CREDITS_SHARED_SUB1:
	DB	B1h,E1h,21h,70h,70h,50h,ECh,61h,78h,FFh

; BGM 67h shared Ch0/Ch1 MML subroutine 2 (10B)
BGM67_ENDING_CREDITS_SHARED_SUB2:
	DB	50h,40h,20h,21h,40h,ECh,61h,E2h,78h,FFh

; BGM/Jingle 67h (Ending Credits Theme) Ch1 detuned echo MML track (247B, loops infinitely
; to BBD9h)
BGM67_ENDING_CREDITS_CH1_TRACK:
	DB	D8h,F9h,13h

BGM67_ENDING_CREDITS_CH1_LOOP:
	DB	E8h,E1h,20h
	DB	FEh,FFh	; Call audio subroutine
	DW	BGM67_ENDING_CREDITS_SHARED_SUB0
	DB	EFh,E8h,E2h,71h
	DB	FEh,FFh	; Call audio subroutine
	DW	BGM67_ENDING_CREDITS_SHARED_SUB1
	DB	EFh,E8h,70h
	DB	FEh,FFh	; Call audio subroutine
	DW	BGM67_ENDING_CREDITS_SHARED_SUB2
	DB	EFh,40h,50h,70h,40h,A0h,A0h,F6h,03h,A1h,F9h,13h,ECh,43h,E1h,33h
	DB	EFh,00h,00h,F6h,03h,01h,F9h,13h,ECh,43h,53h,EFh,E8h,20h,F6h,03h
	DB	20h,F9h,13h,20h,20h,C0h,E2h,B0h,C0h,ECh,61h,E1h,28h,EFh,E8h,51h
	DB	40h,20h,C0h,40h,ECh,41h,05h,EFh,E2h,90h,B0h,E1h,00h,E2h,40h,91h
	DB	E1h,00h,ECh,61h,48h,EFh,20h,10h,20h,40h,D4h,E9h,03h,00h,30h,70h
	DB	E9h,02h,00h,E9h,03h,30h,70h,E9h,02h,00h,30h,71h,31h,01h,E9h,03h
	DB	71h,00h,50h,90h,E9h,02h,00h,E9h,03h,50h,90h,E9h,02h,00h,50h,EFh
	DB	ECh,33h,E1h,97h,EFh,D8h,E1h,40h,60h,70h,ECh,41h,46h,EFh,21h,41h
	DB	61h,62h,22h,ECh,51h,E2h,B5h,EFh,B0h,A0h,B0h,E1h,00h,E2h,B1h,E1h
	DB	00h,ECh,71h,28h,EFh,20h,00h,20h,40h,ECh,42h,42h,EFh,12h,E2h,91h
	DB	ECh,42h,E1h,62h,EFh,32h,E2h,B1h,E2h,B1h,B0h,ECh,51h,E1h,78h,EFh
	DB	70h,60h,40h,20h,22h,62h,22h,E2h,B2h,ECh,41h,63h,EFh,A1h,A0h,A0h
	DB	C0h,50h,C0h,ECh,51h,A8h,EFh,E1h,11h,10h,10h,C0h,E2h,40h,C0h,E1h
	DB	10h,01h,00h,00h,C0h,E2h,30h,C0h,E1h,00h
	DB	FEh,FEh	; Audio infinite loop
	DW	BGM67_ENDING_CREDITS_CH1_LOOP

; BGM/Jingle 67h (Ending Credits Theme) Ch2 bass/accompaniment MML track (249B, loops
; infinitely to BCD1h)
BGM67_ENDING_CREDITS_CH2_TRACK:
	DB	D8h,FBh,14h,E4h

BGM67_ENDING_CREDITS_CH2_LOOP:
	DB	73h
	DB	FEh,FFh	; Call audio subroutine
	DW	BGM67_ENDING_CREDITS_CH2_SUB0
	DB	FBh,14h,40h,70h,E3h,00h,E4h,70h,40h,30h,31h,F8h,12h,30h,FBh,14h
	DB	33h,50h,51h,F8h,12h,50h,FBh,14h,53h,73h
	DB	FEh,FFh	; Call audio subroutine
	DW	BGM67_ENDING_CREDITS_CH2_SUB0
	DB	FBh,14h,00h,20h,40h,70h,20h,31h,F9h,14h,30h,30h,FAh,14h,30h,30h
	DB	FBh,14h,30h,FCh,24h,30h,51h,F8h,12h,50h,F9h,14h,50h,FAh,14h,50h
	DB	FBh,14h,50h,FCh,14h,50h,50h,FBh,13h,41h,FAh,13h,40h,40h,40h,FBh
	DB	13h,41h,FAh,15h,40h,FBh,13h,41h,FBh,15h,40h,40h,FAh,13h,E3h,40h
	DB	FEh,FFh	; Call audio subroutine
	DW	BGM67_ENDING_CREDITS_CH2_SUB1
	DB	FBh,15h,B0h,FBh,13h,B1h,B0h,FBh,14h,B1h,B0h,FAh,13h,E3h,B0h,FBh
	DB	14h,E4h,50h,B1h,FBh,13h,A1h,FAh,13h,A0h,A0h,A0h,A1h,FBh,14h,A0h
	DB	A0h,A0h,F8h,12h,A0h,FBh,13h,E3h,A1h,E4h,A0h
	DB	FEh,FFh	; Call audio subroutine
	DW	BGM67_ENDING_CREDITS_CH2_SUB2
	DB	B1h,B0h,B0h,E3h,B0h,E4h,B2h,41h,FAh,13h,40h,40h,FAh,14h,40h,FBh
	DB	13h,E4h,41h,FAh,15h,30h,FBh,13h,41h,FAh,13h,40h,40h,E3h,40h
	DB	FEh,FFh	; Call audio subroutine
	DW	BGM67_ENDING_CREDITS_CH2_SUB1
	DB	FAh,15h,A0h,FBh,13h,B1h,B0h,FBh,13h,B1h,B0h,FAh,13h,E3h,B0h,FBh
	DB	13h,E4h,50h,B1h,A1h,A0h,A0h,F9h,12h,E3h,A0h,E4h,A0h,FBh,14h,A1h
	DB	A0h,A0h,F8h,12h,A0h,FAh,13h,E3h,A1h,FBh,14h,E4h,A0h
	DB	FEh,FFh	; Call audio subroutine
	DW	BGM67_ENDING_CREDITS_CH2_SUB2
	DB	81h,80h,80h,E3h,80h,E4h,82h
	DB	FEh,FEh	; Audio infinite loop
	DW	BGM67_ENDING_CREDITS_CH2_LOOP

; BGM 67h Ch2 MML subroutine 0 (54B)
BGM67_ENDING_CREDITS_CH2_SUB0:
	DB	F8h,12h,71h,FBh,14h,70h,71h,F8h,12h,70h,70h,FBh,14h,70h,B0h,E3h
	DB	20h,E4h,B0h,70h,53h,F8h,12h,51h,FBh,14h,50h,51h,F8h,12h,50h,50h
	DB	FBh,14h,50h,B0h,E3h,20h,E4h,B0h,50h,43h,F8h,12h,41h,FBh,14h,40h
	DB	41h,F8h,12h,40h,40h,FFh

; BGM 67h Ch2 MML subroutine 1 (12B)
BGM67_ENDING_CREDITS_CH2_SUB1:
	DB	E4h,40h,FBh,13h,41h,B1h,FAh,13h,B0h,B0h,B0h,FFh

; BGM 67h Ch2 MML subroutine 2 (10B)
BGM67_ENDING_CREDITS_CH2_SUB2:
	DB	50h,A0h,91h,90h,90h,E3h,90h,E4h,92h,FFh

; Jingle 6Ah (Special Item / Event) Ch0 MML track (37B)
JINGLE6A_ITEM_EVENT_CH0_TRACK:
	DB	EFh,D6h,F9h,13h,E1h,90h,90h,F8h,00h,70h,90h,F9h,13h,40h,40h,F8h
	DB	00h,20h,40h,F9h,03h,00h,E2h,B0h,90h,80h,D7h,90h,40h,00h,40h,D8h
	DB	F6h,03h,E3h,97h,FFh

; Jingle 6Ah (Special Item / Event) Ch1 MML track (46B)
JINGLE6A_ITEM_EVENT_CH1_TRACK:
	DB	EFh,D6h,F9h,13h,E1h,40h,40h,F8h,00h,20h,40h,F9h,13h,E2h,B0h,B0h
	DB	F8h,00h,90h,B0h,F9h,03h,E8h,E1h,00h,E2h,B0h,90h,80h,EFh,D7h,F6h
	DB	00h,E1h,90h,40h,00h,40h,D8h,F6h,02h,ECh,48h,E2h,07h,FFh

; Jingle 6Ah (Special Item / Event) Ch2 MML track (40B)
JINGLE6A_ITEM_EVENT_CH2_TRACK:
	DB	EFh,D6h,FAh,13h,E4h,90h,E3h,91h,E4h,90h,70h,E3h,71h,E4h,70h,51h
	DB	50h,50h,D7h,71h,80h,80h,D4h,F8h,00h,91h,E3h,00h,40h,E2h,91h,E1h
	DB	00h,40h,F6h,00h,ECh,43h,97h,FFh

; Jingle 6Dh (Game Over) Ch0 MML track (63B)
JINGLE6D_GAME_OVER_CH0_TRACK:
	DB	EFh,D4h,FAh,23h,E5h,91h,91h,E9h,01h,21h,EFh,91h,91h,91h,E9h,01h
	DB	21h,EFh,91h,71h,71h,E9h,01h,21h,EFh,71h,71h,71h,E9h,01h,21h,EFh
	DB	71h,61h,61h,E9h,01h,21h,EFh,61h,61h,61h,E9h,01h,21h,EFh,61h,51h
	DB	51h,E9h,01h,21h,EFh,51h,51h,E9h,01h,21h,91h,A1h,EFh,9Dh,FFh

; Jingle 6Dh (Game Over) Ch1 MML track (54B)
JINGLE6D_GAME_OVER_CH1_TRACK:
	DB	EFh,D4h,FBh,22h,E2h,41h,21h,41h,91h,F8h,02h,91h,FBh,22h,21h,41h
	DB	71h,91h,21h,41h,91h,F8h,02h,91h,FBh,22h,21h,41h,91h,E1h,01h,21h
	DB	E2h,B1h,91h,F8h,02h,91h,FBh,22h,B1h,73h,51h,F8h,02h,51h,FBh,23h
	DB	51h,51h,51h,73h,9Fh,FFh

; Jingle 6Dh (Game Over) Ch2 MML track (43B)
JINGLE6D_GAME_OVER_CH2_TRACK:
	DB	EFh,D4h,FBh,13h,E4h,91h,91h,91h,90h,90h,91h,91h,91h,91h,71h,71h
	DB	71h,70h,70h,71h,71h,71h,71h,61h,61h,61h,60h,60h,61h,61h,61h,61h
	DB	51h,51h,51h,50h,50h,51h,73h,FBh,14h,9Fh,FFh

; System 70h (Pause Chime) Ch0 detuned C-G-E-G-C MML chime track (14B, BF2Dh..BF3Ah)
SYS70_PAUSE_CHIME_CH0_TRACK:
	DB	E8h,D1h,FCh,88h,E1h,04h,74h,44h,74h,FCh,23h,E0h,09h,FFh

; System 70h (Pause Chime) Ch1 C-G-E-G-C MML chime track (14B, BF3Bh..BF48h; BF47h=09h note
; C, BF48h=FFh track terminator)
SYS70_PAUSE_CHIME_CH1_TRACK:
	DB	EFh,D1h,FCh,88h,E1h,04h,74h,44h,74h,FCh,23h,E0h,09h,FFh

; Shared 1-byte FFh immediate-stop track referenced by 15 pointers in
; MasterSoundTrackPtrTable (SFX 24h, BGM 4Ch Ch1-2, 5Bh Ch0-2, 5Eh Ch0-2, 70h Ch2-3, 74h
; Ch0-3)
SND_TRACK_NULL_STOP:
	DB	FFh

; 182 bytes (BF4Ah..BFFFh) of unreferenced FFh ROM padding to end of Bank 15 (together with
; BF48h terminator and BF49h null track forms 184 trailing FFh bytes BF48h..BFFFh)
BANK15_TRAILING_PADDING:
	DS	00B6h,FFh

	DEPHASE

; Physical Bank 11 (ROM 16000h-17FFFh): Levels 1-6 horizontal route strip definitions and Ending Scene 2 tiles
	PHASE	8000h

; Level 1 Route 1 horizontal strip definitions (15FC0h-1613Fh, 384B total): Bank 11 part 2
; (320B = strips 8..47).
LEVEL1_ROUTE1_STRIP_DEFS_PART2:
	DB	3Eh,0Ah,00h,01h,13h,24h,6Bh,3Bh	; Strip 08h
	DB	3Ah,1Ah,03h,00h,2Fh,2Ah,6Ch,11h	; Strip 09h
	DB	3Ah,1Dh,00h,13h,62h,21h,03h,06h	; Strip 0Ah
	DB	3Ah,4Ch,57h,4Dh,2Ah,1Ah,13h,31h	; Strip 0Bh
	DB	36h,5Ch,5Eh,5Dh,2Ch,1Ch,16h,3Bh	; Strip 0Ch
	DB	3Ah,4Ch,58h,4Dh,2Dh,1Ah,15h,3Bh	; Strip 0Dh
	DB	36h,5Ch,5Eh,5Dh,2Ch,1Ch,19h,3Fh	; Strip 0Eh
	DB	36h,1Dh,02h,15h,2Ah,1Ch,0Dh,3Fh	; Strip 0Fh
	DB	36h,4Ch,57h,4Dh,2Ch,63h,08h,11h	; Strip 10h
	DB	3Ah,5Ch,5Fh,5Dh,2Dh,64h,1Bh,03h	; Strip 11h
	DB	3Ah,1Dh,03h,00h,23h,2Ch,26h,26h	; Strip 12h
	DB	3Eh,0Ah,00h,01h,00h,66h,23h,2Dh	; Strip 13h
	DB	3Ch,0Ch,01h,00h,01h,02h,03h,22h	; Strip 14h
	DB	3Eh,0Ah,00h,01h,00h,01h,00h,06h	; Strip 15h
	DB	3Eh,0Ch,01h,00h,01h,00h,13h,31h	; Strip 16h
	DB	3Ch,0Ah,02h,01h,00h,01h,16h,33h	; Strip 17h
	DB	3Eh,0Ch,13h,24h,1Ah,03h,19h,3Bh	; Strip 18h
	DB	10h,09h,15h,2Ch,1Ch,01h,0Bh,3Fh	; Strip 19h
	DB	07h,00h,2Fh,2Dh,1Ah,00h,08h,11h	; Strip 1Ah
	DB	30h,26h,62h,2Ah,1Ch,01h,02h,06h	; Strip 1Bh
	DB	32h,2Ch,2Dh,65h,67h,00h,13h,31h	; Strip 1Ch
	DB	36h,21h,22h,25h,00h,02h,16h,3Bh	; Strip 1Dh
	DB	3Ah,1Ah,01h,00h,01h,00h,19h,3Bh	; Strip 1Eh
	DB	3Ah,1Dh,00h,02h,00h,01h,0Bh,3Fh	; Strip 1Fh
	DB	3Eh,0Ah,01h,00h,03h,00h,0Dh,3Fh	; Strip 20h
	DB	3Ah,1Ah,00h,01h,00h,01h,0Bh,3Fh	; Strip 21h
	DB	36h,1Ch,02h,00h,01h,03h,15h,3Bh	; Strip 22h
	DB	3Ah,4Ch,56h,58h,58h,57h,4Dh,37h	; Strip 23h
	DB	36h,41h,4Ah,4Ah,53h,60h,5Dh,3Bh	; Strip 24h
	DB	36h,42h,4Ah,4Ah,55h,04h,19h,37h	; Strip 25h
	DB	36h,41h,4Ah,4Ah,5Ah,56h,4Dh,3Bh	; Strip 26h
	DB	3Ah,40h,53h,60h,61h,52h,46h,3Bh	; Strip 27h
	DB	3Ah,40h,55h,04h,05h,54h,44h,3Bh	; Strip 28h
	DB	3Ah,42h,5Ah,56h,58h,5Bh,43h,37h	; Strip 29h
	DB	36h,5Ch,61h,52h,4Ah,4Ah,45h,37h	; Strip 2Ah
	DB	36h,1Dh,05h,54h,4Ah,4Ah,46h,3Bh	; Strip 2Bh
	DB	3Ah,4Ch,58h,5Bh,4Ah,4Ah,46h,3Bh	; Strip 2Ch
	DB	36h,5Ch,5Fh,5Eh,5Eh,5Fh,5Dh,3Bh	; Strip 2Dh
	DB	3Ah,1Dh,01h,00h,01h,02h,19h,3Bh	; Strip 2Eh
	DB	3Eh,0Ch,03h,01h,02h,01h,0Bh,3Fh	; Strip 2Fh

; Level 1 Route 2 horizontal strip definitions (48 strips x 8 metatile IDs = 384B), pointed
; to by Bank 00 route strip table 57ADh[1].
LEVEL1_ROUTE2_STRIP_DEFS:
	DB	3Eh,3Eh,3Eh,0Ah,0Dh,3Fh,3Fh,3Fh	; Strip 00h
	DB	3Eh,3Eh,0Eh,09h,08h,0Fh,3Fh,3Fh	; Strip 01h
	DB	3Eh,0Eh,09h,03h,00h,08h,0Fh,3Dh	; Strip 02h
	DB	3Ch,0Ch,01h,00h,01h,00h,0Bh,39h	; Strip 03h
	DB	38h,0Ah,00h,01h,00h,02h,15h,37h	; Strip 04h
	DB	3Ah,1Dh,01h,00h,01h,00h,17h,37h	; Strip 05h
	DB	36h,1Ch,02h,01h,00h,01h,19h,3Bh	; Strip 06h
	DB	3Ah,1Dh,03h,00h,01h,00h,0Bh,3Fh	; Strip 07h
	DB	3Eh,0Ah,00h,01h,00h,03h,0Dh,3Fh	; Strip 08h
	DB	10h,09h,01h,00h,01h,00h,19h,37h	; Strip 09h
	DB	07h,02h,00h,13h,24h,26h,35h,3Bh	; Strip 0Ah
	DB	30h,26h,26h,27h,2Ch,50h,0Fh,3Fh	; Strip 0Bh
	DB	32h,48h,4Bh,1Fh,66h,4Fh,08h,11h	; Strip 0Ch
	DB	3Ah,42h,5Ah,56h,57h,59h,00h,06h	; Strip 0Dh
	DB	36h,5Ch,61h,52h,4Ah,5Ah,4Dh,35h	; Strip 0Eh
	DB	3Ah,6Bh,26h,2Eh,2Eh,2Eh,2Eh,3Bh	; Strip 0Fh
	DB	10h,6Dh,23h,2Dh,2Ch,2Dh,21h,11h	; Strip 10h
	DB	07h,01h,02h,23h,2Ch,2Ah,1Ah,06h	; Strip 11h
	DB	30h,1Bh,01h,00h,23h,2Ch,28h,31h	; Strip 12h
	DB	36h,26h,1Bh,03h,19h,2Ah,1Eh,37h	; Strip 13h
	DB	20h,2Dh,26h,1Bh,15h,2Dh,1Eh,3Bh	; Strip 14h
	DB	07h,23h,2Ch,1Ch,16h,2Ch,1Eh,3Bh	; Strip 15h
	DB	30h,1Eh,2Ah,1Ah,19h,2Dh,1Eh,37h	; Strip 16h
	DB	3Ah,1Eh,2Dh,1Ah,16h,2Ch,6Bh,3Bh	; Strip 17h
	DB	36h,1Eh,2Ch,1Ch,15h,2Dh,6Eh,3Bh	; Strip 18h
	DB	3Ah,1Eh,2Ch,1Ch,16h,2Dh,1Ch,11h	; Strip 19h
	DB	10h,2Fh,2Ah,1Ah,19h,2Ch,63h,06h	; Strip 1Ah
	DB	13h,62h,2Ch,1Ah,16h,2Ah,64h,31h	; Strip 1Bh
	DB	27h,2Dh,21h,01h,00h,23h,2Ch,33h	; Strip 1Ch
	DB	29h,21h,03h,00h,01h,00h,23h,37h	; Strip 1Dh
	DB	32h,1Ah,00h,01h,00h,01h,15h,37h	; Strip 1Eh
	DB	3Ah,1Ch,01h,00h,01h,03h,19h,3Bh	; Strip 1Fh
	DB	3Ah,1Dh,02h,01h,01h,00h,0Bh,3Fh	; Strip 20h
	DB	3Eh,0Ch,00h,02h,00h,01h,0Dh,3Fh	; Strip 21h
	DB	3Ch,0Ah,01h,00h,01h,00h,0Bh,3Fh	; Strip 22h
	DB	38h,1Ch,00h,01h,00h,01h,0Dh,3Fh	; Strip 23h
	DB	3Ah,1Ah,01h,00h,01h,03h,0Bh,3Dh	; Strip 24h
	DB	36h,1Dh,00h,01h,00h,01h,0Dh,39h	; Strip 25h
	DB	3Eh,1Dh,02h,00h,01h,00h,0Bh,3Bh	; Strip 26h
	DB	36h,1Dh,00h,01h,00h,01h,0Dh,3Bh	; Strip 27h
	DB	3Ch,0Ch,01h,03h,01h,02h,0Bh,3Dh	; Strip 28h
	DB	38h,34h,26h,1Ah,13h,24h,35h,39h	; Strip 29h
	DB	3Ah,3Ah,2Ch,1Ch,16h,2Dh,3Bh,3Bh	; Strip 2Ah
	DB	3Eh,3Ah,6Fh,70h,71h,72h,37h,3Fh	; Strip 2Bh
	DB	3Eh,36h,73h,74h,75h,76h,37h,3Fh	; Strip 2Ch
	DB	3Eh,3Ah,77h,78h,79h,7Ah,3Fh,3Fh	; Strip 2Dh
	DB	3Eh,3Eh,32h,1Ch,19h,3Bh,3Fh,3Fh	; Strip 2Eh
	DB	3Eh,36h,3Ah,1Ch,0Bh,3Fh,3Fh,3Fh	; Strip 2Fh

; Level 1 Route 3 horizontal strip definitions (48 strips x 8 metatile IDs = 384B), pointed
; to by Bank 00 route strip table 57ADh[2].
LEVEL1_ROUTE3_STRIP_DEFS:
	DB	3Eh,0Ah,15h,2Ch,1Ah,01h,0Dh,3Fh	; Strip 00h
	DB	3Eh,0Ch,16h,2Dh,1Ch,00h,0Bh,3Fh	; Strip 01h
	DB	3Eh,0Ah,17h,2Ch,1Ah,01h,0Dh,3Fh	; Strip 02h
	DB	3Ah,1Ch,15h,2Ah,1Ah,00h,0Bh,3Fh	; Strip 03h
	DB	3Ah,1Dh,17h,2Dh,1Ch,03h,0Dh,3Dh	; Strip 04h
	DB	36h,1Ch,16h,2Dh,1Ch,00h,0Bh,39h	; Strip 05h
	DB	3Ah,1Dh,15h,2Ch,1Ah,01h,16h,37h	; Strip 06h
	DB	3Ch,0Ah,17h,2Ah,1Ch,03h,17h,3Bh	; Strip 07h
	DB	38h,0Ch,16h,2Ch,1Ch,01h,19h,37h	; Strip 08h
	DB	3Ah,1Ch,15h,2Ah,1Ah,00h,0Bh,3Fh	; Strip 09h
	DB	3Ah,1Ch,16h,2Ah,1Ch,01h,0Dh,3Fh	; Strip 0Ah
	DB	3Ah,1Dh,17h,2Ch,1Ah,02h,0Bh,3Fh	; Strip 0Bh
	DB	10h,09h,2Fh,2Dh,1Ah,00h,0Dh,3Dh	; Strip 0Ch
	DB	07h,13h,62h,2Ch,1Ch,00h,0Bh,39h	; Strip 0Dh
	DB	34h,27h,2Dh,21h,03h,01h,16h,3Bh	; Strip 0Eh
	DB	3Ah,21h,66h,00h,01h,00h,15h,37h	; Strip 0Fh
	DB	10h,01h,00h,01h,00h,01h,17h,3Bh	; Strip 10h
	DB	07h,00h,01h,00h,01h,00h,19h,3Bh	; Strip 11h
	DB	30h,1Bh,00h,01h,00h,02h,0Bh,3Fh	; Strip 12h
	DB	36h,1Dh,02h,00h,01h,00h,0Dh,3Fh	; Strip 13h
	DB	3Ah,1Dh,00h,01h,00h,01h,0Bh,3Dh	; Strip 14h
	DB	3Ch,0Ah,01h,00h,02h,00h,0Dh,39h	; Strip 15h
	DB	38h,0Ch,00h,01h,00h,03h,16h,3Bh	; Strip 16h
	DB	3Ah,1Dh,01h,00h,01h,00h,19h,37h	; Strip 17h
	DB	3Ah,4Ch,58h,57h,58h,58h,4Dh,3Bh	; Strip 18h
	DB	10h,5Eh,5Dh,2Eh,40h,53h,60h,11h	; Strip 19h
	DB	07h,00h,2Fh,2Ch,41h,55h,04h,06h	; Strip 1Ah
	DB	34h,26h,62h,2Dh,42h,5Ah,4Dh,35h	; Strip 1Bh
	DB	32h,21h,22h,66h,5Eh,5Eh,5Dh,3Bh	; Strip 1Ch
	DB	36h,1Ah,01h,00h,01h,03h,19h,37h	; Strip 1Dh
	DB	3Ah,1Ch,00h,02h,00h,00h,0Bh,3Fh	; Strip 1Eh
	DB	3Ah,1Dh,01h,00h,01h,00h,0Dh,37h	; Strip 1Fh
	DB	3Eh,0Ah,00h,01h,00h,01h,0Bh,3Dh	; Strip 20h
	DB	3Eh,0Ch,01h,00h,01h,00h,0Dh,39h	; Strip 21h
	DB	3Ch,0Ah,02h,01h,00h,01h,16h,3Bh	; Strip 22h
	DB	38h,0Ch,01h,00h,01h,03h,17h,37h	; Strip 23h
	DB	3Ah,1Ch,18h,26h,1Ah,01h,19h,3Bh	; Strip 24h
	DB	3Ah,4Ch,49h,2Ch,1Ch,00h,0Bh,3Fh	; Strip 25h
	DB	36h,69h,5Dh,2Dh,1Ah,01h,0Dh,3Dh	; Strip 26h
	DB	3Ah,14h,4Dh,2Ah,1Ch,02h,0Bh,39h	; Strip 27h
	DB	36h,5Ch,6Ah,2Ch,1Ah,01h,0Dh,3Fh	; Strip 28h
	DB	36h,4Ch,68h,2Dh,1Ah,00h,0Bh,3Fh	; Strip 29h
	DB	3Ah,5Ch,5Dh,2Ch,1Ah,01h,0Dh,3Dh	; Strip 2Ah
	DB	3Ah,1Ch,17h,2Ch,1Ch,03h,0Bh,39h	; Strip 2Bh
	DB	36h,1Dh,15h,2Ah,1Ch,01h,0Dh,3Fh	; Strip 2Ch
	DB	3Ah,1Dh,16h,2Dh,1Ah,00h,0Bh,3Fh	; Strip 2Dh
	DB	3Eh,0Ah,15h,2Dh,1Ch,02h,0Dh,3Fh	; Strip 2Eh
	DB	3Eh,0Ch,16h,2Ch,1Ch,00h,0Bh,3Fh	; Strip 2Fh

; Level 2 Route 1 horizontal strip definitions (48 strips x 8 metatile IDs = 384B), pointed
; to by Bank 00 route strip table 57ADh[3].
LEVEL2_ROUTE1_STRIP_DEFS:
	DB	00h,32h,32h,32h,32h,32h,02h,03h	; Strip 00h
	DB	04h,32h,32h,32h,32h,32h,06h,07h	; Strip 01h
	DB	00h,32h,32h,32h,32h,32h,02h,03h	; Strip 02h
	DB	04h,32h,32h,32h,32h,3Eh,0Ah,0Bh	; Strip 03h
	DB	00h,32h,32h,32h,2Eh,27h,0Eh,0Fh	; Strip 04h
	DB	04h,27h,32h,3Eh,3Dh,3Ch,06h,07h	; Strip 05h
	DB	00h,3Ah,2Eh,3Ch,27h,43h,02h,03h	; Strip 06h
	DB	04h,42h,41h,3Dh,27h,3Dh,0Ah,0Bh	; Strip 07h
	DB	00h,40h,27h,2Eh,3Eh,32h,0Eh,0Fh	; Strip 08h
	DB	04h,3Dh,3Eh,32h,32h,32h,36h,37h	; Strip 09h
	DB	00h,2Eh,32h,32h,32h,2Eh,24h,22h	; Strip 0Ah
	DB	04h,32h,32h,32h,32h,32h,27h,32h	; Strip 0Bh
	DB	00h,32h,32h,32h,32h,32h,08h,09h	; Strip 0Ch
	DB	04h,32h,32h,32h,32h,42h,0Ah,0Bh	; Strip 0Dh
	DB	00h,32h,32h,27h,43h,2Eh,0Eh,0Fh	; Strip 0Eh
	DB	04h,32h,32h,3Eh,27h,32h,06h,07h	; Strip 0Fh
	DB	00h,32h,32h,32h,32h,32h,02h,03h	; Strip 10h
	DB	2Ah,2Bh,32h,32h,32h,32h,06h,07h	; Strip 11h
	DB	1Ah,2Fh,01h,32h,32h,27h,02h,03h	; Strip 12h
	DB	29h,52h,1Eh,17h,32h,32h,06h,07h	; Strip 13h
	DB	1Ch,50h,1Ah,1Bh,2Eh,32h,02h,03h	; Strip 14h
	DB	32h,31h,1Eh,1Fh,27h,32h,0Ah,0Bh	; Strip 15h
	DB	34h,35h,21h,1Bh,32h,43h,0Eh,0Fh	; Strip 16h
	DB	38h,39h,25h,26h,2Eh,32h,06h,07h	; Strip 17h
	DB	00h,27h,43h,3Ch,3Eh,2Eh,02h,03h	; Strip 18h
	DB	04h,41h,3Ch,3Eh,27h,32h,0Ah,0Bh	; Strip 19h
	DB	00h,3Ch,3Eh,2Eh,32h,32h,0Eh,0Fh	; Strip 1Ah
	DB	04h,27h,32h,32h,32h,32h,06h,07h	; Strip 1Bh
	DB	00h,32h,32h,32h,32h,27h,02h,03h	; Strip 1Ch
	DB	04h,32h,32h,32h,32h,32h,06h,07h	; Strip 1Dh
	DB	00h,32h,15h,16h,17h,32h,02h,03h	; Strip 1Eh
	DB	04h,27h,19h,1Ah,1Bh,43h,0Ah,0Bh	; Strip 1Fh
	DB	00h,32h,1Dh,1Eh,1Fh,32h,0Eh,0Fh	; Strip 20h
	DB	3Fh,2Eh,19h,1Ah,1Bh,42h,0Ah,0Bh	; Strip 21h
	DB	1Ch,32h,1Dh,1Eh,1Fh,27h,0Eh,0Fh	; Strip 22h
	DB	32h,32h,19h,1Ah,1Bh,32h,06h,07h	; Strip 23h
	DB	20h,32h,1Dh,1Eh,1Fh,32h,02h,03h	; Strip 24h
	DB	1Ch,27h,19h,1Ah,1Bh,43h,06h,07h	; Strip 25h
	DB	32h,32h,31h,1Eh,1Fh,32h,02h,03h	; Strip 26h
	DB	14h,18h,30h,21h,1Bh,32h,0Ah,0Bh	; Strip 27h
	DB	23h,22h,22h,25h,26h,27h,0Eh,0Fh	; Strip 28h
	DB	3Ah,3Eh,32h,32h,2Eh,3Eh,06h,07h	; Strip 29h
	DB	01h,32h,32h,3Eh,32h,27h,02h,03h	; Strip 2Ah
	DB	04h,3Ah,3Ch,3Ah,3Ch,2Eh,0Ah,0Bh	; Strip 2Bh
	DB	00h,2Eh,3Dh,3Ch,27h,41h,0Eh,0Fh	; Strip 2Ch
	DB	04h,43h,42h,2Eh,32h,27h,06h,07h	; Strip 2Dh
	DB	00h,40h,3Eh,32h,3Eh,32h,02h,03h	; Strip 2Eh
	DB	04h,32h,32h,32h,32h,32h,06h,07h	; Strip 2Fh

; Level 2 Route 2 horizontal strip definitions (48 strips x 8 metatile IDs = 384B), pointed
; to by Bank 00 route strip table 57ADh[4].
LEVEL2_ROUTE2_STRIP_DEFS:
	DB	1Ah,1Ah,21h,1Bh,19h,21h,1Ah,1Ah	; Strip 00h
	DB	38h,39h,25h,26h,24h,22h,2Ch,2Dh	; Strip 01h
	DB	00h,41h,3Eh,2Eh,3Ah,42h,02h,03h	; Strip 02h
	DB	04h,3Eh,32h,27h,32h,32h,0Ah,0Bh	; Strip 03h
	DB	00h,27h,32h,32h,32h,2Eh,0Eh,0Fh	; Strip 04h
	DB	04h,32h,32h,32h,32h,32h,06h,07h	; Strip 05h
	DB	00h,32h,32h,32h,32h,42h,02h,03h	; Strip 06h
	DB	04h,32h,32h,32h,2Eh,27h,0Ah,0Bh	; Strip 07h
	DB	00h,32h,32h,32h,32h,32h,0Eh,0Fh	; Strip 08h
	DB	3Fh,32h,32h,32h,32h,3Eh,02h,03h	; Strip 09h
	DB	1Ch,32h,32h,32h,32h,32h,06h,07h	; Strip 0Ah
	DB	2Eh,32h,32h,32h,32h,27h,31h,1Eh	; Strip 0Bh
	DB	34h,12h,14h,18h,14h,18h,30h,21h	; Strip 0Ch
	DB	38h,39h,23h,22h,23h,22h,22h,22h	; Strip 0Dh
	DB	00h,40h,3Ch,41h,3Eh,3Dh,43h,3Eh	; Strip 0Eh
	DB	04h,3Ch,42h,3Eh,3Dh,27h,0Ch,0Dh	; Strip 0Fh
	DB	00h,41h,3Ch,3Dh,3Eh,43h,02h,03h	; Strip 10h
	DB	04h,2Eh,27h,3Eh,2Eh,40h,06h,07h	; Strip 11h
	DB	00h,3Ch,3Dh,3Eh,42h,32h,02h,03h	; Strip 12h
	DB	04h,3Ah,27h,3Dh,3Eh,43h,0Ah,0Bh	; Strip 13h
	DB	00h,3Ch,3Ah,3Eh,27h,32h,0Eh,0Fh	; Strip 14h
	DB	04h,41h,32h,32h,32h,32h,0Ah,0Bh	; Strip 15h
	DB	00h,32h,32h,32h,32h,32h,0Eh,0Fh	; Strip 16h
	DB	04h,32h,32h,32h,32h,32h,06h,07h	; Strip 17h
	DB	00h,32h,32h,32h,32h,32h,02h,03h	; Strip 18h
	DB	04h,32h,32h,32h,27h,32h,0Ah,0Bh	; Strip 19h
	DB	00h,32h,32h,32h,32h,42h,0Eh,0Fh	; Strip 1Ah
	DB	04h,32h,32h,32h,32h,3Eh,06h,07h	; Strip 1Bh
	DB	00h,32h,32h,32h,2Eh,32h,02h,03h	; Strip 1Ch
	DB	04h,32h,32h,32h,32h,32h,06h,07h	; Strip 1Dh
	DB	00h,32h,32h,32h,32h,32h,02h,03h	; Strip 1Eh
	DB	04h,32h,2Eh,32h,32h,32h,0Ah,0Bh	; Strip 1Fh
	DB	00h,43h,32h,27h,32h,3Eh,0Eh,0Fh	; Strip 20h
	DB	04h,32h,32h,32h,32h,32h,0Ah,0Bh	; Strip 21h
	DB	00h,32h,32h,32h,32h,2Eh,0Eh,0Fh	; Strip 22h
	DB	04h,32h,32h,32h,32h,32h,06h,07h	; Strip 23h
	DB	00h,32h,32h,32h,32h,3Eh,02h,03h	; Strip 24h
	DB	04h,32h,32h,3Eh,3Dh,27h,06h,07h	; Strip 25h
	DB	00h,32h,3Eh,3Dh,3Ch,3Dh,02h,03h	; Strip 26h
	DB	00h,43h,27h,3Eh,3Dh,42h,06h,07h	; Strip 27h
	DB	2Ah,2Bh,40h,2Eh,3Ch,41h,31h,1Eh	; Strip 28h
	DB	1Ah,2Fh,12h,13h,11h,12h,35h,1Ah	; Strip 29h
	DB	1Ah,1Ah,1Ah,1Fh,19h,1Ah,1Ah,1Ah	; Strip 2Ah
	DB	1Ah,1Ah,44h,45h,46h,47h,1Ah,1Ah	; Strip 2Bh
	DB	1Ah,1Ah,48h,49h,4Ah,4Bh,1Ah,1Ah	; Strip 2Ch
	DB	1Ah,1Ah,4Ch,4Dh,4Eh,4Fh,1Ah,1Ah	; Strip 2Dh
	DB	1Ah,1Ah,1Ah,1Fh,19h,1Ah,1Ah,1Ah	; Strip 2Eh
	DB	1Ah,1Ah,1Ah,1Fh,1Dh,1Ah,1Ah,1Ah	; Strip 2Fh

; Level 2 Route 3 horizontal strip definitions (48 strips x 8 metatile IDs = 384B), pointed
; to by Bank 00 route strip table 57ADh[5].
LEVEL2_ROUTE3_STRIP_DEFS:
	DB	00h,32h,1Dh,1Eh,1Fh,32h,02h,03h	; Strip 00h
	DB	04h,27h,19h,1Ah,1Bh,42h,0Ah,0Bh	; Strip 01h
	DB	00h,32h,1Dh,1Eh,1Fh,32h,0Eh,0Fh	; Strip 02h
	DB	04h,32h,19h,1Ah,1Bh,2Eh,06h,07h	; Strip 03h
	DB	00h,32h,1Dh,1Eh,1Fh,32h,02h,03h	; Strip 04h
	DB	1Ah,20h,52h,21h,1Bh,43h,06h,07h	; Strip 05h
	DB	38h,1Ch,51h,25h,26h,27h,02h,03h	; Strip 06h
	DB	00h,3Ch,3Eh,3Ch,42h,41h,06h,07h	; Strip 07h
	DB	00h,3Eh,41h,3Eh,2Eh,3Dh,02h,03h	; Strip 08h
	DB	04h,43h,3Dh,3Ah,3Eh,40h,0Ah,0Bh	; Strip 09h
	DB	00h,3Dh,27h,32h,32h,32h,0Eh,0Fh	; Strip 0Ah
	DB	04h,32h,32h,32h,32h,32h,06h,07h	; Strip 0Bh
	DB	3Bh,32h,32h,32h,32h,2Eh,02h,03h	; Strip 0Ch
	DB	1Ch,32h,32h,32h,43h,32h,0Ah,0Bh	; Strip 0Dh
	DB	32h,27h,32h,42h,27h,32h,0Eh,0Fh	; Strip 0Eh
	DB	05h,11h,12h,13h,32h,32h,0Ah,0Bh	; Strip 0Fh
	DB	00h,1Dh,1Eh,1Fh,32h,32h,0Eh,0Fh	; Strip 10h
	DB	04h,19h,1Ah,1Bh,32h,32h,06h,07h	; Strip 11h
	DB	00h,1Dh,1Eh,1Fh,32h,32h,02h,03h	; Strip 12h
	DB	04h,19h,1Ah,1Bh,43h,32h,36h,37h	; Strip 13h
	DB	00h,1Dh,1Eh,1Fh,32h,3Eh,24h,22h	; Strip 14h
	DB	04h,19h,1Ah,1Bh,27h,32h,32h,3Eh	; Strip 15h
	DB	00h,1Dh,1Eh,1Fh,32h,32h,08h,09h	; Strip 16h
	DB	04h,19h,1Ah,1Bh,32h,32h,06h,07h	; Strip 17h
	DB	00h,52h,1Eh,1Fh,32h,32h,02h,03h	; Strip 18h
	DB	04h,50h,21h,1Bh,3Eh,3Ch,0Ah,0Bh	; Strip 19h
	DB	00h,24h,25h,26h,41h,32h,0Eh,0Fh	; Strip 1Ah
	DB	04h,40h,2Eh,42h,43h,3Dh,06h,07h	; Strip 1Bh
	DB	00h,3Ch,3Dh,3Ah,3Dh,3Eh,02h,03h	; Strip 1Ch
	DB	04h,3Dh,3Ah,3Eh,32h,32h,06h,07h	; Strip 1Dh
	DB	00h,2Eh,3Ch,3Ah,3Ch,40h,02h,03h	; Strip 1Eh
	DB	04h,3Ah,41h,3Ch,3Eh,2Eh,06h,07h	; Strip 1Fh
	DB	00h,27h,3Ch,3Eh,3Ch,41h,02h,03h	; Strip 20h
	DB	04h,3Ch,3Dh,3Ch,27h,3Eh,36h,37h	; Strip 21h
	DB	00h,40h,3Eh,32h,32h,3Eh,24h,22h	; Strip 22h
	DB	2Ah,2Bh,32h,32h,32h,32h,32h,3Eh	; Strip 23h
	DB	1Ah,2Fh,18h,14h,18h,10h,18h,14h	; Strip 24h
	DB	38h,39h,22h,23h,22h,22h,22h,23h	; Strip 25h
	DB	00h,3Dh,42h,32h,27h,42h,43h,27h	; Strip 26h
	DB	04h,2Eh,11h,34h,34h,14h,18h,14h	; Strip 27h
	DB	00h,32h,1Dh,1Eh,39h,23h,22h,23h	; Strip 28h
	DB	04h,32h,19h,1Ah,1Bh,3Ah,27h,3Eh	; Strip 29h
	DB	00h,27h,1Dh,1Eh,1Fh,27h,08h,09h	; Strip 2Ah
	DB	04h,3Ah,19h,1Ah,1Bh,43h,06h,07h	; Strip 2Bh
	DB	00h,27h,1Dh,1Eh,1Fh,27h,02h,03h	; Strip 2Ch
	DB	04h,27h,19h,1Ah,1Bh,3Eh,06h,07h	; Strip 2Dh
	DB	00h,2Eh,1Dh,1Eh,1Fh,42h,02h,03h	; Strip 2Eh
	DB	04h,32h,19h,1Ah,1Bh,3Eh,06h,07h	; Strip 2Fh

; Level 3 Route 1 horizontal strip definitions (48 strips x 8 metatile IDs = 384B), pointed
; to by Bank 00 route strip table 57ADh[6].
LEVEL3_ROUTE1_STRIP_DEFS:
	DB	01h,17h,08h,0Ah,0Eh,0Ah,05h,22h	; Strip 00h
	DB	02h,07h,09h,0Bh,10h,08h,06h,23h	; Strip 01h
	DB	01h,03h,0Ah,0Eh,14h,09h,24h,22h	; Strip 02h
	DB	02h,04h,0Eh,0Ah,0Eh,0Ah,06h,23h	; Strip 03h
	DB	01h,03h,11h,21h,08h,0Eh,05h,22h	; Strip 04h
	DB	02h,0Dh,0Eh,0Ch,16h,0Ah,25h,23h	; Strip 05h
	DB	01h,0Fh,0Ah,14h,09h,0Bh,26h,22h	; Strip 06h
	DB	02h,15h,0Bh,0Ah,0Eh,0Eh,06h,23h	; Strip 07h
	DB	01h,03h,0Ah,0Eh,0Ah,10h,1Bh,22h	; Strip 08h
	DB	02h,04h,10h,08h,0Ah,14h,1Ch,23h	; Strip 09h
	DB	01h,03h,0Ch,16h,0Eh,0Eh,05h,18h	; Strip 0Ah
	DB	02h,04h,0Ch,16h,0Ah,11h,21h,1Eh	; Strip 0Bh
	DB	01h,03h,14h,09h,0Bh,0Ah,14h,1Ah	; Strip 0Ch
	DB	02h,04h,0Eh,0Ah,0Ah,0Ah,06h,23h	; Strip 0Dh
	DB	01h,17h,08h,0Eh,10h,08h,05h,22h	; Strip 0Eh
	DB	02h,07h,09h,0Bh,14h,27h,06h,23h	; Strip 0Fh
	DB	01h,03h,0Ah,0Ah,0Ah,0Eh,05h,22h	; Strip 10h
	DB	02h,04h,10h,1Eh,08h,0Eh,06h,23h	; Strip 11h
	DB	01h,03h,14h,1Ah,09h,0Bh,25h,22h	; Strip 12h
	DB	02h,04h,0Eh,0Eh,0Ah,0Eh,26h,18h	; Strip 13h
	DB	18h,03h,0Ah,0Ah,0Ah,0Eh,10h,08h	; Strip 14h
	DB	08h,0Ah,0Eh,0Ah,0Ah,0Eh,28h,27h	; Strip 15h
	DB	09h,0Bh,2Ah,0Eh,29h,0Eh,26h,22h	; Strip 16h
	DB	02h,2Ch,2Bh,0Eh,0Eh,0Eh,06h,23h	; Strip 17h
	DB	18h,03h,0Eh,0Eh,0Eh,0Ah,05h,22h	; Strip 18h
	DB	10h,08h,0Eh,0Ah,0Ah,0Ah,06h,23h	; Strip 19h
	DB	14h,09h,0Bh,0Ah,0Eh,0Ah,05h,22h	; Strip 1Ah
	DB	02h,0Dh,0Ah,18h,18h,2Dh,18h,23h	; Strip 1Bh
	DB	01h,03h,0Eh,18h,29h,30h,29h,22h	; Strip 1Ch
	DB	02h,0Fh,0Ah,0Eh,0Ah,0Eh,06h,23h	; Strip 1Dh
	DB	01h,15h,0Bh,10h,08h,0Ah,05h,18h	; Strip 1Eh
	DB	02h,04h,0Ah,14h,27h,11h,21h,1Eh	; Strip 1Fh
	DB	01h,03h,0Eh,0Eh,0Ah,0Eh,14h,1Ah	; Strip 20h
	DB	02h,04h,10h,08h,0Eh,0Ah,06h,23h	; Strip 21h
	DB	01h,03h,14h,09h,0Bh,10h,08h,22h	; Strip 22h
	DB	02h,04h,0Eh,0Ah,0Eh,14h,27h,23h	; Strip 23h
	DB	01h,10h,08h,0Eh,0Eh,0Eh,05h,22h	; Strip 24h
	DB	02h,14h,09h,0Bh,10h,08h,06h,23h	; Strip 25h
	DB	01h,03h,0Eh,0Eh,14h,27h,05h,22h	; Strip 26h
	DB	02h,04h,0Eh,0Ah,0Eh,0Eh,06h,23h	; Strip 27h
	DB	01h,03h,11h,21h,08h,0Eh,05h,22h	; Strip 28h
	DB	02h,04h,0Ah,14h,09h,0Bh,25h,23h	; Strip 29h
	DB	01h,2Ah,0Eh,0Ah,0Eh,0Eh,26h,22h	; Strip 2Ah
	DB	02h,2Bh,0Ah,0Eh,0Eh,0Ah,06h,23h	; Strip 2Bh
	DB	01h,03h,0Eh,0Ah,11h,21h,1Bh,22h	; Strip 2Ch
	DB	02h,04h,10h,08h,0Eh,14h,1Ch,23h	; Strip 2Dh
	DB	01h,03h,14h,09h,0Bh,0Eh,05h,22h	; Strip 2Eh
	DB	02h,04h,0Eh,0Ah,0Eh,0Ah,06h,23h	; Strip 2Fh

; Level 3 Route 2 horizontal strip definitions (48 strips x 8 metatile IDs = 384B), pointed
; to by Bank 00 route strip table 57ADh[7].
LEVEL3_ROUTE2_STRIP_DEFS:
	DB	01h,18h,18h,2Bh,2Ah,18h,18h,22h	; Strip 00h
	DB	02h,04h,0Ah,0Eh,2Bh,29h,06h,23h	; Strip 01h
	DB	01h,0Fh,0Eh,0Eh,0Eh,0Eh,05h,22h	; Strip 02h
	DB	02h,15h,0Bh,10h,08h,0Ah,29h,23h	; Strip 03h
	DB	01h,03h,0Eh,14h,27h,0Eh,06h,22h	; Strip 04h
	DB	02h,04h,0Ah,0Eh,0Eh,0Eh,06h,23h	; Strip 05h
	DB	01h,03h,10h,08h,0Eh,0Eh,05h,22h	; Strip 06h
	DB	02h,04h,14h,27h,0Ah,2Ah,25h,23h	; Strip 07h
	DB	01h,03h,0Ah,0Ah,0Ah,2Bh,26h,18h	; Strip 08h
	DB	18h,18h,18h,18h,18h,18h,2Dh,18h	; Strip 09h
	DB	18h,0Ah,0Eh,0Eh,0Ah,18h,2Eh,08h	; Strip 0Ah
	DB	10h,08h,0Ah,0Ah,2Ah,18h,14h,27h	; Strip 0Bh
	DB	14h,09h,0Bh,0Ah,2Bh,01h,18h,22h	; Strip 0Ch
	DB	02h,0Dh,0Ah,0Ah,0Ah,02h,01h,18h	; Strip 0Dh
	DB	01h,03h,11h,21h,08h,18h,18h,01h	; Strip 0Eh
	DB	02h,04h,0Ah,14h,27h,18h,01h,18h	; Strip 0Fh
	DB	02h,18h,18h,18h,18h,18h,18h,18h	; Strip 10h
	DB	01h,10h,1Eh,1Eh,08h,11h,21h,08h	; Strip 11h
	DB	02h,14h,1Ah,1Ah,09h,0Bh,14h,27h	; Strip 12h
	DB	18h,18h,18h,18h,18h,18h,18h,18h	; Strip 13h
	DB	29h,29h,29h,29h,29h,0Ah,2Ah,22h	; Strip 14h
	DB	29h,0Ah,0Ah,0Eh,0Ah,0Ah,2Bh,22h	; Strip 15h
	DB	02h,2Ch,0Eh,0Ah,0Ah,0Eh,29h,22h	; Strip 16h
	DB	01h,03h,0Ah,0Eh,2Ah,0Ah,06h,23h	; Strip 17h
	DB	02h,0Dh,2Ah,0Ah,2Bh,0Ah,05h,22h	; Strip 18h
	DB	01h,0Dh,2Bh,0Eh,29h,0Ah,25h,23h	; Strip 19h
	DB	02h,29h,29h,0Ah,0Eh,0Eh,26h,22h	; Strip 1Ah
	DB	01h,0Eh,0Eh,0Ah,0Ah,0Ah,06h,23h	; Strip 1Bh
	DB	02h,17h,08h,0Ah,29h,29h,29h,22h	; Strip 1Ch
	DB	18h,07h,09h,0Bh,0Ah,0Ah,06h,23h	; Strip 1Dh
	DB	18h,18h,18h,18h,29h,0Eh,29h,22h	; Strip 1Eh
	DB	10h,08h,0Ah,18h,0Eh,0Ah,0Eh,23h	; Strip 1Fh
	DB	14h,27h,0Ah,18h,29h,29h,29h,22h	; Strip 20h
	DB	22h,18h,2Ah,18h,0Eh,0Eh,0Eh,23h	; Strip 21h
	DB	23h,18h,2Bh,18h,18h,18h,2Ah,22h	; Strip 22h
	DB	01h,29h,29h,0Ah,0Eh,29h,2Bh,23h	; Strip 23h
	DB	02h,04h,0Eh,0Eh,0Ah,0Ah,05h,22h	; Strip 24h
	DB	01h,03h,10h,1Eh,1Eh,08h,06h,23h	; Strip 25h
	DB	01h,04h,14h,1Ah,1Ah,27h,05h,22h	; Strip 26h
	DB	01h,03h,0Ah,0Ah,0Ah,0Ah,06h,23h	; Strip 27h
	DB	01h,04h,11h,21h,08h,0Ah,05h,22h	; Strip 28h
	DB	02h,18h,18h,0Ch,16h,18h,18h,23h	; Strip 29h
	DB	01h,22h,01h,0Ch,16h,22h,23h,22h	; Strip 2Ah
	DB	01h,18h,31h,32h,33h,34h,22h,23h	; Strip 2Bh
	DB	02h,23h,35h,36h,37h,38h,22h,22h	; Strip 2Ch
	DB	01h,18h,39h,3Ah,3Bh,3Ch,18h,23h	; Strip 2Dh
	DB	02h,22h,18h,14h,27h,18h,22h,22h	; Strip 2Eh
	DB	01h,18h,18h,2Ah,29h,18h,18h,23h	; Strip 2Fh

; Level 3 Route 3 horizontal strip definitions (48 strips x 8 metatile IDs = 384B), pointed
; to by Bank 00 route strip table 57ADh[8].
LEVEL3_ROUTE3_STRIP_DEFS:
	DB	01h,04h,0Eh,11h,21h,08h,05h,22h	; Strip 00h
	DB	01h,17h,08h,0Eh,14h,27h,06h,23h	; Strip 01h
	DB	02h,07h,09h,0Bh,0Eh,0Eh,05h,22h	; Strip 02h
	DB	01h,03h,0Eh,0Eh,0Eh,0Eh,06h,23h	; Strip 03h
	DB	02h,04h,10h,08h,0Eh,0Eh,05h,22h	; Strip 04h
	DB	01h,03h,14h,27h,0Eh,2Ah,25h,23h	; Strip 05h
	DB	02h,04h,0Ah,0Ah,0Ah,2Bh,26h,23h	; Strip 06h
	DB	01h,17h,08h,0Ah,0Ah,0Ah,06h,23h	; Strip 07h
	DB	02h,07h,27h,11h,21h,08h,05h,22h	; Strip 08h
	DB	18h,03h,0Eh,0Eh,14h,27h,06h,23h	; Strip 09h
	DB	10h,08h,0Eh,0Eh,0Ah,0Ah,05h,22h	; Strip 0Ah
	DB	14h,09h,0Bh,0Ah,10h,08h,25h,23h	; Strip 0Bh
	DB	02h,04h,0Ah,0Eh,0Ch,16h,26h,22h	; Strip 0Ch
	DB	01h,17h,08h,0Ah,14h,27h,29h,18h	; Strip 0Dh
	DB	02h,07h,09h,0Bh,0Ah,0Eh,05h,22h	; Strip 0Eh
	DB	18h,03h,0Ah,11h,21h,08h,06h,23h	; Strip 0Fh
	DB	18h,18h,18h,18h,14h,27h,05h,22h	; Strip 10h
	DB	10h,1Eh,08h,18h,0Ah,0Ah,06h,23h	; Strip 11h
	DB	14h,1Ah,27h,18h,0Ah,10h,1Bh,22h	; Strip 12h
	DB	01h,18h,2Dh,18h,0Ah,14h,1Ch,23h	; Strip 13h
	DB	18h,29h,30h,29h,0Ah,0Eh,05h,18h	; Strip 14h
	DB	01h,03h,0Eh,0Ah,0Eh,0Ah,10h,1Eh	; Strip 15h
	DB	01h,04h,11h,21h,08h,0Ah,14h,1Ah	; Strip 16h
	DB	01h,03h,0Eh,14h,27h,0Eh,06h,23h	; Strip 17h
	DB	02h,18h,18h,18h,18h,18h,18h,18h	; Strip 18h
	DB	01h,03h,0Ah,0Ah,0Ah,0Eh,10h,1Eh	; Strip 19h
	DB	02h,04h,10h,1Eh,08h,0Ah,14h,1Ah	; Strip 1Ah
	DB	01h,03h,14h,1Ah,09h,0Bh,06h,23h	; Strip 1Bh
	DB	02h,04h,0Eh,0Eh,0Eh,0Eh,05h,22h	; Strip 1Ch
	DB	01h,17h,08h,0Ah,0Eh,0Ah,06h,23h	; Strip 1Dh
	DB	02h,07h,09h,0Bh,10h,08h,29h,22h	; Strip 1Eh
	DB	02h,03h,0Ah,0Ah,14h,27h,25h,23h	; Strip 1Fh
	DB	01h,04h,29h,0Ah,29h,29h,26h,22h	; Strip 20h
	DB	02h,03h,0Eh,0Ah,0Eh,0Ah,06h,23h	; Strip 21h
	DB	02h,04h,10h,1Eh,08h,0Eh,05h,18h	; Strip 22h
	DB	02h,03h,0Ch,00h,16h,0Ah,29h,18h	; Strip 23h
	DB	02h,04h,14h,1Ah,27h,0Ah,05h,22h	; Strip 24h
	DB	02h,03h,0Ah,0Ah,0Ah,0Ah,06h,23h	; Strip 25h
	DB	02h,04h,0Ah,11h,21h,08h,05h,22h	; Strip 26h
	DB	02h,17h,08h,0Ah,14h,27h,06h,23h	; Strip 27h
	DB	02h,07h,09h,0Bh,0Ah,0Ah,05h,22h	; Strip 28h
	DB	02h,03h,0Ah,0Ah,0Eh,0Ah,06h,23h	; Strip 29h
	DB	02h,0Dh,18h,18h,18h,18h,29h,18h	; Strip 2Ah
	DB	01h,03h,0Ah,10h,08h,0Ah,06h,23h	; Strip 2Bh
	DB	02h,0Fh,0Ah,14h,09h,0Bh,05h,22h	; Strip 2Ch
	DB	01h,15h,0Bh,0Ah,0Eh,0Eh,06h,23h	; Strip 2Dh
	DB	02h,04h,0Ah,0Eh,0Eh,29h,29h,22h	; Strip 2Eh
	DB	01h,03h,0Eh,0Ah,0Ah,0Eh,06h,23h	; Strip 2Fh

; Level 4 Route 1 horizontal strip definitions (48 strips x 8 metatile IDs = 384B), pointed
; to by Bank 00 route strip table 57ADh[9].
LEVEL4_ROUTE1_STRIP_DEFS:
	DB	05h,03h,00h,00h,00h,01h,02h,04h	; Strip 00h
	DB	05h,49h,00h,0Eh,00h,00h,28h,04h	; Strip 01h
	DB	05h,2Ah,38h,01h,37h,00h,4Ah,04h	; Strip 02h
	DB	05h,49h,00h,00h,00h,37h,02h,04h	; Strip 03h
	DB	05h,2Ah,37h,00h,0Eh,01h,28h,04h	; Strip 04h
	DB	05h,49h,01h,00h,00h,37h,4Ah,04h	; Strip 05h
	DB	05h,49h,00h,0Eh,00h,00h,28h,04h	; Strip 06h
	DB	05h,49h,00h,00h,00h,38h,4Ah,04h	; Strip 07h
	DB	05h,2Ah,0Eh,00h,00h,00h,28h,04h	; Strip 08h
	DB	05h,03h,00h,00h,0Eh,00h,02h,04h	; Strip 09h
	DB	23h,07h,00h,33h,11h,31h,2Eh,04h	; Strip 0Ah
	DB	25h,24h,39h,26h,15h,17h,2Ch,04h	; Strip 0Bh
	DB	27h,26h,3Bh,0Fh,0Fh,0Fh,0Fh,0Dh	; Strip 0Ch
	DB	0Fh,0Fh,35h,00h,01h,37h,0Eh,00h	; Strip 0Dh
	DB	00h,01h,00h,0Eh,00h,00h,00h,06h	; Strip 0Eh
	DB	07h,00h,00h,37h,00h,0Eh,02h,04h	; Strip 0Fh
	DB	05h,03h,0Eh,00h,37h,00h,28h,04h	; Strip 10h
	DB	05h,2Ah,00h,38h,0Eh,00h,4Ah,04h	; Strip 11h
	DB	05h,03h,01h,0Eh,00h,37h,02h,04h	; Strip 12h
	DB	05h,49h,00h,37h,37h,38h,4Ah,04h	; Strip 13h
	DB	05h,2Ah,00h,0Eh,00h,00h,28h,04h	; Strip 14h
	DB	05h,2Ah,00h,00h,37h,00h,02h,04h	; Strip 15h
	DB	05h,49h,37h,00h,0Eh,37h,28h,04h	; Strip 16h
	DB	05h,03h,38h,00h,37h,37h,02h,04h	; Strip 17h
	DB	05h,2Ah,00h,00h,00h,01h,02h,04h	; Strip 18h
	DB	05h,49h,0Ah,12h,11h,12h,36h,0Dh	; Strip 19h
	DB	05h,19h,0Bh,1Ch,20h,16h,14h,32h	; Strip 1Ah
	DB	05h,2Ah,0Fh,0Ch,1Ah,0Bh,15h,0Bh	; Strip 1Bh
	DB	05h,1Dh,12h,00h,36h,0Fh,1Ah,0Bh	; Strip 1Ch
	DB	05h,15h,16h,11h,12h,38h,36h,0Fh	; Strip 1Dh
	DB	0Ch,1Ah,0Bh,15h,16h,12h,11h,11h	; Strip 1Eh
	DB	32h,36h,0Fh,1Ah,0Bh,1Ch,20h,20h	; Strip 1Fh
	DB	05h,03h,00h,36h,0Fh,1Ah,0Bh,0Bh	; Strip 20h
	DB	05h,03h,38h,00h,01h,36h,0Fh,0Fh	; Strip 21h
	DB	05h,2Ah,00h,37h,00h,00h,0Eh,00h	; Strip 22h
	DB	05h,03h,00h,37h,0Eh,37h,37h,06h	; Strip 23h
	DB	05h,2Ah,00h,00h,01h,00h,02h,04h	; Strip 24h
	DB	05h,03h,0Ah,00h,00h,38h,02h,04h	; Strip 25h
	DB	05h,2Bh,0Bh,2Ah,00h,00h,02h,04h	; Strip 26h
	DB	05h,2Bh,0Bh,1Dh,12h,00h,36h,0Dh	; Strip 27h
	DB	05h,19h,0Bh,15h,16h,11h,31h,31h	; Strip 28h
	DB	05h,2Ah,0Fh,1Ah,0Bh,15h,17h,1Ch	; Strip 29h
	DB	05h,03h,00h,36h,0Fh,0Ch,0Fh,0Ch	; Strip 2Ah
	DB	05h,49h,00h,00h,00h,00h,01h,00h	; Strip 2Bh
	DB	05h,2Ah,0Eh,00h,00h,38h,00h,06h	; Strip 2Ch
	DB	05h,49h,00h,01h,00h,00h,28h,04h	; Strip 2Dh
	DB	05h,2Ah,01h,00h,01h,00h,28h,04h	; Strip 2Eh
	DB	05h,03h,38h,00h,00h,00h,02h,04h	; Strip 2Fh

; Level 4 Route 2 horizontal strip definitions (48 strips x 8 metatile IDs = 384B), pointed
; to by Bank 00 route strip table 57ADh[10].
LEVEL4_ROUTE2_STRIP_DEFS:
	DB	05h,19h,0Bh,03h,02h,22h,29h,22h	; Strip 00h
	DB	05h,19h,0Bh,2Ah,36h,0Fh,1Ah,0Bh	; Strip 01h
	DB	05h,2Bh,0Bh,49h,01h,00h,36h,0Fh	; Strip 02h
	DB	05h,2Bh,0Bh,2Ah,00h,00h,00h,00h	; Strip 03h
	DB	05h,19h,0Bh,03h,01h,0Eh,00h,06h	; Strip 04h
	DB	05h,2Bh,0Bh,49h,00h,38h,02h,04h	; Strip 05h
	DB	05h,19h,0Bh,49h,00h,01h,4Ah,04h	; Strip 06h
	DB	05h,19h,0Bh,2Ah,00h,00h,28h,04h	; Strip 07h
	DB	05h,2Bh,0Bh,03h,00h,00h,02h,04h	; Strip 08h
	DB	05h,2Ah,0Fh,35h,0Eh,00h,28h,22h	; Strip 09h
	DB	05h,1Dh,31h,12h,01h,00h,36h,0Fh	; Strip 0Ah
	DB	05h,15h,17h,16h,14h,31h,18h,32h	; Strip 0Bh
	DB	0Ch,0Fh,1Ah,0Bh,15h,17h,1Ch,0Bh	; Strip 0Ch
	DB	01h,00h,36h,0Fh,0Fh,0Fh,1Ah,0Bh	; Strip 0Dh
	DB	07h,00h,00h,00h,00h,00h,02h,0Bh	; Strip 0Eh
	DB	05h,03h,00h,0Eh,01h,00h,36h,0Fh	; Strip 0Fh
	DB	05h,2Ah,00h,01h,00h,00h,00h,00h	; Strip 10h
	DB	05h,49h,00h,37h,00h,00h,01h,06h	; Strip 11h
	DB	05h,03h,00h,37h,01h,00h,02h,04h	; Strip 12h
	DB	05h,49h,00h,0Eh,00h,00h,4Ah,04h	; Strip 13h
	DB	05h,2Ah,00h,00h,37h,37h,28h,04h	; Strip 14h
	DB	05h,2Ah,01h,00h,01h,00h,28h,04h	; Strip 15h
	DB	05h,03h,00h,37h,38h,00h,02h,22h	; Strip 16h
	DB	05h,49h,0Eh,00h,00h,01h,36h,0Fh	; Strip 17h
	DB	05h,03h,00h,0Eh,01h,00h,00h,00h	; Strip 18h
	DB	0Ch,35h,00h,00h,00h,00h,00h,06h	; Strip 19h
	DB	12h,00h,38h,00h,01h,00h,02h,04h	; Strip 1Ah
	DB	16h,11h,31h,12h,00h,00h,02h,22h	; Strip 1Bh
	DB	0Bh,15h,17h,16h,11h,12h,36h,0Fh	; Strip 1Ch
	DB	0Fh,0Fh,1Ah,2Ch,15h,16h,11h,31h	; Strip 1Dh
	DB	12h,00h,00h,0Dh,1Ah,0Bh,15h,17h	; Strip 1Eh
	DB	16h,11h,14h,12h,36h,0Fh,0Ch,0Fh	; Strip 1Fh
	DB	0Bh,15h,15h,16h,11h,11h,32h,00h	; Strip 20h
	DB	0Fh,0Dh,1Ah,0Bh,20h,20h,04h,1Eh	; Strip 21h
	DB	00h,00h,36h,1Ah,0Bh,0Bh,04h,08h	; Strip 22h
	DB	07h,0Eh,37h,36h,0Fh,1Ah,04h,08h	; Strip 23h
	DB	05h,03h,00h,00h,00h,02h,04h,08h	; Strip 24h
	DB	24h,03h,00h,0Eh,00h,28h,04h,08h	; Strip 25h
	DB	26h,03h,00h,00h,00h,02h,04h,08h	; Strip 26h
	DB	0Fh,35h,00h,00h,00h,02h,22h,29h	; Strip 27h
	DB	31h,11h,12h,00h,01h,36h,0Fh,0Ch	; Strip 28h
	DB	17h,15h,16h,00h,00h,0Ah,00h,00h	; Strip 29h
	DB	0Fh,1Ah,0Bh,03h,02h,04h,1Eh,1Fh	; Strip 2Ah
	DB	00h,02h,3Dh,3Eh,3Fh,40h,08h,09h	; Strip 2Bh
	DB	07h,02h,41h,42h,43h,44h,08h,09h	; Strip 2Ch
	DB	05h,2Bh,45h,46h,47h,48h,08h,09h	; Strip 2Dh
	DB	05h,19h,0Bh,03h,28h,04h,08h,09h	; Strip 2Eh
	DB	05h,2Bh,0Bh,2Ah,02h,04h,08h,09h	; Strip 2Fh

; Level 4 Route 3 horizontal strip definitions (48 strips x 8 metatile IDs = 384B), pointed
; to by Bank 00 route strip table 57ADh[11].
LEVEL4_ROUTE3_STRIP_DEFS:
	DB	05h,1Dh,31h,12h,00h,00h,28h,04h	; Strip 00h
	DB	05h,15h,17h,16h,30h,00h,2Eh,04h	; Strip 01h
	DB	0Ch,0Fh,1Ah,0Bh,17h,39h,2Ch,04h	; Strip 02h
	DB	00h,00h,36h,0Fh,0Fh,3Ch,1Ah,04h	; Strip 03h
	DB	07h,00h,00h,00h,00h,00h,28h,04h	; Strip 04h
	DB	05h,2Ah,00h,38h,00h,00h,02h,04h	; Strip 05h
	DB	05h,49h,37h,00h,37h,00h,28h,04h	; Strip 06h
	DB	05h,2Ah,00h,0Eh,01h,00h,02h,04h	; Strip 07h
	DB	05h,2Ah,37h,37h,37h,38h,28h,04h	; Strip 08h
	DB	05h,03h,01h,00h,00h,01h,4Ah,04h	; Strip 09h
	DB	0Ch,35h,37h,01h,00h,0Eh,28h,04h	; Strip 0Ah
	DB	32h,01h,00h,00h,00h,0Eh,02h,04h	; Strip 0Bh
	DB	05h,03h,00h,37h,00h,00h,02h,0Bh	; Strip 0Ch
	DB	05h,1Dh,12h,00h,37h,37h,36h,0Dh	; Strip 0Dh
	DB	05h,15h,16h,32h,31h,14h,11h,34h	; Strip 0Eh
	DB	0Ch,1Ah,0Bh,0Bh,17h,15h,15h,04h	; Strip 0Fh
	DB	00h,36h,0Fh,0Fh,0Fh,0Fh,1Ah,04h	; Strip 10h
	DB	07h,00h,37h,37h,00h,00h,02h,04h	; Strip 11h
	DB	05h,03h,00h,37h,00h,37h,02h,04h	; Strip 12h
	DB	05h,2Ah,38h,00h,0Eh,00h,28h,04h	; Strip 13h
	DB	05h,03h,01h,00h,00h,37h,4Ah,04h	; Strip 14h
	DB	05h,2Ah,37h,00h,01h,00h,28h,04h	; Strip 15h
	DB	05h,03h,00h,37h,00h,0Eh,02h,04h	; Strip 16h
	DB	0Ch,35h,00h,0Eh,37h,37h,02h,04h	; Strip 17h
	DB	00h,01h,37h,01h,00h,00h,02h,04h	; Strip 18h
	DB	07h,00h,00h,0Eh,00h,00h,28h,04h	; Strip 19h
	DB	05h,03h,00h,01h,00h,00h,4Ah,04h	; Strip 1Ah
	DB	05h,03h,00h,00h,00h,38h,02h,04h	; Strip 1Bh
	DB	0Ch,35h,00h,00h,0Eh,00h,02h,04h	; Strip 1Ch
	DB	32h,31h,11h,12h,00h,00h,4Ah,22h	; Strip 1Dh
	DB	0Bh,17h,15h,16h,12h,00h,36h,0Fh	; Strip 1Eh
	DB	0Fh,0Fh,1Ah,0Bh,16h,32h,11h,34h	; Strip 1Fh
	DB	00h,00h,36h,1Ah,0Bh,0Bh,15h,04h	; Strip 20h
	DB	07h,00h,00h,36h,0Fh,0Fh,1Ah,04h	; Strip 21h
	DB	05h,03h,0Eh,00h,00h,00h,02h,04h	; Strip 22h
	DB	05h,03h,00h,00h,0Eh,00h,02h,04h	; Strip 23h
	DB	05h,10h,14h,12h,00h,00h,02h,04h	; Strip 24h
	DB	23h,05h,20h,16h,00h,01h,28h,04h	; Strip 25h
	DB	25h,24h,0Bh,0Bh,2Ah,37h,4Ah,04h	; Strip 26h
	DB	27h,26h,39h,0Bh,03h,00h,02h,04h	; Strip 27h
	DB	0Fh,0Fh,3Ah,0Bh,2Ah,01h,28h,04h	; Strip 28h
	DB	11h,11h,2Eh,0Bh,2Ah,00h,28h,04h	; Strip 29h
	DB	15h,15h,0Bh,0Bh,49h,01h,28h,04h	; Strip 2Ah
	DB	05h,1Bh,0Ch,0Fh,35h,00h,28h,04h	; Strip 2Bh
	DB	05h,2Ah,38h,00h,37h,37h,02h,04h	; Strip 2Ch
	DB	05h,03h,00h,00h,01h,00h,28h,04h	; Strip 2Dh
	DB	05h,49h,01h,0Eh,37h,00h,4Ah,04h	; Strip 2Eh
	DB	05h,2Ah,37h,00h,0Eh,00h,28h,04h	; Strip 2Fh

; Level 5 Route 1 horizontal strip definitions (48 strips x 8 metatile IDs = 384B), pointed
; to by Bank 00 route strip table 57ADh[12].
LEVEL5_ROUTE1_STRIP_DEFS:
	DB	4Ah,07h,00h,02h,01h,00h,1Eh,26h	; Strip 00h
	DB	49h,19h,03h,00h,00h,00h,0Fh,13h	; Strip 01h
	DB	49h,1Ah,01h,02h,02h,00h,00h,02h	; Strip 02h
	DB	4Ah,1Ah,02h,01h,00h,01h,04h,22h	; Strip 03h
	DB	4Ah,1Bh,01h,00h,00h,00h,1Ch,4Ch	; Strip 04h
	DB	49h,07h,01h,01h,00h,01h,1Dh,4Dh	; Strip 05h
	DB	49h,07h,02h,00h,01h,02h,1Eh,26h	; Strip 06h
	DB	4Ah,07h,00h,01h,02h,03h,0Fh,13h	; Strip 07h
	DB	49h,07h,02h,02h,00h,01h,02h,01h	; Strip 08h
	DB	4Ah,07h,01h,00h,00h,00h,04h,22h	; Strip 09h
	DB	4Ah,07h,00h,02h,00h,01h,06h,4Ch	; Strip 0Ah
	DB	49h,07h,01h,02h,01h,02h,06h,4Bh	; Strip 0Bh
	DB	4Ah,07h,04h,20h,28h,51h,2Ah,3Eh	; Strip 0Ch
	DB	49h,07h,06h,30h,08h,18h,12h,12h	; Strip 0Dh
	DB	4Ah,07h,06h,32h,07h,01h,02h,00h	; Strip 0Eh
	DB	4Ah,19h,06h,24h,2Eh,51h,29h,42h	; Strip 0Fh
	DB	49h,1Ah,0Fh,13h,12h,18h,09h,4Bh	; Strip 10h
	DB	4Ah,1Ah,03h,00h,01h,00h,06h,4Ch	; Strip 11h
	DB	49h,1Bh,00h,01h,00h,02h,06h,4Dh	; Strip 12h
	DB	49h,07h,02h,00h,02h,01h,06h,4Bh	; Strip 13h
	DB	37h,2Fh,2Ch,36h,2Dh,21h,0Ch,4Ch	; Strip 14h
	DB	12h,12h,09h,48h,0Eh,30h,0Bh,4Dh	; Strip 15h
	DB	00h,00h,1Ch,30h,52h,31h,55h,4Dh	; Strip 16h
	DB	23h,05h,1Dh,32h,54h,32h,10h,4Ch	; Strip 17h
	DB	4Ah,19h,1Eh,32h,52h,30h,1Fh,4Dh	; Strip 18h
	DB	49h,1Bh,06h,30h,53h,31h,52h,4Ch	; Strip 19h
	DB	3Bh,2Fh,2Ah,25h,54h,32h,53h,4Dh	; Strip 1Ah
	DB	3Fh,08h,12h,15h,17h,32h,54h,4Ch	; Strip 1Bh
	DB	3Bh,2Fh,50h,51h,2Eh,3Ah,55h,4Bh	; Strip 1Ch
	DB	3Fh,08h,18h,18h,09h,31h,10h,4Bh	; Strip 1Dh
	DB	49h,07h,01h,02h,06h,31h,52h,4Dh	; Strip 1Eh
	DB	49h,07h,02h,00h,06h,32h,54h,4Bh	; Strip 1Fh
	DB	3Dh,2Fh,56h,2Dh,2Ah,25h,0Bh,4Ch	; Strip 20h
	DB	49h,08h,57h,13h,12h,12h,17h,4Ch	; Strip 21h
	DB	49h,19h,00h,01h,00h,02h,1Ch,4Dh	; Strip 22h
	DB	31h,1Ah,02h,00h,01h,00h,1Dh,4Dh	; Strip 23h
	DB	4Ah,1Bh,00h,02h,01h,02h,1Dh,4Bh	; Strip 24h
	DB	31h,19h,02h,00h,02h,00h,1Eh,4Dh	; Strip 25h
	DB	4Ah,1Bh,01h,02h,00h,01h,1Ch,4Ch	; Strip 26h
	DB	49h,07h,03h,00h,02h,00h,1Dh,4Dh	; Strip 27h
	DB	49h,19h,00h,01h,00h,02h,1Eh,4Dh	; Strip 28h
	DB	4Ah,1Ah,02h,00h,02h,01h,1Ch,4Bh	; Strip 29h
	DB	49h,1Bh,01h,02h,00h,02h,1Eh,4Ch	; Strip 2Ah
	DB	49h,07h,02h,00h,01h,00h,1Ch,4Ch	; Strip 2Bh
	DB	48h,07h,00h,02h,00h,02h,1Dh,4Dh	; Strip 2Ch
	DB	49h,19h,01h,00h,02h,01h,1Dh,4Ch	; Strip 2Dh
	DB	4Ah,1Bh,00h,02h,00h,02h,1Dh,4Dh	; Strip 2Eh
	DB	4Ah,07h,02h,00h,01h,00h,06h,4Dh	; Strip 2Fh

; Level 5 Route 2 horizontal strip definitions (48 strips x 8 metatile IDs = 384B), pointed
; to by Bank 00 route strip table 57ADh[13].
LEVEL5_ROUTE2_STRIP_DEFS:
	DB	3Eh,38h,49h,19h,1Ch,4Bh,40h,4Eh	; Strip 00h
	DB	12h,09h,30h,1Ah,1Dh,4Dh,4Eh,4Fh	; Strip 01h
	DB	03h,06h,32h,1Ah,1Eh,4Ch,4Eh,4Eh	; Strip 02h
	DB	23h,0Ch,31h,1Bh,06h,4Bh,4Eh,4Eh	; Strip 03h
	DB	4Ah,0Bh,30h,07h,06h,4Ch,4Eh,40h	; Strip 04h
	DB	49h,0Bh,31h,0Dh,34h,4Eh,4Eh,4Eh	; Strip 05h
	DB	38h,2Eh,3Ah,52h,35h,56h,38h,3Eh	; Strip 06h
	DB	12h,09h,30h,53h,32h,58h,12h,12h	; Strip 07h
	DB	00h,06h,32h,54h,30h,19h,00h,01h	; Strip 08h
	DB	23h,0Ch,32h,55h,32h,1Ah,04h,22h	; Strip 09h
	DB	4Ah,52h,31h,10h,30h,1Bh,1Ch,4Bh	; Strip 0Ah
	DB	49h,53h,31h,10h,31h,07h,1Dh,4Ch	; Strip 0Bh
	DB	27h,54h,30h,1Fh,32h,07h,1Eh,26h	; Strip 0Ch
	DB	15h,17h,32h,55h,32h,07h,0Fh,13h	; Strip 0Dh
	DB	01h,06h,31h,10h,30h,07h,01h,02h	; Strip 0Eh
	DB	44h,2Ah,25h,1Fh,24h,2Fh,2Ch,42h	; Strip 0Fh
	DB	3Fh,08h,15h,16h,13h,12h,09h,4Ch	; Strip 10h
	DB	49h,19h,02h,00h,02h,01h,1Ch,4Dh	; Strip 11h
	DB	4Ah,1Ah,00h,02h,00h,02h,1Dh,4Dh	; Strip 12h
	DB	49h,1Ah,03h,00h,02h,01h,1Eh,4Ch	; Strip 13h
	DB	4Ah,1Bh,00h,02h,00h,02h,1Ch,4Bh	; Strip 14h
	DB	49h,07h,02h,02h,02h,00h,1Dh,4Ch	; Strip 15h
	DB	49h,19h,00h,01h,00h,02h,1Dh,4Bh	; Strip 16h
	DB	4Ah,1Bh,02h,00h,02h,00h,1Eh,4Bh	; Strip 17h
	DB	49h,19h,00h,01h,02h,00h,1Ch,4Dh	; Strip 18h
	DB	4Ah,1Ah,02h,00h,01h,02h,1Eh,4Dh	; Strip 19h
	DB	49h,1Bh,00h,02h,00h,03h,1Ch,4Ch	; Strip 1Ah
	DB	49h,07h,01h,00h,02h,00h,1Dh,4Ch	; Strip 1Bh
	DB	4Ah,07h,00h,01h,00h,02h,1Dh,4Bh	; Strip 1Ch
	DB	49h,07h,02h,00h,02h,01h,1Eh,4Dh	; Strip 1Dh
	DB	3Bh,2Fh,50h,2Dh,51h,29h,2Ah,3Ch	; Strip 1Eh
	DB	49h,08h,18h,12h,18h,12h,09h,4Dh	; Strip 1Fh
	DB	49h,19h,02h,00h,02h,01h,1Ch,4Bh	; Strip 20h
	DB	4Ah,1Bh,00h,01h,00h,02h,1Dh,4Bh	; Strip 21h
	DB	49h,19h,02h,00h,02h,00h,1Eh,4Ch	; Strip 22h
	DB	49h,1Ah,03h,02h,00h,01h,1Ch,4Dh	; Strip 23h
	DB	49h,1Bh,01h,00h,01h,00h,1Dh,4Ch	; Strip 24h
	DB	49h,07h,00h,02h,00h,02h,1Eh,4Dh	; Strip 25h
	DB	4Ah,19h,02h,00h,01h,00h,1Eh,26h	; Strip 26h
	DB	49h,1Bh,00h,02h,00h,02h,0Fh,13h	; Strip 27h
	DB	4Ah,07h,02h,00h,01h,00h,02h,01h	; Strip 28h
	DB	40h,47h,23h,05h,04h,22h,46h,47h	; Strip 29h
	DB	40h,4Eh,49h,07h,1Ch,4Ch,4Eh,4Fh	; Strip 2Ah
	DB	4Eh,4Eh,5Ah,5Bh,5Ch,5Dh,40h,4Eh	; Strip 2Bh
	DB	4Eh,4Eh,5Eh,5Fh,60h,61h,4Eh,4Fh	; Strip 2Ch
	DB	4Eh,4Eh,62h,63h,64h,65h,4Eh,4Eh	; Strip 2Dh
	DB	40h,4Eh,49h,19h,06h,4Ch,4Eh,4Eh	; Strip 2Eh
	DB	4Eh,4Eh,49h,1Bh,06h,4Bh,4Eh,40h	; Strip 2Fh

; Level 5 Route 3 horizontal strip definitions (48 strips x 8 metatile IDs = 384B), pointed
; to by Bank 00 route strip table 57ADh[14].
LEVEL5_ROUTE3_STRIP_DEFS:
	DB	49h,07h,01h,02h,00h,02h,1Ch,4Ch	; Strip 00h
	DB	4Ah,19h,03h,01h,02h,01h,1Dh,4Dh	; Strip 01h
	DB	49h,1Ah,00h,02h,00h,02h,1Eh,4Bh	; Strip 02h
	DB	4Ah,1Ah,02h,01h,02h,00h,1Ch,4Dh	; Strip 03h
	DB	49h,1Bh,00h,02h,00h,02h,1Dh,4Dh	; Strip 04h
	DB	4Ah,07h,02h,00h,01h,00h,1Dh,4Ch	; Strip 05h
	DB	37h,2Fh,51h,2Ch,21h,05h,1Eh,4Dh	; Strip 06h
	DB	12h,12h,18h,09h,30h,19h,1Ch,4Dh	; Strip 07h
	DB	03h,01h,02h,06h,32h,1Ah,1Dh,4Bh	; Strip 08h
	DB	45h,2Dh,50h,2Ah,3Ah,1Bh,1Eh,4Ch	; Strip 09h
	DB	3Fh,08h,18h,09h,48h,07h,06h,4Dh	; Strip 0Ah
	DB	4Ah,07h,01h,06h,32h,07h,06h,4Dh	; Strip 0Bh
	DB	37h,2Fh,56h,39h,38h,21h,0Ch,4Bh	; Strip 0Ch
	DB	12h,12h,59h,30h,0Eh,32h,52h,4Ch	; Strip 0Dh
	DB	02h,00h,06h,31h,0Bh,31h,53h,4Bh	; Strip 0Eh
	DB	44h,2Fh,2Ah,37h,2Eh,25h,54h,4Dh	; Strip 0Fh
	DB	49h,08h,12h,12h,12h,12h,17h,4Dh	; Strip 10h
	DB	49h,19h,02h,01h,00h,02h,1Ch,4Ch	; Strip 11h
	DB	49h,1Ah,00h,02h,00h,03h,1Dh,4Dh	; Strip 12h
	DB	4Ah,1Ah,01h,00h,02h,01h,1Eh,4Bh	; Strip 13h
	DB	4Ah,1Bh,00h,02h,00h,02h,06h,26h	; Strip 14h
	DB	49h,07h,02h,00h,02h,00h,0Fh,13h	; Strip 15h
	DB	49h,07h,00h,01h,00h,02h,01h,00h	; Strip 16h
	DB	49h,19h,01h,00h,02h,00h,04h,22h	; Strip 17h
	DB	48h,1Ah,02h,00h,02h,00h,06h,4Bh	; Strip 18h
	DB	49h,1Bh,00h,02h,01h,02h,1Ch,4Ch	; Strip 19h
	DB	4Ah,19h,03h,00h,02h,00h,1Dh,4Dh	; Strip 1Ah
	DB	48h,1Bh,00h,02h,00h,01h,1Dh,4Dh	; Strip 1Bh
	DB	49h,07h,02h,00h,02h,00h,1Eh,4Bh	; Strip 1Ch
	DB	49h,19h,00h,01h,00h,02h,1Ch,4Ch	; Strip 1Dh
	DB	49h,1Ah,00h,02h,01h,02h,1Dh,4Dh	; Strip 1Eh
	DB	4Ah,1Bh,02h,00h,02h,00h,1Eh,4Bh	; Strip 1Fh
	DB	49h,19h,01h,02h,00h,02h,1Ch,4Ch	; Strip 20h
	DB	48h,1Bh,02h,00h,02h,03h,1Dh,4Bh	; Strip 21h
	DB	4Ah,07h,00h,01h,00h,02h,1Dh,4Dh	; Strip 22h
	DB	49h,19h,02h,00h,02h,00h,1Eh,4Dh	; Strip 23h
	DB	4Ah,1Bh,01h,02h,00h,02h,06h,4Ch	; Strip 24h
	DB	49h,07h,02h,00h,02h,01h,1Ch,4Bh	; Strip 25h
	DB	37h,2Fh,2Dh,21h,05h,02h,1Dh,4Dh	; Strip 26h
	DB	12h,12h,09h,31h,19h,00h,1Dh,4Dh	; Strip 27h
	DB	01h,02h,1Ch,32h,1Ah,00h,1Eh,4Ch	; Strip 28h
	DB	23h,05h,1Dh,32h,1Bh,02h,06h,4Bh	; Strip 29h
	DB	4Ah,19h,1Dh,30h,19h,01h,1Ch,4Dh	; Strip 2Ah
	DB	49h,1Ah,1Dh,31h,1Bh,00h,1Dh,4Ch	; Strip 2Bh
	DB	48h,1Ah,1Eh,33h,07h,02h,1Dh,4Dh	; Strip 2Ch
	DB	49h,1Bh,0Fh,14h,11h,01h,1Eh,4Bh	; Strip 2Dh
	DB	4Ah,07h,00h,02h,00h,02h,06h,4Bh	; Strip 2Eh
	DB	49h,07h,02h,01h,02h,00h,06h,4Ch	; Strip 2Fh

; Level 6 Route 1 horizontal strip definitions (48 strips x 8 metatile IDs = 384B), pointed
; to by Bank 00 route strip table 57ADh[15].
LEVEL6_ROUTE1_STRIP_DEFS:
	DB	0Ch,0Ch,0Ch,0Ch,14h,00h,04h,00h	; Strip 00h
	DB	0Fh,19h,0Fh,0Eh,09h,01h,04h,01h	; Strip 01h
	DB	12h,1Bh,19h,0Fh,05h,00h,04h,00h	; Strip 02h
	DB	02h,0Dh,0Fh,0Fh,09h,01h,08h,0Ch	; Strip 03h
	DB	03h,06h,0Eh,19h,05h,00h,10h,11h	; Strip 04h
	DB	02h,0Dh,19h,0Fh,0Ah,0Ch,0Ch,0Ch	; Strip 05h
	DB	03h,1Ch,11h,10h,11h,10h,11h,10h	; Strip 06h
	DB	02h,08h,0Ch,0Ch,0Ch,0Ch,14h,00h	; Strip 07h
	DB	03h,06h,0Eh,0Fh,0Fh,19h,09h,01h	; Strip 08h
	DB	02h,06h,19h,1Ah,10h,11h,10h,00h	; Strip 09h
	DB	03h,0Dh,0Fh,0Ah,0Ch,0Ch,14h,01h	; Strip 0Ah
	DB	02h,06h,0Fh,0Fh,0Fh,0Fh,05h,00h	; Strip 0Bh
	DB	03h,02h,12h,13h,12h,1Bh,05h,01h	; Strip 0Ch
	DB	02h,17h,16h,16h,16h,18h,05h,00h	; Strip 0Dh
	DB	03h,06h,0Fh,0Fh,0Fh,0Fh,05h,01h	; Strip 0Eh
	DB	02h,06h,1Ah,10h,11h,10h,11h,00h	; Strip 0Fh
	DB	03h,06h,0Ah,0Ch,0Ch,0Ch,0Ch,0Ch	; Strip 10h
	DB	02h,06h,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh	; Strip 11h
	DB	03h,13h,12h,13h,10h,11h,10h,11h	; Strip 12h
	DB	02h,17h,16h,16h,14h,01h,00h,01h	; Strip 13h
	DB	03h,06h,0Fh,0Eh,05h,00h,01h,00h	; Strip 14h
	DB	02h,13h,12h,1Bh,05h,01h,2Ch,01h	; Strip 15h
	DB	03h,17h,16h,07h,0Ah,0Ch,2Eh,00h	; Strip 16h
	DB	02h,06h,0Fh,19h,0Eh,0Fh,05h,01h	; Strip 17h
	DB	03h,0Dh,0Eh,0Fh,0Fh,0Fh,05h,00h	; Strip 18h
	DB	02h,06h,0Fh,19h,0Fh,0Eh,09h,01h	; Strip 19h
	DB	03h,06h,19h,0Fh,19h,0Fh,05h,00h	; Strip 1Ah
	DB	02h,06h,0Eh,0Fh,0Fh,19h,09h,01h	; Strip 1Bh
	DB	03h,0Dh,0Fh,0Fh,19h,0Eh,05h,00h	; Strip 1Ch
	DB	02h,06h,0Fh,0Fh,0Fh,0Fh,05h,01h	; Strip 1Dh
	DB	03h,06h,19h,0Fh,0Eh,0Fh,09h,00h	; Strip 1Eh
	DB	02h,06h,0Fh,0Fh,19h,0Eh,05h,01h	; Strip 1Fh
	DB	03h,0Dh,0Fh,0Fh,19h,0Fh,05h,00h	; Strip 20h
	DB	02h,06h,0Fh,0Fh,0Fh,19h,09h,01h	; Strip 21h
	DB	03h,0Dh,0Eh,19h,19h,0Fh,05h,00h	; Strip 22h
	DB	02h,06h,19h,0Fh,0Fh,0Eh,05h,01h	; Strip 23h
	DB	03h,0Dh,0Fh,0Eh,0Fh,19h,09h,00h	; Strip 24h
	DB	02h,06h,0Fh,19h,0Fh,0Fh,05h,01h	; Strip 25h
	DB	03h,06h,0Fh,0Fh,0Fh,0Eh,05h,00h	; Strip 26h
	DB	02h,06h,0Eh,0Fh,19h,0Fh,05h,01h	; Strip 27h
	DB	03h,06h,0Eh,0Fh,19h,0Fh,09h,00h	; Strip 28h
	DB	02h,0Dh,0Fh,19h,0Fh,0Eh,05h,01h	; Strip 29h
	DB	03h,06h,19h,0Eh,0Fh,19h,05h,00h	; Strip 2Ah
	DB	02h,06h,0Fh,0Fh,0Fh,0Fh,05h,01h	; Strip 2Bh
	DB	03h,0Dh,0Eh,0Fh,19h,0Fh,09h,00h	; Strip 2Ch
	DB	02h,06h,0Fh,0Fh,0Fh,0Fh,09h,01h	; Strip 2Dh
	DB	03h,0Dh,19h,0Fh,0Eh,19h,05h,00h	; Strip 2Eh
	DB	02h,12h,13h,12h,13h,12h,1Dh,01h	; Strip 2Fh

; Level 6 Route 2 horizontal strip definitions (48 strips x 8 metatile IDs = 384B), pointed
; to by Bank 00 route strip table 57ADh[16].
LEVEL6_ROUTE2_STRIP_DEFS:
	DB	03h,02h,03h,06h,05h,01h,00h,01h	; Strip 00h
	DB	02h,17h,16h,07h,15h,0Ch,14h,00h	; Strip 01h
	DB	03h,0Dh,19h,0Eh,0Fh,0Fh,05h,01h	; Strip 02h
	DB	16h,18h,0Fh,19h,0Fh,19h,09h,00h	; Strip 03h
	DB	13h,12h,13h,12h,1Bh,0Fh,05h,01h	; Strip 04h
	DB	16h,16h,14h,02h,06h,19h,05h,00h	; Strip 05h
	DB	02h,1Bh,05h,03h,06h,0Eh,05h,01h	; Strip 06h
	DB	03h,06h,05h,02h,06h,19h,09h,00h	; Strip 07h
	DB	02h,12h,13h,03h,2Ch,10h,11h,01h	; Strip 08h
	DB	03h,17h,16h,16h,2Dh,0Ch,14h,00h	; Strip 09h
	DB	02h,0Dh,0Fh,19h,0Fh,0Eh,05h,01h	; Strip 0Ah
	DB	03h,06h,0Eh,0Fh,0Fh,19h,05h,00h	; Strip 0Bh
	DB	02h,06h,0Fh,0Fh,0Fh,0Fh,05h,01h	; Strip 0Ch
	DB	03h,06h,0Fh,0Fh,0Fh,0Fh,09h,00h	; Strip 0Dh
	DB	02h,06h,0Fh,0Fh,1Ah,10h,00h,01h	; Strip 0Eh
	DB	03h,13h,12h,13h,1Dh,00h,17h,0Ch	; Strip 0Fh
	DB	16h,16h,14h,03h,04h,01h,06h,0Fh	; Strip 10h
	DB	0Fh,0Fh,09h,02h,04h,00h,1Ch,11h	; Strip 11h
	DB	12h,1Bh,05h,03h,04h,01h,04h,01h	; Strip 12h
	DB	02h,06h,05h,02h,04h,00h,04h,00h	; Strip 13h
	DB	03h,06h,15h,16h,1Fh,0Ch,0Bh,01h	; Strip 14h
	DB	02h,0Dh,0Fh,0Fh,0Fh,0Fh,05h,00h	; Strip 15h
	DB	03h,06h,0Fh,0Fh,0Fh,0Fh,09h,01h	; Strip 16h
	DB	02h,06h,0Fh,0Fh,0Fh,0Eh,09h,00h	; Strip 17h
	DB	03h,0Dh,19h,19h,19h,0Fh,05h,01h	; Strip 18h
	DB	02h,0Dh,0Eh,0Fh,0Fh,19h,05h,00h	; Strip 19h
	DB	03h,06h,19h,0Fh,19h,0Fh,05h,01h	; Strip 1Ah
	DB	02h,06h,0Fh,0Eh,0Fh,0Fh,05h,00h	; Strip 1Bh
	DB	03h,0Dh,19h,19h,0Fh,0Eh,09h,01h	; Strip 1Ch
	DB	02h,06h,0Eh,0Fh,0Fh,0Fh,05h,00h	; Strip 1Dh
	DB	03h,0Dh,0Fh,0Fh,0Fh,0Eh,05h,01h	; Strip 1Eh
	DB	02h,06h,19h,0Fh,19h,19h,09h,00h	; Strip 1Fh
	DB	03h,06h,0Fh,0Fh,0Fh,0Fh,09h,01h	; Strip 20h
	DB	02h,06h,0Eh,0Fh,0Fh,0Eh,05h,00h	; Strip 21h
	DB	03h,0Dh,0Fh,19h,0Fh,0Fh,05h,01h	; Strip 22h
	DB	02h,06h,19h,0Fh,19h,0Eh,09h,00h	; Strip 23h
	DB	03h,0Dh,0Eh,19h,0Fh,0Fh,09h,01h	; Strip 24h
	DB	02h,06h,19h,0Fh,19h,19h,05h,00h	; Strip 25h
	DB	03h,06h,19h,0Fh,0Eh,0Fh,15h,0Ch	; Strip 26h
	DB	02h,0Dh,0Fh,0Fh,0Fh,0Fh,0Fh,0Eh	; Strip 27h
	DB	03h,13h,12h,1Bh,1Ah,10h,11h,10h	; Strip 28h
	DB	03h,02h,03h,06h,05h,01h,00h,01h	; Strip 29h
	DB	02h,03h,02h,06h,05h,00h,01h,00h	; Strip 2Ah
	DB	02h,03h,20h,21h,22h,23h,01h,00h	; Strip 2Bh
	DB	03h,02h,24h,25h,26h,27h,00h,01h	; Strip 2Ch
	DB	02h,03h,28h,29h,2Ah,2Bh,01h,00h	; Strip 2Dh
	DB	03h,02h,03h,06h,05h,01h,00h,01h	; Strip 2Eh
	DB	02h,03h,02h,06h,05h,00h,01h,00h	; Strip 2Fh

; Level 6 Route 3 horizontal strip definitions (48 strips x 8 metatile IDs = 384B), pointed
; to by Bank 00 route strip table 57ADh[17].
LEVEL6_ROUTE3_STRIP_DEFS:
	DB	03h,0Dh,0Fh,0Fh,19h,0Eh,15h,0Ch	; Strip 00h
	DB	02h,06h,19h,0Fh,0Fh,0Fh,19h,0Fh	; Strip 01h
	DB	03h,06h,19h,0Fh,0Eh,0Fh,1Ah,10h	; Strip 02h
	DB	02h,06h,0Fh,0Fh,0Fh,19h,05h,00h	; Strip 03h
	DB	03h,06h,0Eh,0Fh,19h,0Fh,05h,01h	; Strip 04h
	DB	02h,0Dh,19h,0Fh,0Fh,0Eh,09h,00h	; Strip 05h
	DB	03h,06h,0Eh,19h,0Fh,19h,05h,01h	; Strip 06h
	DB	02h,06h,19h,19h,0Fh,0Fh,09h,00h	; Strip 07h
	DB	03h,06h,19h,0Eh,0Fh,19h,05h,01h	; Strip 08h
	DB	02h,0Dh,0Fh,0Fh,19h,0Fh,05h,00h	; Strip 09h
	DB	03h,06h,0Fh,19h,0Eh,19h,09h,01h	; Strip 0Ah
	DB	02h,0Dh,19h,0Fh,19h,0Eh,05h,00h	; Strip 0Bh
	DB	03h,06h,0Eh,19h,0Fh,0Eh,05h,01h	; Strip 0Ch
	DB	02h,0Dh,19h,0Fh,19h,0Fh,05h,00h	; Strip 0Dh
	DB	03h,0Dh,0Fh,0Fh,0Fh,19h,09h,01h	; Strip 0Eh
	DB	16h,18h,19h,0Eh,19h,0Fh,05h,00h	; Strip 0Fh
	DB	0Eh,0Fh,0Fh,0Fh,19h,19h,05h,01h	; Strip 10h
	DB	12h,1Bh,19h,0Fh,19h,0Fh,09h,00h	; Strip 11h
	DB	02h,0Dh,0Eh,19h,0Fh,19h,05h,01h	; Strip 12h
	DB	03h,06h,19h,19h,0Eh,0Fh,05h,00h	; Strip 13h
	DB	02h,06h,19h,0Fh,0Fh,0Fh,09h,01h	; Strip 14h
	DB	03h,0Dh,0Fh,0Eh,19h,19h,05h,00h	; Strip 15h
	DB	02h,06h,19h,0Fh,19h,0Fh,09h,01h	; Strip 16h
	DB	03h,06h,0Eh,19h,0Fh,0Eh,05h,00h	; Strip 17h
	DB	02h,06h,0Eh,0Fh,0Fh,0Fh,09h,01h	; Strip 18h
	DB	03h,0Dh,0Fh,0Fh,19h,0Eh,05h,00h	; Strip 19h
	DB	02h,06h,19h,19h,0Fh,19h,09h,01h	; Strip 1Ah
	DB	03h,06h,0Fh,0Fh,19h,19h,05h,00h	; Strip 1Bh
	DB	02h,0Dh,0Eh,0Fh,19h,0Fh,05h,01h	; Strip 1Ch
	DB	03h,06h,19h,19h,0Fh,19h,05h,00h	; Strip 1Dh
	DB	02h,0Dh,0Eh,0Fh,19h,0Fh,05h,01h	; Strip 1Eh
	DB	03h,06h,19h,0Fh,19h,19h,09h,00h	; Strip 1Fh
	DB	02h,06h,0Eh,0Fh,0Fh,0Fh,05h,01h	; Strip 20h
	DB	03h,0Dh,19h,19h,0Eh,0Fh,05h,00h	; Strip 21h
	DB	02h,06h,0Fh,0Eh,0Fh,19h,05h,01h	; Strip 22h
	DB	03h,0Dh,19h,0Fh,0Eh,19h,09h,00h	; Strip 23h
	DB	02h,0Dh,0Fh,0Fh,0Fh,0Fh,09h,01h	; Strip 24h
	DB	03h,13h,12h,1Eh,10h,11h,10h,00h	; Strip 25h
	DB	16h,14h,02h,04h,00h,17h,14h,01h	; Strip 26h
	DB	0Fh,05h,03h,04h,01h,06h,05h,00h	; Strip 27h
	DB	12h,1Dh,02h,04h,00h,06h,05h,01h	; Strip 28h
	DB	02h,04h,03h,04h,01h,06h,05h,00h	; Strip 29h
	DB	03h,04h,02h,04h,00h,06h,05h,01h	; Strip 2Ah
	DB	02h,04h,03h,04h,01h,06h,05h,00h	; Strip 2Bh
	DB	03h,08h,16h,1Fh,0Ch,18h,05h,02h	; Strip 2Ch
	DB	02h,06h,19h,0Fh,0Eh,0Eh,09h,00h	; Strip 2Dh
	DB	03h,0Dh,0Eh,0Fh,19h,19h,05h,01h	; Strip 2Eh
	DB	02h,0Dh,0Fh,19h,0Fh,19h,05h,00h	; Strip 2Fh

; Shared boss-arena horizontal strip definitions (9AC0h-9B1Fh, 12 strips x 8 metatile IDs =
; 96B), pointed to by Bank 00 route strip table 57ADh[18..23] for all 6 boss encounters.
SHARED_BOSS_ROUTE_STRIP_DEFS:
	DB	00h,00h,00h,0Dh,0Eh,00h,00h,00h	; Strip 00h
	DB	00h,01h,01h,0Fh,10h,01h,01h,00h	; Strip 01h
	DB	00h,04h,04h,04h,04h,04h,0Ah,00h	; Strip 02h
	DB	00h,06h,03h,03h,03h,08h,05h,00h	; Strip 03h
	DB	00h,08h,03h,03h,03h,03h,0Bh,00h	; Strip 04h
	DB	00h,09h,03h,03h,03h,03h,0Bh,00h	; Strip 05h
	DB	00h,09h,03h,03h,03h,03h,0Bh,00h	; Strip 06h
	DB	00h,09h,03h,03h,03h,03h,05h,00h	; Strip 07h
	DB	00h,06h,03h,03h,03h,08h,05h,00h	; Strip 08h
	DB	00h,02h,02h,09h,0Ch,02h,02h,00h	; Strip 09h
	DB	00h,0Dh,0Eh,00h,00h,0Dh,0Eh,00h	; Strip 0Ah
	DB	00h,0Fh,10h,01h,01h,0Fh,10h,00h	; Strip 0Bh

; Ending Scene 2 (632Ch) 42-tile 1bpp block (9B20h-9C6Fh, 42 x 8B = 336B -> dst=01h..2Ah,
; colors 6/D).
ENDING_SCENE2_TILES_1BPP_9B20:
	DB	00h,00h,00h,00h,00h,00h,00h,00h
	DB	C0h,C0h,80h,80h,80h,80h,81h,81h
	DB	5Bh,77h,6Fh,6Fh,DFh,FFh,FFh,EEh
	DB	B8h,B6h,73h,E1h,E8h,E4h,E4h,E4h
	DB	80h,80h,00h,00h,00h,00h,00h,00h
	DB	C0h,C0h,80h,80h,80h,00h,00h,00h
	DB	18h,20h,01h,07h,1Eh,38h,70h,60h
	DB	00h,00h,00h,80h,C0h,E0h,C0h,C0h
	DB	F0h,FCh,FFh,FFh,FFh,3Fh,1Fh,1Fh
	DB	1Fh,3Fh,3Fh,3Fh,3Eh,3Ch,18h,00h
	DB	00h,00h,00h,80h,C0h,F0h,5Fh,6Fh
	DB	02h,01h,01h,01h,01h,40h,C2h,C2h
	DB	03h,1Fh,7Fh,FFh,FFh,F0h,C0h,84h
	DB	FFh,FFh,03h,00h,00h,00h,00h,00h
	DB	80h,80h,C0h,E0h,F0h,FFh,FFh,FFh
	DB	76h,F5h,EDh,F8h,D7h,CDh,F3h,EFh
	DB	00h,01h,01h,03h,03h,07h,07h,07h
	DB	0Fh,0Fh,0Fh,0Fh,1Fh,1Fh,3Eh,3Eh
	DB	FEh,FFh,FDh,FDh,FAh,FBh,FBh,FAh
	DB	FAh,FBh,FAh,D6h,D7h,D7h,CEh,DCh
	DB	01h,03h,07h,0Fh,1Fh,3Fh,3Fh,7Fh
	DB	FFh,FEh,FCh,FCh,F8h,F0h,F4h,E9h
	DB	D9h,F1h,F3h,63h,E7h,CFh,9Eh,3Eh
	DB	00h,01h,07h,0Fh,1Fh,3Fh,7Fh,FFh
	DB	00h,11h,23h,63h,43h,C7h,87h,87h
	DB	FEh,FCh,F8h,F0h,E0h,C0h,80h,00h
	DB	00h,01h,01h,03h,03h,27h,47h,C6h
	DB	C6h,8Eh,8Eh,8Eh,9Ch,1Dh,19h,39h
	DB	8Eh,8Eh,8Ch,1Ch,1Ch,19h,32h,22h
	DB	33h,63h,47h,C6h,8Eh,1Eh,1Ch,3Ch
	DB	0Fh,1Fh,7Ch,F8h,F0h,E0h,80h,00h
	DB	38h,1Ch,1Ch,1Eh,0Eh,0Eh,0Fh,0Fh
	DB	07h,07h,27h,C7h,83h,83h,09h,11h
	DB	00h,0Ch,30h,60h,C0h,C0h,C0h,80h
	DB	86h,8Ch,98h,98h,91h,B1h,B3h,B3h
	DB	10h,32h,22h,62h,67h,67h,67h,37h
	DB	C0h,00h,00h,00h,00h,01h,13h,66h
	DB	CCh,98h,98h,B1h,31h,71h,73h,73h
	DB	63h,E3h,E7h,E7h,C6h,CEh,CCh,8Ch
	DB	00h,00h,00h,00h,84h,08h,10h,30h
	DB	E2h,80h,F0h,3Eh,00h,00h,00h,00h
	DB	00h,00h,01h,03h,0Fh,3Fh,FFh,F0h

; Ending Scene 2 (632Ch) 48-tile 2bpp block (9C70h-9F6Fh, 48 x 16B = 768B -> dst=2Bh..5Ah,
; colors 0/1/6/D).
ENDING_SCENE2_TILES_2BPP_9C70:
	DB	40h,C0h,00h,80h,80h,80h,00h,00h,00h,00h,00h,FFh,00h,00h,00h,00h
	DB	00h,00h,00h,00h,00h,00h,00h,00h,C0h,F8h,3Ch,3Fh,00h,00h,00h,00h
	DB	00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,FFh,7Fh,7Fh,00h,00h
	DB	01h,01h,00h,03h,00h,07h,01h,1Fh,06h,FEh,30h,F0h,00h,00h,00h,00h
	DB	80h,E0h,C0h,F0h,60h,F8h,30h,38h,38h,3Ch,18h,1Eh,1Eh,1Eh,0Eh,0Eh
	DB	0Ch,2Eh,04h,36h,02h,33h,01h,11h,00h,18h,00h,08h,00h,04h,00h,02h
	DB	33h,FFh,1Bh,7Fh,1Bh,7Bh,1Bh,7Bh,13h,B3h,93h,B3h,A6h,A6h,18h,19h
	DB	0Fh,FFh,0Eh,FFh,1Ch,FDh,1Ch,FFh,18h,FBh,38h,FFh,30h,F7h,70h,F7h
	DB	71h,FFh,E1h,EFh,E1h,EFh,E3h,EFh,C2h,CEh,C6h,CEh,C4h,CCh,C4h,CCh
	DB	80h,BFh,84h,FFh,0Ch,7Fh,0Ch,7Fh,1Ch,FFh,34h,F7h,22h,E7h,62h,E7h
	DB	00h,00h,3Ch,3Ch,42h,7Eh,81h,EBh,8Dh,DFh,9Eh,FFh,82h,E3h,80h,E1h
	DB	44h,4Ch,44h,44h,06h,06h,02h,02h,01h,01h,80h,80h,80h,80h,80h,80h
	DB	42h,C7h,43h,C7h,41h,47h,41h,47h,20h,27h,20h,27h,00h,03h,00h,03h
	DB	77h,FFh,3Dh,FFh,3Fh,FFh,3Fh,FFh,1Fh,FFh,1Fh,FFh,0Fh,FFh,0Fh,7Fh
	DB	83h,FFh,83h,FFh,83h,FFh,C3h,FFh,47h,7Fh,C7h,FFh,87h,BFh,A6h,BFh
	DB	EFh,FFh,AFh,FFh,AFh,FFh,59h,FDh,51h,F5h,39h,FDh,69h,EDh,C9h,CDh
	DB	EDh,FFh,C8h,FFh,DEh,FFh,A7h,E7h,C1h,F9h,E8h,FEh,E4h,FFh,73h,FBh
	DB	F3h,FBh,79h,7Fh,3Ch,BEh,1Eh,DFh,8Eh,EFh,C7h,F7h,67h,77h,23h,BBh
	DB	31h,BDh,39h,FDh,98h,DEh,98h,FEh,98h,FEh,88h,EEh,88h,EEh,88h,EEh
	DB	33h,FBh,11h,DDh,89h,EDh,89h,EDh,C9h,EDh,C1h,F5h,C1h,F5h,C1h,F5h
	DB	88h,EEh,88h,EEh,88h,EEh,08h,EEh,08h,CEh,01h,DDh,01h,9Dh,01h,BDh
	DB	00h,00h,00h,00h,03h,03h,00h,0Fh,00h,1Fh,00h,3Fh,00h,7Fh,00h,FFh
	DB	00h,00h,00h,00h,C0h,C0h,30h,F0h,18h,F8h,0Ch,FCh,06h,FEh,03h,FFh
	DB	00h,01h,00h,01h,00h,03h,00h,03h,00h,07h,01h,07h,01h,07h,03h,0Fh
	DB	0Eh,FFh,3Fh,FFh,7Fh,FFh,7Fh,FFh,E1h,E5h,C0h,DEh,80h,FFh,00h,7Fh
	DB	01h,FFh,81h,FFh,C0h,FFh,E0h,FFh,E0h,FFh,F0h,FFh,70h,FFh,38h,BFh
	DB	00h,00h,80h,80h,80h,80h,C0h,C0h,60h,E0h,60h,E0h,30h,F0h,30h,F0h
	DB	18h,F8h,18h,F8h,0Ch,FCh,0Ch,FCh,06h,FEh,06h,FEh,03h,FFh,01h,FFh
	DB	03h,0Fh,02h,0Eh,06h,0Fh,06h,1Fh,06h,1Fh,06h,1Fh,06h,1Fh,07h,1Fh
	DB	07h,1Fh,07h,1Fh,07h,0Fh,07h,0Fh,07h,0Fh,03h,0Fh,02h,0Eh,02h,06h
	DB	02h,06h,02h,06h,02h,06h,02h,06h,04h,0Ch,04h,0Ch,08h,18h,00h,60h
	DB	B3h,FFh,36h,FFh,36h,7Fh,36h,7Fh,32h,7Fh,3Ah,7Fh,3Ah,7Fh,08h,6Eh
	DB	FFh,FFh,7Fh,7Fh,3Fh,BFh,1Eh,DEh,0Eh,CEh,0Dh,EDh,95h,F5h,92h,F3h
	DB	00h,80h,00h,E0h,0Ch,FCh,3Bh,FBh,F6h,F7h,ECh,EFh,D8h,DFh,B0h,BFh
	DB	01h,01h,1Fh,1Fh,F0h,FFh,80h,FFh,00h,FFh,00h,FFh,00h,FFh,00h,FFh
	DB	A0h,BFh,40h,7Fh,40h,7Fh,80h,FFh,81h,FFh,03h,FFh,03h,FFh,07h,FFh
	DB	8Ah,FBh,8Ah,FBh,84h,F7h,94h,F7h,84h,E7h,28h,EFh,48h,CFh,08h,0Fh
	DB	14h,FCh,14h,FCh,34h,FCh,24h,ECh,40h,CCh,80h,84h,02h,06h,01h,03h
	DB	1Ah,FEh,10h,FCh,34h,FCh,34h,FCh,64h,ECh,60h,ECh,C2h,C6h,80h,81h
	DB	9Dh,FFh,19h,FFh,19h,FFh,32h,FEh,32h,FEh,66h,FEh,C4h,DCh,8Ch,BCh
	DB	ECh,FFh,98h,FFh,38h,FFh,63h,FFh,C4h,FFh,08h,FFh,00h,9Ch,00h,30h
	DB	44h,FFh,88h,FFh,10h,FFh,00h,FCh,00h,F0h,03h,83h,0Eh,1Eh,E0h,E0h
	DB	1Dh,DFh,1Ah,9Eh,34h,3Ch,78h,79h,F0h,F3h,C0h,C4h,00h,10h,00h,00h
	DB	1Ch,3Ch,38h,78h,68h,F8h,08h,98h,08h,18h,00h,08h,04h,0Ch,03h,03h
	DB	0Ch,0Ch,06h,1Eh,02h,1Eh,02h,0Eh,00h,0Ch,04h,0Ch,04h,1Ch,08h,18h
	DB	00h,30h,10h,70h,20h,E0h,40h,C0h,00h,00h,00h,00h,00h,00h,00h,00h
	DB	00h,00h,00h,00h,00h,00h,00h,01h,01h,07h,02h,1Eh,18h,F8h,C0h,C0h
	DB	00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,03h,FFh

; Ending Scene 2 (632Ch) 29-tile 2bpp block (17F70h-1813Fh, 464B total -> dst=5Bh..77h):
; Bank 11 part 1 (144B = 9 tiles; continues seamlessly into Bank 12 18000h-1813Fh when Banks
; 10+11+12 are mapped at 6000h-BFFFh).
ENDING_SCENE2_TILES_2BPP_9F70_PART1:
	DB	00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,C0h,90h,F0h,18h,1Fh
	DB	D9h,DDh,91h,9Dh,31h,39h,21h,39h,43h,73h,82h,E3h,06h,C7h,0Ch,0Fh
	DB	18h,1Fh,30h,3Eh,40h,7Ch,80h,F9h,00h,F3h,00h,87h,00h,1Ch,00h,E0h
	DB	00h,00h,80h,C0h,40h,70h,10h,1Ch,08h,0Fh,04h,07h,02h,03h,01h,01h
	DB	00h,03h,00h,07h,01h,07h,02h,0Eh,00h,1Ch,04h,BCh,08h,F8h,10h,F0h
	DB	00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,03h,03h,0Eh,0Fh,38h,3Fh
	DB	08h,08h,10h,10h,20h,30h,61h,61h,C6h,E7h,08h,CFh,30h,BEh,C7h,FFh
	DB	40h,40h,42h,42h,82h,C2h,04h,84h,08h,8Ch,30h,38h,C0h,F0h,01h,E1h
	DB	04h,C7h,10h,9Fh,C0h,FFh,00h,FFh,00h,FFh,00h,FFh,00h,FFh,00h,FFh

	DEPHASE

; MSX BIOS vectors, Konami mapper registers, V9938 VRAM layout, and state IDs

; MSX BIOS entry points and low-memory vectors
BIOS_VDP_DR:  EQU	0006h	; Base VDP read data port byte stored in Main-ROM header
BIOS_VDP_DW:  EQU	0007h	; Base VDP write data port byte stored in Main-ROM header
BIOS_RDSLT:   EQU	000Ch	; Read byte at HL from slot A
BIOS_ENASLT:  EQU	0024h	; Map slot A permanently into CPU page containing HL
BIOS_WRTVDP:  EQU	0047h	; Write value B to VDP register C and update BIOS shadow
BIOS_CHGMOD:  EQU	005Fh	; Switch VDP screen mode to A
BIOS_WRTPSG:  EQU	0093h	; Write value E to PSG register A
BIOS_RDPSG:   EQU	0096h	; Read value from PSG register A
BIOS_CHGET:   EQU	009Fh	; Wait for and read one character from keyboard buffer
BIOS_TAPION:  EQU	00E1h	; Read cassette header and start tape input
BIOS_TAPIN:   EQU	00E4h	; Read one byte from cassette tape
BIOS_TAPIOF:  EQU	00E7h	; Stop reading from cassette tape
BIOS_TAPOON:  EQU	00EAh	; Write cassette header (A=0 short, A<>0 long)
BIOS_TAPOUT:  EQU	00EDh	; Write byte A to cassette tape
BIOS_TAPOOF:  EQU	00F0h	; Finish writing to cassette tape
BIOS_STMOTR:  EQU	00F3h	; Set cassette motor state (A=0 stop, 1 start, FFh toggle)
BIOS_RSLREG:  EQU	0138h	; Read primary slot-select register
BIOS_SNSMAT:  EQU	0141h	; Read keyboard matrix row A
BIOS_KILBUF:  EQU	0156h	; Clear MSX BIOS keyboard ring buffer
BIOS_MSXVER:  EQU	002Dh	; Main-ROM MSX version byte (00h MSX1, 01h MSX2, 02h MSX2+, 03h turbo R)
BIOS_KEYINT:  EQU	0038h	; Main-ROM maskable interrupt entry (RST 38h / IM 1 vector)

; Primary slot-select register (PPI port A)
PPI_SLOT_PORT:     EQU	A8h	; Bits 1-0 page 0 ... bits 7-6 page 3 primary slot
RAM_MAPPER_PAGE0:  EQU	FCh	; MSX2 memory mapper segment register for CPU page 0 (0000h-3FFFh)

; Konami 8 KiB mapper bank-select registers
MAPPER_PAGE1:  EQU	6000h	; Select 8 KiB ROM bank for CPU 6000h-7FFFh
MAPPER_PAGE2:  EQU	8000h	; Select 8 KiB ROM bank for CPU 8000h-9FFFh
MAPPER_PAGE3:  EQU	A000h	; Select 8 KiB ROM bank for CPU A000h-BFFFh

; V9938 VRAM table base addresses & Page 1 off-screen coordinates (SCREEN 5 layout)
VRAM_PAGE1_BOSS4_BG_SAVE:  EQU	E040h	; VRAM Page 1 (E0h, 40h) 32x48 saved background buffer for Boss 4
VRAM_PAGE1_END_KANJI_32:   EQU	E090h	; VRAM Page 1 (E0h, 90h) 32x32 white ending kanji '完' ("THE END")
VRAM_PAGE1_BOSS4_GFX:      EQU	E0B0h	; VRAM Page 1 (E0h..FFh, B0h..DFh) 32x48 Stage 4 Boss guardian statue graphic
VRAM_SPRITE_COL_0:         EQU	F000h	; Hidden/active sprite color table buffer 0
VRAM_HIDDEN_SAT_0:         EQU	F200h	; Hidden/active sprite attribute table buffer 0
VRAM_SPRITE_AUX_FILL:      EQU	F300h	; Auxiliary sprite attribute clear range
VRAM_SPRITE_COL_1:         EQU	F400h	; Hidden/active sprite color table buffer 1
VRAM_HIDDEN_SAT_1:         EQU	F600h	; Hidden/active sprite attribute table buffer 1
VRAM_PALETTE_TABLE:        EQU	F680h	; VRAM palette staging address (32 bytes)
VRAM_SPRITE_GEN_BASE:      EQU	F800h	; Sprite pattern generator table base (2048 bytes)

; Enhanced Edition VRAM Page 2 & Page 3 cache and backup coordinates
VRAM_PAGE2_STAGE_MAP_TILES:   EQU	0000h	; VRAM Page 2 (00h, 00h..2Fh) pre-unpacked F4 Stage Map tileset
VRAM_PAGE2_COMPASS_TILES:     EQU	0030h	; VRAM Page 2 (00h, 30h..47h) pre-unpacked F5 Time Compass tileset
VRAM_PAGE2_BIRD_MSG_TILES:    EQU	0048h	; VRAM Page 2 (00h, 48h..5Fh) pre-unpacked Bird Message portrait frame tileset
VRAM_PAGE2_COMMON_CACHE:      EQU	0060h	; VRAM Page 2 (00h, 60h..FFh) 256x160 master mirror of Page 1 Y=40h..DFh
VRAM_PAGE3_STAGE_CACHE:       EQU	0000h	; VRAM Page 3 (00h, 00h..3Fh) cached active stage tileset + common normal tiles
VRAM_PAGE3_NORMAL_COMMON:     EQU	0030h	; VRAM Page 3 (00h, 30h..3Bh) pre-unpacked COMMON_NORMAL_STAGE_GFX_DESCRIPTOR
VRAM_PAGE3_BOSS_TILES:        EQU	0040h	; VRAM Page 3 (00h, 40h..5Fh) pre-unpacked shared BOSS_STAGE_GFX_DESCRIPTOR
VRAM_PAGE3_CURSOR_MASK:       EQU	C060h	; VRAM Page 3 (C0h, 60h..73h) pre-built 20x20 color-77h XOR cursor mask
VRAM_PAGE3_BOSS4_BG_SAVE:     EQU	E060h	; VRAM Page 3 (E0h, 60h..8Fh) 32x48 saved background buffer for Boss 4
VRAM_PAGE3_SUBSCREEN_BACKUP:  EQU	0080h	; VRAM Page 3 (00h, 80h..FBh) F4 Map / F5 Compass screen backup origin
VRAM_PAGE3_POPUP_BACKUP:      EQU	1080h	; VRAM Page 3 (10h, 80h..BFh) F1 Pause / Password / F2 Power Up / Attract backup
VRAM_PAGE3_LARGE_BOX_BACKUP:  EQU	1080h	; VRAM Page 3 (10h, 80h..F7h) F3 Item Info / Bird Message screen backup origin

; Enhanced Edition MSX2+ (V9958) continuous horizontal scrolling
V9958_R25_CTRL:          EQU	19h	; V9958 R#25: bit 1 MSK masks the leftmost 8 dots, bit 0 SP2 two-page scroll
V9958_R26_HOFS_COARSE:   EQU	1Ah	; V9958 R#26: horizontal offset in 8-dot units (screen scrolls left)
V9958_R27_HOFS_FINE:     EQU	1Bh	; V9958 R#27: 0..7 dot fine adjustment (screen shifts right)
V9958_R25_MSK:           EQU	02h	; R#25 value: single-page wrap with masked 8-dot left border column
HS_MODULE_BASE:          EQU	0040h	; Page-0 RAM load address of the horizontal-scroll module
HSF_READY_BIT:           EQU	00h	; HS_FLAGS: Page-0 module installed on MSX2+/turbo R and enabled in boot menu
HSF_ACTIVE_BIT:          EQU	01h	; HS_FLAGS: camera live on the current normal route
HSF_READY:               EQU	01h	; HS_FLAGS mask for HSF_READY_BIT
HS_FIRST_BOSS_SELECTOR:  EQU	12h	; SPRITE_SET_SELECTOR >= 12h are boss arenas (no horizontal camera)
HS_DEAD_ZONE_LEFT:       EQU	78h	; Camera follows when GAO_POS_X < 78h
HS_DEAD_ZONE_RIGHT:      EQU	89h	; Camera follows when GAO_POS_X >= 89h
HS_MAX_CAMERA_STEPS:     EQU	04h	; Maximum 1-pixel camera steps per gameplay tick; tile-boundary cap may shorten this
HS_WORLD_COLUMNS:        EQU	60h	; Three 32-column routes form a 96-column (768 px) cylinder
HS_ROUTE_COLUMNS:        EQU	20h	; 8x8 tile columns per route (and per VRAM page / tile buffer row)
HS_NORMAL_STRIP_TOP:     EQU	2Fh	; NORMAL_ROUTE_STRIP_SELECTOR_STREAM maps row r to strip 2Fh - (r >> 2)
HS_ROUTE_ROWS:           EQU	00C0h	; Rows per normal route (the vertical tower wraps at C0h)

; Konami companion-cartridge signature and hook addresses
KK2_CART_INIT_PTR_ADDR:    EQU	4002h	; King Kong 2 MSX cartridge INIT vector address
COMPANION_SIG_KK2_ADDR:    EQU	4010h	; King Kong 2 Game Master header signature address
KK2_ROM_PREPARE_VDP_ADDR:  EQU	41E2h	; King Kong 2 page-1 ROM helper called from F26Eh before slot swap
COMPANION_SIG_PAGE1_END:   EQU	7FFAh	; Konami companion signature address at end of page 1
COMPANION_SIG_PAGE2_END:   EQU	BFFAh	; Konami companion signature address at end of page 2
KK2_HTIMI_HOOK_RAM_ADDR:   EQU	F220h	; Resident RAM base address for King Kong 2 H.TIMI hook

; Major MainState IDs dispatched through MAIN_STATE_DISPATCH_TABLE
MAIN_STATE_BOOT_LOGO:       EQU	00h	; Publisher/Konami boot fade-in
MAIN_STATE_TITLE_INIT:      EQU	01h	; Title Firebird phase transition
MAIN_STATE_TITLE_IDLE:      EQU	02h	; Title screen input & attract-mode wait
MAIN_STATE_START_BLINK:     EQU	03h	; PUSH SPACE KEY blink & start fanfare
MAIN_STATE_STAGE_INTRO:     EQU	04h	; Stage intro card & lives/map setup
MAIN_STATE_GAMEPLAY:        EQU	05h	; Active gameplay frame
MAIN_STATE_PLAYER_DEATH:    EQU	06h	; Gao death & life decrement
MAIN_STATE_GAME_OVER:       EQU	07h	; Game Over / F5 Continue screen
MAIN_STATE_EXTRA_LIFE:      EQU	08h	; 1-UP / stage retry transition
MAIN_STATE_COMPANION_MENU:  EQU	09h	; Konami companion-cartridge debug/cheat menu
MAIN_STATE_PAUSE_PASSWORD:  EQU	0Ah	; F1 Pause & Bank 06 Password subscreen
MAIN_STATE_DEFERRED_CB:     EQU	0Bh	; Deferred callback execution state
MAIN_STATE_ENDING_DEMO:     EQU	0Ch	; Bank 06 Ending Demo & credits sequence
MAIN_STATE_POWER_UP:        EQU	0Dh	; Bank 09 F2 POWER UP weapon shop
MAIN_STATE_STAGE_MAP:       EQU	0Eh	; Bank 02 F4 Stage Map viewer
MAIN_STATE_COMPASS_MAP:     EQU	0Fh	; Bank 02 F5 Compass / Era warp screen
MAIN_STATE_NOOP:            EQU	10h	; Unused no-op state
MAIN_STATE_ITEM_INFO:       EQU	11h	; Bank 06 F3 ITEM INFORMATION inventory screen
MAIN_STATE_BIRD_MESSAGE:    EQU	12h	; Bank 06 Bird / stone-tablet message box

BIOS_CHGCPU:                  EQU	0180h	; turbo R CPU-mode switch (BIOS version 03h only)
EXPERT_TURBO_BIOS_SIGNATURE:  EQU	1393h	; Expert IN A,(B6h) signature checked by boot turbo probe

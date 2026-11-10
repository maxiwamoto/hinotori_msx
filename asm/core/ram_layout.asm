; Work RAM (C000h-F2FFh) and MSX BIOS system workspace (F3DBh-FFF6h) layout

; Sound driver channel states & BGM backup workspace (C000h-C0FFh)
SND_UNUSED_C000:          EQU	C000h	; Start of work RAM zeroed during boot clear (C000h..F0EFh)
SND_UNUSED_C001:          EQU	C001h	; LDIR destination for boot work-RAM zero fill
SND_CH0_REC:              EQU	C010h	; Sound driver Channel 0 record (PSG Ch A, 20h bytes)
SND_CH0_SOUND_ID:         EQU	C012h	; Active Sound ID on Channel 0 (polled for blocking jingles/SFX)
KK2_SND_CHA_PTR:          EQU	C01Ah	; King Kong 2 PSG Ch A stream pointer reset after tape LOAD
KK2_SND_CHA_STATE:        EQU	C023h	; King Kong 2 PSG Ch A state byte set to 01h after tape LOAD
KK2_SND_CHB_PTR:          EQU	C02Eh	; King Kong 2 PSG Ch B stream pointer reset after tape LOAD
SND_CH1_REC:              EQU	C030h	; Sound driver Channel 1 record (PSG Ch B, 20h bytes)
SND_CH1_SOUND_ID:         EQU	C032h	; Active Sound ID on Channel 1
KK2_SND_CHB_STATE:        EQU	C037h	; King Kong 2 PSG Ch B state byte set to 01h after tape LOAD
KK2_SERIAL_C038:          EQU	C038h	; King Kong 2 sound/system block serialized to cassette
KK2_SND_CHC_PTR:          EQU	C042h	; King Kong 2 PSG Ch C stream pointer reset after tape LOAD
KK2_SND_CHC_STATE:        EQU	C04Bh	; King Kong 2 PSG Ch C state byte set to 01h after tape LOAD
SND_CH2_REC:              EQU	C050h	; Sound driver Channel 2 record (PSG Ch C music, 20h bytes)
SND_CH2_SOUND_ID:         EQU	C052h	; Active Sound ID on Channel 2 (>= 52h locks out Ch3 SFX)
SND_CH3_SFX_REC:          EQU	C070h	; Sound driver Channel 3 SFX overlay record (PSG Ch C, 20h bytes)
SND_CH3_SOUND_ID:         EQU	C072h	; Active SFX Sound ID on Channel 3 (preempts Ch2 while nonzero)
SND_SAVED_CH0_REC:        EQU	C090h	; Suspended BGM Channel 0 backup record (20h bytes)
SND_SAVED_CH0_ID:         EQU	C092h	; Suspended BGM Channel 0 Sound ID
KK2_SILENT_STREAM_BYTE:   EQU	C098h	; King Kong 2 silent stream FFh byte pointed to after tape LOAD
SND_SAVED_CH1_REC:        EQU	C0B0h	; Suspended BGM Channel 1 backup record (20h bytes)
SND_SAVED_CH1_ID:         EQU	C0B2h	; Suspended BGM Channel 1 Sound ID
SND_SAVED_CH2_REC:        EQU	C0D0h	; Suspended BGM Channel 2 backup record (20h bytes)
SND_SAVED_CH2_ID:         EQU	C0D2h	; Suspended BGM Channel 2 Sound ID
SND_PSG_MIXER_SHADOW:     EQU	C0F0h	; PSG R#7 mixer shadow written every VBlank
SND_BGM_RESTORE_REQ:      EQU	C0F1h	; Set to 01h to restore suspended BGM from C090h..C0EFh
SND_BGM_SAVED_LOCK:       EQU	C0F2h	; Nonzero while active BGM is saved in C090h..C0EFh
SND_FORCE_PSG_REFRESH:    EQU	C0F3h	; Forces restored BGM channels to refresh PSG registers
SND_FADEOUT_TARGET_ID:    EQU	C0F4h	; Post-fade Sound ID queued for 9-step BGM fade-out
SND_FADEOUT_FRAME_CNT:    EQU	C0F5h	; 16-VBlank sub-timer per BGM fade-out attenuation step
SND_FADEOUT_ATTEN:        EQU	C0F6h	; Current BGM fade-out volume subtraction (00h..08h)
SND_BGM_MUTE_FLAG:        EQU	C0F7h	; Suppresses MML music PSG writes when nonzero
SND_UNUSED_C0F8:          EQU	C0F8h	; Unused in Main/A1; Enhanced reuses C0F8h..C0FBh below
SUBSCREEN_TILE_Y_OFFSET:  EQU	C0F8h	; Enhanced: VRAM Y row offset (00h/30h/48h) added in BLIT_FONT_GLYPH_TO_VRAM_XY
SUBSCREEN_TILE_LMMM_OP:   EQU	C0F9h	; Enhanced: LMMM page+op byte (48h=Page 1, 88h=Page 2) for BLIT_FONT_GLYPH_TO_VRAM_XY
CACHED_STAGE_TILESET_ID:  EQU	C0FAh	; Enhanced: Normal stage LEVEL_INDEX (00h..05h) cached in VRAM Page 3 Y=00h..3Fh
LANGUAGE_MODE_FLAG:       EQU	C0FBh	; Enhanced: Active language mode (00h = Japanese, 01h = English)

; Main state machine, VBlank flags, input latches & player lives/score (C100h-C1FFh)
MAIN_STATE:                 EQU	C100h	; Major per-frame game state index (00h..12h)
MAIN_SUBSTATE:              EQU	C101h	; Secondary substate index consumed by DJNZ ladders
MAIN_CONTROL_FLAGS:         EQU	C102h	; Global mode flags (bit 0 = attract demo, bit 6 = mute SFX)
GAME_TICK_COUNTER:          EQU	C103h	; Incremented once per main-frame dispatch
MAIN_STATE_TIMER:           EQU	C104h	; General state countdown timer
MAIN_FRAME_BUSY:            EQU	C105h	; Re-entrancy guard around per-frame main dispatch
PRESSED_INPUT_BITS:         EQU	C106h	; Newly pressed joystick / cursor & trigger bits
CURRENT_INPUT_BITS:         EQU	C107h	; Held joystick / cursor & trigger bits
PRESSED_KEY_ROW6_BITS:      EQU	C108h	; Newly pressed keyboard row-6 bits (F1..F3, SHIFT/CTRL/GRAPH)
CURRENT_KEY_ROW6_BITS:      EQU	C109h	; Held keyboard row-6 bits
DISPLAY_RESET_LATCH:        EQU	C10Ah	; Cleared during display/sprite reset
ATTRACT_DEMO_INDEX:         EQU	C10Bh	; Current attract-mode recorded demo index (0..2)
CURRENT_PAGE3_BANK:         EQU	C10Ch	; Active ROM bank mapped at CPU A000h-BFFFh
ATTRACT_DEMO_STREAM_PTR:    EQU	C10Dh	; 16-bit read cursor into attract-mode recorded input stream
ATTRACT_OR_ENDING_TIMER:    EQU	C10Eh	; Attract-demo input duration / Ending Demo state timer
SPRITE_PAIR_ROT_OFFSET:     EQU	C10Fh	; SAT byte offset stepped by 68h for sprite-pair priority rotation
COMPANION_CART_TYPE:        EQU	C110h	; Detected Konami companion cartridge ID (00h = none)
COMBINATION_INPUT_STATE:    EQU	C111h	; Companion-cartridge hotkey latch in H.TIMI
CHEAT_MENU_VRAM_COORD:      EQU	C112h	; Packed (X, Y) coordinate for companion cheat-menu value redraw
CHEAT_MENU_APPLY_REQ:       EQU	C114h	; Nonzero when companion cheat menu selections should be applied
CHEAT_STAGE_SELECT_BCD:     EQU	C115h	; Selected stage number in companion cheat menu
CHEAT_STAGE_INDEX:          EQU	C116h	; Zero-based stage index selected in companion cheat menu
CHEAT_PLAYER_LIVES_BCD:     EQU	C117h	; Selected player lives count in companion cheat menu
CHEAT_MENU_HELD_KEYS:       EQU	C118h	; Held input latch for companion cheat menu
CHEAT_MENU_CLEAR_DEST:      EQU	C119h	; LDIR clear destination for companion cheat menu work bytes
CHEAT_MENU_ROW_KEYS:        EQU	C11Ah	; Secondary key latch (also KK2 post-load flag 1)
CHEAT_MENU_CURSOR_ROW:      EQU	C11Bh	; Active row index (0..2) in companion cheat menu
CHEAT_MENU_DIGIT_BUF:       EQU	C11Eh	; Scratch digit byte for companion cheat menu
CHEAT_MENU_BCD_WORK:        EQU	C11Fh	; RLD/nibble scratch byte for companion cheat menu
COMBINATION_HOTKEY_BITS:    EQU	C120h	; Held F4/F5 combination hotkey bits
SAVED_PSG_VOL_A:            EQU	C121h	; Saved PSG R#8 volume while muted
SAVED_PSG_VOL_B:            EQU	C122h	; Saved PSG R#9 volume while muted
SAVED_PSG_VOL_C:            EQU	C123h	; Saved PSG R#10 volume while muted
PRESSED_KEY_ROW7_BITS:      EQU	C124h	; Newly pressed keyboard row-7 bits (F4, F5, ESC, STOP, RETURN)
CURRENT_KEY_ROW7_BITS:      EQU	C125h	; Held keyboard row-7 bits
VBLANK_TICK_DIVIDER:        EQU	C130h	; Two-VBlank gameplay divider (30 Hz at 60 Hz video, 25 Hz at 50 Hz)
HIDDEN_SAT_VRAM_ADDR:       EQU	C132h	; VRAM address (F200h or F600h) of back-buffer SAT
KK2_BUSY_SUBSTATE_FLAG:     EQU	C133h	; King Kong 2 busy flag checked == 0 before F4/F5 tape UI
HIDDEN_COL_VRAM_ADDR:       EQU	C134h	; VRAM address (F000h or F400h) of back-buffer sprite colors
PASSWORD_SUBSTATE:          EQU	C137h	; Password screen substate index (0..5)
SPRITE_SET_BANK_PARAM:      EQU	C138h	; Active sprite/graphics bank parameter
IRQ_REENTRY_GUARD:          EQU	C139h	; Nonzero while H.TIMI interrupt body is executing
SOUND_MUTE_TOGGLE_LATCH:    EQU	C13Ah	; STOP/mute audio toggle latch
ATTRACT_WAIT_HIGH_CNT:      EQU	C13Bh	; Attract-demo countdown high byte (also KK2 post-load flag 2)
ATTRACT_DEMO_STOP_FLAG:     EQU	C13Ch	; Set to 01h when attract-mode demo ends or user presses key
KK2_POST_LOAD_MASK:         EQU	C148h	; King Kong 2 post-load state latch set to FFh on tape exit
PAUSE_KEY_LATCH:            EQU	C151h	; F1 / pause key edge-detection state byte
PLAYER_SCORE_LOW:           EQU	C155h	; Player score / gameplay RAM clear start (3-byte BCD score block)
PASSWORD_RESET_START:       EQU	C158h	; Start of gameplay state cleared when applying password
NEXT_EXTRALIFE_STEP:        EQU	C15Ah	; Score milestone counter for awarding bonus lives
PLAYER_SCORE_POINTS_BIN:    EQU	C15Bh	; 16-bit accumulated binary score points toward next 1000/1-UP
PLAYER_LIVES_BCD:           EQU	C160h	; Gao remaining lives in packed BCD (GM2 parameter @ C160h)
CURRENT_STAGE_DISPLAY_BCD:  EQU	C161h	; 1-based stage display number in BCD (GM2 parameter @ C161h)
GAME_ACTIVE_SESSION_FLAG:   EQU	C163h	; Nonzero during active or title-ready game session
CONTINUE_USED_WORD:         EQU	C170h	; Cleared on player death / continue state transition
DIFFICULTY_RANK_COUNTER:    EQU	C172h	; Dynamic difficulty / stage progression rank (0..10)

; Overlay, pause, attract-mode & deferred callback latches (C200h-C2FFh)
CALLBACK_DELAY_TIMER:    EQU	C200h	; Frame countdown before invoking DEFERRED_CALLBACK_PTR
CALLBACK_SUBTIMER:       EQU	C201h	; Secondary timer byte (also KK2 pause/overlay flag)
DEFERRED_CALLBACK_PTR:   EQU	C202h	; 16-bit routine pointer invoked by MAIN_STATE_DEFERRED_CB
SKIP_SUBSTATE_DISPATCH:  EQU	C203h	; Suppresses normal main-state dispatch for one tick when nonzero
SCROLL_FREEZE_FLAGS:     EQU	C204h	; Nonzero halts vertical map scrolling and Gao idle step animation during popups/time-stop
POWER_UP_BLOCKED_FLAG:   EQU	C205h	; Cancels F1/F2 subscreen entry when nonzero

; Level map streaming, scroll position & viewport control (C300h-C3FFh)
LEVEL_STRIP_STREAM_BASE:  EQU	C300h	; 16-bit base pointer to current route strip stream in Bank 12
LEVEL_ROUTE_ROW:          EQU	C302h	; 16-bit current logical row index within route
LEVEL_METATILE_DICT_PTR:  EQU	C304h	; 16-bit base pointer to stage 4x4 metatile dictionary in Bank 10
LEVEL_ROUTE_DEF_PTR:      EQU	C306h	; 16-bit base pointer to route window definition in Bank 10/11
KK2_PLAYER_HEALTH:        EQU	C307h	; King Kong 2 player health clamped >= 04h after tape LOAD
LEVEL_METATILE_ROW_BASE:  EQU	C308h	; 16-bit metatile dictionary base plus selected 4-byte row offset (decode scratch)
LEVEL_TILE_WRITE_CURSOR:  EQU	C30Ch	; 16-bit row write cursor in circular LEVEL_TILE_BUFFER (E000h..E3FFh)
KK2_PLAYER_MAX_STAT:      EQU	C321h	; King Kong 2 stat clamped <= 80h after tape LOAD
KK2_TRANSITION_CLEAR:     EQU	C325h	; King Kong 2 transition byte cleared on tape exit
SCROLL_STREAM_PHASE:      EQU	C380h	; Incremental tile-row streaming phase counter
LAST_STREAMED_ROW_BAND:   EQU	C381h	; Previously streamed scroll row band
SCROLL_DELTA_ACCUM:       EQU	C382h	; 16-bit scroll delta accumulator
WORLD_SCROLL_POS:         EQU	C384h	; 16-bit vertical world scroll position (low byte)
VERTICAL_SCROLL_OFFSET:   EQU	C385h	; Hardware vertical scroll offset written to VDP R#23
VERTICAL_SCROLL_DELTA:    EQU	C388h	; Signed per-frame vertical scroll pixel step
SCROLL_DIRECTION_MODE:    EQU	C389h	; Current vertical scroll direction / lock state
SCROLL_BOUNDARY_FLAG:     EQU	C38Ch	; Scroll stop / boundary reached flag
STREAM_VRAM_ROW_PTR:      EQU	C390h	; 16-bit VRAM destination row pointer for background streaming
STREAM_RENDER_FLAGS:      EQU	C392h	; Bit 0 selects background row render path

; Stage/route selectors, sprite slot budget, cheats & subscreen state (C400h-C4FFh)
BROKEN_BUSH_REPLACE_TILE:    EQU	C440h	; Replacement map tile ID (00h) written when weapon destroys a 51h/61h bush or block
UNUSED_ATTR60_TILE_ID:       EQU	C441h	; Written only by disabled Bank 01 UNUSED_PATCH_STAGE_TILE_ATTRS for attr 60h
BROKEN_TILE50_REPLACE_TILE:  EQU	C442h	; Replacement map tile ID (00h) written when weapon destroys a 50h destructible tile
UNUSED_ATTR05_TILE_ID:       EQU	C443h	; Written only by disabled Bank 01 UNUSED_PATCH_STAGE_TILE_ATTRS for attr 05h
UNUSED_ATTR40_TILE_ID:       EQU	C444h	; Written only by disabled Bank 01 UNUSED_PATCH_STAGE_TILE_ATTRS for attr 40h
UNUSED_ATTR61_TILE_ID:       EQU	C445h	; Written only by disabled Bank 01 UNUSED_PATCH_STAGE_TILE_ATTRS for attr 61h
UNUSED_ATTR00_DUP_TILE_ID:   EQU	C446h	; Unreachable duplicate attr-00h slot in disabled UNUSED_PATCH_STAGE_TILE_ATTRS
SPRITE_SET_SELECTOR:         EQU	C480h	; Active route/arena graphics & spawn-stream selector (0..24)
LEVEL_NUMBER:                EQU	C481h	; 1-based stage number (1..6)
LEVEL_INDEX:                 EQU	C482h	; 0-based stage/tileset index (0..7)
ROUTE_INDEX:                 EQU	C483h	; 0-based route/era lane index (0..2 normal, 3 boss)
MAP_RELOAD_AND_PWD_FLAG:     EQU	C485h	; Bit 7 triggers stage map/graphics reload & marks valid password
CURRENT_ROUTE_ID:            EQU	C486h	; Combined route/arena ID (0..17 normal, 18..23 boss, 24 empty)
INITIAL_ROUTE_ROW:           EQU	C487h	; 16-bit starting route row copied to LEVEL_ROUTE_ROW
RESPAWN_GAO_Y:               EQU	C489h	; Checkpoint / password / wrap respawn Gao Y coordinate
RESPAWN_GAO_X:               EQU	C48Ah	; Checkpoint / password / wrap respawn Gao X coordinate
RESPAWN_GAO_DIR:             EQU	C48Bh	; Checkpoint / saved Gao facing direction
STAGE_TRANSITION_WORK:       EQU	C48Ch	; 6-byte stage transition / warp scratch area
SAVED_ROUTE_STATE_BLOCK:     EQU	C498h	; 7-byte saved route/respawn state snapshot (C498h..C49Eh)
SAVED_ROUTE_ID_SNAP:         EQU	C499h	; Saved CURRENT_ROUTE_ID in snapshot block
SAVED_ROUTE_ROW_SNAP:        EQU	C49Ah	; 16-bit saved INITIAL_ROUTE_ROW in snapshot block
SAVED_GAO_Y_SNAP:            EQU	C49Ch	; Saved Gao Y in snapshot block
SAVED_GAO_X_SNAP:            EQU	C49Dh	; Saved Gao X in snapshot block
SAVED_GAO_DIR_SNAP:          EQU	C49Eh	; Saved Gao facing direction in snapshot block
CHECKPOINT_GAO_X:            EQU	C49Fh	; Active warp/checkpoint Gao X coordinate
CHECKPOINT_GAO_Y:            EQU	C4A0h	; Active warp/checkpoint Gao Y coordinate
CHECKPOINT_ROUTE_ROW:        EQU	C4A1h	; 16-bit active warp/checkpoint route row
CHECKPOINT_ROUTE_ID:         EQU	C4A3h	; Active warp/checkpoint route ID
CHECKPOINT_LEVEL_NUM:        EQU	C4A4h	; Active warp/checkpoint level number
DYNAMIC_SPRITE_SLOT_CNT:     EQU	C4A8h	; Dynamic SAT slot count from slot 10 (16 normal, 20 ending)
AUX_SPRITE_SLOT_CNT:         EQU	C4A9h	; Auxiliary SAT slot count
COLLECTED_PIECE_FLAGS:       EQU	C4AAh	; 5-bit sculpture-piece / boss completion bitmask
BOSS_DROP_COLLECT_CNT:       EQU	C4ABh	; Boss reward / piece pickup counter
FRAME_COUNTER:               EQU	C4B0h	; Free-running gameplay/demo frame counter
GFX_UNPACK_VRAM_PAGE_HI:     EQU	C4B2h	; Target VRAM high byte (00h/40h/80h/A0h/C0h/C8h) for descriptor loader
PASSWORD_EDIT_CURSOR_PTR:    EQU	C4B4h	; 16-bit cursor into editable PASSWORD_INPUT_BUFFER (E982h)
MSG_BOX_ORIGIN_X:            EQU	C4B6h	; Bird/tablet message interior left tile column
MSG_BOX_WIDTH:               EQU	C4B7h	; Bird/tablet message interior width in tiles
MSG_BOX_ORIGIN_Y:            EQU	C4B8h	; Bird/tablet message interior top tile row
MSG_BOX_HEIGHT:              EQU	C4B9h	; Bird/tablet message interior height in tiles
MSG_TYPEWRITER_STEP:         EQU	C4BBh	; 16-bit typewriter character reveal target for bird messages
GAMEPLAY_MSG_SELECTOR:       EQU	C4BDh	; Selected index (0..47) in 6x8 bird/tablet message matrix
FORCE_SPRITE_COL_REFRESH:    EQU	C4BEh	; 2-frame countdown forcing rebuild of dynamic sprite line colors
PRNG_MIX_BYTE:               EQU	C4BFh	; 8-bit feedback byte mixed by pseudo-random generator (987Fh)
PRNG_STATE_WORD:             EQU	C4C0h	; 16-bit LFSR/state word updated by pseudo-random generator (987Fh)
SPRITE_COL_PATCH_COUNT:      EQU	C4C2h	; Pending CPU sprite color line patch count
SPRITE_COL_PATCH_ADDR:       EQU	C4C3h	; 16-bit destination pointer for sprite color patch
SPRITE_COL_PATCH_HI:         EQU	C4C4h	; High byte / color word of sprite color patch request
SPRITE_COL_PATCH_VALUE:      EQU	C4C5h	; Color byte written by pending sprite color patch
LAST_HIT_ENEMY_TYPE:         EQU	C4C7h	; Object type ID of enemy most recently struck by player shot
POST_WRAP_GRACE_TIMER:       EQU	C4C8h	; Post-wrap gameplay-tick timer (01h..0Fh; nominal 0.5s at 60 Hz video) for cut Stage 2 Enemy 16 back-and-forth ambush
HORIZ_WRAP_PENDING_FLAG:     EQU	C4C9h	; Set to 01h on horizontal screen-edge wrap; cleared on first frame of destination route
SPAWN_TRAP_GRACE_TIMER:      EQU	C4D0h	; 2-frame stage-entry countdown suppressing warp gates/traps near Gao's spawn point
DEBUG_CHEAT_MASTER_FLAG:     EQU	C4D1h	; Developer cheat mode enabled by hidden 'aaaaa' password
POWER_UP_CURSOR_INDEX:       EQU	C4D2h	; 1-based cursor index (1..7) on F2 POWER UP screen
SUBSCREEN_ACTIVE_MODE:       EQU	C4D8h	; Current subscreen overlay mode selector
PENDING_STATE_AFTER_PWD:     EQU	C4DAh	; 16-bit MainState/Substate restored when closing Password screen
ATTRACT_POPUP_INDEX:         EQU	C4DBh	; Current tutorial popup record index during attract demo
SECRET_PWD_APPLIED_FLAG:     EQU	C4DCh	; Nonzero when a secret cheat password matched
CHEAT_INFINITE_LIVES:        EQU	C4E0h	; Set to 01h by NANDANANDANANDA secret password
CHEAT_AUTO_FIRE:             EQU	C4E1h	; Set to 01h by AUTOSHOT secret password
CHEAT_INVINCIBILITY:         EQU	C4E2h	; Set to 01h by ILOVEHINOTORI secret password
CHEAT_FEATHERS_X10:          EQU	C4E3h	; Set to 01h by HANEYOKAGAYAKE secret password

; Palette fade buffers & King Kong 2 event shadow (C500h-C5FFh)
TILE_COLOR_NIBBLE_LUT:     EQU	C500h	; 8-byte unpacked color-nibble lookup table for 1bpp/2bpp/3bpp tiles
FADE_CURRENT_PALETTE:      EQU	C510h	; 32-byte working V9938 palette buffer stepped during fades
FADE_TARGET_PALETTE:       EQU	C530h	; 32-byte target V9938 palette buffer for fade-in
FADE_STEP_COUNTER:         EQU	C550h	; Remaining palette fade step counter
KK2_CUTSCENE_ACTIVE_FLAG:  EQU	C560h	; King Kong 2 event flag checked == 0 before F4/F5 tape UI
SCREEN_WIPE_ITEM_REQ:      EQU	C580h	; Set to 01h when screen-wipe item (slot 1) is collected; latched into SCREEN_WIPE_ACTIVE_FLAG
GAMEPLAY_EVENT_FLAGS:      EQU	C581h	; Bitmask of active stage/boss/popup scroll-lock flags

; Tile attribute lookup & password decode workspace (C600h-C7FFh)
PASSWORD_DECODE_WORK_BUF:  EQU	C600h	; Work area cleared before decoding a password

; Gao player physics, weapon state & 41-slot item/stone inventory (C800h-C8FFh)
GAO_MODE:                    EQU	C800h	; Major Gao player state (walk/jump/climb/hurt/dead)
GAO_SUBMODE:                 EQU	C801h	; Secondary Gao action phase
GAO_ACTION_TIMER:            EQU	C803h	; Gao jump / knockback / action frame timer
GAO_STEP_PHASE:              EQU	C804h	; Gao walk / climb cycle index
GAO_POS_X_FRAC:              EQU	C808h	; 16-bit Gao X position fractional low byte (C808h..C809h)
GAO_POS_X:                   EQU	C809h	; Gao X world/screen pixel coordinate (high byte of C808h)
GAO_POS_Y_FRAC:              EQU	C80Ah	; 16-bit Gao Y position fractional low byte (C80Ah..C80Bh)
GAO_POS_Y:                   EQU	C80Bh	; Gao Y screen pixel coordinate (high byte of C80Ah)
GAO_FACING_WORD:             EQU	C80Ch	; Gao horizontal facing / motion state low byte
GAO_FACING_DIR:              EQU	C80Dh	; Gao facing direction (0=right, 1=left)
GAO_VEL_X:                   EQU	C810h	; 16-bit signed 8.8 Gao horizontal velocity
GAO_VEL_Y_BASE:              EQU	C812h	; 16-bit signed 8.8 Gao base vertical velocity
GAO_GRAVITY_VEL_Y:           EQU	C814h	; 16-bit signed 8.8 Gao jump/fall vertical velocity
GAO_ANIM_TIMER:              EQU	C818h	; Countdown until next Gao animation frame
GAO_ANIM_FRAME_IDX:          EQU	C81Ah	; Current frame index within Gao animation sequence
GAO_SPRITE_LAYOUT_ID:        EQU	C81Ch	; Encoded Gao 4-sprite SAT layout selector
GAO_RENDER_X:                EQU	C820h	; Derived Gao display X coordinate for SAT slots 6..9
GAO_RENDER_Y:                EQU	C821h	; Derived Gao display Y coordinate for SAT slots 6..9
GAO_GROUND_STATE:            EQU	C822h	; Gao grounded / platform contact flag
GAO_AUX_RENDER_X:            EQU	C824h	; Display X coordinate for optional Gao SAT slot 31
GAO_AUX_RENDER_Y:            EQU	C825h	; Display Y coordinate for optional Gao SAT slot 31
GAO_PREV_POS_Y:              EQU	C826h	; Saved 16-bit Gao Y coordinate before collision check
GAO_PREV_POS_Y_HI:           EQU	C827h	; High byte of saved Gao Y coordinate
GAO_PREV_POS_X:              EQU	C828h	; Saved 16-bit Gao X coordinate before collision check
GAO_PREV_POS_X_HI:           EQU	C829h	; High byte of saved Gao X coordinate
GAO_HEAD_TILE_ATTR:          EQU	C82Bh	; Tile collision attribute sampled at Gao head
GAO_BLANK_COLOR_FLAG:        EQU	C82Ch	; Overrides Gao sprite colors with transparent/blank palette rows (invisibility blink)
GAO_SURFACE_FLAGS:           EQU	C82Eh	; Bitfield of surrounding solid/ladder/hazard tile contacts
GAO_CARRY_DX:                EQU	C830h	; 16-bit X displacement imparted by moving platform
GAO_CARRY_DY:                EQU	C832h	; 16-bit Y displacement imparted by moving platform
GAO_LETHAL_HIT_ACCUM:        EQU	C834h	; Signed player hit accumulator (00h normal, decremented < 0 on lethal hit, 7Fh when invincible)
GAO_SPECIAL_POSE_TIMER:      EQU	C836h	; Countdown for item-pickup / warp special Gao pose
GAO_FALL_DISTANCE_CNT:       EQU	C837h	; Accumulated fall / stun state byte
GAO_WEAPON_FORM:             EQU	C840h	; Current equipped weapon / Gao form (01h..06h)
GAO_SHOT_COOLDOWN:           EQU	C841h	; Cooldown frames before next weapon shot
MAX_CONCURRENT_SHOTS:        EQU	C842h	; Maximum simultaneous player projectiles allowed
GAO_WEAPON_POWER:            EQU	C843h	; Base weapon power / upgrade level
GAO_ATTACK_ANIM_FLAG:        EQU	C844h	; Nonzero while Gao attack swing/throw pose is active
FEATHER_ORB_COUNT:           EQU	C845h	; Collected feather/orb currency count (0..200)
BLOCK_PLACEMENT_LOCK:        EQU	C847h	; Prevents overlapping stone-block placement
GAO_ATTACK_POSE_PHASE:       EQU	C848h	; Attack pose sub-phase index
GAO_SOLID_FLASH_FLAG:        EQU	C849h	; Overrides Gao sprite colors with solid flash template (invincible body-ram aura blink)
GAO_SPRITE_PART_COUNT:       EQU	C84Ah	; Number of logical sprite parts in current Gao pose
GAO_KNOCKBACK_DIR:           EQU	C84Bh	; Horizontal knockback direction when hurt
INVENTORY_SLOTS_BASE:        EQU	C850h	; Base of 41 x 4-byte inventory slots (slot 0 / Item 01h: Straw Sandals speed 0..3)
INVENTORY_CLEAR_DEST:        EQU	C851h	; LDIR destination for initializing inventory slots
INV_MAPLE_LEAF_SLOT:         EQU	C854h	; Slot 1 (Item 02h): Maple Leaf instant screen-wipe trigger slot
SCREEN_WIPE_ACTIVE_FLAG:     EQU	C857h	; Latched for 1 frame from SCREEN_WIPE_ITEM_REQ to launch all active on-screen enemies
INV_INVISIBILITY_TIMER:      EQU	C858h	; Slot 2 (Item 03h): Medicine Jar timed invisibility counter (0Dh x 32 frames)
INV_RAPID_FIRE_SLOT:         EQU	C85Ch	; Slot 3 (Item 04h): Ladybug rapid-fire shot upgrade level (0..3)
INV_INVINCIBLE_AURA_TIMER:   EQU	C860h	; Slot 4 (Item 05h): Gourd timed invincible body-ram aura counter (0Dh x 32 frames)
INV_REIBOKU_BASE_SLOT:       EQU	C864h	; Slot 5 (Item 06h): Reiboku base icon / +10 feather drop placeholder (cap C8h)
INV_TURTLE_SHELL_SLOT:       EQU	C868h	; Slot 6 (Item 07h): UNUSED Turtle Shell shield item (glyph 26h, cap 03h, timed buff handler, 0 spawns/reads)
INV_BLOCK_BASE_SLOT:         EQU	C86Ch	; Slot 7 (Item 08h): Block tile icon / +1 feather drop placeholder (cap C8h)
INV_STORAGE_BOX_SLOT:        EQU	C870h	; Slot 8 (Item 09h): Stone-block storage box count (cap 05h)
INV_STAGE_MAP_SLOT:          EQU	C874h	; Slot 9 (Item 0Ah): F4 Stage Map scroll count (cap 06h)
INV_STAGE_MAP_MASK:          EQU	C875h	; 6-bit per-level ownership bitmask for F4 Stage Maps
INV_COMPASS_COUNT_SLOT:      EQU	C878h	; Slot 10 (Item 0Bh): F5 Era Map piece scroll count (cap 06h)
INV_COMPASS_SECTOR_MASK:     EQU	C879h	; 6-bit unlocked era/sector bitmask for F5 Compass
INV_HEART_ORB_BASE_SLOT:     EQU	C87Ch	; Slot 11 (Item 0Ch): Heart Orb base icon & unused standalone orb buff slot (cap 01h, cleared on route/death reset)
INV_TIME_STOP_TIMER:         EQU	C880h	; Slot 12 (Item 0Dh): Hourglass 90-tick time-stop / scroll-freeze timer (plays fanfare 4Ch)
INV_INFINITE_COMPASS_SLOT:   EQU	C884h	; Slot 13 (Item 0Eh): Compass warp item flag (cap 01h; enables F5 era warp)
COMPASS_CURSOR_SECTOR:       EQU	C887h	; Selected destination sector (1..6) on F5 Compass screen
INV_UNUSED_GAP_SLOT_14:      EQU	C888h	; Slot 14 (Item 0Fh): Unused hex-alignment gap before Item 10h composite kanji tablets
INV_SQUARE_STONES_BASE:      EQU	C88Ch	; Slots 15..19 (Items 10h..14h): Group 1 Reiboku ('霊木') seal tablets for Stages 1..5
INV_STAGE6_STONE_GRP1:       EQU	C8A0h	; Slot 20 (Item 15h): Stage 6 Group 1 Reiboku seal tablet (packed as 1-bit flag in password)
INV_SQUARE_STONES_GRP2:      EQU	C8A4h	; Slots 21..25 (Items 16h..1Ah): Group 2 Reiboku ('霊木') seal tablets for Stages 1..5
INV_STAGE6_STONE_GRP2:       EQU	C8B8h	; Slot 26 (Item 1Bh): Stage 6 Group 2 Reiboku seal tablet (also 1-based base for Group 3)
INV_SQUARE_STONES_GRP3:      EQU	C8BCh	; Slots 27..31 (Items 1Ch..20h): Group 3 boss-dropped Reiboku gate tablets (Stages 1..5)
INV_UNUSED_STONE_PAD_SLOTS:  EQU	C8D0h	; Slots 32..34 (Items 21h..23h): Unused 3-slot padding after Group 3 Reiboku tablets
INV_SUPERBALL_SLOTS_BASE:    EQU	C8DCh	; Slots 35..39 (Items 24h..28h): Five boss Heart Orbs ('こころのたま', 天空水明充)
INV_UNUSED_ORB_PAD_SLOT:     EQU	C8F0h	; Slot 40 (Item 29h): Unused 6th Heart Orb padding slot

; Tile collision class table (C900h-C9FFh)
TILE_COLLISION_ATTR_LUT:   EQU	C900h	; 256-byte tile index -> collision attribute lookup page
TILE_COLLISION_CLEAR_DST:  EQU	C901h	; LDIR destination for clearing TILE_COLLISION_ATTR_LUT

; Logical weapon/projectile sprite records (CA00h-CAFFh)
LOGICAL_SPRITE_OBJ_TABLE:  EQU	CA00h	; Six 20h-byte Gao weapon/shot records (also KK2 300h-byte save buf)
FREE_LOGICAL_OBJ_SLOTS:    EQU	CAD0h	; Available free slots (0..6) in LOGICAL_SPRITE_OBJ_TABLE

; Terrain-stream cursor & stage event work variables (CB00h-CCFFh)
TERRAIN_STREAM_ENABLE:     EQU	CB00h	; Terrain / platform stream active state byte
TERRAIN_STREAM_PTR:        EQU	CB02h	; 16-bit read pointer into Bank 09 terrain spawn stream
TERRAIN_SPAWN_ROW_NEXT:    EQU	CB04h	; Next route row trigger for terrain spawn stream
TERRAIN_SCROLL_PHASE:      EQU	CB06h	; Terrain object vertical scroll synchronization byte
TERRAIN_PARSE_WORK_WORD:   EQU	CB40h	; 2-byte scratch header while parsing terrain stream record
TERRAIN_PARSE_WORK_HI:     EQU	CB41h	; Second byte of TERRAIN_PARSE_WORK_WORD
TERRAIN_GATE_LOCK_FLAG:    EQU	CB44h	; Gate / bridge terrain state latch
UNUSED_SCREEN_SHAKE_FLAG:  EQU	CB49h	; Unreferenced VDP R#18 display-adjust shake state read only by dead Bank 00 helper 498Eh
UNUSED_SCREEN_SHAKE_STEP:  EQU	CB4Ah	; Unreferenced VDP R#18 display-adjust table index updated only by dead Bank 00 helper 498Eh
TERRAIN_LAST_SPAWN_SLOT:   EQU	CB4Ch	; Most recently allocated terrain object slot index
TERRAIN_AUX_STATE_BUF:     EQU	CB80h	; 24-byte terrain auxiliary work table (CB80h..CB97h)
TERRAIN_PERSIST_FLAGS:     EQU	CB97h	; 24-byte per-terrain defeated/collected flags
STAGE_SPAWN_TRACK_TABLE:   EQU	CC00h	; 16 x 10h-byte active enemy spawn-tracking records

; Bank 06 Ending Demo & credits state variables (CD00h-CDFFh)
ENDING_DEMO_STATE:        EQU	CD00h	; Primary Ending Demo state index (00h..11h)
ENDING_SUBSTATE:          EQU	CD01h	; Secondary substate for Firebird text fade & scrolling credits
ENDING_SCRIPT_TIMER:      EQU	CD10h	; 16-bit frame timer for ENDING_TIMED_SCENE_SCRIPT
ENDING_SCRIPT_INDEX:      EQU	CD12h	; Current step index (0..5) in ENDING_TIMED_SCENE_SCRIPT
ENDING_CREDITS_LINE_IDX:  EQU	CD80h	; 1-based credit line index for part 1 / part 2 tables
ENDING_FADE_DONE_FLAG:    EQU	CD81h	; Set to 01h when Ending Demo palette fade completes
ENDING_FADE_PHASE:        EQU	CD82h	; 00h = load palette & start fade, 01h = step fade
ENDING_FADE_MODE:         EQU	CD83h	; 00h = fade out to black, 01h = fade in to target
ENDING_SCROLL_STOP_FLAG:  EQU	CD84h	; Set to 01h when temple ascent reaches top threshold
ENDING_MESSAGE_INDEX:     EQU	CD85h	; 0-based Firebird dialogue page index (0..2)
ENDING_HOME_BONUS_SHOWN:  EQU	CD86h	; Prevents hidden HOME-key bonus message from re-triggering
ENDING_COLOR12_RGB_WORD:  EQU	CD87h	; 2-byte V9938 color 12 (RB, G) text fade work word
ENDING_COLOR12_FADE_CNT:  EQU	CD89h	; 7-step countdown for V9938 color 12 text fade

; Ending cutscene actor records (CE00h-CEFFh)
ENDING_ACTOR0_RECORD:    EQU	CE00h	; First 80h-byte ending cutscene actor kinematic record
ENDING_ACTOR1_RECORD:    EQU	CE80h	; Second 80h-byte ending cutscene actor kinematic record
ENDING_ACTOR1_VELOCITY:  EQU	CE87h	; 16-bit scroll velocity inside ENDING_ACTOR1_RECORD (+07h)
ENDING_ACTOR1_POS_MID:   EQU	CE98h	; Middle byte (+18h) of ENDING_ACTOR1_RECORD 24-bit position

; Per-type active object presence table (CF00h-CFFFh)
OBJECT_PRESENCE_TABLE:   EQU	CF00h	; 256-byte per-type object presence / sprite-load lookup table
OBJECT_TYPE16_PRESENCE:  EQU	CF16h	; Presence flag entry for special object type 16h

; Terrain object table: 8 x 80h-byte records (D000h-D3FFh)
TERRAIN_OBJECT_TABLE:  EQU	D000h	; Eight 80h-byte terrain/platform object records (D000h..D3FFh)
TERRAIN_OBJ0_PHASE:    EQU	D001h	; OBJ_PHASE byte (+01h) of TERRAIN_OBJECT_TABLE slot 0
TERRAIN_OBJ6_RECORD:   EQU	D300h	; Slot 6 base address inside TERRAIN_OBJECT_TABLE

; Boss / stage hazard & spawn control workspace (D400h-D6FFh)
BOSS_ENCOUNTER_ACTIVE:     EQU	D400h	; Nonzero during an active boss encounter
BOSS_STATE_PHASE:          EQU	D401h	; Current boss state-machine phase index
BOSS_COMPLETION_FLAG:      EQU	D402h	; Encounter completion latch: 01h on defeat or the Level 6 bird trigger; 00h while pending
BOSS_PHASE_TIMER:          EQU	D403h	; Boss state transition / defeat explosion timer
BOSS_ARENA_LOCK_FLAG:      EQU	D404h	; Arena scroll lock byte set upon entering boss room
BOSS_ORIGIN_COORD_WORD:    EQU	D405h	; 2-byte boss reference (X, Y) arena anchor
BOSS_ORIGIN_Y:             EQU	D406h	; High byte (Y) of BOSS_ORIGIN_COORD_WORD
DEFEATED_BOSS_MASK:        EQU	D407h	; Bitmask of bosses defeated in current session (bits 0..4)
BOSS_ATTACK_PATTERN_IDX:   EQU	D408h	; Current boss attack / movement pattern index
BOSS_INVULN_OR_FLASH:      EQU	D409h	; Boss hit-flash / temporary invulnerability flag
BOSS_SUBPHASE_A:           EQU	D40Ah	; Boss auxiliary state counter A
BOSS_SUBPHASE_B:           EQU	D40Bh	; Boss auxiliary state counter B
SPAWN_QUEUE_LOCK_FLAG:     EQU	D410h	; Suppresses stage object queue processing when nonzero
BOSS_PROJECTILE_COUNT:     EQU	D411h	; Active boss projectile / minion count
ACTIVE_ENEMY_OBJ_COUNT:    EQU	D412h	; Number of currently active enemy gameplay objects
ENEMY_SPAWN_RESET_START:   EQU	D413h	; Start of enemy spawn work counters cleared on stage init
LINKED_OBJ_PTR_TEMP:       EQU	D417h	; 16-bit temporary object record pointer for multi-part enemies
LINKED_OBJ_WORK_WORD:      EQU	D418h	; 16-bit temporary work word for linked enemy creation
SPECIAL_SPAWN_ACTIVE:      EQU	D41Ah	; Nonzero while special scripted enemy wave is active
SWARM_ENEMY_COUNTER:       EQU	D41Bh	; Active count for grouped/swarm enemy spawns
RANDOM_SPAWN_TIMERS_BASE:  EQU	D430h	; 6-byte periodic enemy wave spawn countdown array (D430h..D435h)
RANDOM_SPAWN_TIMER_1:      EQU	D431h	; Periodic wave spawn timer 1
RANDOM_SPAWN_TIMER_2:      EQU	D432h	; Periodic wave spawn timer 2
RANDOM_SPAWN_TIMER_3:      EQU	D433h	; Periodic wave spawn timer 3
RANDOM_SPAWN_TIMER_4:      EQU	D434h	; Periodic wave spawn timer 4
RANDOM_SPAWN_TIMER_5:      EQU	D435h	; Periodic wave spawn timer 5
WAVE_VARIANT_COUNTER_A:    EQU	D436h	; 2-bit cycling index A for periodic enemy spawns
WAVE_VARIANT_COUNTER_B:    EQU	D437h	; 2-bit cycling index B for periodic enemy spawns
WAVE_VARIANT_COUNTER_C:    EQU	D438h	; 2-bit cycling index C for boss/enemy spawns
WAVE_SPAWN_SLOT_CURSOR:    EQU	D439h	; 4-step cycling index into WAVE_SPAWN_WORK_ARRAY (D450h)
SCROLL_SPAWN_BUDGET_LO:    EQU	D43Bh	; 16-bit scroll-triggered spawn threshold low byte
SCROLL_SPAWN_BUDGET_HI:    EQU	D43Ch	; 16-bit scroll-triggered spawn threshold high byte
WAVE_SPAWN_WORK_ARRAY:     EQU	D450h	; 4-byte active wave slot tracking array
DROP_CYCLE_COUNTER:        EQU	D454h	; 4-step item-drop table cycling index
STAGE_OBJ_SPAWN_QUEUE:     EQU	D500h	; Ten 10h-byte queued stage-object spawn descriptors

; Gameplay object table: 10 x 80h-byte records (D700h-DBFFh)
GAMEPLAY_OBJECT_TABLE:    EQU	D700h	; Ten 80h-byte active gameplay enemy/item records (D700h..DBFFh)
GAMEPLAY_OBJ0_COLL_MODE:  EQU	D714h	; OBJ_COLLISION_MODE (+14h) of GAMEPLAY_OBJECT_TABLE slot 0

; Auxiliary object table: 8 x 80h-byte records (DC00h-DFFFh)
AUXILIARY_OBJECT_TABLE:  EQU	DC00h	; Eight 80h-byte auxiliary projectile/effect records (DC00h..DFFFh)

; Circular 32x32 level tile buffer (E000h-E3FFh)
LEVEL_TILE_BUFFER:     EQU	E000h	; 32x32-byte circular logical level tilemap buffer (E000h..E3FFh)
LEVEL_TILE_BUF_ROW27:  EQU	E360h	; Row 27 start (+0360h) inside circular LEVEL_TILE_BUFFER

; CPU sprite line-color staging buffer (E400h-E67Fh)
CPU_SPRITE_COLOR_TABLE:        EQU	E400h	; CPU-side 32x16-byte sprite color table (200h bytes); legacy bulk upload reads 280h
CPU_SPRITE_COL0_LAST:          EQU	E40Fh	; Last line (+0Fh) of sprite 0 color block
GAO_SPRITE_COLOR_TABLE:        EQU	E460h	; 64-byte line-color block for Gao SAT slots 6..9
DYNAMIC_OBJECT_SPRITE_COLORS:  EQU	E4A0h	; 320-byte line-color staging area for dynamic SAT slots 10..29
AUX_SPRITE_COLOR_TABLE:        EQU	E5F0h	; 16-byte line-color block for optional Gao SAT slot 31

; CPU sprite attribute staging table (E600h-E7FFh)
CPU_SPRITE_ATTR_TABLE:  EQU	E600h	; CPU-side 32x4-byte Sprite Attribute Table (80h bytes)
CPU_SAT_CLEAR_DEST:     EQU	E601h	; Second byte of CPU_SPRITE_ATTR_TABLE for LDIR clear
GAO_SPRITE_ATTR_TABLE:  EQU	E618h	; Four 4-byte SAT entries for Gao (slots 6..9)
DYNAMIC_OBJ_SAT_BASE:   EQU	E628h	; Twenty 4-byte SAT entries for general objects (slots 10..29)
AUX_DYNAMIC_SAT_BASE:   EQU	E678h	; Auxiliary SAT entries starting at slot 30
GAO_OPT_SLOT31_SAT:     EQU	E67Ch	; Optional SAT slot 31 Y byte reserved for Gao
GAO_OPT_SLOT31_X:       EQU	E67Dh	; Optional SAT slot 31 X byte
GAO_OPT_SLOT31_PAT:     EQU	E67Eh	; Optional SAT slot 31 pattern byte

; Shared scratch, icon draw & password codec buffers (E800h-E9FFh)
SHARED_WORK_BUFFER:       EQU	E800h	; Shared scratch buffer for tile unpack, UI draw, and messages
ITEM_DRAW_ICON_ID:        EQU	E801h	; 1-based item icon ID at SHARED_WORK_BUFFER+1
ITEM_DRAW_COORD_Y:        EQU	E802h	; UI icon Y coordinate / BCD & projectile scratch word at SHARED_WORK_BUFFER+2
ITEM_DRAW_COORD_X:        EQU	E803h	; UI icon X coordinate / object-spawn scratch pointer at SHARED_WORK_BUFFER+3
POWER_UP_ERASE_WORD2:     EQU	E804h	; Blanking scratch word at SHARED_WORK_BUFFER+4
SPAWN_SCRATCH_PARAM_5:    EQU	E805h	; Temporary spawn / aiming parameter at SHARED_WORK_BUFFER+5
POWER_UP_ERASE_TERM:      EQU	E806h	; FFh string terminator at SHARED_WORK_BUFFER+6
AIM_VECTOR_DX_TEMP:       EQU	E807h	; Temporary X delta / vector scratch at SHARED_WORK_BUFFER+7
AIM_OCTANT_FLAGS:         EQU	E808h	; Octant / sign bitflags during projectile aiming
AIM_SPEED_SHIFT_TEMP:     EQU	E809h	; Temporary speed scale byte during projectile aiming
AIM_TARGET_X_TEMP:        EQU	E80Ah	; Target X coordinate scratch during aiming
AIM_TARGET_Y_TEMP:        EQU	E80Bh	; Target Y coordinate scratch during aiming
AUX_SPAWN_TYPE_TEMP:      EQU	E80Fh	; Temporary auxiliary projectile type ID
SHOT_COLL_WORK_WORD:      EQU	E810h	; 16-bit temporary pointer / flag during weapon collision
SHOT_TILE_CHECK_XY_A:     EQU	E812h	; 2-byte (X, Y) probe coordinate A for weapon-tile collision
SHOT_TILE_PROBE_ATTR:     EQU	E813h	; Sampled tile attribute byte during weapon-tile collision
SHOT_TILE_CHECK_XY_B:     EQU	E814h	; 2-byte (X, Y) probe coordinate B for weapon-tile collision
SHOT_SAVED_POS_WORD:      EQU	E830h	; Saved 2-byte projectile (Y, X) during collision step
ITEM_QTY_RENDER_BYTE:     EQU	E880h	; 1-byte BCD item quantity scratch for F3 ITEM INFORMATION
PASSWORD_DISPLAY_HDR:     EQU	E900h	; 2-byte (X, Y) header before 32-char encoded password
PASSWORD_DISPLAY_HDR_Y:   EQU	E901h	; Second byte of PASSWORD_DISPLAY_HDR (also stage clear scratch)
PASSWORD_VALUE_BUFFER:    EQU	E902h	; 32-byte 5-bit encoded password / display text buffer
PASSWORD_VALUE_5:         EQU	E907h	; 6th 5-bit password value used in cross-check sum
PASSWORD_VALUE_6:         EQU	E908h	; 7th 5-bit password value used in cross-check sum
PASSWORD_INPUT_HDR:       EQU	E980h	; 2-byte (X, Y) header before editable password buffer
PASSWORD_INPUT_BUFFER:    EQU	E982h	; Editable password input buffer (initialized to FFh)
PASSWORD_INPUT_BUF_NEXT:  EQU	E983h	; LDIR destination for filling PASSWORD_INPUT_BUFFER
PASSWORD_INPUT_CHAR_5:    EQU	E987h	; Entered password value 5 verified during decode
PASSWORD_INPUT_CHAR_6:    EQU	E988h	; Entered password value 6 verified during decode

; Spatial collision hitbox arrays & decoded password fields (EA00h-EFFFh)
COLLISION_AND_MSG_WORK:    EQU	EA00h	; Shared 400h-byte spatial collision grid & bird-message work area
COLLISION_WORK_CLEAR_DST:  EQU	EA01h	; LDIR destination for clearing spatial collision work header
COLLISION_PLAYER_BOX_HDR:  EQU	EA08h	; Player hitbox scratch header for object collision
COLLISION_SHOT_BOX_ARRAY:  EQU	EA09h	; 6-entry active weapon shot bounding-box array
COLLISION_SCRATCH_TAIL:    EQU	EAFFh	; Bit-stream / hitbox comparison cursor at EAFFh
DECODED_PWD_RANDOM_KEY:    EQU	EC00h	; Decoded 5-bit password randomizer key ( also tile unpack buf )
DECODED_PWD_ROUTE_ID:      EQU	EC01h	; Decoded password route ID
DECODED_PWD_ROW_LO:        EQU	EC02h	; Decoded password route row low nibble
DECODED_PWD_ROW_HI:        EQU	EC03h	; Decoded password route row high nibble
DECODED_PWD_LIVES:         EQU	EC04h	; Decoded password lives count
DECODED_PWD_GAO_Y:         EQU	EC05h	; Decoded password Gao Y / 8
DECODED_PWD_GAO_X:         EQU	EC06h	; Decoded password Gao X / 8
DECODED_PWD_EQUIP_A:       EQU	EC07h	; Decoded password equipment bitfield A
DECODED_PWD_EQUIP_B:       EQU	EC08h	; Decoded password equipment bitfield B
DECODED_PWD_FEATHERS_Q4:   EQU	EC09h	; Decoded password feather count / 4
DECODED_PWD_BOXES:         EQU	EC0Ah	; Decoded password storage box count
DECODED_PWD_MAPS_COMP:     EQU	EC10h	; Decoded password stage-map & compass counts (also mirror tile buf)
DECODED_PWD_CROSS_SUM:     EQU	EC12h	; Decoded password cross-check sum
DECODED_PWD_WEAPON:        EQU	EC13h	; Decoded password equipped weapon form
DECODED_PWD_BOSS_FLAGS:    EQU	EC14h	; Decoded password progression/boss flags

; Cartridge stack, Konami mapper shadows & King Kong 2 combination RAM (F0F0h-F21Fh)
GAME_STACK_TOP:             EQU	F0F0h	; Initial Z80 stack pointer loaded at cartridge boot
MAPPER_BANK_PAGE1:          EQU	F0F1h	; Shadow of ROM bank mapped at CPU 6000h-7FFFh
MAPPER_BANK_PAGE2:          EQU	F0F2h	; Shadow of ROM bank mapped at CPU 8000h-9FFFh
MAPPER_BANK_PAGE3:          EQU	F0F3h	; Shadow of ROM bank mapped at CPU A000h-BFFFh
SAVED_MAPPER_PAGE2:         EQU	F0F4h	; Saved page-2 bank around interrupt sound-driver calls
SAVED_MAPPER_PAGE3:         EQU	F0F5h	; Saved page-3 bank around interrupt sound-driver calls
BOOT_DISPLAY_MODE_FLAG:     EQU	F0FFh	; System/display initialization state byte
HINOTORI_SLOT_ID:           EQU	F100h	; ENASLT slot ID of Hi no Tori cartridge
KK2_SLOT_ID:                EQU	F101h	; ENASLT slot ID of companion King Kong 2 cartridge
KK2_INIT_ENTRY_ADDR:        EQU	F102h	; King Kong 2 startup entry read from 4002h
KK2_HTIMI_HOOK_TARGET:      EQU	F104h	; Patched target capturing King Kong 2 H.TIMI handler
COMBINATION_HOOK_BUSY:      EQU	F106h	; Re-entrancy lock for resident F220h H.TIMI hook
COMBINATION_ACTIVE_MODE:    EQU	F107h	; 00h=idle, 01h=F4 cassette SAVE, 02h=F5 cassette LOAD
COMBINATION_UI_SUBSTATE:    EQU	F108h	; Substate index for cassette SAVE/LOAD state machine
COMBINATION_FILENAME_LEN:   EQU	F109h	; Entered cassette filename length (0..6)
COMBINATION_FILENAME_BUF:   EQU	F10Ah	; 6-character user-entered cassette filename buffer
COMBINATION_TAPE_HDR_NAME:  EQU	F110h	; 6-character filename read from cassette tape header
COPIED_KK2_INIT_STUB:       EQU	F120h	; 256-byte RAM copy of King Kong 2 startup code (F120h..F21Fh)

; Enhanced MSX2+ horizontal-scroll resident state and routines (F2CAh-F37Fh). Lies above the
; stack and the King Kong 2 hook (F220h..F2C9h) and outside every game clear (C000h-F0EFh at
; boot, C155h-EFFFh per new game); measured untouched once the cartridge is running.
HS_FLAGS:           EQU	F2CAh	; Bit 0: module installed and scrolling enabled in boot menu; bit 1: camera live
HS_CAM_LO:          EQU	F2CBh	; Camera X within its route (pixel units) = page X shown at screen X 0
HS_A8_RAM:          EQU	F2CCh	; Primary slot register value with page 0 = RAM slot
HS_A8_ROM:          EQU	F2CDh	; Primary slot register value with page 0 = Main-ROM
HS_SUB_RAM:         EQU	F2CEh	; Page-3 slot subslot register value with page 0 = RAM subslot
HS_SUB_ROM:         EQU	F2CFh	; Page-3 secondary-slot state saved on module entry (boot value until first call)
HS_SUB_EXPANDED:    EQU	F2D0h	; Nonzero when the RAM primary slot is expanded
HS_MOD_TARGET:      EQU	F2D1h	; 16-bit page-0 module routine called by HS_RESIDENT_CALL_MODULE
HS_RAW_TARGET:      EQU	F2D3h	; 16-bit raw VDP primitive entry handed to HS_MOD_PRIMITIVE
HS_LAST_DELTA:      EQU	F116h	; Signed camera X delta from the most recent HS_TICK
HS_DEFEATED_IDX:    EQU	F117h	; Circular write index (0..7) into HS_DEFEATED_TAGS
HS_DEFEATED_TAGS:   EQU	F118h	; 8-byte circular table of destroyed/triggered terrain stream tags (F118h..F11Fh)
HS_CAM_ROUTE:       EQU	F2D5h	; Camera route 0..2 (camera world X = route * 256 + HS_CAM_LO)
HS_SPAWN_PASS:      EQU	F2D6h	; 00h = scanning HS_CAM_ROUTE, 01h = scanning (HS_CAM_ROUTE + 1) mod 3
HS_RESIDENT_BASE:   EQU	F2D7h	; Resident routine image destination (F2D7h..F37Fh)
HS_RESIDENT_LIMIT:  EQU	F380h	; Start of BIOS inter-slot workspace; resident end must not exceed this address

; Enhanced MSX2+ horizontal-scroll module variables in page-0 RAM (valid only while the module
; runs with CPU page 0 switched to RAM)
; (3F00h reserved)
HS_DELTA:           EQU	3F01h	; Signed pixels the camera moved this frame (objects shift by -delta)
HS_WIN_L:           EQU	3F02h	; World tile column (00h..5Fh) held by the leftmost loaded page column
HS_PREV_PHASE:      EQU	3F03h	; SCROLL_STREAM_PHASE sampled before the vertical scroll tick
HS_PREV_LRR:        EQU	3F04h	; 16-bit LEVEL_ROUTE_ROW sampled before the vertical scroll tick
HS_PREV_CURSOR:     EQU	3F06h	; 16-bit LEVEL_TILE_WRITE_CURSOR sampled before the tick
HS_CHK_ROW_SHADOW:  EQU	3F08h	; 16-bit last seen CHECKPOINT_ROUTE_ROW
HS_CHK_X_SHADOW:    EQU	3F0Ah	; Last seen (route-local) CHECKPOINT_GAO_X
HS_DEF_PTRS:        EQU	3F0Bh	; Three 16-bit strip-definition pointers for routes 0..2 (3F0Bh..3F10h)
HS_SPLIT_RAW:       EQU	3F11h	; 16-bit raw VDP command routine used by HS_SPLIT_BLIT
HS_SPLIT_A_PARAM:   EQU	3F13h	; A parameter (page / logical-op / color byte) for the raw command
HS_SPLIT_FLAGS:     EQU	3F14h	; Bits 0/1: H/D is page-0 X; bit 2: advance D; bit 3: original command is byte-oriented
HS_SPLIT_WIDTH:     EQU	3F15h	; Width of the current split part (00h = 256)
HS_TMP_C:           EQU	3F16h	; Tile column within its route
HS_TMP_BCUR:        EQU	3F17h	; Tile-buffer row index of LEVEL_TILE_WRITE_CURSOR
HS_TMP_P:           EQU	3F18h	; 16-bit strip-definition pointer of the decoded route
HS_TMP_SUB:         EQU	3F1Ah	; Byte offset inside the 4x4 metatile
HS_TMP_ROW:         EQU	3F1Bh	; 16-bit route row being decoded
HS_TMP_DST:         EQU	3F1Dh	; 16-bit tile-buffer write pointer
HS_TMP_RETIRE:      EQU	3F1Fh	; 16-bit retire handler for HS_SHIFT_TABLE (0000h = none)
HS_TMP_TERRAIN:     EQU	3F21h	; Terrain slots (bit n = slot n) pushed off screen this frame

; MSX BIOS system variables and H.TIMI interrupt hook (F3DBh-FFF6h)
BIOS_CLIKSW:       EQU	F3DBh	; MSX BIOS key-click switch (00h = disabled)
BIOS_RG1SAV:       EQU	F3E0h	; MSX BIOS VDP R#1 shadow register
BIOS_STATFL:       EQU	F3EBh	; MSX BIOS VDP status register S#0 shadow
BIOS_FNKSTR:       EQU	F87Fh	; MSX BIOS 160-byte function-key string table
BIOS_KEYBUF:       EQU	FBF0h	; MSX BIOS 40-byte keyboard ring buffer
BIOS_CAPST:        EQU	FCACh	; MSX BIOS CAPS lock flag
BIOS_EXPTBL:       EQU	FCC1h	; MSX BIOS 4-byte slot expansion flags table (followed by SLTTBL)
BIOS_H_TIMI:       EQU	FD9Fh	; MSX BIOS VBlank interrupt hook opcode byte (FD9Fh)
BIOS_H_TIMI_ADDR:  EQU	FDA0h	; MSX BIOS VBlank interrupt hook target word (FDA0h..FDA1h)
BIOS_RG8SAV:       EQU	FFE7h	; MSX2 BIOS VDP R#8 shadow register
BIOS_RG9SAV:       EQU	FFE8h	; MSX2 BIOS VDP R#9 shadow register
BIOS_RG23SAV:      EQU	FFF6h	; MSX2 BIOS VDP R#23 vertical-scroll shadow register
BIOS_RG25SAV:      EQU	FFFAh	; MSX2+ BIOS VDP R#25 shadow register
SUBSLOT_REG:       EQU	FFFFh	; Secondary slot register of the page-3 primary slot (reads inverted)

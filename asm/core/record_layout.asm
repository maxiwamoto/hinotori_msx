; IX / IY record field offsets for gameplay objects, logical weapon objects,
; and Bank 14 sound-driver channel records

; Gameplay, terrain, auxiliary, and ending actor object record (80h bytes)
OBJ_TYPE:              EQU	00h	; 1-based object or terrain type ID (00h = empty slot)
OBJ_PHASE:             EQU	01h	; Per-object state machine phase / substate index
OBJ_Y_FRAC:            EQU	02h	; 16-bit Y coordinate subpixel / fractional low byte
OBJ_Y:                 EQU	03h	; 16-bit Y coordinate screen pixel integer byte
OBJ_X_FRAC:            EQU	04h	; 16-bit X coordinate subpixel / fractional low byte
OBJ_X:                 EQU	05h	; 16-bit X coordinate screen pixel integer byte
OBJ_ANIM_TIMER:        EQU	06h	; Primary animation / state countdown timer
OBJ_VEL_Y_LO:          EQU	07h	; 8.8 signed Y velocity low byte
OBJ_VEL_Y_HI:          EQU	08h	; 8.8 signed Y velocity high byte
OBJ_VEL_X_LO:          EQU	09h	; 8.8 signed X velocity low byte
OBJ_VEL_X_HI:          EQU	0Ah	; 8.8 signed X velocity high byte
OBJ_ACCEL_ENABLE:      EQU	0Bh	; Bit 0 enables per-frame acceleration update (+0Ch..+0Fh)
OBJ_ACCEL_Y_LO:        EQU	0Ch	; 8.8 signed Y acceleration low byte
OBJ_ACCEL_Y_HI:        EQU	0Dh	; 8.8 signed Y acceleration high byte
OBJ_ACCEL_X_LO:        EQU	0Eh	; 8.8 signed X acceleration low byte
OBJ_ACCEL_X_HI:        EQU	0Fh	; 8.8 signed X acceleration high byte
OBJ_SPRITE_POSE:       EQU	10h	; Sprite layout / pose ID (bit 7 = refresh/hidden flag)
OBJ_ACTION_TIMER:      EQU	11h	; Secondary action / attack period countdown timer
OBJ_HIT_POINTS:        EQU	12h	; Remaining object HP; damage is applied by APPLY_DAMAGE_BITS_TO_OBJECT_HP
OBJ_HIT_REACTION:      EQU	13h	; Pending hit bitmask: bits 0/1/3 subtract 1/2/3 HP; other bits are type-specific
OBJ_COLLISION_MODE:    EQU	14h	; Visibility and player-interaction enable mode
OBJ_EXTENT_Y:          EQU	15h	; Vertical interaction half-extent or reward parameter
OBJ_EXTENT_X:          EQU	16h	; Horizontal interaction half-extent or HP counter
OBJ_WORK_0:            EQU	17h	; Type-specific work byte 0 (or ending actor 24-bit pos low)
OBJ_WORK_1:            EQU	18h	; Type-specific work byte 1 (or ending actor 24-bit pos mid)
OBJ_WORK_2:            EQU	19h	; Type-specific work byte 2 (or ending actor 24-bit pos high)
OBJ_LINK_PTR_LO:       EQU	1Ah	; Linked spawn / parent record pointer low byte
OBJ_LINK_PTR_HI:       EQU	1Bh	; Linked spawn / parent record pointer high byte
OBJ_SUB_TIMER:         EQU	1Ch	; Auxiliary sub-phase countdown timer
OBJ_STEP_INDEX:        EQU	1Dh	; Multi-step movement or attack sequence index
OBJ_BURST_CNT:         EQU	1Fh	; Projectile burst / repeat counter
OBJ_PART0_FLAGS:       EQU	20h	; Composite sub-part 0 flags (bit 7 = offscreen/hidden)
OBJ_PART0_DY:          EQU	21h	; Composite sub-part 0 relative Y offset
OBJ_PART0_DX:          EQU	22h	; Composite sub-part 0 relative X offset
OBJ_PART0_WIDTH:       EQU	24h	; Composite sub-part 0 pixel width
OBJ_PART0_HEIGHT:      EQU	23h	; Composite sub-part 0 pixel height
OBJ_PART0_SPRITE_LO:   EQU	25h	; Composite sub-part 0 sprite attribute / tile low
OBJ_PART0_SPRITE_HI:   EQU	26h	; Composite sub-part 0 sprite pattern offset / high
OBJ_PART1_FLAGS:       EQU	28h	; Composite sub-part 1 flags (bit 7 = offscreen/hidden)
OBJ_PART1_DY:          EQU	29h	; Composite sub-part 1 relative Y offset
OBJ_PART1_DX:          EQU	2Ah	; Composite sub-part 1 relative X offset
OBJ_PART1_HEIGHT:      EQU	2Bh	; Composite sub-part 1 pixel height
OBJ_PART1_AUX:         EQU	2Ch	; Composite sub-part 1 auxiliary counter
OBJ_PART1_SPRITE_HI:   EQU	2Eh	; Composite sub-part 1 sprite pattern offset / high
OBJ_PART2_FLAGS:       EQU	30h	; Composite sub-part 2 flags (bit 7 = offscreen/hidden)
OBJ_PART2_DY:          EQU	31h	; Composite sub-part 2 relative Y offset
OBJ_PART2_DX:          EQU	32h	; Composite sub-part 2 relative X offset
OBJ_PART2_HEIGHT:      EQU	33h	; Composite sub-part 2 pixel height
OBJ_PART2_SPRITE_LO:   EQU	35h	; Composite sub-part 2 sprite attribute / tile low
OBJ_PART2_SPRITE_HI:   EQU	36h	; Composite sub-part 2 sprite pattern offset / high
OBJ_PART3_FLAGS:       EQU	38h	; Composite sub-part 3 flags (bit 7 = offscreen/hidden)
OBJ_PART3_DY:          EQU	39h	; Composite sub-part 3 relative Y offset
OBJ_PART3_DX:          EQU	3Ah	; Composite sub-part 3 relative X offset
OBJ_PART3_HEIGHT:      EQU	3Bh	; Composite sub-part 3 pixel height
OBJ_PART3_SPRITE_LO:   EQU	3Dh	; Composite sub-part 3 sprite attribute / tile low
OBJ_PART3_SPRITE_HI:   EQU	3Eh	; Composite sub-part 3 sprite pattern offset / high
OBJ_TERRAIN_PARAM:     EQU	40h	; Terrain / stage spawn parameter byte
OBJ_TERRAIN_STATE:     EQU	41h	; Terrain / platform active substate
OBJ_PART_WRAP_MASK:    EQU	42h	; Bits 7..4 enable Y-wrap check for composite sub-parts 0..3
OBJ_TERRAIN_DELTA:     EQU	43h	; Terrain / platform movement delta
OBJ_PART_ACTIVE_MASK:  EQU	46h	; Bits 7..4 mark active visible composite sub-parts 0..3
OBJ_TERRAIN_ANIM_IDX:  EQU	48h	; Terrain 09 4-step animation cycle index (Bank 06)
OBJ_SLOT0_SAT_ATTR:    EQU	55h	; Allocated dynamic sprite slot 0 status byte
OBJ_SLOT0_AUX:         EQU	56h	; Composite slot 0 auxiliary flag
OBJ_SLOT1_SAT_ATTR:    EQU	5Dh	; Allocated dynamic sprite slot 1 status byte
OBJ_SLOT1_FLAGS:       EQU	5Eh	; Composite slot 1 auxiliary flags
OBJ_ANIM_CYCLE_CNT:    EQU	60h	; Per-object animation / PRNG phase counter
OBJ_SHOT_COOLDOWN:     EQU	61h	; Enemy projectile / attack cooldown timer
OBJ_SPAWN_PERSIST:     EQU	62h	; Spawn persistence / defeated state flag
OBJ_SLOT2_SAT_ATTR:    EQU	65h	; Allocated dynamic sprite slot 2 status byte
OBJ_BOSS_HIT_FLAG:     EQU	68h	; Bit 0 enables custom boss/special damage handling
OBJ_SLOT3_SAT_ATTR:    EQU	6Dh	; Allocated dynamic sprite slot 3 status byte
OBJ_HITBOX_DX:         EQU	70h	; Hitbox X offset copied by SET_OBJECT_HITBOX_FROM_HL
OBJ_HITBOX_DY:         EQU	71h	; Hitbox Y offset copied by SET_OBJECT_HITBOX_FROM_HL
OBJ_HITBOX_W:          EQU	72h	; Hitbox width copied by SET_OBJECT_HITBOX_FROM_HL
OBJ_HITBOX_H:          EQU	73h	; Hitbox height copied by SET_OBJECT_HITBOX_FROM_HL
OBJ_COLLISION_CLASS:   EQU	74h	; Collision behavior class (0=none, 1..3=hurt/solid/pickup)
OBJ_SLOT4_SAT_ATTR:    EQU	75h	; Allocated dynamic sprite slot 4 status byte
OBJ_ITEM_SUBTYPE:      EQU	78h	; Item / pickup subtype index
OBJ_ATTACK_WAVE_IDX:   EQU	7Bh	; Boss / multi-shot wave counter
OBJ_REC_SIZE:          EQU	80h	; Size of one gameplay / terrain / auxiliary / ending actor record

; Logical weapon / Gao projectile sprite-object record at CA00h (20h bytes)
LOBJ_TYPE:        EQU	00h	; Logical weapon/shot type & flags (00h=free, FFh=retire, bit 6=persistent)
LOBJ_PHASE:       EQU	01h	; Weapon projectile movement phase
LOBJ_Y_FRAC:      EQU	02h	; 16-bit Y subpixel byte
LOBJ_Y:           EQU	03h	; 16-bit Y screen coordinate byte
LOBJ_X_FRAC:      EQU	04h	; 16-bit X subpixel byte
LOBJ_X:           EQU	05h	; 16-bit X screen coordinate byte
LOBJ_VEL_Y_LO:    EQU	06h	; 8.8 signed Y velocity low byte
LOBJ_VEL_Y_HI:    EQU	07h	; 8.8 signed Y velocity high byte
LOBJ_VEL_X_LO:    EQU	08h	; 8.8 signed X velocity low byte
LOBJ_VEL_X_HI:    EQU	09h	; 8.8 signed X velocity high byte
LOBJ_STEP_COUNT:  EQU	0Ah	; Remaining bounce / arc step counter
LOBJ_TIMER:       EQU	0Bh	; Projectile lifetime countdown timer
LOBJ_REC_SIZE:    EQU	20h	; Size of one logical weapon/sprite-object record at CA00h

; Ground-item VRAM icon tracking record at STAGE_SPAWN_TRACK_TABLE (CC00h, 10h bytes)
GITEM_STATE:       EQU	00h	; 00h free, 01h save background, 02h draw icon, 03h idle, 04h+ erase
GITEM_ICON_ID:     EQU	01h	; 1-based item / stone icon ID
GITEM_Y:           EQU	02h	; Screen Y (scrolled with VERTICAL_SCROLL_DELTA)
GITEM_X:           EQU	03h	; Screen X low byte; active horizontal camera may make it unaligned
GITEM_CACHE_SLOT:  EQU	04h	; Index into the CBxxh VRAM background-cache allocation flags
GITEM_X_HIGH:      EQU	05h	; Enhanced signed screen X high byte (00h or FFh while visible)
GITEM_REC_SIZE:    EQU	10h	; Size of one ground-item tracking record

; Queued stage-object spawn descriptor at STAGE_OBJ_SPAWN_QUEUE (D500h, 10h bytes)
SPAWNQ_X:         EQU	05h	; Screen X passed in D to the spawn routine
SPAWNQ_REC_SIZE:  EQU	10h	; Size of one queued spawn descriptor

; Bank 14 PSG sound driver channel record at C010h..C08Fh (20h bytes)
SND_CH_NOTE_TIMER:         EQU	00h	; Remaining VBlank ticks for current note, rest, or raw SFX step; decremented at $94F4/$95BA, fetches next track command when 0
SND_CH_NOTE_DURATION:      EQU	01h	; Reload duration in VBlank ticks for current MML note (((low_nibble+1)*SND_CH_TEMPO_UNIT) at $96ED) or raw SFX 2xh group ($9524)
SND_CH_SOUND_ID:           EQU	02h	; Active 1-based Sound ID ($01..$74) playing on this channel, or $00 when channel is inactive
SND_CH_TRACK_PTR_LO:       EQU	03h	; Current main track bytecode cursor low byte (16-bit LE pointer SND_CH_TRACK_PTR at +03h..+04h)
SND_CH_TRACK_PTR_HI:       EQU	04h	; Current main track bytecode cursor high byte ($9D37..$BF49 across mapped Banks 14 and 15)
SND_CH_MIXER_ENV_MODE:     EQU	05h	; Channel mixer & hardware-envelope mode (2xh raw prefix, $02 in MML tone mode, $00 silent): bit0=noise enable, bit1=tone enable, bit2=no R#11..13 retrigger, bit3=PSG HW envelope enable
SND_CH_TEMPO_UNIT:         EQU	06h	; MML base note-length unit in VBlank ticks ($00..$0F, set by D0h..DFh at $9666)
SND_CH_INIT_VOLUME:        EQU	07h	; MML note initial volume ($01..$0E, set to (cmd & $0F)+1 by F0h..FDh at $9673)
SND_CH_ENV_VOLUME:         EQU	08h	; MML current software-envelope volume level during note sustain/decay (reloaded from SND_CH_INIT_VOLUME at $970A, decayed at $95ED..$95F4)
SND_CH_OCTAVE_SHIFT:       EQU	09h	; MML octave period left-shift count ($00..$07, set by E0h..E7h at $96DB; 0=highest octave, shifts base period $9854 left n times at $9740)
SND_CH_ENV_DECAY_CNT:      EQU	0Ah	; MML software-envelope attack-decay counter (set to duration + SND_CH_ENV_ATTACK_TICKS at $972A; double-decremented per tick until equal to SND_CH_NOTE_TIMER)
SND_CH_LOOP_COUNTER:       EQU	0Bh	; Iteration counter for FE <count> <addr> loops ($00 initially; incremented at $98E7 up to <count>, or kept $00 for infinite loops $82..$FE)
SND_CH_ENV_ATTACK_TICKS:   EQU	0Ch	; MML software-envelope initial attack-decay frame count ($00..$0F, upper nibble of byte following F0h..FDh at $967E)
SND_CH_ENV_RELEASE_TICKS:  EQU	0Dh	; MML software-envelope release-decay remaining-frames threshold ($00..$0F, lower nibble of byte following F0h..FDh at $9684)
SND_CH_MUSIC_MODE:         EQU	0Eh	; Channel bytecode mode flag (initialized to $01 = MML Music Mode at $947B; toggled 1<->0 by FE 00 at $990E where $00 = Raw PSG/SFX Mode)
SND_CH_MOD_FLAGS:          EQU	0Fh	; Modulation & detune flags (cleared by EFh at $96AA): bit0=10-frame vibrato delay elapsed ($95FD/$960D), bit2=vibrato active (ECh, $96C7), bit3=+1 period detune active (E8h, $96D3/$9832)
SND_CH_MACRO_SET_ID:       EQU	10h	; Active percussion/instrument macro set ID ($00=standard tone synthesis; $01..$05=1-based index into $9976 SoundMacroSetPtrTable, set by E9h..EEh <id> at $96A3)
SND_CH_MACRO_PTR_LO:       EQU	11h	; Current percussion/instrument micro-stream pointer low byte (16-bit LE pointer SND_CH_MACRO_PTR at +11h..+12h)
SND_CH_MACRO_PTR_HI:       EQU	12h	; Current percussion/instrument micro-stream pointer high byte ($9998..$9C48 in Bank 14)
SND_CH_MACRO_TIMER:        EQU	13h	; Remaining VBlank ticks for current percussion/instrument micro-stream step (decremented at $977D)
SND_CH_MACRO_DURATION:     EQU	14h	; Reload step duration in VBlank ticks for current micro-stream 2xh group (stored at $9527, loaded into SND_CH_MACRO_TIMER at $95AB)
SND_CH_TONE_PERIOD_LO:     EQU	15h	; Current 12-bit PSG tone period fine byte written to PSG R#0 / R#2 / R#4 (modulated in-place by vibrato at $9626..$964D)
SND_CH_TONE_PERIOD_HI:     EQU	16h	; Current 12-bit PSG tone period coarse byte (bits 0..3) written to PSG R#1 / R#3 / R#5
SND_CH_OUT_VOLUME:         EQU	17h	; Current 4-bit channel volume ($00..$0F) or PSG R#13 HW envelope shape (when SND_CH_MIXER_ENV_MODE bits 3..2 == 10b) sent to PSG R#8..R#10
SND_CH_RET_PTR_LO:         EQU	18h	; Saved 1-level subroutine return address low byte pushed by FE FF <addr> ($992B) and popped on FFh ($97C3)
SND_CH_RET_PTR_HI:         EQU	19h	; Saved 1-level subroutine return address high byte ($00 = no active subroutine call; tested on FFh at $97B9)
SND_CH_VIB_TIMER:          EQU	1Ah	; Vibrato tick counter ($00..$09 during initial 10-tick onset delay; thereafter $00..(rate-1) ticks per vibrato half-cycle)
SND_CH_VIB_POLARITY:       EQU	1Bh	; Vibrato oscillation sign byte ($00=add depth, $FF=subtract depth; inverted via CPL each half-cycle at $9635)
SND_CH_VIB_PARAM:          EQU	1Ch	; Vibrato parameter byte set by ECh <param> ($96CD): upper nibble = ticks per half-cycle, lower nibble = tone-period delta
SND_CH_UNUSED_1D:          EQU	1Dh	; Unused alignment byte 1 of 3 padding each 29-byte ($1D) channel record to a $20-byte (32-byte) stride
SND_CH_UNUSED_1E:          EQU	1Eh	; Unused alignment byte 2 of 3 padding each 29-byte ($1D) channel record to a $20-byte (32-byte) stride
SND_CH_UNUSED_1F:          EQU	1Fh	; Unused alignment byte 3 of 3 padding each 29-byte ($1D) channel record to a $20-byte (32-byte) stride (SND_CH_REC_SIZE = $20)
SND_CH_REC_SIZE:           EQU	20h	; Size of one sound driver channel record

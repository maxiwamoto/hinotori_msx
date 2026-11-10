# Hinotori MSX

Commented Z80 disassembly of **Hi no Tori: Houou-hen** (Konami, 1987),
with an Enhanced edition for MSX2/MSX2+. One maintained source tree contains
the sixteen physical 8 KiB ROM banks and their build dependencies.

## Play Enhanced without compiling

**Hinotori Enhanced is released.** Download one of the three IPS patches from
the [v1.0.1 release](https://github.com/maxiwamoto/hinotori_msx/releases/tag/v1.0.1):

- `hinotori-main-to-enhanced.ips` for the original Main `(J)` ROM.
- `hinotori-a1-to-enhanced.ips` for the original `(J) [a1]` ROM.
- `hinotori-a2-to-enhanced.ips` for the original `(J) [a2]` ROM.

Use an IPS patcher to apply exactly one patch to an uncompressed original ROM
matching the SHA-1 in the table below. Keep your original and save the patched
result separately. IPS does not check the input ROM, so check its hash first;
do not patch an English translation, another modified ROM, or a ZIP archive.
All three patches produce the same Enhanced ROM with both Japanese and English.

Name the result **`hinotori-enhanced [Konami].rom`** for WebMSX, or select
**Cartridge 1 > Set ROM Format > Konami**. WebMSX may guess ASCII8 without the
filename hint. Use MSX2 or later; horizontal scrolling requires MSX2+ or turbo R.
Enhanced selects 60 Hz at startup, including on PAL machines. Cold-reset after
loading a new build: older emulator states restore older RAM code and settings.

## Four targets

| Target | Description | SHA-1 (131,072 bytes each) |
| --- | --- | --- |
| `main` | Original Japanese Main dump | `D723F2EB1C887DB5448FD56BE5E7C57E60D88E63` |
| `a1` | Original Japanese alternate revision | `612C18616BC800D9EB69B9DA3CD29ECA31F50C1C` |
| `a2` | Archival Main-based alternate dump, including its incorrect music-loop pointer | `300F20ADDE3941AB10EB158DB48250E8E856A911` |
| `enhanced` | A1-based enhancements; Japanese/English selection at runtime | `5D755BDFFD1A1383C6CD585740155EFB1B9F0811` |

Enhanced adds MSX2+ hardware horizontal scrolling, border masking, automatic
turbo support, restored Enemy 16h
encounters, and fixes including the Level 4 boss-tablet palette and Game Master
title-screen restoration. This release also fixes duplicated Level 3 shooting
heads during horizontal scrolling and the English ending's freeze before the
credits. Version 1.0.1 restores the original English FIN lettering and adds
ENHANCED VERSION / MAX IWAMOTO to the credits in both language modes.
It is still being play-tested. Main/A1 stay original;
A2 reproduces Main's one-byte alteration and does not include A1's fixes.

## Contents

- `asm/banks/bank00.asm` through `bank15.asm`: commented code and data.
- `asm/core/`: assembler compatibility, constants, record and RAM definitions.
- `asm/enhanced/`: scrolling, turbo and translation-fix modules.
- `asm/hinotori-*.asm`: four entry wrappers; `asm/hinotori.asm` includes the banks.
- `tools/build.py`, `tools/convert.py`, `tools/package.py`: build, export and package.
- `tools/make_ips.py`: generate and verify the three Enhanced IPS release patches.
- `checksums.json`: reference sizes, SHA-1 and SHA-256 values.

No external ROM input is needed to assemble: the assembly includes the code and
data. Original ROM archives, built ROMs, emulator states, research tools, maps,
and assembler binaries are not included in this repository.

## Build

Install Python 3.10+ and the assembler you want to use. The Python tools use only
the standard library. Glass additionally requires Java 8 or newer.

Tested tools:

- [tniasm10](http://www.tni.nl/products/tniasm.html), in `compat` mode.
- [Glass 0.6](https://www.grauw.nl/projects/glass/).
- [SjASMPlus 1.24.0](https://github.com/z00m128/sjasmplus/releases/tag/v1.24.0).
  Original SjASM is a different assembler and is not a tested target.

Run from this repository's root (quote tool paths containing spaces):

```sh
python tools/build.py --assembler tniasm --tniasm /path/to/tniasm
python tools/build.py --assembler glass --glass-jar /path/to/glass-0.6.jar
python tools/build.py --assembler sjasmplus --sjasmplus /path/to/sjasmplus
```

Each command builds and verifies all four targets. Add `--target enhanced` (or
`main`, `a1`, `a2`) to build just one. Executables may be on PATH; environment
variables `TNIASM`, `GLASS_JAR`, `JAVA` and `SJASMPLUS` are also supported.

To build all twelve combinations and compare their actual bytes:

```sh
python tools/build.py --assembler all --tniasm /path/to/tniasm --glass-jar /path/to/glass-0.6.jar --sjasmplus /path/to/sjasmplus
```

Outputs, per-target symbols and assembler logs go in `build/<assembler>/`.
`build/verification.json` records the successful invocation. A wrong size,
reference hash or cross-assembler byte difference fails the build. If you
intentionally edit the game, use `--allow-modified`; this skips reference hashes
but still checks size and, with `--assembler all`, cross-assembler equality.

To reproduce the three release patches after building all four tniasm targets:

```sh
python tools/make_ips.py
```

The patches go in `build/ips/`. The tool checks every input against
`checksums.json`, then applies each saved patch and verifies that its output is
byte-for-byte identical to Enhanced. Use `--rom-dir build/glass` or
`--rom-dir build/sjasmplus` for the other assemblers.

## Conversion and standalone source packages

Edit the maintained tniasm10 files. The converter exports a selected target into
its own directory, keeping the bank files, comments and named symbols. It resolves
the project's variant conditionals, qualifies local labels (shortening unusually
long ones deterministically), adds leading zeroes to hex literals that need them,
and replaces the tniasm10-specific `IM` macros with native instructions.

Glass receives explicit logical/physical address bookkeeping with `ORG`.
SjASMPlus receives `DISP`/`ENT` and uses `--longptr` for the 128 KiB output.
Zero-byte padding is guarded for SjASMPlus. Strings and data are preserved.
Unsupported conditionals fail explicitly: this is a converter for this project,
not an arbitrary tniasm10 translator. Converted files are generated, not maintained
as additional source trees.

```sh
python tools/convert.py --assembler glass --target all
python tools/convert.py --assembler sjasmplus --target all
python tools/package.py
```

The last command writes three source-only ZIPs in `build/packages/`, with direct
assembler commands in each archive's README. Glass and SjASMPlus packages contain
one source directory per target and need no Python converter to assemble. No ROMs
or assembler executables are packaged. Generate these packages after verification.

## Bank layout

The bank files follow physical ROM order. Banks 00-03 assemble continuously:
one instruction crosses the original `7FFFh`/`8000h` file boundary. Do not build
each bank separately. Some code is assembled for a RAM address and copied there
at runtime; changing only `ORG` without preserving physical output would break it.
Enhanced moves code and data: consult its matching symbols for actual addresses.

## Credits

Original game: Konami. Disassembly, research and Enhanced work: Max Iwamoto.
English translation project: [MSX Translations](https://msxtranslations.com/hinotori.php).
The translation credits
**232** for translation and icon design, and **BiFi** for coding, graphics and
manual layout. BiFi's `FBIRDFIX.IPS` supplies the Level 4 tablet and Game Master
fixes incorporated into both language modes of Enhanced.

Original game and translation material retain their respective ownership.
This repository does not claim a new license over that material.

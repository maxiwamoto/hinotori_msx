#!/usr/bin/env python3
"""Create standalone source-only archives; does not publish or bundle assemblers."""
from __future__ import annotations

from pathlib import Path
import tempfile
import zipfile

from convert import ROOT, TARGETS, export


def instructions(assembler: str) -> str:
    lines = [f"# Hinotori MSX - {assembler} sources", "",
             "Four 128 KiB targets: Main, A1, archival A2 and Enhanced.",
             "A2 intentionally reproduces Main's incorrect music-loop pointer.",
             "Enhanced language selection is a runtime option.", "",
             "Install the assembler separately. These sources need no ROM input",
             "and no Python converter to assemble. Commands run from the extracted",
             "archive root. Replace tool paths below with your installation.", ""]
    if assembler == "tniasm":
        lines += ["Tested: tniasm10, compatibility mode.", "", "```sh"]
        for target in TARGETS:
            lines.append(f"tniasm compat asm/hinotori-{target}.asm hinotori-{target}.rom")
    else:
        version = "Glass 0.6 with Java 8+" if assembler == "glass" else "SjASMPlus 1.24.0 (not original SjASM)"
        lines += [f"Tested: {version}.", "", "```sh"]
        for target in TARGETS:
            lines.append(f"cd {target}")
            if assembler == "glass":
                lines.append(f"java -Dfile.encoding=UTF-8 -jar /path/to/glass-0.6.jar -I . asm/hinotori-{target}.asm hinotori-{target}.rom hinotori-{target}.sym")
            else:
                lines.append(f"sjasmplus --longptr --inc=. --raw=hinotori-{target}.rom --sym=hinotori-{target}.sym asm/hinotori-{target}.asm")
            lines.append("cd ..")
    lines += ["```", "", "Check sizes and hashes against checksums.json.",
              "Do not assemble the bank files individually: banks 00-03 form a continuous module.",
              "Generated sources should be regenerated from the maintained source after edits.", "",
              "Original game: Konami. Disassembly/research/Enhanced: Max Iwamoto.",
              "English translation project: MSX Translations.",
              "English translation/icon design: 232. Coding/graphics/manual layout: BiFi.",
              "BiFi also supplied the Level 4 tablet and Game Master fixes.",
              "Original game and translation material retain their respective ownership.",
              "https://msxtranslations.com/hinotori.php", "",
              "Repository: https://github.com/maxiwamoto/hinotori_msx (private during preparation).", ""]
    return "\n".join(lines)


def write_entry(archive, name: str, data: bytes):
    # Fixed metadata makes unchanged source packages reproducible.
    info = zipfile.ZipInfo(name, date_time=(2026, 11, 9, 0, 0, 0))
    info.compress_type = zipfile.ZIP_DEFLATED
    info.external_attr = 0o644 << 16
    archive.writestr(info, data)


def main():
    destination = ROOT / "build" / "packages"
    destination.mkdir(parents=True, exist_ok=True)
    for assembler in ("tniasm", "glass", "sjasmplus"):
        with tempfile.TemporaryDirectory(prefix="hinotori-export-") as temp:
            tree = Path(temp)
            if assembler == "tniasm":
                files = [(path.relative_to(ROOT).as_posix(), path) for path in sorted((ROOT / "asm").rglob("*.asm"))]
            else:
                for target in TARGETS:
                    export(ROOT, tree / target, target, assembler)
                files = [(path.relative_to(tree).as_posix(), path) for path in sorted(tree.rglob("*.asm"))]
            path = destination / f"hinotori-msx-{assembler}-sources.zip"
            with zipfile.ZipFile(path, "w") as archive:
                write_entry(archive, "README.md", instructions(assembler).encode("utf-8"))
                write_entry(archive, "checksums.json", (ROOT / "checksums.json").read_bytes())
                for relative, source in files:
                    write_entry(archive, relative, source.read_bytes())
            print(path)


if __name__ == "__main__":
    main()

#!/usr/bin/env python3
"""Build and verify Hinotori with tniasm10, Glass, or SjASMPlus; Python 3.10+."""
from __future__ import annotations

import argparse
import hashlib
import json
import os
from pathlib import Path
import shutil
import subprocess
import sys

from convert import ROOT, TARGETS, export

ASSEMBLERS = ("tniasm", "glass", "sjasmplus")


def executable(value: str) -> str:
    found = shutil.which(value)
    if found:
        return str(Path(found).resolve())
    path = Path(value).expanduser()
    if path.is_file():
        return str(path.resolve())
    raise ValueError(f"Executable not found: {value}")


def run(command: list[str], cwd: Path, log: Path):
    result = subprocess.run(command, cwd=cwd, stdout=subprocess.PIPE,
                            stderr=subprocess.STDOUT)
    log.parent.mkdir(parents=True, exist_ok=True)
    log.write_bytes(result.stdout)
    if result.returncode:
        tail = result.stdout.decode("utf-8", errors="replace")[-5000:]
        raise RuntimeError(f"Assembler failed ({result.returncode}); see {log}\n{tail}")


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--assembler", choices=(*ASSEMBLERS, "all"), default="tniasm")
    parser.add_argument("--target", choices=(*TARGETS, "all"), default="all")
    parser.add_argument("--tniasm", default=os.environ.get("TNIASM", "tniasm"))
    parser.add_argument("--sjasmplus", default=os.environ.get("SJASMPLUS", "sjasmplus"))
    parser.add_argument("--glass-jar", default=os.environ.get("GLASS_JAR", "glass.jar"))
    parser.add_argument("--java", default=os.environ.get("JAVA", "java"))
    parser.add_argument("--allow-modified", action="store_true",
                        help="Allow intentional changes from reference hashes; size and cross-assembler equality still checked")
    args = parser.parse_args()
    (ROOT / "build" / "verification.json").unlink(missing_ok=True)
    assemblers = ASSEMBLERS if args.assembler == "all" else (args.assembler,)
    targets = tuple(TARGETS) if args.target == "all" else (args.target,)
    expected = json.loads((ROOT / "checksums.json").read_text(encoding="utf-8"))
    commands = {}
    for assembler in assemblers:
        if assembler == "glass":
            jar = Path(args.glass_jar).expanduser().resolve()
            if not jar.is_file():
                raise ValueError(f"Glass jar not found: {jar}; set GLASS_JAR or --glass-jar")
            commands[assembler] = [executable(args.java), "-Dfile.encoding=UTF-8", "-jar", str(jar)]
        else:
            commands[assembler] = [executable(getattr(args, assembler))]
    report = {"builds": [], "cross_assembler_equal": None}
    for target in targets:
        reference = None
        for assembler in assemblers:
            directory = ROOT / "build" / assembler
            directory.mkdir(parents=True, exist_ok=True)
            output = directory / f"hinotori-{target}.rom"
            symbol = output.with_suffix(".sym")
            # Never accept stale files from an earlier successful build.
            output.unlink(missing_ok=True)
            symbol.unlink(missing_ok=True)
            if assembler == "tniasm":
                cwd = ROOT
                command = commands[assembler] + ["compat", f"asm/hinotori-{target}.asm", str(output)]
            else:
                cwd = ROOT / "build" / "generated" / assembler / target
                export(ROOT, cwd, target, assembler)
                entry = f"asm/hinotori-{target}.asm"
                if assembler == "glass":
                    command = commands[assembler] + ["-I", ".", entry, str(output), str(symbol)]
                else:
                    command = commands[assembler] + ["--nologo", "--fullpath", "--longptr", "--inc=.",
                                                     f"--raw={output}", f"--sym={symbol}", entry]
            run(command, cwd, directory / f"hinotori-{target}.log")
            if assembler == "tniasm" and (ROOT / "tniasm.sym").is_file():
                shutil.copyfile(ROOT / "tniasm.sym", symbol)
            data = output.read_bytes()
            sha1 = hashlib.sha1(data).hexdigest().upper()
            sha256 = hashlib.sha256(data).hexdigest().upper()
            if len(data) != 131072:
                raise ValueError(f"{assembler}/{target}: expected 131072 bytes, got {len(data)}")
            if not args.allow_modified and (sha1 != expected[target]["sha1"] or sha256 != expected[target]["sha256"]):
                raise ValueError(f"{assembler}/{target}: reference hash mismatch: {sha1}")
            if reference is not None and data != reference:
                offset = next(i for i, (a, b) in enumerate(zip(reference, data)) if a != b)
                raise ValueError(f"{assembler}/{target}: assemblers differ at ROM offset {offset:05X}h")
            reference = data
            report["builds"].append(dict(assembler=assembler, target=target, bytes=len(data), sha1=sha1, sha256=sha256))
            print(f"PASS {assembler:9} {target:8} {sha1}", flush=True)
    report["cross_assembler_equal"] = True if len(assemblers) > 1 else None
    (ROOT / "build" / "verification.json").write_text(json.dumps(report, indent=2) + "\n", encoding="utf-8")
    print(f"Verified {len(report['builds'])} builds.")


if __name__ == "__main__":
    try:
        main()
    except (ValueError, RuntimeError, OSError) as exc:
        print(f"ERROR: {exc}", file=sys.stderr)
        sys.exit(1)

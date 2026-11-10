"""Generate verified Main/A1/A2 to Enhanced IPS patches from assembled ROMs."""
import argparse
import hashlib
import json
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]


def make_patch(source, target):
    if len(source) != len(target) or len(target) != 131072:
        raise ValueError('Expected two 128 KiB ROMs')
    patch = bytearray(b'PATCH')
    pos = 0
    while pos < len(target):
        if source[pos] == target[pos]:
            pos += 1
            continue
        start = pos
        while pos < len(target) and source[pos] != target[pos] and pos-start < 65535:
            pos += 1
        patch += start.to_bytes(3, 'big')
        patch += (pos-start).to_bytes(2, 'big')
        patch += target[start:pos]
    return bytes(patch+b'EOF')


def apply_patch(source, patch):
    """Decode standard IPS records independently to verify the generated file."""
    if patch[:5] != b'PATCH':
        raise ValueError('Invalid IPS header')
    output = bytearray(source)
    pos = 5
    while patch[pos:pos+3] != b'EOF':
        if pos+5 > len(patch):
            raise ValueError('Truncated IPS record')
        offset = int.from_bytes(patch[pos:pos+3], 'big')
        size = int.from_bytes(patch[pos+3:pos+5], 'big')
        pos += 5
        if size:
            data = patch[pos:pos+size]
            if len(data) != size:
                raise ValueError('Truncated IPS data')
            pos += size
        else:
            if pos+3 > len(patch):
                raise ValueError('Truncated IPS run')
            size = int.from_bytes(patch[pos:pos+2], 'big')
            data = bytes([patch[pos+2]])*size
            pos += 3
        if offset+size > len(output):
            raise ValueError('Record exceeds the 128 KiB ROM')
        output[offset:offset+size] = data
    if pos+3 != len(patch):
        raise ValueError('Unexpected bytes after IPS EOF')
    return bytes(output)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--rom-dir', type=Path, default=ROOT/'build/tniasm')
    parser.add_argument('--output', type=Path, default=ROOT/'build/ips')
    args = parser.parse_args()
    refs = json.loads((ROOT/'checksums.json').read_text())
    roms = {}
    for name in ('main', 'a1', 'a2', 'enhanced'):
        data = (args.rom_dir/f'hinotori-{name}.rom').read_bytes()
        expected = refs[name]
        if (len(data) != expected['bytes'] or
                hashlib.sha1(data).hexdigest().upper() != expected['sha1'] or
                hashlib.sha256(data).hexdigest().upper() != expected['sha256']):
            raise SystemExit(f'{name}: ROM does not match checksums.json')
        roms[name] = data
    args.output.mkdir(parents=True, exist_ok=True)
    for name in ('main', 'a1', 'a2'):
        path = args.output/f'hinotori-{name}-to-enhanced.ips'
        patch = make_patch(roms[name], roms['enhanced'])
        path.write_bytes(patch)
        if apply_patch(roms[name], path.read_bytes()) != roms['enhanced']:
            raise SystemExit(f'{name}: patched ROM differs from Enhanced')
        print(f'{path.name}: {len(patch)} bytes; verified exact Enhanced output')


if __name__ == '__main__':
    main()

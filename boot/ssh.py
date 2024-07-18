#!/usr/bin/env python3
import argparse
import subprocess
import os

parser = argparse.ArgumentParser(prog='boot/ssh')
parser.add_argument('-p', '--port', type=int, default=22)
parser.add_argument('-t', '--tmpdir', default='/tmp')
parser.add_argument('-s', '--sudo', action='store_true')
parser.add_argument('-r', '--recursive', action='store_true')
parser.add_argument('-e', '--exec', action='store_true')
parser.add_argument('src')
parser.add_argument('dst')
args = parser.parse_args()

src: str = args.src
dst: str = args.dst
ssh_uri: str = None
is_pull = False
if ':' in src:
    is_pull = True
    ssh_uri, src = src.split(':', 1)
if ':' in dst:
    ssh_uri, dst = dst.split(':', 1)


ssh_cmd = ['ssh', '-p', str(args.port), ssh_uri]
rsync_cmd = ['rsync', '-re' if args.recursive else '-e', f'ssh -p {args.port}']


if is_pull or not args.sudo:
    subprocess.check_call(rsync_cmd + [args.src, args.dst])
else:
    tmp_fname = os.path.basename(src)
    tmp_path = os.path.join(args.tmpdir, tmp_fname)
    subprocess.check_call(rsync_cmd + [src, ssh_uri + ':' + tmp_path])
    subprocess.check_call(ssh_cmd + ['sudo', 'rsync', '-rI' if args.recursive else '-I', tmp_path, dst])
if args.exec:
    subprocess.check_call(ssh_cmd + ['chmod', '+x', dst])
    subprocess.check_call(ssh_cmd + [dst])

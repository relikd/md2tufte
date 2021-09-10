#!/usr/bin/env python3
import os
import sys

if len(sys.argv) != 3:
    print('  usage: script {template-file} {md-file}')
    exit(1)

temp = sys.argv[1]
src = sys.argv[2]
if not os.path.isfile(temp) or not os.path.isfile(src):
    print('Error: file does not exist')
    exit(1)

f_temp = ''
f_md = ''
with open(temp, 'r') as f:
    f_temp = f.read()

with open(src, 'r') as f:
    def is_colon(line):
        return len(line) > 5 and len(line.rstrip(':')) == 0
    init = True
    header = False
    ml_key = ''
    ml_val = ''
    for line in f.readlines():
        if init:
            init = False
            header = is_colon(line.rstrip())
        elif header:
            # if multi-line, keep collecting until closing @@@-line
            if ml_key:
                if line.strip() == '@@@':
                    f_temp = f_temp.replace('<#_{}_#>'.format(ml_key), ml_val)
                    ml_key = ''
                    ml_val = ''
                else:
                    ml_val += line
                continue
            # process KEY: Value pair
            line = line.strip()
            if is_colon(line):
                header = False
                continue
            key, val = line.split(':', 1)
            key = key.rstrip()
            val = val.lstrip()
            if val == '@@@':
                ml_key = key  # start multi-line
            else:
                f_temp = f_temp.replace('<#_{}_#>'.format(key), val)
        if not header:
            f_md += line

with open(src + '.tmp', 'w') as f:
    f.write(f_md)

print(f_temp)

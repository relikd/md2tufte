#!/usr/bin/env python3
import os
import sys

if len(sys.argv) != 3:
    print('  usage: script {template-tmp-file} {body-file}')
    exit(1)

temp = sys.argv[1]
body = sys.argv[2]
if not os.path.isfile(temp) or not os.path.isfile(body):
    print('Error: file does not exist')
    exit(1)

f_temp = ''
f_body = ''
with open(temp, 'r') as f:
    f_temp = f.read()
with open(body, 'r') as f:
    f_body = f.read()
with open(body, 'w') as f:
    f.write(f_temp.replace('<#_BODY_#>', f_body))

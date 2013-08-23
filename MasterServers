#!/usr/bin/env python

from os import *
from fnmatch import fnmatch
from shutil import copy2 as copy

mask = '*aster*'
start_dir = '.'
orig_file = 'script.py'

def walk(dir, mask):
    result = []
    for file in listdir(dir):
        file_path = path.join(dir, file)
        if path.isfile(file_path):
            if fnmatch(file_path, mask):
                result.append(file_path)
        else:
            walk(path)
    return result

files = walk(start_dir, mask)
for i in files:
    copy(orig_file, i)

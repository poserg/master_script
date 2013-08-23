#!/usr/bin/env python
# -*- coding: utf-8 -*-

from os import *
from fnmatch import fnmatch
from shutil import copy2 as copy

# Файл на который нужно все заменить
orig_file = 'MasterServer.vdf'

# Заменяемые файлы
mask2 = ['rev_MasterServers', 'MasterServers2', 'MasterServers']

# Начальная директория для поиска
start_dir = '.'

def walk(dir, mask):
    result = []
    for file in listdir(dir):
        file_path = path.join(dir, file)
        if path.isfile(file_path):
            for m in mask:
                if m == file and m != orig_file:
                    result.append(file_path)
                    break
        else:
            result += walk(file_path, mask)
    return result

if path.exists(orig_file):
    files = walk(start_dir, mask2)
    for i in files:
        copy(orig_file, i)
        print 'Updated ' + i

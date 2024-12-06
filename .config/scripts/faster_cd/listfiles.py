#!/bin/python3
import os

home = '/home/Sahil/'

def get(folder):
    for x in os.scandir(folder):
        if x.is_dir() and not x.name.startswith("."):
            print(x.path)

def get_folders():
    return [ home, home + "programing/", home + "programing/rust/", home + ".config/", home + "dotfile", home + "programing/frontend", home + "programing/C", home + "GitClones/", home + "programing/cpp", home + "programing/Assemblyyyy" ]

folders = get_folders()

for f in folders:
    get(f)

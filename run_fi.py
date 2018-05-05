#!/usr/bin/env python

# Runs our top level program against the relevant tests 
# Needs to be written in Python or Bash
# Validates results against the expected output from our program.
import os
import subprocess
import sys
from os.path import basename

#call make to create topelevel.native
command = "make"
os.system(command)

#get file name/path from args:
if len(sys.argv) != 2:
    print("please provide a file name")
    exit()
filepath = sys.argv[1]
name_only = sys.argv[1][:len(filepath) - 3]

#check that file type is fi:
if not filepath.endswith(".fi"):
    print("please provide a Fi file")
    exit()

"""
if we're here than we can start the compiling process 
"""

# create llvm file	
command = "./toplevel.native {}.fi > {}.ll".format(name_only,name_only)
os.system(command)
#print("./toplevel.native helloworld.fi > helloworld.ll")

#create .s file
command  = "llc {}.ll > {}.s".format(name_only,name_only)
os.system(command)
#print("llc helloworld.ll > helloworld.s")

#create exe file:
command = "gcc -o {}.exe {}.s ~/plt/custom_funcs.o -lm".format(name_only, name_only)
os.system(command)
#print("cc -o helloworld.ext helloworld.s")

command = "./{}.exe".format(name_only)
os.system(command)


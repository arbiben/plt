#!/usr/bin/env python

# Runs our top level program against the relevant tests 
# Needs to be written in Python or Bash
# Validates results against the expected output from our program.
import os
import subprocess
import sys
from os.path import basename

#this should always be 10 -- geting the number of files in the dir
DIR = './tests'

#call make to create topelevel.native
command = "make"
os.system(command)

#get file name/path from args:
if len(sys.argv) != 2:
    print("please provide a file name")
    exit()
filepath = sys.argv[1]

#check if file exists:
if not os.path.isfile(filepath) and not os.path.isfile("{}/{}".format(DIR, filepath)): 
    print("file \"{}\" does not exist in direcotory \"{}\"".format(filepath, DIR))
    exit()

#check that file type is fi:
if not filepath.endswith(".fi"):
    print("please provide a Fi file")
    exit()

#get file name from path:
bn = basename(filepath)
name_only = DIR + "/" + os.path.splitext(bn)[0]

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

#create output file:
command = "./{}.exe > {}.out".format(name_only, name_only)
os.system(command)

"""
#print out file:
command = "cat helloworld.out"
os.system(command)
"""
#compare output of file to ref output
command = "echo diff -b  {}.out {}.ref > {}.diff 1>&2"
os.system(command)

#check for difference 
ref = open('{}.ref'.format(name_only), 'r').read()
out = open('{}.out'.format(name_only), 'r').read()
if ref == out:
    print("OK")
else:
    print("FAILED {}.out differs from {}.ref".format(name_only, name_only))

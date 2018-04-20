# Runs our top level program against the relevant tests 
# Needs to be written in Python or Bash
# Validates results against the expected output from our program.
import os
import subprocess

#this should always be 10 -- geting the number of files in the dir
DIR = './'

#call make to create topelevel.native
#command = "make"
#os.system(command)

# create llvm file	
command = "./toplevel.native helloworld.fi > helloworld.ll"	
os.system(command)
#print("./toplevel.native helloworld.fi > helloworld.ll")

#create .s file
command  = "llc helloworld.ll > helloworld.s"
os.system(command)
#print("llc helloworld.ll > helloworld.s")

#create exe file:
command = "gcc -o helloworld.exe helloworld.s ~/plt/custom_funcs.o -lm"
os.system(command)
#print("cc -o helloworld.ext helloworld.s")

#create output file:
command = "./helloworld.exe > helloworld.out"
os.system(command)

#print out file:
command = "cat helloworld.out"
os.system(command)

"""
#compare output of hello world to ref output
command = "diff -b helloworld.out ref > diff.out"
os.system(command)
"""

"""
ref = open('ref', 'r').read()
out = open('helloworld.out', 'r').read()
if ref == out:
    print("success")
else:
    print("failure")
"""

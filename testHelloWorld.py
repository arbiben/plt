# Runs our top level program against all ./tests 
# Needs to be written in Python or Bash
# Validates results against the expected output from our program.
import os
import subprocess

#this should always be 10 -- geting the number of files in the dir
DIR = './'

#call make to create topelevel.native
command = "make"
os.system(command)

# create llvm file	
command = "./toplevel.native helloworld.fi > helloworld.ll"	
os.system(command)
#print("./toplevel.native helloworld.fi > helloworld.ll")

#create .s file
command  = "llc helloworld.ll > helloworld.s"
os.system(command)
#print("llc helloworld.ll > helloworld.s")

#create exe file:
command = "cc -o helloworld.exe helloworld.s"
os.system(command)
#print("cc -o helloworld.ext helloworld.s")

#create output file:
command = "./helloworld.exe > helloworld.out"
os.system(command)

#print out file:
command = "cat helloworld.out"
os.system(command)


#compare output of hello world to ref output
command = "diff -b helloworld.out ref.out > diff.out"
os.system(command)

""" 
	v = open('test{}.out'.format(i), 'rb').read() == open('./tests/postest{}.out'.format(i), 'rb').read()
	print("postest{} validated: {}".format(i,v))
	command = "rm ./test{}.out".format(i)
	os.system(command)
    
   
"""

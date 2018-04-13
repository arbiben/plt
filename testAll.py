
# Runs our top level program against the relevant tests 
# Validates results against the expected output from our program.
import sys, os
import subprocess

dirName = './tests'
#this program can accept either one or zero command line arguments
if len(sys.argv) == 0:
    #call make to create topelevel.native
    command = "make"
    os.system(command)
    runAll()
elif len(sys.argv) == 1:
    command = "make"
    os.system(command)
    comp(sys.argv(1))
else:
    print("please provide either 0 or 1 arguments")
    sys.exit(1)
#####################################################################

#compile given file
def comp(filename):
    # create llvm file	
    command = "./toplevel.native {}.fi > {}.ll".format(filename, filename)
    os.system(command)
    #print("./toplevel.native helloworld.fi > helloworld.ll")

    #create .s file
    command  = "llc {}.ll > {}.s".format(filename, filename)
    os.system(command)
    #print("llc helloworld.ll > helloworld.s")

    #create exe file:
    command = "cc -o {}.exe {}.s".format(filename, filename)
    os.system(command)
    #print("cc -o helloworld.ext helloworld.s")

    #create output file:
    command = "./{}.exe > {}.out".format(filename, filename)
    os.system(command)

    #print out file:
    #command = "cat {}.out".format(filename)
    #os.system(command)


    #compare output of file to ref output
    command = "diff -b {}.out {}_ref > diff_{}.out".format(filename)
    os.system(command)

	
    ref = open('{}_ref'.format(filename), 'r').read()
    out = open('{}.out'.format(filename), 'r').read()
    if ref == out:
        print("success")
    else:
        print("failure")

#loop thru all files in a dir
def runAll():
    for f in os.listdir(dirName):	
        comp(f)


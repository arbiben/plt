
# Runs our top level program against the relevant tests 
# Validates results against the expected output from our program.
import sys, os
import subprocess
from os.path import basename

# now you can call it directly with basename
dirname = './tests'
#compile given file
def comp(filename):

    print("*******************************************")
    print("compiling file: \"{}\" in directory: \"{}\"".format(filename,dirname))
    
    # create llvm file	
    command = "./toplevel.native {}/{}.fi > {}/compiled/{}.ll".format(dirname, filename, dirname, filename)
    print(command)
    os.system(command)
    
    #create .s file
    command  = "llc {}/compiled/{}.ll > {}/compiled/{}.s".format(dirname,filename,dirname,filename)
    print(command)
    os.system(command)
    
    #create exe file:
    command = "cc -o {}/compiled/{}.exe {}/compiled/{}.s".format(dirname,filename,dirname,filename)
    print(command)
    os.system(command)

    #create output file:
    command = "{}/compiled/{}.exe > {}/compiled/{}.out".format(dirname,filename,dirname,filename)
    print(command)
    os.system(command)

    #print out file:
    command = "cat {}/compiled/{}.out".format(dirname,filename)
    os.system(command)
    print("")


    #compare output of file to ref output
    #command = "diff -b {}.out {}_ref > diff_{}.out".format(filename)
    #os.system(command)
	
    #ref = open('{}_ref'.format(filename), 'r').read()
    #out = open('{}.out'.format(filename), 'r').read()
    #if ref == out:
        #print("success")
    #else:
        #print("failure")


#loop thru all files in a dir
def runAll():
    for f in os.listdir(dirname):	
        if not os.path.isdir(f):
            comp(os.path.splitext(basename(f))[0])

######################################################################

#this program can accept either one or zero command line arguments
if len(sys.argv) == 1:
    #call make to create topelevel.native
    print("no argumnets provided")
    command = "make"
    os.system(command)
    #clean everything before we start
    command = "rm -rf ./tests/compiled/*.s ./tests/compiled/*.ll ./tests/compiled/*.out ./tests/compiled/*.exe"
    os.system(command)
    #run on all files in tests direcotry 
    runAll()

elif len(sys.argv) == 2:
    print("one arg provided")
    #call make to create topelevel.native
    command = "make"
    os.system(command)
    #test only one file 
    command = "rm -rf ./tests/compiled/*.s ./tests/compiled/*.ll ./tests/compiled/*.out ./tests/compiled/*.exe"
    os.system(command)
    comp(os.path.splitext(basename(sys.argv[1]))[0])

else:
    print("please provide either 0 or 1 arguments")
    sys.exit(1)
#####################################################################

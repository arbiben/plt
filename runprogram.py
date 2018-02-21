# Runs our top level program against all ./tests 
# Needs to be written in Python or Bash
# Validates results against the expected output from our program.
import os
import subprocess

#this should always be 10 -- geting the number of files in the dir
DIR = './tests'
length = len([name for name in os.listdir(DIR) if name.endswith('.fi') and os.path.isfile(os.path.join(DIR, name))])

#half of the files are positive tests
for i in range(1,int (length/2)+1):
	command = "./toplevel.native ./tests/postest{}.fi > test{}.out".format(i,i)
	os.system(command)
	v = open('test{}.out'.format(i), 'rb').read() == open('./tests/postest{}.out'.format(i), 'rb').read()
	print("postest{} validated: {}".format(i,v))
	command = "rm ./test{}.out".format(i)
	os.system(command)

#half of the files are negative tests
for i in range(1,int (length/2)+1):
	command = "./toplevel.native ./tests/negtest{}.fi".format(i)
	error = subprocess.Popen(command, stderr=subprocess.PIPE, stdout=subprocess.PIPE, shell=True)
	out, error = error.communicate()
	v = error == open('./tests/negtest.out', 'rb').read()
	print("negtest{} validated: {}".format(i,v))

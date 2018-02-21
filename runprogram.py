# Runs our top level program against all ./tests 
# Needs to be written in Python or Bash
# Validates results against the expected output from our program.
import os
import subprocess

for i in range(1,6):
	command = "./toplevel.native ./tests/postest{}.fi > test{}.out".format(i,i)
	os.system(command)
	v = open('test{}.out'.format(i), 'rb').read() == open('./tests/postest{}.out'.format(i), 'rb').read()
	print("postest{} validated: {}".format(i,v))
	command = "rm ./test{}.out".format(i)
	os.system(command)


for i in range(1,6):
	command = "./toplevel.native ./tests/negtest{}.fi".format(i)
	error = subprocess.Popen(command, stderr=subprocess.PIPE, stdout=subprocess.PIPE, shell=True)
	out, error = error.communicate()
	v = error == open('./tests/negtest.out', 'rb').read()
	print("negtest{} validated: {}".format(i,v))

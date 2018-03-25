# Team Fi's PLT Repo

Or Aboodi oda2102@columbia.edu

Geffen Huberman gh2434@columbia.edu

Tomer Aharoni ta2453@columbia.edu

Ben Arbib ba2490@columbia.edu

This is our GitHub repo for the PLT project, Spring 2019


### How to compile and execute our compiler
	- Go inside in the main directory (inside the Fi directory: /Fi/)
	- Make sure you have all the ocaml packages installed: ocamlbuild in particular
        - Make sure you have llvm.3.8 installed (that's version 3.8 of llvm)
        - For the testing script also make sure you have python installed on your system (either 2.7 or 3 should work but 3 is prefred)
	- You can either run each part of our code manually or run eveything together using the 
          Makefile we have provided. --> The python script, "testHelloWorld.py" will also run 'make'
        - Makefile commands:
                - 'make' will build all of our language files
                - 'make toplevel.native' is equal to running 'ocamlbuild toplevel.native'. 
                   This will build all of our language files without running the python script.
                   (or alternativly just 'make toplevel.native'). This command will only run the aforementioned python script.
	- To run the compiler on any program from that same directory, run: ./toplevel.native <yourfilehere> (this will create an llvm .ll file)

### To compile and run helloworld.fi, you must either compile manually (details below), or, run our test script --> testHelloWorld.py. 
        - You must have llvm.3.8 installed 
        - For our test script, make sure you have python 2.7 or 3.* installed. You can use both for our script but it's better to use v.3
	- Go inside the same directory (the main one) as the compiler instructions above explain

        * To run using the script:
	- Run the following command: python3 testHelloWorld.py (can also run python testHelloWorld.py)
        - The script will first run 'make' to create our toplevel.native
        - Then, in turn, the script will compile helloworld.fi and finally run it
        - It will then print its output which should be "hello world" and validate it by comparing it to a read-only reference file which contains the required output. If the reference file equals the output file then the script will print sucess. Otherwise it will print fail 
        - Any differences in the output will be printed into a file called 'diff.out'. If after running the script this file is not empty then there's an error.
        - Additionally, we do expect to see the actual quotes in "hello world", and we will take care of that at a later point

        * To run manually, enter the following commands in the following order:
        1) 'make'
        2) './toplevel.native helloworld.fi > helloworld.ll'
        3) 'cc -o helloworld.exe helloworld.s'
        4) 'helloworld.exe > helloworld.out'
        5) 'diff helloworld.out ref > diff.out' (you can also cat diff.out to make sure it's empty)

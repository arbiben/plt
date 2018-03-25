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
        - and, for the testing script also Make sure you have python installed on your system (either 2.7 or 3 should work but 3 is prefred)
	- You can either run each part of our code manually or run eveything together using the 
          Makefile we have provided. --> They python script, "testHelloWorld.py" will also run 'make'
        - Makefile commands:
                - 'make' will build all of our language files
                - 'make toplevel.native' is equal to running 'ocamlbuild toplevel.native'. 
                   This will build all of our language files without running the python script.
                   (or alternativly just 'make toplevel.native'). This command will only run the aforementioned python script.
                - you can also use make to build each of our language files sepeartly by typing the command 'make <FILENAME>'. It will use ocamllex for the scanner, ocamlyacc for the parser, and ocamlc -c for any file that is either an .ml or .mli file   
	- To run the compiler on any program from that same directory, run: ./toplevel.native <yourfilehere> (this will create and llvm .ll file)

### To comile and run helloworld.fi, you must run our test script --> testHelloWorld.py. To do so:
        - You must have llvm.3.8 installed 
        - Make sure you have python 2.7 or 3.* installed. You can use both for our scripti but it's better to use v.3
	- Go inside the same directory as the compiler instructions explain
	- run the following command: python3 testHelloWorld.py (can also run python testHelloWorld.py)
        - the script will first run 'make' create our toplevel.native
        - then, in turn, the script will compile helloworld.fi and finally run it
        - it will then print it's output which should be "hello world" and validate it by  comparing it to a read-only reference file which contains the required output.  
        - Any differences will be printed into a file called 'diff.out'. If after running the script this file is not empty then there's an error

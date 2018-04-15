# Team Fi's PLT Repo

Or Aboodi oda2102@columbia.edu

Geffen Huberman gh2434@columbia.edu

Tomer Aharoni ta2453@columbia.edu

Ben Arbib ba2490@columbia.edu

This is the README for the GitHub repo of Team Fi's PLT project, Spring 2019


### Prereqs for using our compiler
	- Go inside in the main directory (inside the Fi directory: /Fi/)
	- Make sure you have all the ocaml packages installed: ocamlbuild in particular
        - Make sure you have llvm.3.8 installed (that's version 3.8 of llvm)
        - Make sure you can run Bash scripts on your shell
        - If you want to execute the compiler on one specific file, make sure to have python installed on your system.

### Automatically Compiling our compiler and executing the compiler using a script
        - To run the compiler automatically on all of our tests:
                1. Run 'make', which compiles the compiler, and produces a .native file
                2. Run './testall.sh', and you should see the validation for each test by seeing an 'ok'
                   What this does: For each file in our tests folder, this script then:
                        - runs an automatic process which produces an ll file, links the code, and executes the executable
                        - validates the output against a gold standard and confirms the results are the same
        - To run the compiler automatically against one specific test, run 'python testAll.py <filename>'
                - This does all of the above, just only on one specific file and does not validate the output
                - However, it will show the compilation steps and the output of your program

### Compiling the compiler separately from running the script, using the makefile
        - running 'make' will build all of our language files, effectively compiling our compiler.
        - running 'make toplevel.native' is equal to running 'ocamlbuild toplevel.native'. 
        - The result of compiling the compiler is a toplevel.native file.
        - When run against an argument, which needs to be a .fi file, toplevel.native outputs the llvm associated with that file

### Steps to manually execute our compiler on a specific file 
        * To execute the compiler manually on your own fi program, enter the following commands in the following order:
        1) 'make' (this will compile the compiler)
        2) './toplevel.native <yourfilename>.fi > <yourfilename>.ll' (this will create an llvm .ll file) 
                Note: <yourfilename> represents the location + name of your file. For example,
                      if your .fi file is in fi/tests and is called test_me.fi, then <yourfilename> 
                      will be ./tests/test_me 
        3) 'cc -o <yourfilename>.exe <yourfilename>.s' (this will link your code and produce a .exe file)
        4) '<yourfilename>.exe' (this will run the .exe file and produce your output)

### Descriptions for each test
        Positive tests:
                Note: * before the number indicates a test for something that is not in microc
                If a test needs to output something, we specify so. Otherwise, it simply needs to run without error
        1) print_int.fi: tests that our program prints "1" using the print() function
        *2) print_string.fi: tests that our program prints "hello world" using the printstring() function
        3) if.fi: tests that an if statement can be run, that the 'is' boolean condition works, and prints a "1"
        *4) define_struct.fi: tests that a new struct type can correctly be defined globally without error
        *5) declare_struct.fi: tests that a struct type can be declared as a variable locally without error
        *6) assign_struct.fi: tests that a struct variable can have one of its field's assigned to without error
        *7) access_struct.fi: tests that a struct field that has been assigned to can be accessed without error, then prints a "1"

        Negative tests:
        1) unop_err.fi: tests that a sematic error results when a unop operator is applied to a string, which is the wrong type
        2) binop_err.fi: tests that a sematic error results when a binop operator is applied to a string, which is the wrong type
        3) scope_err.fi: tests that a semantic error results when a variable is named without being declared first

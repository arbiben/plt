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
                1. Run `make`, which compiles the compiler, and produces a .native file
                2. Run './testall.sh', and you should see the validation for each test by seeing an 'ok'
                   What this does: For each file in our tests folder, this script then:
                        - runs an automatic process which produces an ll file, links the code, and executes the executable
                        - validates the output against a gold standard and confirms the results are the same
        - To run the compiler automatically against one specific test, run 'python run_fi.py <filename>'
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
        3) 'gcc -o <yourfilename>.exe <yourfilename>.s <absolute/relative_path_to>custom_funcs.o -lm' 
		(this will link your code and produce a .exe file)
        4) '<yourfilename>.exe' (this will run the .exe file and produce your output)

### Descriptions for each test
        Positive tests:
                If a test needs to output something, we specify so. Otherwise, it simply needs to run without error
        1) test-print_int.fi: tests that our program prints "1" using the print() function
        2) test-print_string.fi: tests that our program prints "hello world" using the printstring() function
        3) test-if.fi: tests that an if statement can be run, that the 'is' boolean condition works, and prints a "1"
        4) test-define_struct.fi: tests that a new struct type can correctly be defined globally without error
        5) test-declare_struct.fi: tests that a struct type can be declared as a variable locally without error
        6) test-assign_struct.fi: tests that a struct variable can have one of its field's assigned to without error
        7) test-access_struct.fi: tests that a struct field that has been assigned to can be accessed without error, then prints a "1"
        8) test-array_scope.fi: tests that an array can be declared globally and assigned locally, or assigned and declared locally
        9) test-assign_arr.fi: tests filling struct arrays only partially and printing their contents/default values; prints (null)2 0arrays :) 
        10) test-for-loop-read.fi: tests looping through an array of file names, reading the contents of each and prints them out; prints Hello I am a sentence composed out of ten files
        11) test-global-string.fi: tests declaring global string variables and using them across multiple functions; prints hello WORLD
        12) test-global_struct.fi: test declaring struct as a global variable
        13) test-helloworld.fi: the original helloworld testing file that will print helloworld
        14) test-pass_intarray.fi: tests passing an array of integers to a function, modifying its contents, and returns. pritns: 2should be 33
        15) test-pass_struct.fi: tests passing a struct and returning it changed; prints huberman6
        16) test-read-to-array.fi: tests reading contents of a file into an array of strings that is a member of a struct; prints blue
        17) test-rwr.fi: tests different string manipulations with different files; prints Original File: ThiS IS A StrinG
Lower Case File: this is a string
Upper Case File: THIS IS A STRING
        18) test-struct_decls.fi: tests passings structs and arrays into functions; prints hello!/nyo!!!/n7hihi/nyo!!!/n
        19) test-struct_scope.fi: testing creation of global and local structs and the infunction assignment of their fields; prints expecting 55expecting 33
        20) test-write-blank.fi: tests writing an empty string into a nonexistent test file; expects an output of an empty new file write_example.txt
        21) test-write.fi: tests writing a string into a nonexistent file; expects an output file write_example.txt containing the string "Hello World!"
  
        Negative tests:
        1) fail-unop_err.fi: tests that a sematic error results when a unop operator is applied to a string, which is the wrong type
        2) fail-binop_err.fi: tests that a sematic error results when a binop operator is applied to a string, which is the wrong type
        3) fail-scope_err.fi: tests that a semantic error results when a variable is named without being declared first
        4) fail-struct_strcts.fi: testing if structs of structs can be created and assigned to. result: can be created but not assigned to

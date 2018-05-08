#!/bin/bash
dir="~/plt/tests/*"
for file in ~/plt/tests/*.fi
do
    filebname="$(basename $file)"
    if [ -f "$file" ]
    then
        echo "Echoing: $filebname" 
        echo "File: $filebname" >> "tests.doc"
        cat "$file" >> "tests.doc"
        echo "--------------------------------" >> "tests.doc"
    fi
done


#!/bin/bash
dir="~/plt/tests/*"
for file in ~/plt/tests/*.out
do
    filebname="$(basename $file)"
    if [ -f "$file" ]
    then
        echo "$filebname:" 
        echo "Expected Output:"
        cat "$file"
        echo "
        "
        echo "---------------------------------------------------------------"
    fi
done

for file in ~/plt/tests/*.err
do
    filebname="$(basename $file)"
    if [ -f "$file" ]
    then
        echo "$filebname:" 
        echo "Expected Output:"
        cat "$file"
        echo "
        "
        echo "---------------------------------------------------------------"
    fi
done


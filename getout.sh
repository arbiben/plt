#!/bin/bash
dir="~/plt/tests/*"
for file in ~/plt/tests/*.fi
do
    filebname="$(basename $file)"
    if [ -f "$file" ]
    then
        echo "File: $filebname" >> files.doc
        cat "$file" >> files.doc
        echo "---------------------------------------------------------------" >> files.doc
        echo "Expected Output:" >> files.doc
        tmp1=$(echo "$file" | sed 's/.fi/.out/')
        tmp2=$(echo "$file" | sed 's/.fi/.err/')
        cat $tmp1 >> files.doc 2>/dev/null
        cat $tmp2 >> files.doc 2>/dev/null

        echo "---------------------------------------------------------------" >> files.doc
    fi
done


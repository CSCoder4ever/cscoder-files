#!/bin/bash

# Bash script written to compile java in Emacs

if [[ "$1" == "-h" || "$1" == "-H" || "$1" == "--help" || "$1" == "--Help" ]]; then
    echo "Usage: emacsjavac [ options ]"
    echo 
    echo "options: "
    echo "-x                  compile and execute java swing program."
    echo "-h, --help          you are here."
    echo "-a, --all-files     compile all files in directory and execute selected file."
    echo "-ax, --allx-files   compile all java swing files in directory and execute selected file."
    echo "-c, --compile-only  compile all java files only."
    exit
fi

if [[ "$1" == "-x" || "$1" == "-X" ]]; then
    [ -f "$(basename $2 .java).class" ] && rm $(basename $2 .java).class
    echo "Compiling $2 ... "
    javac $2
    echo "Executing Java Swing program ... "
    java $(basename $2 .java) 
    exit 0
fi

if [[ "$1" == "-a" || "$1" == "-A" || "$1" == "--all-files" ]]; then
    for classFile in *.class
    do
	rm $classFile
    done
    
    for file in *.java
    do
	echo "Compiling $file ... "
	javac $file
    done

    echo "-----------OUTPUT-----------"
    java $(basename $2 .java)
    exit
fi

if [[ "$1" == "-a" || "$1" == "-A" || "$1" == "--all-files" ]]; then
    for classFile in *.class
    do
	rm $classFile
    done
    
    for file in *.java
    do
	echo "Compiling $file ... "
	javac $file
    done

    echo "-----------OUTPUT-----------"
    java $(basename $2 .java)
    exit
fi

if [[ "$1" == "-c" || "$1" == "-C" || "$1" == "--compile-only" ]]; then
    for classFile in *.class
    do
	rm $classFile
    done 
    
    for file in *.java
    do
	echo "Compiling $file ... "
	javac $file
    done

    echo "Completed ... "
    exit
fi

[ -f "$(basename $1 .java).class" ] && rm $(basename $1 .java).class
echo "$(basename $1 .java).class"

echo "Compiling $1 ... "
javac $1

echo "-----------OUTPUT-----------"
java $(basename $1 .java)

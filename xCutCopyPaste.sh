#!/bin/bash

# If you are changing this, use absolute path
STOREFILE=~/.store

xcut () {
    echo mv > $STOREFILE
    echo `pwd` >> $STOREFILE
    for var
    do
        echo $var >> $STOREFILE;
    done
}

xcopy () {
    echo cp > $STOREFILE
    echo `pwd` >> $STOREFILE
    for var
    do
        echo $var >> $STOREFILE;
    done
}

xpaste () { 
    OLD_IFS=$IFS
    IFS=$'\n'
    store=($(cat $STOREFILE))
    IFS=$OLD_IFS

    if [ "${#store[@]}" -lt 2 ]
    then
        echo "Sorry, nothing to paste" 1>&2
        return
    fi

    cmd="${store[0]}" 
    path="${store[1]}"

    if [ "$1" == "--peek" ]
    then
        echo "$cmd:"
        for file in "${store[@]:2}"
        do
            echo "$path/$file"
        done
        return
    fi

    for file in "${store[@]:2}"
    do
        $cmd "$path/$file" .
    done

    # Empty the store file, so that successive xpaste fails
    > $STOREFILE
}

# The export fails if there is an alias
# Be rude, and override alias
unalias xcut 2>/dev/null
unalias xcopy 2>/dev/null
unalias xpaste 2>/dev/null
export -f xcut
export -f xcopy
export -f xpaste


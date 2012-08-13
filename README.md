x-cut-copy-paste
================

cut, copy, paste the ''x'' way in bash

why?
===
I use multiple terminal sessions and often have to copy/move the files around.  
Using cp/mv commands is tedious since i have to type in the whole path to the file while the file in question is right there in the cwd on some terminal window.  
So, i wrote these little wrappers to cut copy and paste in the x way.  

Basically, you can do `xcopy <somefile>` in some directory in some terminal window, and then go to some other terminal window maybe and just do `xpaste` to copy somefile there.
Easy enough i guess.  

Tip: Use `xpaste --peek` to see what operation you`re about to do, just in case!  

usage
=====
1. Clone the xCutCopyPaste.sh to your home directory (your call)  
2. Rename to .xCutCopyPaste.sh (your call again)  
3. Add the following lines to your .bashrc:  
```
    if [ -f ~/.xCutCopyPaste.sh ]; then
        . ~/.xCutCopyPaste.sh
    fi
```
4. Use the xcut, xcopy and xpaste commands  
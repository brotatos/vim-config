#!/bin/bash
# Sets up the appropriate symlinks for the config files located here
#ln -s source_file link_name

files=('vimrc' 'vim')

for i in "${files[@]}"; do
   rm -r ~/.$i
   ln -s $PWD/$i ~/.$i
done

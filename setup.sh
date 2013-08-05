#!/bin/bash
files=('vimrc' 'vim')

git submodule init && git submodule update

for i in "${files[@]}"; do
   rm -r ~/.$i
   ln -s "$PWD/$i" ~/."$i"
done

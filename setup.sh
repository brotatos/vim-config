#!/bin/bash
files=('vimrc' 'vim')

for i in "${files[@]}"; do
   rm -r ~/."$i"
   ln -sf "$PWD/$i" ~/."$i"
done

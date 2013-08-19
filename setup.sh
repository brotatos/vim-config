#!/bin/bash
files=('vimrc' 'vim')

git submodule init && git submodule update

cd vim/bundle/vundle
git pull origin master
cd -

for i in "${files[@]}"; do
   rm -r ~/."$i"
   ln -sf "$PWD/$i" ~/."$i"
done

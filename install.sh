#!/bin/sh
cd $(dirname $0)

# install vundle.git
#git clone http://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

# create symbolic link
for dotfile in $(ls)
do
    if [ $dotfile != '..' ] && [ $dotfile != '.git' ] && [ $dotfile != '.gitignore' ] &&
       [ $dotfile != 'README.md' ] && [ $dotfile != 'install.sh' ]
    then
        echo "linking $HOME/.$dotfile to $PWD/$dotfile"
        ln -Fis "$PWD/$dotfile" "$HOME/.$dotfile"
    fi
done

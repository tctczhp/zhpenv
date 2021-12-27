#/bin/bash

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

rm -rf  ~/.tmux.conf
rm -rf  ~/.vimrc

cp ./tmux.conf ~/.tmux.conf
cp ./vimrc ~/.vimrc
cp -r ./zhpbins ~

#!/bin/bash
set -e
ln -sf ~/.vim/vimrc ~/.vimrc
git submodule init
git submodule update

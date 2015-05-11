#!/usr/bin/env bash

source ./_config;
source ./homebrew;

# install vim
if ! brew ls | grep '^vim$' > /dev/null 2>&1; then
  echo "==> Installing Vim";
  brew install vim;
fi

# install vindle
if which vim > /dev/null 2>&1; then
  if [ ! -d ~/.vim/bundle/Vundle.vim ]; then
    echo "==> Installing Vundle";
    git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim;
    if [ -f ~/.vimrc ]; then
      vim +PluginInstall '+source ~/.vimrc' +qall;
    fi
  fi
fi
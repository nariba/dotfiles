#!/bin/bash

# emacs's symbolic link setting
if [ -e ${HOME}/.emacs.d ]; then
    mv ${HOME}/.emacs.d ${HOME}/.emacs.d_org && ln -s ${HOME}/dotfiles/emacs ${HOME}/.emacs.d || echo "Failed to make .emacs.d symbolic link."
else
     ln -s ${HOME}/dotfiles/emacs ${HOME}/.emacs.d
fi

if [ ! -e cask ]; then
    curl -fsSkL https://raw.github.com/cask/cask/master/go | python
    mv ${HOME}/.cask ${HOME}/dotfiles/cask
    ln -s ${HOME}/dotfiles/cask ${HOME}/.cask
    export PATH="${HOME}/.cask/bin:$PATH"
fi
if [ ! -e ${HOME}/.emacs.d/Cask ]; then
    cd ${HOME}/.emacs.d
    cask upgrade
    cask init
fi
cd ${HOME}/.emacs.d
cask install

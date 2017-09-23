#!/bin/bash

# emacs's symbolic link setting
if [ -e ${HOME}/.emacs.d ]; then
    mv ${HOME}/.emacs.d ${HOME}/.emacs.d_org && ln -s ${HOME}/dotfiles/emacs ${HOME}/.emacs.d || echo "Failed to make .emacs.d symbolic link."
else
     ln -s ${HOME}/dotfiles/emacs ${HOME}/.emacs.d
fi

# deploy git config files
if [ -e ${HOME}/.gitconfig ]; then
    mv ${HOME}/.gitconfig ${HOME}/.gitconfig_org
fi
ln -s ${HOME}/dotfiles/git/gitconfig ${HOME}/.gitconfig \
    || echo "Failed to deploy git config files."


# deploy zsh config files
curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh

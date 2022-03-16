#!/bin/zsh

git submodule init
git submodule update

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
export ZPLUG_HOME=${HOME}/dotfiles/zsh/zplug
source ${ZPLUG_HOME}/init.zsh

if [ -e ${HOME}/.zplug ]; then
    mv ${HOME}/.zplug ${HOME}/.zplug_org
fi
ln -s ${HOME}/dotfiles/zsh/zplug ${HOME}/.zplug \
    || echo "Failed to deploy zplug."

## deploy the prezto files
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
ln -s $HOME/.zplug/repos/sorin-ionescu/prezto $HOME/.zprezto

setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
    ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

if [ -e ${HOME}/.zshrc ]; then
    mv ${HOME}/.zshrc ${HOME}/.zshrc_org
fi
ln -s ${HOME}/dotfiles/zsh/zshrc ${HOME}/.zshrc \
    || echo "Failed to deploy zshrc."
rm -f .zshrc_org

# deploy lscolors config files
if [ -e ${HOME}/.dircolors ]; then
    mv ${HOME}/.dircolors ${HOME}/.dircolors_org
fi
ln -s ${HOME}/dotfiles/zsh/ls_colors/LS_COLORS ${HOME}/.dircolors \
    || echo "Failed to deploy lscolors config files."

# deploy tpm (tmux package manager) config files
if [ -e ${HOME}/.tmux ]; then
    mv ${HOME}/.tmux ${HOME}/.tmux_org
fi
mkdir -p ${HOME}/.tmux/plugins
ln -s ${HOME}/dotfiles/tmux/tpm ${HOME}/.tpm/plugins/tpm
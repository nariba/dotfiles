#!/bin/zsh

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
echo "source ~/.zplug/init.zsh" >> ${HOME}/.zshrc
echo "zplug \"sorin-ionescu/prezto\"" >> ${HOME}/.zshrc
echo "zplug load --verbose" >> ${HOME}/.zshrc
source ${HOME}/.zshrc
zplug install
rm ${HOME}/.zshrc
ln -s $HOME/.zplug/repos/sorin-ionescu/prezto $HOME/.zprezto

setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

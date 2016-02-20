##
#   ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

shopt -s checkwinsize
shopt -s autocd
shopt -s histappend
shopt -s histverify
shopt -s direxpand

# Set the correct terminal type
if [ -e /usr/share/terminfo/x/xterm-256color ] && [ "$COLORTERM" == "xfce4-terminal" ]; then
    export TERM=xterm-256color
fi

# Prompt
if [ ${UID} -eq 0 ]; then
    PS1='\[\e[0;31m\]\u\[\e[m\]:\[\e[0;33m\]\w\[\e[m\] # '
else
    PS1='\[\e[0;36m\]\u\[\e[m\]:\[\e[0;33m\]\W\[\e[m\] $ '
fi

# pkgfile command lookup
[ -e /usr/share/doc/pkgfile/command-not-found.bash ] && \
    . /usr/share/doc/pkgfile/command-not-found.bash

# Source aliases and user environment vars
[ -e ${HOME}/.env.sh ] && . ${HOME}/.env.sh

# Some more aliases
alias bashrc='$EDITOR $HOME/.bashrc && source $HOME/.bashrc'
alias zshrc='$EDITOR $HOME/.zshrc'


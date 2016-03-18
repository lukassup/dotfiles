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
if [ -e /usr/share/terminfo/x/xterm-256color ]; then
    [[ $COLORTERM =~ "(xfce4-|gnome-|mate-|lx)terminal" ]] && \
        export TERM=xterm-256color
fi

# Prompt
rst="$(tput sgr0)"
red="$(tput setaf 1)"
grey="$(tput setaf 7)"
bld="$(tput bold)"

PS1='$(RET=$? && (( $RET )) && echo '
PS1+='"\[$grey\][\[$rst\]\[$bld\]$RET\[$rst\]\[$grey\]]\[$rst\] ")'
[ $UID -eq 0 ] && PS1+='\[$red\]'
PS1+='\[$bld\]\u\[$rst\]\[$grey\]@\h:\[$rst\]'
[ $UID -eq 0 ] && PS1+='\w' || PS1+='\W'
PS1+=' \[$grey\]\$\[$rst\] '

# pkgfile command lookup
[ -e /usr/share/doc/pkgfile/command-not-found.bash ] && \
    . /usr/share/doc/pkgfile/command-not-found.bash

# Source aliases and user environment vars
[ -e ${HOME}/.env.sh ] && . ${HOME}/.env.sh

# Some more aliases
alias bashrc='$EDITOR $HOME/.bashrc && source $HOME/.bashrc'
alias zshrc='$EDITOR $HOME/.zshrc'


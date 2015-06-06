#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --group-directories-first'

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto --group-directories-first'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -AlF'
alias la='ls -A'
alias l='ls -CF'
alias pacman='pacman --color=auto'
alias sudo='sudo '

if [ ${UID} -eq 0 ]; then
        PS1='\[\e[0;31m\]\u\[\e[m\]:\[\e[1;34m\]\w\[\e[m\] \[\e[0;31m\]\$ \[\e[m\]'
else
        PS1='\[\e[0;36m\]\u\[\e[m\]:\[\e[1;34m\]\W\[\e[m\] \[\e[1;32m\]\$\[\e[m\] '
fi

# pkgfile command lookup
source /usr/share/doc/pkgfile/command-not-found.bash

export EDITOR="vim"

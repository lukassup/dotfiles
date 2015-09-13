#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

shopt -s checkwinsize

alias ls='ls --group-directories-first'

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto --group-directories-first'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias cp='cp -iv'
alias mv='mv -iv'
alias rm='rm -Iv'
alias rmdir='rmdir -v'
alias mkdir='mkdir -v'
alias ln='ln -v'
alias ll='ls -lAhF --time-style=+'
alias lll='ls -lAhF'
alias la='ls -A'
alias l='ls -CF'
alias pacman='pacman --color=auto'
alias sudo='sudo '
alias vi='vim'
alias pup='sudo pacman -Syu'
alias yup='yaourt -Syua'
alias vimrc='$EDITOR $HOME/.vimrc'
alias bashrc='$EDITOR $HOME/.bashrc && source $HOME/.bashrc'
alias zshrc='$EDITOR $HOME/.zshrc'

if [ ${UID} -eq 0 ]; then
        PS1='\[\e[0;31m\]\u\[\e[m\]:\[\e[0;33m\]\w\[\e[m\]# '
else
        PS1='\[\e[0;36m\]\u\[\e[m\]:\[\e[0;33m\]\W\[\e[m\]$ '
fi

# pkgfile command lookup
source /usr/share/doc/pkgfile/command-not-found.bash

export EDITOR="vim"
export BROWSER="firefox"

# Wine settings
export WINEPREFIX="$HOME/Wine"
export WINEARCH="win32"
export WINEDEBUG="-all"


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
alias cp='cp -iv' # safe+verbose copy
alias mv='mv -iv' # safe+verbose move
alias rm='rm -Iv' # safe+verbose delete (prompt once)
alias rmdir='rmdir -v'
alias mkdir='mkdir -v'
alias ln='ln -v'
alias ll='ls -AlF'
alias la='ls -A'
alias l='ls -CF'
alias pacman='pacman --color=auto'
alias sudo='sudo '
alias pup='sudo pacman -Syu'
alias yup='yaourt -Syua'   # if using yaourt
alias root='root -l'

if [ ${UID} -eq 0 ]; then
        PS1='\[\e[0;31m\]\u\[\e[m\]:\[\e[0;33m\]\w\[\e[m\]# '
else
        PS1='\[\e[0;36m\]\u\[\e[m\]:\[\e[0;33m\]\W\[\e[m\]$ '
fi

# pkgfile command lookup
source /usr/share/doc/pkgfile/command-not-found.bash

export EDITOR="vim"

export ROOTSYS=/usr                                                                                                                                           

if [ -z "${LD_LIBRARY_PATH}" ]; then
   LD_LIBRARY_PATH=/usr/lib/root; export LD_LIBRARY_PATH       # Linux, ELF HP-UX
else
   LD_LIBRARY_PATH=/usr/lib/root:$LD_LIBRARY_PATH; export LD_LIBRARY_PATH
fi

if [ -z "${PYTHONPATH}" ]; then
   PYTHONPATH=/usr/lib/root; export PYTHONPATH
else
   PYTHONPATH=/usr/lib/root:$PYTHONPATH; export PYTHONPATH
fi


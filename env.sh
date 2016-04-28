##
#   ~/.env.sh
#

# Global aliases

if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
    alias pacman='pacman --color=auto'
    alias ip='ip -c'

    man() {
        env LESS_TERMCAP_mb=$'\e[0m' \
        LESS_TERMCAP_md=$'\e[1;37m' \
        LESS_TERMCAP_me=$'\e[0m' \
        LESS_TERMCAP_se=$'\e[0m' \
        LESS_TERMCAP_so=$'\e[7;93m' \
        LESS_TERMCAP_ue=$'\e[0m' \
        LESS_TERMCAP_us=$'\e[3;94m' \
        man "$@"
    }
fi

alias cp='cp -iv'
alias mv='mv -iv'
alias rm='rm -Iv'
alias rmdir='rmdir -v'
alias mkdir='mkdir -v'
alias ln='ln -v'
alias ll='ls -lhF --time-style=+'
alias lll='ls -lAhF'
alias la='ls -A'
alias l='ls -CF'
alias sudo='sudo '
alias vi='$EDITOR'
alias vim='$EDITOR'
alias pacur='sudo pacman -Syu'
alias aurup='pacaur -Syu'
alias vimrc='$EDITOR $HOME/.vim/vimrc'

RBPATH="${HOME}/.gem/ruby/2.3.0/bin"
GOPATH="${HOME}/.go/bin"
PYPATH="${HOME}/.local/bin"
export PATH="${PYPATH}:${RBPATH}:${GOPATH}${PATH:+:${PATH}}"
export EDITOR="nvim"
export PAGER="less"
export LESS="-RSCi"
export BROWSER="firefox"

# Wine settings
export WINEPREFIX="$HOME/Wine"
export WINEARCH="win32"
export WINEDEBUG="-all"

# Workaround for Jython cache permission issue
export JYTHON_OPTS="-Dpython.cachedir=$HOME/.jythoncache"

# vim: set ft=sh syn=sh:

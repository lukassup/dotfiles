#
# ~/.zshrc
#

HISTFILE=$HOME/.zsh_history
HISTSIZE=1024
SAVEHIST=1024
setopt appendhistory autocd NO_BEEP
bindkey -e

zstyle :compinstall filename '$HOME/.zshrc'
zstyle ':completion:*' insert-tab false

autoload -Uz compinit promptinit colors
compinit
promptinit
colors

prompt custom

bindkey ';5D' emacs-backward-word
bindkey ';5C' emacs-forward-word

# create a zkbd compatible hash;
# to add other keys to this hash, see: man 5 terminfo
typeset -A key

key[Home]=${terminfo[khome]}
key[End]=${terminfo[kend]}
key[Insert]=${terminfo[kich1]}
key[Delete]=${terminfo[kdch1]}
key[Up]=${terminfo[kcuu1]}
key[Down]=${terminfo[kcud1]}
key[Left]=${terminfo[kcub1]}
key[Right]=${terminfo[kcuf1]}
key[PageUp]=${terminfo[kpp]}
key[PageDown]=${terminfo[knp]}

# setup key accordingly
[[ -n "${key[Home]}" ]] && bindkey "${key[Home]}" beginning-of-line
[[ -n "${key[End]}" ]] && bindkey "${key[End]}" end-of-line
[[ -n "${key[Insert]}" ]] && bindkey "${key[Insert]}" overwrite-mode
[[ -n "${key[Delete]}" ]] && bindkey "${key[Delete]}" delete-char
[[ -n "${key[Up]}" ]] && bindkey "${key[Up]}" up-line-or-history
[[ -n "${key[Down]}" ]] && bindkey "${key[Down]}" down-line-or-history
[[ -n "${key[Left]}" ]] && bindkey "${key[Left]}" backward-char
[[ -n "${key[Right]}" ]] && bindkey "${key[Right]}" forward-char
[[ -n "${key[PageUp]}" ]] && bindkey "${key[PageUp]}" history-beginning-search-backward
[[ -n "${key[PageDown]}" ]] && bindkey "${key[PageDown]}" history-beginning-search-forward

# Finally, make sure the terminal is in application mode, when zle is
# active. Only then are the values from $terminfo valid.
function zle-line-init () {
    echoti smkx
}
function zle-line-finish () {
    echoti rmkx
}
zle -N zle-line-init
zle -N zle-line-finish  

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
alias vi='vim'
alias pacman='pacman --color=auto'
alias sudo='sudo '
alias pup='sudo pacman -Syu'
alias yup='yaourt -Syua'
alias vimrc='$EDITOR $HOME/.vimrc'
alias bashrc='$EDITOR $HOME/.bashrc'
alias zshrc='$EDITOR $HOME/.zshrc && source $HOME/.zshrc'

source /usr/share/doc/pkgfile/command-not-found.zsh

export EDITOR="vim"
export BROWSER="firefox"

# Wine settings
export WINEPREFIX="$HOME/Wine"
export WINEARCH="win32"
export WINEDEBUG="-all"


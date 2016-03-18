##
#   ~/.zshrc
#

zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
zstyle ':completion:*' completions 1
zstyle ':completion:*' expand prefix
zstyle ':completion:*' glob 1
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' matcher-list '' 'r:|[._-]=* r:|=*' '' '+m:{[:lower:]}={[:upper:]}'
zstyle ':completion:*' max-errors 1
zstyle ':completion:*' preserve-prefix '//[^/]##/'
zstyle ':completion:*' prompt 'Correcting %e error(s)'
zstyle ':completion:*' select-prompt %SScrolling %p%s
zstyle ':completion:*' squeeze-slashes true
zstyle ':completion:*' substitute 1
#zstyle ':completion:*' insert-tab false
zstyle ':completion:*' rehash true
zstyle :compinstall filename '/home/lukas/.zshrc'

# Group matches and describe.
#zstyle ':completion:*:*:*:*:*' menu select=3
zstyle ':completion:*:matches' group 'yes'
zstyle ':completion:*:options' description 'yes'
zstyle ':completion:*:options' auto-description '%d'
zstyle ':completion:*:corrections' format ' %F{green}-- %d (errors: %e) --%f'
zstyle ':completion:*:descriptions' format ' %F{yellow}-- %d --%f'
zstyle ':completion:*:messages' format ' %F{purple} -- %d --%f'
zstyle ':completion:*:warnings' format ' %F{red}-- no matches found --%f'
zstyle ':completion:*:default' list-prompt '%S%M matches%s'
zstyle ':completion:*' format ' %F{yellow}-- %d --%f'
zstyle ':completion:*' group-name ''
#zstyle ':completion:*' verbose yes

zstyle ':vcs_info:*' enable git
#zstyle ':vcs_info:git*' formats '%s %f%r/%S %b %m%u%c '
zstyle ':vcs_info:git*' formats '%F{white}%s:%f%u%c%b%f %m '
zstyle ':vcs_info:git*' check-for-changes true
zstyle ':vcs_info:git*' stagedstr '%F{green}'
zstyle ':vcs_info:git*' unstagedstr '%F{yellow}'

autoload -Uz compinit vcs_info
compinit

HISTFILE=$HOME/.zsh_history
HISTSIZE=1024
SAVEHIST=1024
bindkey -e

# use share_history instead of setopt APPEND_HISTORY         # appends history to .zsh_history
setopt AUTO_CD                # cd if no matching command
setopt AUTO_PARAM_SLASH       # adds slash at end of tabbed dirs
setopt CHECK_JOBS             # check bg jobs on exit
setopt CORRECT                # corrects spelling
setopt CORRECT_ALL            # corrects spelling
setopt EXTENDED_GLOB          # globs #, ~ and ^
setopt EXTENDED_HISTORY       # saves timestamps on history
setopt GLOB_DOTS              # find dotfiles easier
setopt HASH_CMDS              # save cmd location to skip PATH lookup
setopt HIST_EXPIRE_DUPS_FIRST # expire duped history first
setopt HIST_NO_STORE          # don't save 'history' cmd in history
setopt INC_APPEND_HISTORY     # append history as command are entered
setopt LIST_ROWS_FIRST        # completion options left-to-right, top-to-bottom
setopt LIST_TYPES             # show file types in list
setopt MARK_DIRS              # adds slash to end of completed dirs
setopt SHARE_HISTORY          # share history between open shells
setopt PROMPT_SUBST           # sub values in prompt (though it seems to work anyway haha)
#setopt RM_STAR_WAIT           # pause before confirming rm *
#setopt NUMERIC_GLOB_SORT      # sort numerically first, before alpha
unsetopt BEEP
unsetopt HIST_BEEP
unsetopt LIST_BEEP

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
#function zle-line-init () {
#    echoti smkx
#}
#function zle-line-finish () {
#    echoti rmkx
#}
#zle -N zle-line-init
#zle -N zle-line-finish  

# zsh inline syntax highlighting
[ -e /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ] && \
    . /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# pkgfile command lookup
[ -e /usr/share/doc/pkgfile/command-not-found.zsh ] && \
    . /usr/share/doc/pkgfile/command-not-found.zsh
# Source aliases and user environment vars
[ -e ${HOME}/.env.sh ] && . ${HOME}/.env.sh

# Prompt
if [[ "$TERM" != "dumb" ]]; then
    PS1='%(?..%F{7}[%f%B%?%b%F{7}]%f )'
    PS1+='%B%(!.%F{1}.%F{reset})%n%f%b'
    PS1+='%F{7}@%m %(!.#.$)%f '
    precmd() { vcs_info }
    RPROMPT="\${vcs_info_msg_0_}%F{7}%~%f"
    export PS1 RPROMPT
else
    export PROMPT="%(?..[%?] )%n@%m:%~ %(!.#.$) "
fi

# More aliases
alias bashrc='$EDITOR $HOME/.bashrc'
alias zshrc='$EDITOR $HOME/.zshrc && source $HOME/.zshrc'


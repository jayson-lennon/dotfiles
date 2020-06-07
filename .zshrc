# Bulk rename utility
autoload -U zmv

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory autocd extendedglob nomatch notify
unsetopt beep
# Shift+tab
bindkey '^[[Z' reverse-menu-complete

zstyle :compinstall filename '/home/jayson/.zshrc'

autoload -Uz compinit
compinit

source ~/.profile
source /usr/share/zsh/share/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle pip
antigen bundle rust
antigen bundle cargo
antigen bundle colored-man-pages
antigen bundle command-not-found
antigen bundle extract
antigen bundle vi-mode
antigen bundle history

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting

# More completions
antigen bundle zsh-users/zsh-completions

# Autosuggest based on history
antigen bundle zsh-users/zsh-autosuggestions

# Tell Antigen that you're done.
antigen apply

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#7a7a7a"

set KEYTIMEOUT=1

# 'z' tool
set _Z_DATA=/home/jayson/data/sys/appdata/z
[[ -r "/usr/share/z/z.sh" ]] && source /usr/share/z/z.sh

# fzf
source /usr/share/fzf/key-bindings.zsh

# Prompt
eval "$(starship init zsh)"

# Aliases
source ~/.aliases

# Misc tools
source /home/jayson/.config/broot/launcher/bash/br
source <(navi widget zsh)

# Set cursor depending on mode
function zle-keymap-select zle-line-init zle-line-finish {
  case $KEYMAP in
    vicmd)      print -n -- "\E]50;CursorShape=2\C-G";; # underline
    viins|main) print -n -- "\E]50;CursorShape=0\C-G";; # block
  esac

  zle reset-prompt
  zle -R
}

zle -N zle-line-init
zle -N zle-line-finish
zle -N zle-keymap-select

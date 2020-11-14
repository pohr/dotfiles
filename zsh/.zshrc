# PATH
export PATH=/usr/local/bin:$PATH
[ -f $HOME/.zshrc_local ] && source $HOME/.zshrc_local

# Alias
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias vim='nvim'
alias vimrc='nvim ~/.config/nvim/init.vim'
alias zshrc='nvim ~/.zshrc'
alias sr="source ~/.zshrc"
alias p="python3"

# Changing directories
setopt auto_cd
setopt auto_pushd
unsetopt pushd_ignore_dups
setopt pushdminus

# Basic auto/tab complete
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# History
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=1000
setopt hist_ignore_all_dups
setopt hist_ignore_space

# Auto complete
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
setopt menu_complete

# Vim mode
bindkey -v
export KEYTIMEOUT=1
bindkey -a u undo
bindkey '^?' backward-delete-char
bindkey -M viins '^r' history-incremental-search-backward
bindkey -M vicmd '^r' history-incremental-search-backward

# Pure prompt
autoload -U promptinit; promptinit
prompt pure

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

# Changing directories
setopt auto_cd
setopt auto_pushd
unsetopt pushd_ignore_dups
setopt pushdminus

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

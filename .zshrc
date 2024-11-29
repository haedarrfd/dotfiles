# Store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download zinit
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"

# Source/load zinit
source "${ZINIT_HOME}/zinit.zsh"

# Syntax highlighting plugin
zinit light zsh-users/zsh-syntax-highlighting
# Completions plugin
zinit light zsh-users/zsh-completions
# Autosuggestions plugin
zinit light zsh-users/zsh-autosuggestions
# Fzf tab plugin
zinit light Aloxaf/fzf-tab

# Load completions
autoload -Uz compinit && compinit

# Starship config
eval "$(starship init zsh)"
export STARSHIP_CONFIG=~/.config/starship/starship.toml

# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

export EDITOR="nvim" # Default editor
export SHELL="zsh" # Default shell
export LANG=en_US.UTF-8 # Language environment
export TERM="screen-256color" # Default terminal color
# Set tty 
if [ -n "$TTY" ]; then
  export GPG_TTY=$(tty)
else
  export GPG_TTY="$TTY"
fi

# Aliases
alias ls='ls --color'
alias la='ls -lathr'
alias v=$EDITOR

# Keybindings
bindkey '^e' autosuggest-execute
bindkey '^a' autosuggest-accept

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no

# Automated add fzf 
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Shell integrations
eval "$(fzf --zsh)" # Set up fzf key bindings and fuzzy completion 

# Disable underline syntax highlighting
(( ${+ZSH_HIGHLIGHT_STYLES} )) || typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[path]=none
ZSH_HIGHLIGHT_STYLES[path_prefix]=none

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$HOME/.cargo/bin:$PATH"
# Bun path
export BUN_INSTALL="$HOME/.bun"
export PATH=$BUN_INSTALL/bin:$PATH
# Go path
export GOPATH=$HOME/go
export GOROOT=/usr/local/go
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOPATH
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin
# Xampp path
export PATH=/opt/lampp/bin/:$PATH
# Node version manager path
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" 
# Laravel path
export PATH="/home/supernova/.config/herd-lite/bin:$PATH"
export PHP_INI_SCAN_DIR="/home/supernova/.config/herd-lite/bin:$PHP_INI_SCAN_DIR"
# Cargo path
. "$HOME/.cargo/env"

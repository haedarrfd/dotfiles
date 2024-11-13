export EDITOR="nvim" # Default editor
export SHELL="zsh" # Default shell

# Aliases
alias ls='ls --color'
alias la='ls -lathr'
alias v=$EDITOR

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

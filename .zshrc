
# _ __  _ __| |_   _______| |__
#| '_ \| '__| __| |_  / __| '_ \
#| |_) | |  | |_   / /\__ \ | | |
#| .__/|_|   \__| /___|___/_| |_|
#|_|

# -------------------------------
#  Completion & FZF Config
# -------------------------------

autoload -Uz compinit
zstyle ':completion::complete:*' use-cache on
zstyle ':completion::complete:*' cache-path ~/.zsh/cache
compinit -C

zstyle ':completion:*' menu select

# -------------------------------
#  Environment Variables
# -------------------------------

export NVM_DIR="$HOME/.nvm"
export VAULT="$HOME/Library/Mobile Documents/iCloud~md~obsidian/Documents/vault"
export PROJECTS="$HOME/Documents/1 Projects"
export PRT="$HOME/Library/Mobile Documents/com~apple~CloudDocs/2 Areas/prt-site"
export MA="$VAULT/1 Projects/Ma"

# -------------------------------
#  Zinit Plugin Manager
# -------------------------------

if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    echo "Installing Zinit plugin manager..."
    mkdir -p "$HOME/.local/share/zinit" && chmod g-rwX "$HOME/.local/share/zinit"
    git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# -------------------------------
#  Lazy-loaded Plugins
# -------------------------------

zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-completions
zinit light Aloxaf/fzf-tab


zinit ice wait"1" lucid \
  atinit'export NVM_DIR="$HOME/.nvm"' \
  atload'source /opt/homebrew/opt/nvm/nvm.sh'
zinit snippet https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/nvm.sh


# Lazy-load Docker Desktop init
zinit ice wait"1" lucid atload"source /Users/philipp/.docker/init-zsh.sh || true"
zinit snippet /Users/philipp/.docker/init-zsh.sh

# -------------------------------
#  Starship Prompt
# -------------------------------
eval "$(starship init zsh)"

# -------------------------------
#  Source External Files
# -------------------------------

source "$HOME/.zsh_aliases"

alias reload='source ~/.zshrc'

source /Users/philipp/.config/broot/launcher/bash/br

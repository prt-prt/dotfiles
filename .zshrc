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

export WIN_DIR="$HOME/mnt/c/Users/phili/dotfiles"

# -------------------------------
#  Common Environment Variables
# -------------------------------

# Keep only system-agnostic variables here
# export NVM_DIR="$HOME/.nvm"
# export VAULT="$HOME/Library/Mobile Documents/iCloud~md~obsidian/Documents/vault"
# export PROJECTS="$HOME/Documents/1 Projects"
# export PRT="$HOME/Library/Mobile Documents/com~apple~CloudDocs/2 Areas/prt-site"
# export MA="$VAULT/1 Projects/Ma"

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


# -------------------------------
#  OS Detection & Config
# -------------------------------

if [[ "$OSTYPE" == "darwin"* ]]; then
    # macOS specific configuration
    source "$HOME/.zsh_macos"
elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
    # Linux/WSL specific configuration
    source "$WIN_DIR/.zsh_linux"
fi


# -------------------------------
#  Starship Prompt
# -------------------------------

eval "$(starship init zsh)"

# -------------------------------
#  Source External Files
# -------------------------------


alias reload='source ~/.zshrc'



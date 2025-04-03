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
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

# -------------------------------
#  Common Environment Variables
# -------------------------------

# Keep only system-agnostic variables here

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

export WIN_DIR="/mnt/c/Users/phili"
if [[ "$OSTYPE" == "darwin"* ]]; then
    source "$HOME/.zsh_macos"
fi
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    source "$WIN_DIR/.zsh_linux"
fi

# -------------------------------
#  Starship Prompt
# -------------------------------

eval "$(starship init zsh)"
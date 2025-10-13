# Start a TMUX session if we are launching a terinal session outside TMUX
if [ "$TMUX" = "" ]; then 
    # Source TMUX config
    $(tmux source-file $HOME/.tmux.conf)

    # Startup a TMUX session
    tmux;

    # Exit when TMUX session quits
    exit;
else
    # MOTD
    fortune -s | cowsay -f sus
fi

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

# Add Go's Cargo PATH
export PATH="$PATH:$HOME/.cargo/bin"

# Set up Homebrew
export PATH="$PATH:$HOME/opt/homebrew/bin"
eval "$(/opt/homebrew/bin/brew shellenv)"

# Setup rbenv
export PATH="$PATH:$HOME/.rbenv/shims"
export PATH="$PATH:$HOME/.rbenv/bin"
eval "$(rbenv init -)"

# Local binaries PATH
export PATH="$PATH:$HOME/.local/bin"

# Set up prompt
export STARSHIP_CONFIG=$HOME/.config/starship.toml
eval "$(starship init zsh)"

# Set up zoxide
eval "$(zoxide init --cmd cd zsh)"

# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)
export FZF_DEFAULT_OPTS='--layout reverse --border top'
alias fzf="fzf --style full \
    --preview 'fzf-preview.sh {}' --bind 'focus:transform-header:file --brief {}'"

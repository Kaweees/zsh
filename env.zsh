#
### Content for env.zsh file
#

if [[ -f "/opt/homebrew/bin/brew" ]] then
  # If you're using macOS, you'll want this enabled
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# I use neovim btw
export EDITOR=nvim

# RTFM
export MANPATH="/usr/local/man:$MANPATH"

# Automatically cd into typed directory.
setopt autocd

# Disable ctrl-s to freeze terminal.
stty stop undef

# Allow comments in interactive shell.
setopt interactive_comments

# History settings
export HISTSIZE=10000000 # 10 million
export LISTMAX=$HISTSIZE # display all history
export HISTFILE="$HOME/.zsh_history" # History file location
export SAVEHIST=$HISTSIZE
export HISTDUP=erase # Erase duplicates in history
setopt inc_append_history # Save every command before execution
setopt appendhistory # Prevent corruption from multiple sessions
setopt sharehistory
setopt hist_ignore_space # Don't save commands that start with a space
setopt hist_ignore_all_dups # Never save duplicate commands
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups # Don't display duplicates when searching history

[[ ! -f $HISTFILE ]] || touch $HISTFILE # Create the history file if missing

# Set automatic notification threshold
export AUTO_NOTIFY_THRESHOLD=20
export AUTO_NOTIFY_TITLE="%command finished executing"
export AUTO_NOTIFY_BODY="It completed in %elapsed seconds with exit code %exit_code"
AUTO_NOTIFY_IGNORE+=("docker" "man" "sleep")

# Python support
export PATH="/usr/local/bin:$PATH"
export PATH="/usr/bin:$PATH"
export PATH="/bin:$PATH"
export PATH="$HOME/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"

# Use Nix-installed binaries
if [ -e "$HOME/.nix-profile/etc/profile.d/nix.sh" ]; then
  . "$HOME/.nix-profile/etc/profile.d/nix.sh"
fi

# Optional: load Nix if installed via multi-user setup
if [ -e /etc/profile.d/nix.sh ]; then
  . /etc/profile.d/nix.sh
fi

# Fix for nix-shell compatibility with Zsh
# This makes sure `nix-shell` sets the prompt correctly
if [[ -n "$IN_NIX_SHELL" ]]; then
  PROMPT='%F{green}%n@%m%f:%F{blue}%~%f [nix-shell] %# '
fi

# CUDA support
export PATH="/usr/local/cuda/bin:$PATH"
export DYLD_LIBRARY_PATH="/usr/local/cuda/lib:$DYLD_LIBRARY_PATH"
export PATH="/usr/local/cuda/bin${PATH:+:${PATH}}"
export LD_LIBRARY_PATH="/usr/local/cuda/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}"

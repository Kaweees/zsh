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
export PATH="/usr/bin/:$PATH"

# Rust support
export PATH="$HOME/.local/bin:$PATH"

# pmpm support
export PATH="$HOME/Library/pnpm:$PATH"

# CUDA support
export PATH="/usr/local/cuda/bin:$PATH"
export DYLD_LIBRARY_PATH="/usr/local/cuda/lib:$DYLD_LIBRARY_PATH"

export PATH="/usr/local/cuda/bin${PATH:+:${PATH}}"
export LD_LIBRARY_PATH="/usr/local/cuda/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}"

# RISC-V toolchain support
export PATH="/opt/riscv/bin:$PATH"
export PATH="/usr/local/opt/riscv-gnu-toolchain/bin:$PATH"

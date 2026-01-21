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
export PATH="$HOME/.pixi/bin:$PATH"

# UV support
export UV_VENV_CLEAR=1

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
if [[ -d "/usr/local/cuda-13.0" ]]; then
  export CUDA_HOME=/usr/local/cuda-13.0
  export CUDA_PATH=$CUDA_HOME
  export PATH=$CUDA_HOME/bin:$PATH
  export LD_LIBRARY_PATH=$CUDA_HOME/lib64:$LD_LIBRARY_PATH
elif [[ -d "/usr/local/cuda" ]]; then
  export CUDA_HOME=/usr/local/cuda
  export CUDA_PATH=$CUDA_HOME
  export PATH=$CUDA_HOME/bin:$PATH
  export LD_LIBRARY_PATH=$CUDA_HOME/lib64:$LD_LIBRARY_PATH
elif [[ -d "/usr/lib/cuda" ]]; then
  # Ubuntu/Debian package manager installation
  export CUDA_HOME=/usr/lib/cuda
  export CUDA_PATH=$CUDA_HOME
  export PATH=$CUDA_HOME/bin:$PATH
  export LD_LIBRARY_PATH=$CUDA_HOME/lib64:$LD_LIBRARY_PATH
fi

# Add NVIDIA driver libraries to LD_LIBRARY_PATH based on architecture
ARCH=$(uname -m)
if [[ "$ARCH" == "aarch64" ]]; then
  NVIDIA_DRIVER_LIB="/usr/lib/aarch64-linux-gnu/nvidia"
elif [[ "$ARCH" == "x86_64" ]]; then
  NVIDIA_DRIVER_LIB="/usr/lib/x86_64-linux-gnu/nvidia"
elif [[ "$ARCH" == "i386" ]] || [[ "$ARCH" == "i686" ]]; then
  NVIDIA_DRIVER_LIB="/usr/lib/i386-linux-gnu/nvidia"
fi

# Also check for i386 libraries (for 32-bit compatibility on 64-bit systems)
if [[ -z "$NVIDIA_DRIVER_LIB" ]] || [[ ! -d "$NVIDIA_DRIVER_LIB" ]]; then
  if [[ -d "/usr/lib/i386-linux-gnu/nvidia" ]]; then
    NVIDIA_DRIVER_LIB="/usr/lib/i386-linux-gnu/nvidia"
  fi
fi

if [[ -n "$NVIDIA_DRIVER_LIB" ]] && [[ -d "$NVIDIA_DRIVER_LIB" ]]; then
  export LD_LIBRARY_PATH=$NVIDIA_DRIVER_LIB:$LD_LIBRARY_PATH
fi

# macOS-specific CUDA library path
if [[ "$OSTYPE" == "darwin"* ]] && [[ -n "$CUDA_HOME" ]]; then
  export DYLD_LIBRARY_PATH=$CUDA_HOME/lib:$DYLD_LIBRARY_PATH
fi

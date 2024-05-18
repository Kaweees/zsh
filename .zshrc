#################
# Let's configure zsh
# Are you ready?
################

# Enable zsh profiling for debugging
# zmodload zsh/zprof

# Set encoding to UTF-8 for all locales
export LC_ALL=en_US.UTF-8

# -------------------------------------------------------------------
# Set dotfile paths for easier editing.
# -------------------------------------------------------------------

# Set the directory where the dotfiles and zsh are stored
export DOTFILES="$(dirname $(realpath "$-1"))"
export ZSH="$(dirname $(realpath "$-1"))"
export ZDOTDIR=$ZSH

# -------------------------------------------------------------------
# Load prompt
# -------------------------------------------------------------------
[[ ! -f $ZSH/prompt.zsh ]] || source $ZSH/prompt.zsh

# -------------------------------------------------------------------
# Load plugins
# -------------------------------------------------------------------
[[ ! -f $ZSH/plugins.zsh ]] || source $ZSH/plugins.zsh

# -------------------------------------------------------------------
# Load environment variables
# -------------------------------------------------------------------
[[ ! -f $ZSH/env.zsh ]] || source $ZSH/env.zsh

# -------------------------------------------------------------------
# Load aliases
# -------------------------------------------------------------------
[[ ! -f $ZSH/aliases.zsh ]] || source $ZSH/aliases.zsh

# -------------------------------------------------------------------
# Load functions
# -------------------------------------------------------------------
[[ ! -f $ZSH/functions.zsh ]] || source $ZSH/functions.zsh

# -------------------------------------------------------------------
# Load keybinds
# -------------------------------------------------------------------
[[ ! -f $ZSH/keybinds.zsh ]] || source $ZSH/keybinds.zsh

# -------------------------------------------------------------------
#  Start X if not already running
# -------------------------------------------------------------------
if·[[·-z·$DISPLAY·]]·&&·[[·$(tty)·=·/dev/tty1·]];·then
    startx
fi


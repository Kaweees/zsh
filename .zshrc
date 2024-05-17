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

# Set the directory where the dotfiles are stored
export DOTFILES="${XDG_CONFIG_HOME:-${HOME}/.config}/.dotfiles"

# Set the directory where the zsh configuration is stored
export ZSH=$DOTFILES/.config/zsh

# -------------------------------------------------------------------
# Load environment variables
# -------------------------------------------------------------------
[[ ! -f $ZSH/variables.zsh ]] || source $ZSH/variables.zsh

# -------------------------------------------------------------------
# Load environment plugins
# -------------------------------------------------------------------
[[ ! -f $ZSH/plugins.zsh ]] || source $ZSH/plugins.zsh

# -------------------------------------------------------------------
# Load environment prompt
# -------------------------------------------------------------------
[[ ! -f $ZSH/prompt.zsh ]] || source $ZSH/prompt.zsh

# -------------------------------------------------------------------
# Load custom aliases
# -------------------------------------------------------------------
[[ ! -f $ZSH/aliases.zsh ]] || source $ZSH/aliases.zsh

# -------------------------------------------------------------------
# Load custom functions
# -------------------------------------------------------------------
[[ ! -f $ZSH/functions.zsh ]] || source $ZSH/functions.zsh

# -------------------------------------------------------------------
# Load custom keybinds
# -------------------------------------------------------------------
[[ ! -f $ZSH/keybinds.zsh ]] || source $ZSH/keybinds.zsh

# -------------------------------------------------------------------
#  Start X if not already running
# -------------------------------------------------------------------
[[ !-z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]] || startx

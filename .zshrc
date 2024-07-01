#################
# Let's configure zsh
# Are you ready?
################

# Enable zsh profiling for debugging
zmodload zsh/zprof

# Set encoding to UTF-8 for all locales
export LC_ALL=en_US.UTF-8

# -------------------------------------------------------------------
# Set dotfile paths for easier editing.
# -------------------------------------------------------------------

# Set the directory where the dotfiles and zsh are stored
export DOTFILES="$HOME/Documents/GitHub/Projects/dotfiles"
export ZSH="$HOME/.oh-my-zsh"
export ZDOTDIR=$HOME

# -------------------------------------------------------------------
# Load plugins
# -------------------------------------------------------------------
[[ ! -f $ZDOTDIR/plugins.zsh ]] || source $ZDOTDIR/plugins.zsh

# -------------------------------------------------------------------
# Load prompt
# -------------------------------------------------------------------
[[ ! -f $ZDOTDIR/prompt.zsh ]] || source $ZDOTDIR/prompt.zsh

# -------------------------------------------------------------------
# Load environment variables
# -------------------------------------------------------------------
[[ ! -f $ZDOTDIR/env.zsh ]] || source $ZDOTDIR/env.zsh

# -------------------------------------------------------------------
# Load aliases
# -------------------------------------------------------------------
[[ ! -f $ZDOTDIR/aliases.zsh ]] || source $ZDOTDIR/aliases.zsh

# -------------------------------------------------------------------
# Load functions
# -------------------------------------------------------------------
[[ ! -f $ZDOTDIR/functions.zsh ]] || source $ZDOTDIR/functions.zsh

# -------------------------------------------------------------------
# Load keybinds
# -------------------------------------------------------------------
[[ ! -f $ZDOTDIR/keybinds.zsh ]] || source $ZDOTDIR/keybinds.zsh

# -------------------------------------------------------------------
#  Start X if not already running
# -------------------------------------------------------------------
if [ -z "$DISPLAY" ] && [ "$(tty)" = "/dev/tty1" ]; then
    startx
fi

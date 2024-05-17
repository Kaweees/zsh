#
### Content for .aliases.zsh file
#

# I use neovim btw
alias vim='nvim'

# Colorized output
alias diff='diff --color'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias grep='grep --color=auto'
alias ls='ls --color=auto -la'
alias tree='tree -C'

# Add sudo to common commands
alias reboot='sudo reboot'
alias upgrade='sudo apt-get update && sudo apt-get upgrade'

# Add apt-get to common commands
alias apt='sudo apt'
alias apt-get='sudo apt'
alias apt-i='sudo apt install'

# Confirm before overwriting each file, overridden with -f
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# Create tape archives. Args: TARBALL INFILES
alias tarz='tar czvf'

# Extract tape archives. Args: TARBALL
alias taru='tar xzvf'

# List tape archives. Args: TARBALL
alias tarl='tar tvf'

# For managing jobs sent to background with CTRL+Z and `fg`.
alias j="jobs -l"

# Display PATH over multiple lines.
alias split_path='echo "$PATH" | sed "s/:/\n/g"'

# List bin executables available, by directory.
alias bins='ls -1 -R ~/bin'

# Recent history.
alias hi='history | tail -n20'

# Find by given NAME.
alias fn='find . -name'
alias fnd='find . -type d -name'
alias fnf='find .  -type f -name'

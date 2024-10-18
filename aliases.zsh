#
### Content for aliases.zsh file
#

# Use the same editor
alias nano='$EDITOR'
alias vim='$EDITOR'
alias vi='$EDITOR'
alias code='$EDITOR'
alias emacs='$EDITOR'
alias cursor='~/Documents/execs/cursor.appimage'

# Load tmux file
alias tmux='tmux -f ~/.tmux.conf'

# Good python
alias python='ipython'
alias python3='ipython'

# Wifi management
alias wifi-gui='nm-connection-editor'
alias wifi-tui='nmtui'

# SSH to Cal Poly
alias mavillaf='ssh mavillaf@unix1.csc.calpoly.edu'

alias ebrc="vim $HOME/.zshrc" # Edit bashrc
alias srcbrc="source $HOME/.zshrc"

# Colorized output
alias diff='diff --color'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias grep='grep --color=auto'
alias dir='ls --color=auto -lah'
alias ls='ls --color=auto -lah'
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

alias c='clear'

# Simple aliases (replace long commands with short names)
alias ll='ls -l'                # List files with details

# Suffix aliases (execute specific file types with desired tool)
alias edit='vim'              # Edit files with vim

# Function aliases (for multi-command aliases with parameters)
alias updategit='git pull && git status'  # Update and check git status

# Custom aliases (for frequently used commands)
alias l='exa -l'             # Colorful file listing with exa (replace with your preferred lister)
alias ..='cd ..'             # Go up two directories

### List - single column

# One line. With types.
# Note that just `1` is already reserved in ZSH for navigate back a directory.
alias l1='ls -1 -F'

# Wrapping names.
alias l='ls -C -F'

# Show hidden.
alias la='ls -A'
# With types.
alias la1='ls -A -F -1'

### List - long (aka multi-column view)

alias ll='ls -l -h'
alias lal='ls -l -h -A -F'

# Newest first and show ISO date and time.
alias lt='ls -t --full-time'

# Largest files first.
alias lS='ls -l -F -S'

### Other

alias m="make"

# The original commands are useful in a for loop of a shell script.
# Save and then change the current directory. With no arguments, pushd exchanges the top two directories.
alias pu="pushd"
# Remove the top entry from the directory stack, and cd to the new top directory.
alias po="popd"

alias s="sudo"

# Activate virtual environment in current directory, otherwise try in the parent.
alias act='source venv/bin/activate || source ../venv/bin/activate'

alias pserver='python3 -m http.server'
alias pip-user='PIP_REQUIRE_VIRTUALENV=false python3 -m pip'


# ZSH adds this already.
if [[ "$IS_BASH" == 'true' ]]; then
  alias g=git
fi

alias jek='bundle exec jekyll'

# Summarize directory.
#   Breakdown of sorted sizes of files and directories at current level (depth of zero combined with using *).
#   Sorted by human-readable sizes and reversed.
#   This is expensive at ~.
#
# Friendly summary of dirs.
# Ignores .git and other hidden folders by using *.
alias usage='du -h -s -c * | sort -h -r'
# Similar to above but excludes files and includes hidden directories.
# This can work without args (same as `.`) or with a path.
alias du1='du -h -d 1'

# Show files and dirs and not just dirs. Similar to find but with sizes. And similar to ls -h but ls
# is not good for parsing.
alias dua='du -h -a'

# Concat lists and pick one.
alias random_alias='{ alias & git alias ;} | shuf -n 1'

### Docker

alias dc='docker-compose'
alias dps='docker-compose ps'
alias dstart='docker-compose start'
alias dstop='docker-compose stop'
alias dup='docker-compose up'
alias dub='docker-compose up --build'
alias ddown='docker-compose down'
alias drestart='docker-compose restart'
# Usage: dexec COMMAND
alias dexec='docker exec -it /bin/sh'
# Update images
alias dpull='docker pull'

### Searching

# Search using PATTERN.
alias hg='history | grep'
alias ag='alias | grep'

# Export ESP-IDF environment variables.
# https://docs.espressif.com/projects/esp-idf/en/latest/esp32/get-started/linux-macos-setup.html
alias get_idf=". $HOME/esp/esp-idf/export.sh"

# Create a new project.
alias new_idf="cp -r $HOME/esp/esp-idf/examples/get-started/blink ."

# Set the directory we want to store zinit and plugins
export ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source/Load zinit
source "${ZINIT_HOME}/zinit.zsh"

# Add in zsh plugins
zinit light zsh-users/zsh-syntax-highlighting # Syntax highlighting
zinit light zsh-users/zsh-completions # Tab completions
zinit light zsh-users/zsh-autosuggestions # Autosuggestions
zinit light zsh-users/zsh-history-substring-search # Fish shell's history search feature
zinit light MichaelAquilina/zsh-auto-notify  # Automatically notify when a command finishes
zinit light MichaelAquilina/zsh-you-should-use # Reminds you to use a command if you have it installed
zinit light Aloxaf/fzf-tab # FZF tab completion

# Automatically load zsh-completions on startup
autoload -Uz compinit && compinit

# gitstatus prompt
source ~/gitstatus/gitstatus.prompt.zsh

# Replay all cached completions
zinit cdreplay -q

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}' # Case-insensitive completion
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}" # Use LS_COLORS for completion colors
zstyle ':completion:*' menu no # Disable default zshell completion menu
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath' # Preview directories when using cd completion
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath' # Preview directories when using zoxide completion

# Automatically load zsh-history-substring-search on startup
zinit ice wait lucid load zsh-users/zsh-history-substring-search

# Ensure unique search results
HISTORY_SUBSTRING_SEARCH_ENSURE_UNIQUE=1

# Add in snippets from Oh My Zsh plugins
zinit snippet OMZP::git
zinit snippet OMZP::command-not-found

# Shell integrations
# FZF integration
if [ -f /usr/share/doc/fzf/examples/completion.zsh ]; then
  source /usr/share/doc/fzf/examples/completion.zsh
fi
if [ -f /usr/share/doc/fzf/examples/key-bindings.zsh ]; then
  source /usr/share/doc/fzf/examples/key-bindings.zsh
fi

# eval "$(fzf --zsh)" # Add FZF keybindings
eval "$(zoxide init zsh)" # Add Zoxide keybindings


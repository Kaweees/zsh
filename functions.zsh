function sessionizer() {
  zsh ~/.scripts/sessionizer.zsh
}

zle -N sessionizer

if [[ "$(uname -s)" == "Linux" ]]; then
  function cursor {
    (nohup ~/.local/share/applications/cursor.desktop --no-sandbox "$@" > /dev/null 2>&1 &)
  }
fi

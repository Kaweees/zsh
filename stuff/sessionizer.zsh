export FZF_DEFAULT_OPTS=" \
--color=bg+:#313244,spinner:#f5e0dc,hl:#f38ba8 \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8"

lavender="#b4befe"
maroon="#eba0ac"
peach="#fab387"
subtext0="#a6adc8"
overlay2="#9399b2"
overlay0="#6c7086"
surface2="#585b70"
surface1="#45475a"
surface0="#313244"
base_minus_1="#262637"
base="#1e1e2e"
mantle="#181825"

projects=$(\
  find \
    ~/Documents/GitHub/Work* \
    ~/Documents/GitHub/Projects \
    ~/Documents/GitHub/Forks \
    \
    -mindepth 1 -maxdepth 1 \
    -follow \
    -type d \
    -printf "%T@ %p\n" \
    |

  # Sort by date
  sort --numeric-sort --reverse |

  # Strip floating number at the start used for sorting
  sed --regexp-extended "s/\w*\.\w* //" |

  # Strip home dir
  sed --regexp-extended "s/^\/home\/[^\/]+\///g" |

  # # Strip the "Documents\GitHub" directory name for project repos
  # sed --regexp-extended "s/Documents\/GitHub\///g" |

  sed --regexp-extended "s/^projects\/work/📋 work/g" |
  sed --regexp-extended "s/^projects\/axyl/🔷 axyl/g" |
  sed --regexp-extended "s/^projects\/waycrate/🟨 waycrate/g" |
  sed --regexp-extended "s/^projects\/personal\//🟢 /g" |
  sed --regexp-extended "s/^projects\/silver/💿 silver/g" |
  sed --regexp-extended "s/^projects\/(\S*)/🔲 \1/g" |
  sed --regexp-extended "s/^forks/↔️  forks/g" |
  sed --regexp-extended "s/^study/✏️  study/g" |

  tee
)

selected=$(echo "$projects" |
  fzf \
    --border=none \
    --prompt="    "   \
    --header="🔥 BLAZINGLY FAST!"\
    --header-first \
    --pointer="" \
    --scrollbar="┃" \
    --layout=reverse \
    --ansi \
    --cycle \
    --tiebreak="begin,index" \
    \
    --scheme="path" \
    --no-mouse \
    --padding 0,0,0,1 \
    --margin 0 \
    --info=inline \
    --separator="r" \
    \
    --color="border:$surface0" \
    --color="header:$maroon" \
    --color="header:bold" \
    --color="prompt:$peach" \
    --color="query:" \
    --color="info:$surface1" \
    \
    --color="fg:$subtext0" \
    \
    --color="bg+:$base_minus_1" \
    --color="pointer:$lavender" \
    --color="fg+:$lavender" \
    --color="fg+:bold" \
    \
    --color="preview-bg:$base" \
    --color="preview-fg:$overlay2" \
    \
    --color="hl:green" \
    --color="hl:bold" \
    --color="hl:underline" \
    --color="hl+:green" \
    --color="hl+:bold" \
    --color="hl+:underline" \
    --color="gutter:$mantle" \
    \
    --color="scrollbar:green" \
    --color="scrollbar:bold" \
    \
    --color="spinner:green" \
    --color="spinner:dim" \
    \
    \
    \
    --preview="$HOME/.config/zsh/mts-show-project.zsh ''{}''" \
    --preview-window=border-left,60% \
    --preview-window=border-sharp \
)
if [ $? != 0 ]; then exit; fi

selected_dir="$HOME/${selected}"

selected_name=$(basename "$selected_dir" | tr . _)

echo "Sessionizing $selected_name..."


# Open in current terminal

alacritty --working-directory "$selected_dir" --title "$selected_name" &
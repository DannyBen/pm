if [[ ${args[--available]:-} ]]; then
  pacman -S -l -q | fzf \
    --preview 'pacman -Si {}' \
    --layout=reverse \
    --bind 'enter:execute(pacman -Si {} | less)'
else
  pacman -Qq | fzf \
    --preview 'pacman -Qil {}' \
    --layout=reverse \
    --bind 'enter:execute(pacman -Qil {} | less)'
fi

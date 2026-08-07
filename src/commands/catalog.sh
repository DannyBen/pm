pacman -S -l -q | fzf \
  --preview 'pacman -Si {}' \
  --layout=reverse \
  --bind 'enter:execute(pacman -Si {} | less)'

pm_set_pager

if [[ ${args[--available]:-} ]]; then
  pacman -S -l -q | fzf \
    --preview 'pacman -Si {}' \
    --layout=reverse \
    --bind "enter:execute(pacman -Si {} | $PAGER)"
else
  pacman -Qq | fzf \
    --preview 'pacman -Qil {}' \
    --layout=reverse \
    --bind "enter:execute(pacman -Qil {} | $PAGER)"
fi

if [[ ${args[--available]:-} ]]; then
  pacman -S -l -q
else
  pacman -Q -q -e
fi

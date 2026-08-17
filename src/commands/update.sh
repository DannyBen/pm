options=(-Syu)

if [[ ${args[--yes]:-} ]]; then
  options+=(--noconfirm)
fi

sudo pacman "${options[@]}"

packages=()
eval "packages=(${args[package]})"

sudo pacman -Rs "${packages[@]}"

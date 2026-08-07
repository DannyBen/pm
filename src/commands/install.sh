packages=()
eval "packages=(${args[package]})"

sudo pacman -S "${packages[@]}"

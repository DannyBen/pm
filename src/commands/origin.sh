paths=()
eval "paths=(${args[path]})"

pacman -Qo "${paths[@]}"

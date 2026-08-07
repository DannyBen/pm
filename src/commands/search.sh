queries=()
eval "queries=(${args[query]})"

pacman -Ss "${queries[@]}"

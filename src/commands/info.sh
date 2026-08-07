packages=()
eval "packages=(${args[package]})"

if [[ ${args[--available]:-} ]]; then
  operation=-Si
else
  operation=-Qi
fi

pacman "$operation" "${packages[@]}"

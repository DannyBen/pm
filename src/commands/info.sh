packages=()
eval "packages=(${args[package]})"

if [[ ${args[--installed]:-} ]]; then
  operation=-Qi
else
  operation=-Si
fi

pacman "$operation" "${packages[@]}"

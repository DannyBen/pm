queries=()
eval "queries=(${args[query]})"

if [[ ${args[--available]:-} ]]; then
  operation=-Ss
else
  operation=-Qs
fi

pacman "$operation" "${queries[@]}"

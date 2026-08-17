options=()

if [[ ${args[--available]:-} ]]; then
  options+=(--sync)
fi

if [[ ${args[--reverse]:-} ]]; then
  options+=(--reverse)
fi

if [[ ${args[--depth]:-} ]]; then
  options+=(--depth "${args[--depth]}")
fi

pactree "${options[@]}" "${args[package]}"

options=()

if [[ ${args[--available]:-} ]]; then
  options+=(--sync)
fi

if [[ ${args[--reverse]:-} ]]; then
  options+=(--reverse)
fi

pactree "${options[@]}" "${args[package]}"

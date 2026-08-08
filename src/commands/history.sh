log_file=$(pacman-conf LogFile)

if [[ ${args[package]:-} ]]; then
  rg \
    -n \
    --context "${args[--context]:-10}" \
    --fixed-strings \
    -- \
    "${args[package]}" \
    "$log_file"
elif [[ ${args[--context]:-} ]]; then
  printf '%s\n' "--context requires a package" >&2
  exit 1
else
  cat "$log_file"
fi

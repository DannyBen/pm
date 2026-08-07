options=(-r)

if [[ ${args["--dry-run"]:-} ]]; then
  options=(-d)
fi

if [[ -n ${args[--keep]:-} ]]; then
  options+=(--keep "${args[--keep]}")
fi

if [[ ${args["--dry-run"]:-} ]]; then
  paccache "${options[@]}"
else
  sudo paccache "${options[@]}"
fi

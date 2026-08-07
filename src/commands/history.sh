log_file=$(pacman-conf LogFile)

rg \
  -n \
  --context "${args[--context]}" \
  --fixed-strings \
  -- \
  "${args[package]}" \
  "$log_file"

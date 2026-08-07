status=0
checkupdates || status=$?

if ((status == 2)); then
  exit 0
fi

exit "$status"

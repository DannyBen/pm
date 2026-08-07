@Given package commands are mocked
  PATH="$PWD/features/fixtures/bin:$PATH"
  export PATH

@When I run '{command}'
  PATH="$(pwd):$PATH" run "$command"

@Then the output should include '{text}'
  [[ "$(printf '%s' "$LAST_STDOUT" | strip_ansi)" == *"$text"* ]]

@Then the error output should include '{text}'
  [[ "$(printf '%s' "$LAST_STDERR" | strip_ansi)" == *"$text"* ]]

@Then the exit code should mean success
  [[ "$LAST_EXIT_CODE" -eq 0 ]]

@Then the exit code should mean failure
  [[ "$LAST_EXIT_CODE" -ne 0 ]]

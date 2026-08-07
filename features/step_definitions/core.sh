@Before
  scenario_path="$PATH"

@After
  PATH="$scenario_path"
  export PATH
  unset PM_TEST_NO_UPDATES

@Given package commands are mocked
  PATH="$PWD/features/fixtures/bin:$PATH"
  export PATH

@Given no package updates are available
  export PM_TEST_NO_UPDATES=1

@When I run '{command}'
  PATH="$(pwd):$PATH" run "$command"

@When I complete '{command}'
  PATH="$PWD:$PATH"
  export PATH
  read -r -a COMP_WORDS <<< "$command"
  COMP_CWORD=$((${#COMP_WORDS[@]} - 1))
  COMPREPLY=()
  source <(pm completions)
  _pm_completions
  LAST_STDOUT=$(printf '%s\n' "${COMPREPLY[@]}")
  LAST_EXIT_CODE=0

@Then the output should include '{text}'
  [[ "$(printf '%s' "$LAST_STDOUT" | strip_ansi)" == *"$text"* ]]

@Then the output should not include '{text}'
  [[ "$(printf '%s' "$LAST_STDOUT" | strip_ansi)" != *"$text"* ]]

@Then the error output should include '{text}'
  [[ "$(printf '%s' "$LAST_STDERR" | strip_ansi)" == *"$text"* ]]

@Then the exit code should mean success
  [[ "$LAST_EXIT_CODE" -eq 0 ]]

@Then the exit code should mean failure
  [[ "$LAST_EXIT_CODE" -ne 0 ]]

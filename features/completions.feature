Feature: Bash completions
  Generate and exercise runtime-aware Bash completions

Scenario: Generate the completion function
  When I run 'pm completions'
  Then the output should include '# pm completion'
  And the output should include '_pm_completions()'
  And the output should include 'complete -F _pm_completions pm'
  And the exit code should mean success

Scenario: Complete an available package for installation
  Given package commands are mocked
  When I complete 'pm install r'
  Then the output should include 'remotepkg'
  And the output should not include 'localpkg'

Scenario: Complete an installed package for removal
  Given package commands are mocked
  When I complete 'pm remove l'
  Then the output should include 'localpkg'
  And the output should not include 'remotepkg'

Scenario: Complete an available package for information
  Given package commands are mocked
  When I complete 'pm info r'
  Then the output should include 'remotepkg'
  And the output should not include 'localpkg'

Scenario: Complete an installed package for information
  Given package commands are mocked
  When I complete 'pm info --installed l'
  Then the output should include 'localpkg'
  And the output should not include 'remotepkg'

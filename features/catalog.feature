Feature: Repository package catalog
  Browse available packages with repository package details

Scenario: Open the repository package catalog
  Given package commands are mocked
  When I run 'pm catalog'
  Then the output should include 'ripgrep'
  And the output should include 'pacman -Si {}'
  And the output should include 'enter:execute(pacman -Si {} | less)'
  And the exit code should mean success

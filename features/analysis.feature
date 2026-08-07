Feature: Package analysis
  Inspect package provenance and configured repositories

Background:
  Given package commands are mocked

Scenario: List foreign packages
  When I run 'pm foreign'
  Then the output should include 'pacman -Qm'
  And the exit code should mean success

Scenario: List configured repositories
  When I run 'pm repos'
  Then the output should include 'core'
  And the output should include 'extra'
  And the exit code should mean success

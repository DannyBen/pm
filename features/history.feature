Feature: Package history
  Find package activity in the pacman log

Background:
  Given package commands are mocked

Scenario: Show package history with useful context
  When I run 'pm history mdcat'
  Then the output should include 'rg -n --context 10 --fixed-strings -- mdcat /custom/pacman.log'
  And the exit code should mean success

Scenario: Choose the amount of surrounding context
  When I run 'pm history mdcat -c 3'
  Then the output should include 'rg -n --context 3 --fixed-strings -- mdcat /custom/pacman.log'
  And the exit code should mean success

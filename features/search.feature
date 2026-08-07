Feature: Package search
  Search installed and available packages

Background:
  Given package commands are mocked

Scenario: Search installed packages
  When I run 'pm search pacman'
  Then the output should include 'pacman -Qs pacman'
  And the exit code should mean success

Scenario: Search available packages
  When I run 'pm search pacman -a'
  Then the output should include 'pacman -Ss pacman'
  And the exit code should mean success

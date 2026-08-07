Feature: Package information
  Show information about installed and available packages

Background:
  Given package commands are mocked

Scenario: Show installed package information
  When I run 'pm info pacman'
  Then the output should include 'pacman -Qi pacman'
  And the exit code should mean success

Scenario: Show available package information
  When I run 'pm info pacman --available'
  Then the output should include 'pacman -Si pacman'
  And the exit code should mean success

Feature: Package information
  Show information about remote and installed packages

Scenario: Show remote package information
  When I run 'pm info pacman'
  Then the output should include 'Repository'
  And the output should include 'Name'
  And the exit code should mean success

Scenario: Show installed package information
  When I run 'pm info pacman --installed'
  Then the output should include 'Name'
  And the output should include 'Install Date'
  And the exit code should mean success

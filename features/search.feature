Feature: Package search
  Search packages in remote repositories

Scenario: Find a package
  When I run "pm search '^pacman$'"
  Then the output should include 'core/pacman'
  And the exit code should mean success

Scenario: Find no packages
  When I run 'pm search pm-package-that-does-not-exist'
  Then the exit code should mean failure

Feature: Pacman contribution utilities
  Provide friendly interfaces to common pacman-contrib utilities

Background:
  Given package commands are mocked

Scenario: List outdated packages
  When I run 'pm outdated'
  Then the output should include 'bash 5.3.3-1 -> 5.3.4-1'
  And the exit code should mean success

Scenario: Report no outdated packages successfully
  Given no package updates are available
  When I run 'pm outdated'
  Then the exit code should mean success

Scenario: Show an installed package dependency tree
  When I run 'pm tree bash'
  Then the output should include 'pactree bash'
  And the exit code should mean success

Scenario: Show an available package dependency tree
  When I run 'pm tree bash --available'
  Then the output should include 'pactree --sync bash'
  And the exit code should mean success

Scenario: Show a reverse dependency tree
  When I run 'pm tree bash --reverse'
  Then the output should include 'pactree --reverse bash'
  And the exit code should mean success

Scenario: Limit the depth of a package dependency tree
  When I run 'pm tree bash -d 1'
  Then the output should include 'pactree --depth 1 bash'
  And the exit code should mean success

Scenario: Clean the package cache conservatively
  When I run 'pm clean'
  Then the output should include 'sudo paccache -r'
  And the exit code should mean success

Scenario: Keep a chosen number of package versions
  When I run 'pm clean -k 2'
  Then the output should include 'sudo paccache -r --keep 2'
  And the exit code should mean success

Scenario: Preview package cache cleaning
  When I run 'pm clean -d'
  Then the output should include 'paccache -d'
  And the output should not include 'sudo'
  And the exit code should mean success

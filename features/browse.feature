Feature: Browse packages
  Browse installed and available packages interactively

Background:
  Given package commands are mocked

Scenario: Browse installed packages
  When I run 'PAGER="less -R" pm browse'
  Then the output should include 'bash'
  And the output should include 'git'
  And the output should include 'pacman -Qil {}'
  And the output should include 'enter:execute(pacman -Qil {} | less -R)'
  And the exit code should mean success

Scenario: Browse available packages
  When I run 'PAGER= pm browse --available'
  Then the output should include 'ripgrep'
  And the output should include 'pacman -Si {}'
  And the output should include 'enter:execute(pacman -Si {} | more)'
  And the exit code should mean success

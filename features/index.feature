Feature: Installed package index
  Browse installed packages with package details and file lists

Scenario: Open the installed package index
  Given package commands are mocked
  When I run 'pm index'
  Then the output should include 'bash'
  And the output should include 'git'
  And the output should include 'pacman -Qil {}'
  And the output should include 'enter:execute(pacman -Qil {} | less)'
  And the exit code should mean success

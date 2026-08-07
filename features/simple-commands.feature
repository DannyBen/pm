Feature: Simple package operations
  Translate friendly commands to their underlying package commands

Background:
  Given package commands are mocked

Scenario: Update the system
  When I run 'pm update'
  Then the output should include 'sudo pacman -Syu'
  And the exit code should mean success

Scenario: Update the keyring
  When I run 'pm update-keys'
  Then the output should include 'sudo pacman -Sy --noconfirm archlinux-keyring'
  And the exit code should mean success

Scenario: Install packages
  When I run 'pm install git fzf'
  Then the output should include 'sudo pacman -S git fzf'
  And the exit code should mean success

Scenario: Uninstall packages
  When I run 'pm uninstall git fzf'
  Then the output should include 'sudo pacman -Rs git fzf'
  And the exit code should mean success

Scenario: List explicitly installed packages
  When I run 'pm list'
  Then the output should include 'localpkg'
  And the exit code should mean success

Scenario: List available repository packages
  When I run 'pm list --available'
  Then the output should include 'remotepkg'
  And the exit code should mean success

Scenario: Find a command provider
  When I run 'pm provides convert'
  Then the output should include 'pkgfile -b convert'
  And the exit code should mean success

Scenario: Find the packages that own files
  When I run 'pm origin /usr/bin/git /usr/bin/bash'
  Then the output should include 'pacman -Qo /usr/bin/git /usr/bin/bash'
  And the exit code should mean success

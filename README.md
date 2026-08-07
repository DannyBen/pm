# pm - Friendly Pacman

![repocard](https://repocard.dannyben.com/svg/pm.svg)

pm is a friendly command-line interface for Arch Linux's pacman package
manager. It replaces hard-to-remember combinations of uppercase and lowercase
flags with clear commands such as `pm install`, `pm search`, and `pm outdated`.

pm was developed using the [Bashly Command Line Framework][bashly] and is
distributed as a single Bash script.

## Install

### Installing using the setup script

The setup script installs the latest pm release and its Bash completions:

```shell
curl -Ls get.dannyb.co/pm/setup | bash
```

Feel free to inspect the [setup script](setup) before running.

### Installing manually

Download the `pm` script from the [latest release][release], place it somewhere
in your path, and make it executable:

```shell
wget https://github.com/DannyBen/pm/releases/latest/download/pm
sudo install -m 0755 pm /usr/local/bin/
```

Generate Bash completions with:

```shell
pm completions
```

## Concept

Commands that can query two package sources use the same rule everywhere:

```shell
# Query packages installed on this system
pm list
pm info git
pm search terminal
pm browse

# Query all packages available in configured repositories
pm list --available
pm info git --available
pm search terminal --available
pm browse --available
```

`--available` can also be written as `-a`.

pm operates on pacman packages and configured binary repositories. It does not
search, build, or update AUR packages.

## Examples

```shell
# Install, update, and uninstall packages
pm install git fzf
pm update
pm uninstall fzf

# Check for available updates without upgrading
pm outdated

# Inspect package relationships and history
pm tree git
pm tree git --reverse
pm origin /usr/bin/git
pm history git

# Inspect repositories and foreign packages
pm repos
pm foreign

# Preview package-cache cleanup
pm clean --dry-run
```

## Usage

```text
pm - A friendly interface for pacman

Usage:
  pm COMMAND
  pm [COMMAND] --help | -h
  pm --version | -v

Package Management Commands:
  update        Update package databases and upgrade the system
  install       Install packages
  uninstall     Remove packages and their unneeded dependencies

Package Maintenance Commands:
  update-keys   Update the Arch Linux keyring
  clean         Remove old packages from the package cache
  outdated      List installed packages with available updates

Package Query Commands:
  list          List package names
  info          Show package information
  search        Search packages
  browse        Browse packages interactively

Package Analysis Commands:
  provides      Find packages that provide a command
  tree          Show a package dependency tree
  origin        Show which installed package owns a file
  history       Show package activity from the pacman log
  foreign       List installed packages absent from configured repositories
  repos         List configured package repositories

Internal Commands:
  completions   Generate bash completions.
```

Run `pm COMMAND --help` for command-specific options and examples.

## Optional dependencies

Most pm commands only require pacman. Additional commands declare their own
dependencies and show installation instructions when needed:

| Commands | Package |
|:---------|:--------|
| `clean`, `outdated`, `tree` | `pacman-contrib` |
| `browse` | `fzf`, `less` |
| `provides` | `pkgfile` |
| `history` | `ripgrep` |

## Uninstall

```shell
curl -Ls get.dannyb.co/pm/uninstall | bash
```

## Contributing / Support

If you experience an issue, have a question or suggestion, or wish to
contribute, feel free to [open an issue][issues].

---

[bashly]: https://bashly.dev/
[issues]: https://github.com/DannyBen/pm/issues
[release]: https://github.com/DannyBen/pm/releases/latest

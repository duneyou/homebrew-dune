# homebrew-dune

Homebrew tap for **Dune IDE** — the desktop app and its `dune` command line
launcher (the VS Code-style `code` command, but `dune`).

## Tap

Homebrew maps `brew tap duneyou/dune` to this repository
(`https://github.com/duneyou/homebrew-dune`).

```bash
brew tap duneyou/dune
```

## Install

```bash
# Desktop app + the `dune` command (recommended)
brew install --cask dune-ide

# Just the `dune` launcher (no GUI bundle)
brew install duneyou/dune/dune-ide-cli
```

The cask installs `Dune IDE.app` and links the bundled launcher to
`dune` on your PATH. The `dune-ide-cli` formula installs a standalone `dune`
binary that locates an already-installed `Dune IDE.app` (or `$DUNE_IDE_BIN`).

### Naming note: OCaml `dune`

Homebrew core ships an unrelated OCaml build tool named
[`dune`](https://formulae.brew.sh/formula/dune). Both install a `dune` binary.
This tap names the formula `dune-ide-cli` so it never shadows the core formula,
but the installed command is still `dune`. If you use both, control which one
wins on PATH (for example `brew unlink dune` to drop the OCaml one, or order
your PATH accordingly).

## Usage

```bash
dune .                       # open the current folder
dune src/main.rs             # open a file
dune -g src/main.rs:42:5     # open at line 42, column 5
dune -n ~/project            # open in a new window
dune -d a.txt b.txt          # diff two files
dune --wait CHANGELOG.md     # block until the file is closed (great for $EDITOR)
dune --install-extension ms-python.python
dune --list-extensions
dune --help
```

## Release assets

Formulas and casks expect assets published by the
[Dune IDE release workflow](https://github.com/duneyou/dune) for each tag
`vX.Y.Z`:

| Asset                          | Used by          |
|--------------------------------|------------------|
| `dune-darwin-arm64`            | `dune-ide-cli`   |
| `dune-darwin-x64`              | `dune-ide-cli`   |
| `dune-linux-arm64`             | `dune-ide-cli`   |
| `dune-linux-x64`               | `dune-ide-cli`   |
| `Dune-IDE-darwin-arm64.dmg`    | `dune-ide` cask  |
| `Dune-IDE-darwin-x64.dmg`      | `dune-ide` cask  |

## Updating `url` / `sha256` after a release

Run the **Update formulas** workflow (`workflow_dispatch`) in this repo with the
release version, or edit the files by hand using `shasum -a 256 <file>`.

## Contents

| File                        | Installs                                   |
|-----------------------------|--------------------------------------------|
| `Formula/dune-ide-cli.rb`   | `dune` launcher binary                     |
| `Casks/dune-ide.rb`         | `Dune IDE.app` + linked `dune` command     |

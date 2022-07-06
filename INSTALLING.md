# Installing

## Table of contents

- [Installing](#installing)
  - [Table of contents](#table-of-contents)
  - [Version Status](#version-status)
  - [Arch linux & Arch linux derivatives *Manjaro, EndeavorOS, etc...*](#arch-linux--arch-linux-derivatives-manjaro-endeavoros-etc)
  - [Other distros](#other-distros)
    - [Install script](#install-script)
    - [Install commands](#install-commands)
    - [Using git & GNU make](#using-git--gnu-make)
    - [PATH issues *(pokeget not found when doing a local install)*](#path-issues-pokeget-not-found-when-doing-a-local-install)
  - [Updating](#updating)
  - [Installing pokeget-lite](#installing-pokeget-lite)

## Version Status

- **Borked** means that some or all component are completely non-functional.
- **Semi-borked** means that while it works, it has major issues with certain functionality. *(Eg. the update script is really bad or doesn't work at all.)*
- **Deprecated** means that while still functional, it has a threat of becoming borked soon.
- **Not Recommended** avoid this version if possible, but everything should be functional.
- **Functional** means that it everything works correctly, but doesn't have the latest features or improvements.
- **Latest** means that it is the newest version.

| Version Status                                                               |
| ---------------------------------------------------------------------------- |
| ![...1.3.2](https://img.shields.io/badge/...1.3.1-borked-red)                |
| ![1.4-1.8.1](https://img.shields.io/badge/1.4--1.8.1-not_recommended-yellow) |
| ![1.9](https://img.shields.io/badge/1.9-latest-brightgreen)                  |

## Arch linux & Arch linux derivatives *Manjaro, EndeavorOS, etc...*

On Arch linux, you can install it from AUR:

``` bash
yay -S pokeget-git
```

## Other distros

### Install script

To run the install script you can run:

```bash
bash <(curl -s https://raw.githubusercontent.com/talwat/pokeget/main/scripts/install.sh)
```

Which should also offer you to setup `~/.local/bin` in PATH.

If the install script isn't working for you try the install commands or one of the other methods.

### Install commands

*Note: the install commands should be exactly the same for **updating**, and **repairing** pokeget in case `pokeget update` fails.*

You can install pokeget by running these install commands:

```bash
mkdir -p ~/.local/bin
curl -s https://raw.githubusercontent.com/talwat/pokeget/testing/pokeget --output ~/.local/bin/pokeget
chmod +x ~/.local/bin/pokeget
```

Which will preform a local installation, or to install for all users do:

```bash
sudo curl -s https://raw.githubusercontent.com/talwat/pokeget/testing/pokeget --output /usr/bin/pokeget
sudo chmod +x /usr/bin/pokeget
```

### Using [git](https://git-scm.com/) & GNU make

You can run these commands to install it with [git](https://git-scm.com/) & [make](https://www.gnu.org/software/make/).

To do a local install you can run:

```bash
git clone -b testing https://github.com/talwat/pokeget.git
cd pokeget

make install
```

Or for a global install run:

```bash
git clone -b testing https://github.com/talwat/pokeget.git
cd pokeget

make install PREFIX=/usr
```

### PATH issues *(pokeget not found when doing a local install)*

If pokeget is not found after doing a user installation, then do a system wide installation because this usually means `~/.local/bin` is not added to PATH.

If you want to add `~/.local/bin` to PATH append `export PATH="$HOME/.local/bin:$PATH"` to your shells rc file. For example you can run `echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.bashrc` if you use bash.

## Updating

If you want to update pokeget, you can either run `pokeget update` or follow the install commands.

If you installed pokeget with brew, rpm, or dpkg then please download the newest package from the releases tab and update that way.

## Installing pokeget-lite

To install pokeget-lite either run the install script or run these commands:

```bash
mkdir -p ~/.local/bin
curl -s https://raw.githubusercontent.com/talwat/pokeget/testing/pokeget-lite --output ~/.local/bin/pokeget-lite
chmod +x ~/.local/bin/pokeget-lite
```

Which will install pokeget-lite locally, if you want to install for all users run these commands:

```bash
sudo curl -s https://raw.githubusercontent.com/talwat/pokeget/testing/pokeget-lite --output /usr/bin/pokeget-lite
sudo chmod +x /usr/bin/pokeget-lite
```

# Installing

## Table of contents

- [Installing](#installing)
  - [Table of contents](#table-of-contents)
  - [Packaging status](#packaging-status)
  - [Version Status](#version-status)
  - [Arch linux & Arch linux derivatives *Manjaro, EndeavorOS, etc...*](#arch-linux--arch-linux-derivatives-manjaro-endeavoros-etc)
  - [Debian & Debian derivatives *Ubuntu, Linux mint, etc...*](#debian--debian-derivatives-ubuntu-linux-mint-etc)
  - [Red hat & rpm distros *Fedora, CentOS, OpenSUSE, etc...*](#red-hat--rpm-distros-fedora-centos-opensuse-etc)
  - [macOS with homebrew](#macos-with-homebrew)
  - [Other distros](#other-distros)
    - [Install script](#install-script)
    - [Install commands](#install-commands)
    - [Using git & GNU make](#using-git--gnu-make)
    - [PATH issues *(pokeget not found when doing a local install)*](#path-issues-pokeget-not-found-when-doing-a-local-install)
  - [Updating](#updating)
  - [Installing pokeget-lite](#installing-pokeget-lite)

## Packaging status

| Packaging Status                                                                      |
| ------------------------------------------------------------------------------------- |
| ![Install Commands](https://img.shields.io/badge/Install_Commands-Latest-brightgreen) |
| ![AUR](https://img.shields.io/badge/AUR-Latest-brightgreen)                           |
| ![Homebrew](https://img.shields.io/badge/Homebrew-1.7.3-orange)                       |
| ![RPM](https://img.shields.io/badge/.rpm-Latest-brightgreen)                          |
| ![DEB](https://img.shields.io/badge/.deb-Latest-brightgreen)                          |
| ![Glacier](https://img.shields.io/badge/Glacier-1.7.3-orange)                         |

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
| ![1.4-1.7.4](https://img.shields.io/badge/1.4--1.7.4-not_recommended-yellow) |
| ![1.8](https://img.shields.io/badge/1.8-functional-green)                    |
| ![1.8.1](https://img.shields.io/badge/1.8.1-latest-brightgreen)              |

## Arch linux & Arch linux derivatives *Manjaro, EndeavorOS, etc...*

On Arch linux, you can install it from AUR:

``` bash
yay -S pokeget-git
pokeget get-man # Run this if you also want manual pages
```

## Debian & Debian derivatives *Ubuntu, Linux mint, etc...*

You can download the .deb package from the [releases tab](https://github.com/talwat/pokeget/releases) and then use dpkg/apt to install pokeget. If you do that, please uninstall & update pokeget using dpkg/apt.

In true debian fashion this is the most stable option.

## Red hat & rpm distros *Fedora, CentOS, OpenSUSE, etc...*

You can download the .rpm package from the [releases tab](https://github.com/talwat/pokeget/releases) and then use rpm/your distros main package manager to install pokeget. If you do that, please uninstall & update pokeget using rpm/your distros main package manager.

*Note: You will have to run **get-man** to install the manual pages for now*

## macOS with homebrew

You can use brew to install pokeget by doing these commands:

```bash
brew tap talwat/pokeget https://github.com/talwat/pokeget
brew install --build-from-source pokeget
```

Which will add the pokeget tap and then install pokeget.

This should also work if you have brew on a Linux system.

## Other distros

### Install script

To run the install script you can run:

```bash
bash <(curl -s https://raw.githubusercontent.com/talwat/pokeget/testing/scripts/install.sh)
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
~/.local/bin/pokeget get-man # Run this if you would like manpages
```

Which will preform a local installation, or to install for all users do:

```bash
sudo curl -s https://raw.githubusercontent.com/talwat/pokeget/testing/pokeget --output /usr/bin/pokeget
sudo chmod +x /usr/bin/pokeget
/usr/bin/pokeget get-man # Run this if you would like manpages
```

### Using [git](https://git-scm.com/) & GNU make

You can run these commands to install it with [git](https://git-scm.com/) & [make](https://www.gnu.org/software/make/), which will automatically add the manpages.

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

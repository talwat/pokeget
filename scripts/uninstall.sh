#!/usr/bin/env bash

# Color variables

GREEN="\x1B[32m"
ORANGE="\x1B[33m"
CYAN="\x1B[36m"
RESET="\x1B[0m"
BOLD="\x1B[1m"
RED="\x1B[31m"

rm /tmp/pokeget-uninstall-log >/dev/null 2>&1

function log {
	echo -e "$1[!]${RESET} $2"
	echo -e "$2" | sed 's/\x1B\[[0-9;]\{1,\}[A-Za-z]//g' >>"/tmp/pokeget-uninstall-log"
}

function input {
	echo -e -n "$1[?]${RESET} $3: "
	read -r "$2"
	echo -e "Input:
  Question: $3
  Variable to write to: $2
  Answer: ${!2}" | sed 's/\x1B\[[0-9;]\{1,\}[A-Za-z]//g' >>"/tmp/pokeget-uninstall-log"
}

function yesOrNo {
	if [[ $1 == *"n"* ]]; then
		return 1
	else
		return 0
	fi
}

areYouSureInput="no"
log "$CYAN" "Uninstall script started."

assume_yes=false

for var; do
	case $var in
	-y)
		assume_yes=true
		;;
	-*)
		log "$RED" "Invalid flag: $var"
		exit 1
		;;
	*)
		log "$RED" "Invalid command: $var"
		;;
	esac
done

log "$CYAN" "Detecting if pokeget was installed with a package manager..."

if command dpkg -s pokeget >/dev/null 2>&1; then
	log "$RED" "It looks like you installed pokeget with dpkg, please uninstall pokeget with dpkg as well to avoid issues. You can do this by running ${BOLD}dpkg -r pokeget${RESET} as root."
	exit 1
elif command rpm -q pokeget >/dev/null 2>&1; then
	log "$RED" "It looks like you installed pokeget with rpm, please uninstall pokeget with rpm as well to avoid issues. You can do this by running ${BOLD}rpm -e pokeget${RESET} as root."
	exit 1
elif command brew ls --versions pokeget >/dev/null 2>&1; then
	log "$RED" "It looks like you installed pokeget with brew, please uninstall pokeget with brew as well to avoid issues. You can do this by running ${BOLD}brew remove pokeget${RESET}."
	exit 1
fi

if [ $assume_yes == true ]; then
	areYouSureInput="yes"
else
	input "$ORANGE" "areYouSureInput" "Are you sure you would like to uninstall pokeget (y/n)"
fi

if ! yesOrNo "$areYouSureInput"; then
	exit 1
fi

log "$ORANGE" "Uninstalling pokeget..."

if [ -f "$HOME/.local/bin/pokeget" ]; then
	log "$CYAN" "Removing pokeget from $HOME/.local/bin/pokeget..."

	rm "$HOME/.local/bin/pokeget"

	log "$CYAN" "Removing pokeget config file from $HOME/.config/pokeget..."

	rm -rf "$HOME/.config/pokeget"
fi

if [ -f "/usr/bin/pokeget" ]; then
	log "$CYAN" "Removing pokeget from /usr/bin/pokeget..."

	sudo rm "/usr/bin/pokeget"
fi
log "$GREEN" "pokeget has been successfully uninstalled."
log "$CYAN" "A log has been written to /tmp/pokeget-uninstall-log"

exit 0

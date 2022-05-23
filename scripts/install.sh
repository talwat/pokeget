#!/usr/bin/env bash

GREEN="\x1B[32m"
ORANGE="\x1B[33m"
RED="\x1B[31m"
CYAN="\x1B[36m"
BOLD="\x1B[1m"
RESET="\x1B[0m"

success=false

rm /tmp/pokeget-install-log >/dev/null 2>&1

function log {
	echo -e "$1[!]${RESET} $2"
	echo -e "$2" | sed 's/\x1B\[[0-9;]\{1,\}[A-Za-z]//g' >>"/tmp/pokeget-install-log"
}

function input {
	echo -e -n "$1[?]${RESET} $3: "
	read -r "$2"
	echo -e "Input:
  Question: $3
  Variable to write to: $2
  Answer: ${!2}" | sed 's/\x1B\[[0-9;]\{1,\}[A-Za-z]//g' >>"/tmp/pokeget-install-log"
}

log "$CYAN" "Install script started."

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
		exit 1
		;;
	esac
done

# Input variables

local_or_global_input="local"
pokeget_or_lite="pokeget"
continue_input="yes"

if [ $assume_yes = true ]; then
	script_name="pokeget"
else
	input "$CYAN" "pokeget_or_lite" "Would you like to install pokeget or pokeget-lite (pokeget/pokeget-lite/quit)"
fi

case $pokeget_or_lite in
*l*)
	script_name="pokeget-lite"
	;;
*q*)
	exit 1
	;;
*)
	script_name="pokeget"
	;;
esac

if [ $assume_yes = true ]; then
	local_or_global_input="local"
else
	input "$CYAN" "local_or_global_input" "Would you like to do a local install or a global install (local/global/quit)"
fi

case $local_or_global_input in
*g*)
	local_install=false
	install_path="/usr/bin"
	;;
*q*)
	exit 1
	;;
*)
	local_install=true
	install_path="$HOME/.local/bin"
	;;
esac

if [ $assume_yes = true ]; then
	continue_input="yes"
else
	input "$ORANGE" "continue_input" "Installing $script_name to $install_path, would you like to continue (y/n)"
fi

if [[ $continue_input == *"n"* ]]; then
	exit 1
fi

log "$CYAN" "Downloading $script_name..."
curl -s "https://raw.githubusercontent.com/talwat/pokeget/testing/$script_name" --output "/tmp/$script_name"

log "$CYAN" "Installing $script_name..."
log "$CYAN" "Making needed directories..."
mkdir -p "$install_path" "/tmp"

log "$CYAN" "Marking script as executable..."
chmod +x "/tmp/$script_name"

log "$CYAN" "Moving script to $install_path..."

if [ $local_install = false ]; then
	sudo mv "/tmp/$script_name" "$install_path"
else
	mv "/tmp/$script_name" "$install_path"
fi

if command which $script_name >/dev/null 2>&1; then
	log "$GREEN" "$script_name successfully installed and found in PATH!"
	success=true

elif [ -f "$HOME/.local/bin/$script_name" ] && [ $local_install = true ]; then
	add_to_path="n"

	if [ $assume_yes = true ]; then
		add_to_path="y"
	else
		input "$ORANGE" "add_to_path" "$script_name successfully installed, but ${BOLD}~/.local/bin${RESET} isn't in PATH. Would you like to add it to PATH (${BOLD}NOTE${RESET}: this only works if your using zsh/bash)"
	fi

	case $add_to_path in
	*y*)
		log "$CYAN" "Adding $script_name to PATH in shell rc files..."
		function appendPathAdd {
			if [ -f "$HOME/$1" ]; then
				printf "# Add ~/.local/bin to PATH (auto-generated by pokeget installer)\nexport PATH=\"\$HOME/.local/bin:\$PATH\"" >>"$HOME/$1"
			fi
		}
		appendPathAdd ".profile"
		appendPathAdd ".zprofile"
		appendPathAdd ".zshrc"
		appendPathAdd ".bashrc"
		log "$GREEN" "$script_name successfully installed! Make sure to restart your shell. (You can just re-open your terminal emulator)"
		success=true
		;;
	*)
		log "$CYAN" "A log has been written to /tmp/pokeget-install-log"
		exit 1
		;;
	esac
elif [ -f "/usr/bin/$script_name" ] && [ $local_install = true ]; then
	log "$ORANGE" "$script_name successfully installed, but somehow ${BOLD}/usr/bin${RESET} is not in PATH. Your OS installation may be corrupt."
	success=true
else
	log "$RED" "$script_name installation failed."
	log "$CYAN" "A log has been written to /tmp/pokeget-install-log"
	exit 1
fi

log "$CYAN" "A log has been written to /tmp/pokeget-install-log"

if [ $success = true ] && [ $script_name = "pokeget" ]; then
	log "$CYAN" "Running ${BOLD}pokeget get-man${RESET} to download manpages..."
	if [ $local_install ]; then
		"$HOME/.local/bin/pokeget" get-man
	else
		"/usr/bin/pokeget" get-man
	fi
	exit 0
fi

exit 1

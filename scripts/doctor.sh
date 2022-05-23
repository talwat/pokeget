#!/usr/bin/env bash

GREEN="\x1B[32m"
ORANGE="\x1B[33m"
RED="\x1B[31m"
CYAN="\x1B[36m"
BOLD="\x1B[1m"
RESET="\x1B[0m"

errors=0

rm /tmp/pokeget-doctor-log >/dev/null 2>&1

shopt -s extglob
ansi_filter() {
	local line
	local IFS=
	while read -r line || [[ "$line" ]]; do
		echo "${line//$'\e'[\[(]*([0-9;])[@-n]/}"
	done
}

function log {
	echo -e "$1[!]${RESET} $2"
	echo -e "$2" | sed 's/\x1B\[[0-9;]\{1,\}[A-Za-z]//g' >>"/tmp/pokeget-doctor-log"
}

function check_cmd {
	if command -v "$1" >/dev/null 2>&1; then
		return 0
	else
		return 1
	fi
}

log "${CYAN}" "Doctor script started."
log "${CYAN}" "Starting to test..."

if check_cmd "curl"; then
	log "$GREEN" "cURL found! Located in ${BOLD}$(which curl)${RESET}"
else
	log "$RED" "cURL not found."
	errors=$((errors + 1))
fi

if check_cmd "cat" && check_cmd "shuf"; then
	log "$GREEN" "GNU Coreutils found! Located in ${BOLD}$(which cat)${RESET} and ${BOLD}$(which shuf)${RESET}"
else
	log "$RED" "GNU Coreutils not found."
	errors=$((errors + 1))
fi

if check_cmd "pokeget"; then
	log "${GREEN}" "pokeget found! Located in ${BOLD}$(which pokeget)${RESET}"
else
	if [ -f "$HOME/.local/bin/pokeget" ]; then
		log "${RED}" "pokeget found, but not in PATH. You need to add ${BOLD}export PATH=\"\$HOME/.local/bin:\$PATH\"${RESET} to your shells rc file."
	else
		log "${RED}" "pokeget not found in PATH."
	fi

	errors=$((errors + 1))
fi

if command dpkg -s pokeget >/dev/null 2>&1; then
	log "$CYAN" "pokeget was installed with dpkg."
elif command rpm -q pokeget >/dev/null 2>&1; then
	log "$CYAN" "pokeget was installed with rpm."
elif command brew ls --versions pokeget >/dev/null 2>&1; then
	log "$CYAN" "pokeget was installed with brew."
elif [ -f "$HOME/.local/bin/pokeget" ] || [ -f "/usr/bin/pokeget" ]; then
	log "$CYAN" "pokeget was installed with either install commands, or another simular method."
else
	log "$ORANGE" "pokeget was not installed to a traditional location, or it is not installed at all."
	errors=$((errors + 1))
fi

# Check for macOS/darwin

if [[ $OSTYPE == *'darwin'* ]]; then
	log "${CYAN}" "Running Darwin (macOS)."
else
	source /etc/os-release

	log "${CYAN}" "Running $PRETTY_NAME"
fi

log "${CYAN}" "Kernel: $(uname -prs)"
log "${CYAN}" "TERM: $TERM"
log "${CYAN}" "Default shell: ${SHELL##*/}"
bash_version_output=$(bash --version | head -n 1)
log "${CYAN}" "Bash version: ${bash_version_output#*GNU bash, version }"
pokeget_version_output=$(pokeget version)
log "${CYAN}" "pokeget version: ${pokeget_version_output#*pokeget }"
shells_no_comments=$(sed '/^#/d' </etc/shells)
shells_no_empty=$(echo "$shells_no_comments" | sed '/^$/d')
shells_no_tabs=$(echo "$shells_no_empty" | sed "s/^/    /")
log "${CYAN}" "Shells:
$shells_no_tabs"
log "$CYAN" "Wrote a log to ${BOLD}/tmp/pokeget-doctor-log${RESET}"
exit $errors

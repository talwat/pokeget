#!/usr/bin/env bash

# Please do not submit feature requests for pokeget lite, as it is meant to be extremely simple.

# Color variables

CYAN="\x1B[36m"
RED="\x1B[31m"
BOLD="\x1B[1m"
RESET="\x1B[0m"

if [ "$1" = "" ]; then
	echo -e "${CYAN}[!]${RESET} Use ${BOLD}pokeget-lite [pokemon national dex id/pokemon name]${RESET}."
	exit 0

else
	rawId=$1

	# Parse the ID/Name

	if [[ $rawId =~ ^[0-9]+$ ]]; then
		id=$rawId
		length=${#id}

		# Loop until the pokemon ID's length is three. This makes '3' '003', '25' '025', etc...

		while ((length < 3)); do
			id=0$id
			length=${#id}
		done

		# Get final sprite

		r=$(curl -s -L "https://raw.githubusercontent.com/talwat/pokeget-sprites/main/pokemon_vanilla/small/${id}.txt")
	else
		id=$(echo "$rawId" | tr '[:upper:]' '[:lower:]')

		# Get final sprite

		r=$(curl -s -L "https://raw.githubusercontent.com/talwat/pokeget-sprites/main/pokemon_vanilla_named/small/${id}.txt")
	fi

	# Print output or 404 message

	if [[ $r == *"404"* ]]; then
		echo -e "${RED}[!]${RESET} Pokemon could not be found (404 Error)$RESET"
		exit 1
	else
		echo -e "$r$RESET"
		exit 0
	fi
fi

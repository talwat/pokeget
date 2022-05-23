#!/usr/bin/env bash

curl -s 'https://bulbapedia.bulbagarden.net/wiki/List_of_Pok%C3%A9mon_by_National_Pok%C3%A9dex_number' |
	tr -d '\n' |
	grep -oE 'Pokémon\)">[^<]+</a></td>' |
	sed -E 's/Pokémon\)">([^<]+)<\/a><\/td>/\1/' |
	uniq |
	awk -F',' -v OFS=',' '{ printf("%03i,%s\n", NR, $0) }'

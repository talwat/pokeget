#!/usr/bin/env bash

final=$(awk 'NR==2 {print "\nset -e"} 1' "$1")
echo "$final" >"$1"

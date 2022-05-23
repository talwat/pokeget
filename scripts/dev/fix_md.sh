#!/usr/bin/env bash

raw_content=$(cat docs/index.md)

link_lowercase=$(echo "$raw_content" | while IFS="" read -r p || [ -n "$p" ]; do
	if [[ $p == *"("* ]] && [[ $p == *")"* ]] && [[ $p == *".md"* ]]; then
		line=$(echo "$p" | cut -d"(" -f2 | cut -d")" -f1 | awk '{print tolower($0)}')
		echo "$p" | sed "s/(.*)/($line)/g"
	else
		echo "$p"
	fi
done)

linked_semi="${link_lowercase//.md\]\(/.md](https://talwat.github.io/pokeget/}"
linked_standalone="${linked_semi//.md)/)}"
final="${linked_standalone//.md#/#}"

echo "$final" >docs/index.md

for f in docs/*.md; do
	mv -v "$f" "$(echo "$f" | awk '{print tolower($0)}')"
done

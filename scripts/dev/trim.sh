#!/usr/bin/env bash

mkdir trimmed
mogrify -trim -path ./trimmed ./*.png

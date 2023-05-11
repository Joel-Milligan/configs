#!/usr/bin/env bash

[[ $- != *i* ]] && return # If not running interactively, don't do anything

for file in ~/.{alias,bash_prompt,exports}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

shopt -s nocaseglob; # Case-insensitive globbing (used in pathname expansion)
shopt -s histappend; # Append to the Bash history file, rather than overwriting it
shopt -s cdspell; # Autocorrect typos in path names when using `cd`

if [ -f /etc/bash_completion ]; then
	source /etc/bash_completion;
fi;

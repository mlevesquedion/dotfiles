#!/bin/bash

files=(
    bin
    .aliases
    .config/i3
    .config/polybar
    .profile
    .vimrc
    .zshrc
    .Xmodmap
    .oh-my-zsh/custom/themes
    .vim/ftplugin
)

for from in "${files[@]}"; do
    if [[ ! -e "$HOME/$from" ]]; then
        echo "$HOME/$from does not exist!"
        exit 1
    fi
done

for from in "${files[@]}"; do
    to="${from#.}"
    from="$HOME/$from"
    if [[ -d $from ]]; then
        mkdir -p "$to"
        cp -r "$from"/* "$to"
        continue
    fi
    cp "$from" "$to"
done

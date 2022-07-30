#! /bin/bash

dotfiles=("$HOME/.Xresources"
	  "$HOME/.xinitrc"
	  "$HOME/.zshrc"
	  "$HOME/.local/bin")

for file in "${dotfiles[@]}"; do
	rsync -av $file ./
done

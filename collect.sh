#! /bin/bash

dotfiles=("$HOME/.Xresources"
	  "$HOME/.xinitrc"
	  "$HOME/.zshrc"
	  "$HOME/.config/neofetch/config.conf"
	  "$HOME/.local/bin"
      "$HOME/.vimrc"
      "$HOME/.tmux.conf"
      "/home/unlock.sh")

for file in "${dotfiles[@]}"; do
	rsync -av $file ./
done

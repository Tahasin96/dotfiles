#!/bin/bash

# List of config folders you want to track
folders=("waybar" "hypr" "nvim" "wofi" "rofi" "kitty")

for folder in "${folders[@]}"; do
  rsync -av --delete ~/.config/$folder/ ~/dotfiles/$folder/
done

cd ~/dotfiles || exit

git add .
git commit -m "Update dotfiles"
git push

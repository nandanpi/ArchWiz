#!/bin/bash

# Checking if is running in Repo Folder
if [[ "$(basename "$(pwd)" | tr '[:upper:]' '[:lower:]')" =~ ^scripts$ ]]; then
    echo "You are running this in ArchWiz Folder."
    echo "Please use ./ArchWiz.sh instead"
    exit
fi

# Installing git

echo "Installing git."
pacman -Sy --noconfirm --needed git glibc

echo "Cloning the ArchWiz Project"
git clone https://github.com/christitustech/ArchWiz

echo "Executing ArchWiz Script"

cd $HOME/ArchWiz

exec ./ArchWiz.sh

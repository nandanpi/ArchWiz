#!/bin/bash
#github-action genshdoc
#
# @file ArchWiz
# @brief Entrance script that launches children scripts for each phase of installation.

# Find the name of the folder the scripts are in
set -a
SCRIPT_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
SCRIPTS_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"/scripts
CONFIGS_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"/configs
set +a
echo -ne "
-------------------------------------------------------------------------
                    ArchWiz Automated Arch Linux Installer
-------------------------------------------------------------------------
                Scripts are in directory named ArchWiz
"
    ( bash $SCRIPT_DIR/scripts/startup.sh )|& tee startup.log
      source $CONFIGS_DIR/setup.conf
    ( bash $SCRIPT_DIR/scripts/0-preinstall.sh )|& tee 0-preinstall.log
    ( arch-chroot /mnt $HOME/ArchWiz/scripts/1-setup.sh )|& tee 1-setup.log
    ( arch-chroot /mnt $HOME/ArchWiz/scripts/3-post-setup.sh )|& tee 3-post-setup.log
    cp -v *.log /mnt/home/$USERNAME

echo -ne "
-------------------------------------------------------------------------
                    ArchWiz Automated Arch Linux Installer
-------------------------------------------------------------------------
                Done - Please Eject Install Media and Reboot
"

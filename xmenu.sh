#!/bin/bash
echo "";
source menu.sh;

# Generates array of dialog option labels;
# These have no function other than display purposes.
declare -a options=(
    "sudo cp /etc/X11/xorg.conf.vga /etc/X11/xorg.conf"
    "sudo cp /etc/X11/xorg.conf.extern /etc/X11/xorg.conf"
    "sudo cp /etc/X11/xorg.conf.intern /etc/X11/xorg.conf"
    "Exit this menu."
                    );
generateDialog "options" "Kies Xorg-config" "${options[@]}"

read choice
# Do something after receiving user choice

# Each of these choices corresponds to one of the "options"
# declared above.
case $choice in
    [1]* ) sudo cp /etc/X11/xorg.conf.vga /etc/X11/xorg.conf;;
    [2]* ) sudo cp /etc/X11/xorg.conf.extern /etc/X11/xorg.conf;;
    [3]* ) sudo cp /etc/X11/xorg.conf.intern /etc/X11/xorg.conf;;
    [4]* ) echo "Exiting the menu.";  generateQuote;;
       * ) echo "Please select one of the options listed.";;
esac

#!/bin/bash
echo "";
source menu.sh;
  
# Generates array of dialog option labels; 
# These have no function other than display purposes.
declare -a options=(
    "ssh  zigmoo@dev.zigmoo-domain.com"
    "ssh  zigmoo@ci.zigmoo-domain.com"
    "ssh  zigmoo@scm.zigmoo-domain.com"
    "ssh  zigmoo@zigmoo_raspberry_pi.local"
    "ssh  zigmoo@vanilla_minecraft_server.local"
    "list 'screen' multiplexer sessions"
    "Exit this menu."
                    );
generateDialog "options" "$(whoami)@$(hostname): Choose an option" "${options[@]}"
  
read choice
# Do something after receiving user choice
  
# Each of these choices corresponds to one of the "options"
# declared above.  
case $choice in
    [1]* ) ssh  -i ~/.ssh/id_rsa zigmoo@dev.zigmoo-domain.com;           "${MENU_DIR}"/"${BASH_SOURCE[0]}";;
    [2]* ) ssh  -i ~/.ssh/id_rsa zigmoo@ci.zigmoo-domain.com;            "${MENU_DIR}"/"${BASH_SOURCE[0]}";;
    [3]* ) ssh  -i ~/.ssh/id_rsa zigmoo@scm.zigmoo-domain.com;           "${MENU_DIR}"/"${BASH_SOURCE[0]}";;
    [4]* ) ssh  -i ~/.ssh/id_rsa zigmoo@zigmoo_raspberry_pi.local;       "${MENU_DIR}"/"${BASH_SOURCE[0]}";;
    [5]* ) ssh  -i ~/.ssh/id_rsa zigmoo@vanilla_minecraft_server.local;  "${MENU_DIR}"/"${BASH_SOURCE[0]}";;
    [6]* ) screen -ls ;                                                  "${MENU_DIR}"/"${BASH_SOURCE[0]}";;
    [7]* ) echo "Exiting the menu.";  generateNapoleonQuote;;
       * ) echo "Please select one of the options listed.";;
esac

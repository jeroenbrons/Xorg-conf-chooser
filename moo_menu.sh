#!/bin/bash
echo "";
source menu.sh;
  
# Generates array of dialog options
declare -a options=(
    "ssh  zigmoo@server-01.zigmoodomain.com"
    "ssh  zigmoo@server-02.zigmoodomain.com"
    "ssh  zigmoo@server-03.zigmoodomain.com"
    "list 'screen' multiplexer sessions"
    "list 'screen' multiplexer sessions"
    "Exit this menu."
                    );
generateDialog "options" "$(whoami)@$(hostname): Choose an option" "${options[@]}"
  
read choice
# Do something after receiving user choice
  
case $choice in
    [1]* ) ssh  -i ~/.ssh/id_rsa_priv_key zigmoo@server-01.zigmoodomain.com;  "${MENU_DIR}"/"${BASH_SOURCE[0]}";;
    [2]* ) ssh  -i ~/.ssh/id_rsa_priv_key zigmoo@server-02.zigmoodomain.com;  "${MENU_DIR}"/"${BASH_SOURCE[0]}";;
    [3]* ) ssh  -i ~/.ssh/id_rsa_priv_key zigmoo@server-03.zigmoodomain.com;  "${MENU_DIR}"/"${BASH_SOURCE[0]}";;
    [4]* ) screen -ls ;                                                       "${MENU_DIR}"/"${BASH_SOURCE[0]}";;
    [5]* ) echo "Exiting the menu.";  generateNapoleonQuote;;
       * ) echo "Please select one of the options listed.";;
esac

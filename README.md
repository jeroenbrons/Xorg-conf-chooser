bash-menu-generator
=================

A simple bash script that will generate menus.

Examples
=================

![alt Bash Menu Options Moo Menu Example](https://raw.githubusercontent.com/zigmoo/bash-menu-generator/master/images/moo_menu_screenshot.png)

![alt Bash Menu Options Basic Example](https://raw.githubusercontent.com/JamieCruwys/bash-menu-generator/master/images/Bash%20Menu%20Options.png)

![alt Bash Menu Instructions Example](https://raw.githubusercontent.com/JamieCruwys/bash-menu-generator/master/images/Bash%20Menu%20Instructions.png)

Usage
=================


Start the menu using your own modified version 
of this customized commands script like so:

cd <the directory where your menu file lives>

./moo_menu.sh

=================

generateDialog
-----------------
**Parameter 1:** "options" to use **[1]** or "instructions" for **1.**  
**Parameter 2:** Title for the menu  
**Parameter 3:** Array of options or instructions to show  

`e.g. generateDialog "options" "Choose an option" "${options[@]}"`


Configuration
=================

- **symbol** - Which character to be used to create the menu
- **paddingSymbol** - Character to space and center the text
- **lineLength** - How wide the menu should be
- **charsToOption** - How much padding you want from the sides of the menu
- **charsToName** - How much padding you want around the text

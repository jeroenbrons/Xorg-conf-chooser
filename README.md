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


Quick Start:
=================
-----------------
Launch the menu quickly by executing the launch command script like so:

`cd <the directory where your menu.sh, moo_menu.sh, and quotes.txt files live>`

`./moo_menu.sh`

When ready, customize moo_menu.sh (and even rename it) for your own purposes!
The quotes.txt file is optional. Customize it to your liking, or just remove it.

Write your own moo_menu.sh scratch:
=================

------

Internal Function: generateDialog()
-----------------
**Parameter 1:** "options" to use **[1]** or "instructions" for **1.**  
**Parameter 2:** Title for the menu  
**Parameter 3:** Array of options or instructions to show  

`e.g. generateDialog "options" "Choose an option" "${options[@]}"`


Configuration
-----------------
- **SYMBOL** - Which character to be used to create the menu
- **PADDING_SYMBOL** - Character to space and center the text
- **LINE_LENGTH** - How wide the menu should be
- **CHARS_TO_OPTION** - How much padding you want from the sides of the menu
- **CHARS_TO_NAME** - How much padding you want around the text
- 

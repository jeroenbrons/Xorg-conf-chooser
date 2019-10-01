bash-menu-generator
=================

A simple bash script that will generate menus.

Examples
=================

![alt Bash Menu Options Moo Menu Example](https://raw.githubusercontent.com/zigmoo/bash-menu-generator/master/images/moo_menu_screenshot.png)


Usage
=================


Advanced Quick Start Launcher (moo_menu.sh):
=================
-----------------
Launch the menu quickly by executing the launch command script like so:

```cd <the directory where your menu.sh, moo_menu.sh, and quotes.txt files live>```

```./moo_menu.sh```

When ready, customize moo_menu.sh (and even rename it) for your own purposes!
The quotes.txt file is optional. Customize it to your liking, or just remove it.

Write your own Launcher from scratch:
=================

Super-Basic Example Launcher:
------
example.sh:
------
```
#!/bin/bash
source menu.sh

# Generates dialog with options
declare -a options=("Enable WiFi" "Disable flux capacitor" "Check repository status" "Walk the dog");
generateDialog "options" "Choose an option" "${options[@]}"

read choice
# Do something after getting their choice

clear

# Generates a dialog with ordered instructions
declare -a instructions=("Turn on the computer" "Check WiFi is enabled" "Go to GitHub" "Star cool repositories");
generateDialog "instructions" "GitHub Instructions" "${instructions[@]}"
```
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

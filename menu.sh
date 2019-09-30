#!/bin/bash

# menu.sh
# Description: Bash menu generator
#
# Created by Jamie Cruwys on 21/02/2014.
# https://github.com/JamieCruwys/bash-menu-generator
# Thanks Jamie!! - zigmoo
# - inconsequential tweaks by Jason Ziegler / zigmoo
#

# Configuration
SYMBOL="*"
PADDING_SYMBOL=" "
LINE_LENGTH=70
CHARS_TO_OPTION=1
CHARS_TO_NAME=3
MENU_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
QUOTES="$MENU_DIR"/"quotes.txt"

function generateQuote() {
    # If the quotes.txt file is found, then use it
    # Otherwise, do nothing.
    if [[ -f $QUOTES ]]; then
        LOW=1;
        HIGH=$(cat $QUOTES|wc -l);
        RANDOM_QUOTE_ROW=$((LOW + RANDOM % (1 + HIGH - LOW)))
        QUOTE_AUTHOR=$(sed -n ${RANDOM_QUOTE_ROW}p $QUOTES | awk -F "|" '{print $1}')
        QUOTE=$(sed -n ${RANDOM_QUOTE_ROW}p $QUOTES | awk -F "|" '{print $2}')
        echo ""
        echo "Farewell from $QUOTE_AUTHOR:"
        echo "    $QUOTE"
        echo ""
    fi
}

function generatePadding() {

    STRING="";

    for (( i=0; i < $2; i++ )); do
        STRING+="$1";
    done
    echo "$STRING";

}

# Generated configs
REMAINING_LENGTH=$(( $LINE_LENGTH - 2 ));
MENU_LINE=$(generatePadding "${SYMBOL}" "${LINE_LENGTH}");
TO_OPTIONS_PADDING=$(generatePadding "${PADDING_SYMBOL}" "${CHARS_TO_OPTION}");
TO_NAME_PADDING=$(generatePadding "$PADDING_SYMBOL" "$CHARS_TO_NAME");

# generateText (text)
function generateText() {

    TOTAL_CHARS_TO_PAD=$((REMAINING_LENGTH - ${#1}));
    CHARS_TO_PAD_EACH_SIDE=$((TOTAL_CHARS_TO_PAD / 2));
    PADDING=$(generatePadding "$PADDING_SYMBOL" "$CHARS_TO_PAD_EACH_SIDE");
    totalChars=$(( ${#SYMBOL} + ${#PADDING} + ${#1} + ${#PADDING} + ${#SYMBOL} ));

    if [[ ${totalChars} < ${LINE_LENGTH} ]]; then
        echo "${SYMBOL}${PADDING}${1}${PADDING}${PADDING_SYMBOL}${SYMBOL}";
    else
        echo "${SYMBOL}${PADDING}${1}${PADDING}${SYMBOL}";
    fi
}

# generateTitle (title)
function generateTitle() {

    echo "$MENU_LINE"
    generateText ""
    generateText "$1"
    generateText ""
    echo "$MENU_LINE"

}

# generateOption (dialogType, optionNumber, optionName)
function generateOption() {

    TEMP_OPTIONS_PADDING=$TO_OPTIONS_PADDING
    TEMP_NAME_PADDING=$TO_NAME_PADDING

    if [[ $1 == "options" ]]; then

        if [[ $3 == "Exit" ]] || [[ $3 == "Return to the main menu" ]]; then
            OPTION_STRING="[0]"
        else
            OPTION_STRING="[$2]"
        fi

    elif [[ $1 == "instructions" ]]; then
        OPTION_STRING="$2."
    fi

    CHARS_TO_PAD_NAME=$(( ${LINE_LENGTH} - ${#SYMBOL} - ${#TEMP_OPTIONS_PADDING} - ${#OPTION_STRING} - ${#TEMP_NAME_PADDING} - ${#3} - ${#SYMBOL} ));
    NAME_PADDING=$(generatePadding "$PADDING_SYMBOL" "$CHARS_TO_PAD_NAME");

    echo "${SYMBOL}${TEMP_OPTIONS_PADDING}${OPTION_STRING}${TEMP_NAME_PADDING}${3}${NAME_PADDING}${SYMBOL}";
}

# generateOptionsFromArray (dialogType, array[options])
function generateOptionsFromArray() {

    INDEX=1
    generateText ""

    for OPTION in "${@:2}"

        do
            if [[ "$1" == "message" ]]; then
                generateText "$OPTION"
            else
                generateOption "$1" "$INDEX" "$OPTION"
            fi
            ((INDEX++))
        done

    generateText ""
}

# generateDialog (dialogType, dialogTitle, array[options])
function generateDialog() {
    generateTitle "$2"
    generateOptionsFromArray "$1" "${@:3}"
    echo "$MENU_LINE";
}

# generateGoBackDialog (name, isNewLine)
function generateGoBackDialog() {

    if [[ $2 == "true" ]]; then
        echo -e "\n$MENU_LINE"
    else
        echo -e "$MENU_LINE"
    fi

    generateText ""
    generateOption "options" "0" "$1"
    generateText ""
    echo -e "$MENU_LINE"
}

# generateMessageDialog (title, array[message])
function generateMessageDialog() {

    if [[ "${#1}" > 0 ]]; then
        generateTitle "$1"
    fi

    generateOptionsFromArray "message" "${@:2}"
    echo "$MENU_LINE"

}

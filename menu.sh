#!/bin/sh
  
# menu.sh
# Description: Bash menu generator
#
# Created by Jamie Cruwys on 21/02/2014.
# https://github.com/JamieCruwys/bash-menu-generator
# Thanks Jamie!! - zigmoo
# - inconsequential tweaks by Jason Ziegler / zigmoo
#

# Configuration
symbol="*"
paddingSymbol=" "
lineLength=70
charsToOption=1
charsToName=3
MENU_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

napoleon_quotes="${MENU_DIR}"/"napoleon.txt"

function generateNapoleonQuote() {
    low=1;
    high=$(cat $napoleon_quotes|wc -l);
    random_quote_row=$((low + RANDOM % (1 + high - low)))
    echo ""
    echo "Napoleon Dynamite:"
    quote=$( sed -n ${random_quote_row}p $napoleon_quotes )
    echo "    $quote"
    echo ""
}

function generatePadding() {

    string="";

    for (( i=0; i < $2; i++ )); do
        string+="$1";
    done
    echo "$string";

}
  
# Generated configs
remainingLength=$(( $lineLength - 2 ));
line=$(generatePadding "${symbol}" "${lineLength}");
toOptionPadding=$(generatePadding "${paddingSymbol}" "${charsToOption}");
toNamePadding=$(generatePadding "$paddingSymbol" "$charsToName");
  
# generateText (text)
function generateText() {

    totalCharsToPad=$((remainingLength - ${#1}));
    charsToPadEachSide=$((totalCharsToPad / 2));
    padding=$(generatePadding "$paddingSymbol" "$charsToPadEachSide");
    totalChars=$(( ${#symbol} + ${#padding} + ${#1} + ${#padding} + ${#symbol} ));

    if [[ ${totalChars} < ${lineLength} ]]; then
        echo "${symbol}${padding}${1}${padding}${paddingSymbol}${symbol}";
    else
        echo "${symbol}${padding}${1}${padding}${symbol}";
    fi
}
  
# generateTitle (title)
function generateTitle() {

    echo "$line"
    generateText ""
    generateText "$1"
    generateText ""
    echo "$line"

}
  
# generateOption (dialogType, optionNumber, optionName)
function generateOption() {

    tempOptionPadding=$toOptionPadding
    tempNamePadding=$toNamePadding

    if [[ $1 == "options" ]]; then

        if [[ $3 == "Exit" ]] || [[ $3 == "Return to the main menu" ]]; then
            optionString="[0]"
        else
            optionString="[$2]"
        fi
    
    elif [[ $1 == "instructions" ]]; then
        optionString="$2."
    fi

    charsToPadName=$(( ${lineLength} - ${#symbol} - ${#tempOptionPadding} - ${#optionString} - ${#tempNamePadding} - ${#3} - ${#symbol} ));
    namePadding=$(generatePadding "$paddingSymbol" "$charsToPadName");

    echo "${symbol}${tempOptionPadding}${optionString}${tempNamePadding}${3}${namePadding}${symbol}";
}
  
# generateOptionsFromArray (dialogType, array[options])
function generateOptionsFromArray() {

    index=1
    generateText ""

    for OPTION in "${@:2}"

        do
            if [[ "$1" == "message" ]]; then
                generateText "$OPTION"
            else
                generateOption "$1" "$index" "$OPTION"
            fi
            ((index++))
        done

    generateText ""
}
  
# generateDialog (dialogType, dialogTitle, array[options])
function generateDialog() {
    generateTitle "$2"
    generateOptionsFromArray "$1" "${@:3}"
    echo "$line";
}
  
# generateGoBackDialog (name, isNewLine)
function generateGoBackDialog() {

    if [[ $2 == "true" ]]; then
        echo -e "\n$line"
    else
        echo -e "$line"
    fi

    generateText ""
    generateOption "options" "0" "$1"
    generateText ""
    echo -e "$line"
}
  
# generateMessageDialog (title, array[message])
function generateMessageDialog() {

    if [[ "${#1}" > 0 ]]; then
        generateTitle "$1"
    fi

    generateOptionsFromArray "message" "${@:2}"
    echo "$line"

}

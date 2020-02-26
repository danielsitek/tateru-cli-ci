#!/bin/bash

# ###
# Compare generated files in dist/ against preserved files in sample/.
# Return error if any file differs.
#
# @link https://www.linuxquestions.org/questions/linux-software-2/diff-how-do-i-read-it-as-true-or-false-871240/
# ###

testDiff() {
    RETURN=0

    printf "\n"
    printf "Testing Diff\n"
    echo "------------"
    printf "\n"

    for file in "$@"
    do
        diff -q "sample/$file" "dist/$file" 1>/dev/null
        if [[ $? == "0" ]]
        then
            printf "> %-30s same\n" $file
        else
            printf "> %-30s diff\n" $file
            RETURN=1
        fi
    done

    printf "\n"
    printf "Result >"

    if [[ $RETURN == "0" ]]
    then
        printf "%-24s \e[1;32mFiles are same\e[0m\n" ""
    else
        printf "%-24s \e[1;31mFiles are in diff\e[0m\n" ""
    fi

    return $RETURN
}

testDiff 'index.html' 'about.html'

exit $?;

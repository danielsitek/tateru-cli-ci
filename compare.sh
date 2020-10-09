#!/bin/bash

# ###
# Compare generated files in dist/ against preserved files in sample/.
# Return error if any file differs.
#
# @link https://www.linuxquestions.org/questions/linux-software-2/diff-how-do-i-read-it-as-true-or-false-871240/
# ###

ENV=${1:-dev}

testDiff() {
    RETURN=0;

    printf "%s\n" "";
    printf "%s\n" "${ENV^^} Testing Diff";
    printf "%s\n" "-----------------";
    printf "%s\n" "";

    for file in "$@";
    do
        SAMPLE_FILE="sample/${ENV}/${file}";
        DIST_FILE="dist/${file}";
        EXISTS=0

        if [ ! -e $SAMPLE_FILE ]
        then
            printf "%s\n" "File sample/${ENV}/${file} does not exists";
            EXISTS=1
        fi

        if [ ! -e $DIST_FILE ]
        then
            printf "%s\n" "File dist/${file} does not exists";
            EXISTS=1
        fi

        if [ $EXISTS -eq 0 ]
        then
            diff -q $SAMPLE_FILE $DIST_FILE 1>/dev/null
            if [ $? -eq 0 ]
            then
                printf "> %-30s same\n" "${file}";
            else
                printf "> %-30s diff\n" "${file}";
                RETURN=1
            fi
        else
            RETURN=1
        fi
    done

    printf "%s\n" ""
    printf "%s" "Result >"

    if [ $RETURN -eq 0 ]
    then
        printf "%-24s \e[1;32mFiles are same\e[0m\n";
    else
        printf "%-24s \e[1;31mFiles are in diff\e[0m\n";
    fi

    printf "%s\n" ""

    return $RETURN
}

testDiff 'index.html' 'about.html' 'robots.txt' 'sitemap.xml' 'manifest.json'

exit $?;

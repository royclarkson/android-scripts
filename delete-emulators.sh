#!/bin/bash

function echoheading {
    echo "-------------------"
    echo " $1"
    echo "-------------------"
    echo
}

function deleteavd {
    android delete avd --name Android-$API
    echo
    android delete avd --name Android-$API-x86
    echo
}

APIS=( 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 )
for API in "${APIS[@]}"; do
    echoheading "Delete Android-$API"
    deleteavd $API
done

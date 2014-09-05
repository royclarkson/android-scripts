#!/bin/bash

function echoheading {
    echo "-------------------"
    echo " $1"
    echo "-------------------"
    echo 
}

function createavd {
    echo no | android --silent create avd --name $1 --target android-$2 --abi $3 --force
    echo 
}

function deleteavd {
    android delete avd --name Android-$API
    echo 
    android delete avd --name Android-$API-x86
    echo 
}

APIS=( 7 8 9 10 11 12 13 14 15 16 17 18 19 L )
for API in "${APIS[@]}"; do
    echoheading "Delete Android-$API"
    deleteavd $API
    echoheading "Create Android-$API"
    if [ "$API" -lt "14" ]; then
        createavd Android-$API $API "armeabi"
    else
        createavd Android-$API $API "armeabi-v7a"
    fi
    createavd Android-$API-x86 $API "x86"
done

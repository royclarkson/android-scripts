#!/bin/bash
function createavd {
    if [ -n "$2" ]; then
        echo "no" | android create avd -n Android-$1 -t android-$1 --abi $2 --force
    else
        echo "no" | android create avd -n Android-$1 -t android-$1 --force
    fi
}
for ((API=8; API<=19; API++)); do
    android delete avd -n Android-$API
    output=$(createavd $API)
    ret=$?
    echo $output
    if [ $ret -ne 0 ]; then
        if [[ $output == *armeabi-v7a* ]]; then
            createavd $API "armeabi-v7a"
        elif [[ $output == *armeabi* ]]; then
            createavd $API "armeabi"
        fi
    fi
done

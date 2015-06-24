#!/bin/bash

#Android Developers Dashboards
APIS=( 10 15 16 17 18 19 21 22)
for API in "${APIS[@]}"; do
    emulator @Android-$API -no-boot-anim &
    ret=$?
    if [ $ret -eq 0 ]; then
        sleep 15
    fi
done
sleep 15
adb devices -l

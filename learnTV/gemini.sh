#!/bin/bash 

choice=0

while [ "$choice" -ne 5 ]
do
    echo "=============================="
    echo "   LINUX DISTRO EXPLORER      "
    echo "=============================="
    echo "1 - Arch"
    echo "2 - CentOS"
    echo "3 - Debian"
    echo "4 - Ubuntu"
    echo "5 - EXIT SCRIPT"
    echo "=============================="
    printf "Choose an option: "
    read choice

    case "$choice" in
        1) echo -e "\nBy the way, I use Arch.\n";;
        2) echo -e "\nCentOS is rock solid for servers.\n";;
        3) echo -e "\nDebian is the grandfather of stability.\n";;
        4) echo -e "\nUbuntu is the cloud king.\n";;
        5) echo -e "\nGoodbye! Happy Engineering.\n";;
        *) echo -e "\nInvalid choice, try 1-5.\n";;
    esac
    
    sleep 1
done

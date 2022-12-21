#!/bin/bash

. instalacion.sh

sudo apt install fzy

PS3='Please enter your choice: '
options=(Ubuntu "Debian based distribution" Fedora "Arch or Arch based distrobution" Quit)
echo "Please choose an option:"
select opt in "${options[@]}"
do
    case $opt in
        "Ubuntu")
            echo "you chose Ubuntu"
            ;;
        "Debian based distribution")
            echo "you chose Debian based distribution"
            ;;
        "Fedora")
            echo "you chose Fedora"
            ;;
        "Arch or Arch based distrobution")
            echo "you chose Arch or Arch based distrobution"
            ;;
        "Quit")
            break
            ;;
        *) echo "invalid option $REPLY";;
    esac
done

do
    options=(opt1 "option 2" another "option here")
    echo "Please choose an option:"
    printf "%s\n" "${options[@]}" | fzy
    case $options in
        "Ubuntu")
            echo "you chose Ubuntu"
            ;;
        "Debian based distribution")
            echo "you chose Debian based distribution"
            ;;
        "Fedora")
            echo "you chose Fedora"
            ;;
        "Arch or Arch based distrobution")
            echo "you chose Arch or Arch based distrobution"
            ;;
        "Quit")
            break
            ;;
        *) echo "invalid option $REPLY";;
    esac
done


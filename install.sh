#!/bin/bash

echo "===================================================================================================="
echo ""
echo "██╗░░░░░██╗███╗░░██╗██╗░░░██╗██╗░░██╗ ███████╗██████╗░███████╗░██████╗██╗░░██╗"
echo "██║░░░░░██║████╗░██║██║░░░██║╚██╗██╔╝ ██╔════╝██╔══██╗██╔════╝██╔════╝██║░░██║"
echo "██║░░░░░██║██╔██╗██║██║░░░██║░╚███╔╝░ █████╗░░██████╔╝█████╗░░╚█████╗░███████║"
echo "██║░░░░░██║██║╚████║██║░░░██║░██╔██╗░ ██╔══╝░░██╔══██╗██╔══╝░░░╚═══██╗██╔══██║"
echo "███████╗██║██║░╚███║╚██████╔╝██╔╝╚██╗ ██║░░░░░██║░░██║███████╗██████╔╝██║░░██║"
echo "╚══════╝╚═╝╚═╝░░╚══╝░╚═════╝░╚═╝░░╚═╝ ╚═╝░░░░░╚═╝░░╚═╝╚══════╝╚═════╝░╚═╝░░╚═╝"
echo ""
echo "██╗███╗░░██╗░██████╗████████╗░█████╗░██╗░░░░░██╗░░░░░ ░██████╗░█████╗░██████╗░██╗██████╗░████████╗"
echo "██║████╗░██║██╔════╝╚══██╔══╝██╔══██╗██║░░░░░██║░░░░░ ██╔════╝██╔══██╗██╔══██╗██║██╔══██╗╚══██╔══╝"
echo "██║██╔██╗██║╚█████╗░░░░██║░░░███████║██║░░░░░██║░░░░░ ╚█████╗░██║░░╚═╝██████╔╝██║██████╔╝░░░██║░░░"
echo "██║██║╚████║░╚═══██╗░░░██║░░░██╔══██║██║░░░░░██║░░░░░ ░╚═══██╗██║░░██╗██╔══██╗██║██╔═══╝░░░░██║░░░"
echo "██║██║░╚███║██████╔╝░░░██║░░░██║░░██║███████╗███████╗ ██████╔╝╚█████╔╝██║░░██║██║██║░░░░░░░░██║░░░"
echo "╚═╝╚═╝░░╚══╝╚═════╝░░░░╚═╝░░░╚═╝░░╚═╝╚══════╝╚══════╝ ╚═════╝░░╚════╝░╚═╝░░╚═╝╚═╝╚═╝░░░░░░░░╚═╝░░░"
echo "====================================================================================================="

PS3='Please enter your choice: '
options=("Ubuntu" "Debian" "Debian based distribution" "Fedora" "Arch or Arch based distrobution" "Quit")
echo "Please choose an option:"
select opt in "${options[@]}"
do
    case $opt in
        "Ubuntu")
            sh ./scripts/ubuntu.sh
            sudo sh ./scripts/sudoubuntu.sh
            break
            ;;
        "Debian")
            sh ./scripts/debian.sh
            sudo sh ./scripts/sudodebian.sh
            break
            ;;
        "Debian based distribution")
            sh ./scripts/debdist.sh
            sudo sh ./scripts/sudodebdist.sh
            break
            ;;
        "Ubuntu based distribution")
            sh ./scripts/ubudist.sh
            sudo sh ./scripts/sudoubudest.sh
            break
            ;;
        "Fedora")
            sh ./scripts/fedora.sh
            sudo sh ./scripts/sudofedora.sh
            break
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
echo ""
echo "====================================================================================================="
echo ""
echo "██╗░░░░░██╗███╗░░██╗██╗░░░██╗██╗░░██╗ ███████╗██████╗░███████╗░██████╗██╗░░██╗"
echo "██║░░░░░██║████╗░██║██║░░░██║╚██╗██╔╝ ██╔════╝██╔══██╗██╔════╝██╔════╝██║░░██║"
echo "██║░░░░░██║██╔██╗██║██║░░░██║░╚███╔╝░ █████╗░░██████╔╝█████╗░░╚█████╗░███████║"
echo "██║░░░░░██║██║╚████║██║░░░██║░██╔██╗░ ██╔══╝░░██╔══██╗██╔══╝░░░╚═══██╗██╔══██║"
echo "███████╗██║██║░╚███║╚██████╔╝██╔╝╚██╗ ██║░░░░░██║░░██║███████╗██████╔╝██║░░██║"
echo "╚══════╝╚═╝╚═╝░░╚══╝░╚═════╝░╚═╝░░╚═╝ ╚═╝░░░░░╚═╝░░╚═╝╚══════╝╚═════╝░╚═╝░░╚═╝"
echo ""
echo "██╗███╗░░██╗░██████╗████████╗░█████╗░██╗░░░░░██╗░░░░░ ░██████╗░█████╗░██████╗░██╗██████╗░████████╗"
echo "██║████╗░██║██╔════╝╚══██╔══╝██╔══██╗██║░░░░░██║░░░░░ ██╔════╝██╔══██╗██╔══██╗██║██╔══██╗╚══██╔══╝"
echo "██║██╔██╗██║╚█████╗░░░░██║░░░███████║██║░░░░░██║░░░░░ ╚█████╗░██║░░╚═╝██████╔╝██║██████╔╝░░░██║░░░"
echo "██║██║╚████║░╚═══██╗░░░██║░░░██╔══██║██║░░░░░██║░░░░░ ░╚═══██╗██║░░██╗██╔══██╗██║██╔═══╝░░░░██║░░░"
echo "██║██║░╚███║██████╔╝░░░██║░░░██║░░██║███████╗███████╗ ██████╔╝╚█████╔╝██║░░██║██║██║░░░░░░░░██║░░░"
echo "╚═╝╚═╝░░╚══╝╚═════╝░░░░╚═╝░░░╚═╝░░╚═╝╚══════╝╚══════╝ ╚═════╝░░╚════╝░╚═╝░░╚═╝╚═╝╚═╝░░░░░░░░╚═╝░░░"
echo ""
echo "███████╗██╗███╗░░██╗██╗░██████╗██╗░░██╗███████╗██████╗░"
echo "██╔════╝██║████╗░██║██║██╔════╝██║░░██║██╔════╝██╔══██╗"
echo "█████╗░░██║██╔██╗██║██║╚█████╗░███████║█████╗░░██║░░██║"
echo "██╔══╝░░██║██║╚████║██║░╚═══██╗██╔══██║██╔══╝░░██║░░██║"
echo "██║░░░░░██║██║░╚███║██║██████╔╝██║░░██║███████╗██████╔╝"
echo "╚═╝░░░░░╚═╝╚═╝░░╚══╝╚═╝╚═════╝░╚═╝░░╚═╝╚══════╝╚═════╝░"
echo ""
echo "====================================================================================================="
echo "                                    You can reboot your computer                                     "
echo "====================================================================================================="

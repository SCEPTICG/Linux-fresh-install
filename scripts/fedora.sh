#!/bin/bash

echo"================================================"
echo""
echo"███████╗███████╗██████╗░░█████╗░██████╗░░█████╗░"
echo"██╔════╝██╔════╝██╔══██╗██╔══██╗██╔══██╗██╔══██╗"
echo"█████╗░░█████╗░░██║░░██║██║░░██║██████╔╝███████║"
echo"██╔══╝░░██╔══╝░░██║░░██║██║░░██║██╔══██╗██╔══██║"
echo"██║░░░░░███████╗██████╔╝╚█████╔╝██║░░██║██║░░██║"
echo"╚═╝░░░░░╚══════╝╚═════╝░░╚════╝░╚═╝░░╚═╝╚═╝░░╚═╝"
echo""
echo"================================================"
echo"       Automated Fedora Config Installer        "  
echo"================================================"

echo"================================================"
echo"               Making DNF better                "
echo"================================================"
sleep 2

sudo cp conf/dnf.conf /etc/dnf/dnf.conf

echo"================================================"
echo"                Updating Fedora                 "
echo"================================================"
sleep 2

sudo dnf upgrade -y

echo"================================================"
echo"              Enabling RPM Fusion               "
echo"================================================"
sleep 2

sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -y
sudo dnf groupupdate core -y

echo"================================================"
echo"            Add Flathub Repository              "
echo"================================================"
sleep 2

flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

echo"================================================"
echo"             Install media codecs               "
echo"================================================"
sleep 2



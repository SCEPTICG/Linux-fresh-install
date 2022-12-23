#!/bin/bash

echo "========================================================================================="
echo ""
echo "    ░██████╗██╗░░░██╗██████╗░░█████╗░  ██████╗░███████╗██████╗░██╗░█████╗░███╗░░██╗    "
echo "    ██╔════╝██║░░░██║██╔══██╗██╔══██╗  ██╔══██╗██╔════╝██╔══██╗██║██╔══██╗████╗░██║    "
echo "    ╚█████╗░██║░░░██║██║░░██║██║░░██║  ██║░░██║█████╗░░██████╦╝██║███████║██╔██╗██║    "
echo "    ░╚═══██╗██║░░░██║██║░░██║██║░░██║  ██║░░██║██╔══╝░░██╔══██╗██║██╔══██║██║╚████║    "
echo "    ██████╔╝╚██████╔╝██████╔╝╚█████╔╝  ██████╔╝███████╗██████╦╝██║██║░░██║██║░╚███║    "
echo "    ╚═════╝░░╚═════╝░╚═════╝░░╚════╝░  ╚═════╝░╚══════╝╚═════╝░╚═╝╚═╝░░╚═╝╚═╝░░╚══╝    "
echo ""
echo "========================================================================================="
echo "                         Automated Debian Config Installer for sudo                      "
echo "========================================================================================="
echo ""

echo "====================================================="
echo "                 Installing Astrovim                 "
echo "====================================================="
echo ""
sleep 2
#INSTALAMOS ASTROVIM PARA ROOT
mv ~/.local/share/nvim/site ~/.local/share/nvim/site.bak
git clone https://github.com/AstroNvim/AstroNvim ~/.config/nvim
nvim +PackerSync

echo "====================================================="
echo "  Installing and configuring OhMyBash  "
echo "====================================================="
echo ""
sleep 2
bash -c "$(wget https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh -O -)"
cp config/p10k.zsh ~/.p10k.zsh

echo "====================================================="
echo "                   Installing FZF                    "
echo "====================================================="
echo ""
sleep 2
#INSTALAMOS FZF PARA ROOT
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
exit
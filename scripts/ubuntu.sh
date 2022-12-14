#!/bin/bash

echo "====================================================="
echo ""
echo "██╗░░░██╗██████╗░██╗░░░██╗███╗░░██╗████████╗██╗░░░██╗"
echo "██║░░░██║██╔══██╗██║░░░██║████╗░██║╚══██╔══╝██║░░░██║"
echo "██║░░░██║██████╦╝██║░░░██║██╔██╗██║░░░██║░░░██║░░░██║"
echo "██║░░░██║██╔══██╗██║░░░██║██║╚████║░░░██║░░░██║░░░██║"
echo "╚██████╔╝██████╦╝╚██████╔╝██║░╚███║░░░██║░░░╚██████╔╝"
echo "░╚═════╝░╚═════╝░░╚═════╝░╚═╝░░╚══╝░░░╚═╝░░░░╚═════╝░"
echo ""
echo "====================================================="
echo "          Automated Ubuntu Config Installer          "
echo "====================================================="
echo ""

echo "====================================================="
echo "                   Updating ubuntu                   "
echo "====================================================="
echo ""
sleep 2
#ACTUALIZAMOS UBUNTU
sudo apt update 
sudo apt upgrade -y


echo "====================================================="
echo " Uninstalling Snap firefox and installig deb version "
echo "====================================================="
echo ""
sleep 2
#INSTALAR FIREFOX COMO .DEB
sudo snap remove firefox
#Añadimos el ppa de Mozilla Team
sudo add-apt-repository ppa:mozillateam/ppa -y
#Cambiamos la prioridad del paquete para que use el ppa
echo '
Package: *
Pin: release o=LP-PPA-mozillateam
Pin-Priority: 1001
' | sudo tee /etc/apt/preferences.d/mozilla-firefox
#Nos aseguramos que las actualizaciones se hagan automaticamente
echo 'Unattended-Upgrade::Allowed-Origins:: "LP-PPA-mozillateam:${distro_codename}";' | sudo tee /etc/apt/apt.conf.d/51unattended-upgrades-firefox


echo "====================================================="
echo "                Add PPA Repositories                 "
echo "====================================================="
echo ""
sleep 2
#AÑADIMOS LOS PPA QUE NECESTIAMOS
#Vscode
sudo apt install software-properties-common apt-transport-https wget -y
wget -O- https://packages.microsoft.com/keys/microsoft.asc | sudo gpg --dearmor | sudo tee /usr/share/keyrings/vscode.gpg
echo deb [arch=amd64 signed-by=/usr/share/keyrings/vscode.gpg] https://packages.microsoft.com/repos/vscode stable main | sudo tee /etc/apt/sources.list.d/vscode.list

echo "====================================================="
echo "                 Installing packages                 "
echo "====================================================="
echo ""
sleep 2
#INSTALAMOS TODOS LOS PAQUETES
sudo apt update
sudo apt install firefox code nala virtualbox git kitty neofetch ubuntu-restricted-extras -y --allow-downgrades
wget https://github.com/neovim/neovim/releases/download/v0.8.0/nvim-linux64.deb
sudo dpkg -i nvim-linux64.deb
rm nvim-linux64.deb
wget https://github.com/shiftkey/desktop/releases/download/release-3.1.1-linux1/GitHubDesktop-linux-3.1.1-linux1.deb
sudo dpkg -i GitHubDesktop-linux-3.1.1-linux1.deb
rm GitHubDesktop-linux-3.1.1-linux1.deb


echo "====================================================="
echo "                Installing Nerd Fonts                "
echo "====================================================="
echo ""
sleep 2
#DESCARGAMOS E INSTALAMOS NERDFONTS
git clone https://github.com/ryanoasis/nerd-fonts.git
cd nerd-fonts
./install.sh
cd ..
rm -rf nerd-fonts

echo "====================================================="
echo "                 Installing Astrovim                 "
echo "====================================================="
echo ""
sleep 2
#INSTALAMOS ASTROVIM
mv ~/.local/share/nvim/site ~/.local/share/nvim/site.bak
git clone https://github.com/AstroNvim/AstroNvim ~/.config/nvim
nvim +PackerSync


echo "====================================================="
echo "  Installing and configuring ZSH with powerlevel10k  "
echo "====================================================="
echo ""
sleep 2
#INSTALAMOS ZSH Y CONFIGURAMOS POWERLEVEL10K
sudo apt install zsh -y
chsh -s $(which zsh)
cp config/zshrc ~/.zshrc
sudo apt install zsh-syntax-highlighting zsh-autosuggestions locate bat -y
sudo updatedb
sudo mkdir /usr/share/zsh-sudo
sudo chown scepticg:scepticg /usr/share/zsh-sudo
wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/plugins/sudo/sudo.plugin.zsh
sudo mv sudo.plugin.zsh /usr/share/zsh-sudo
wget https://github.com/Peltoche/lsd/releases/download/0.23.1/lsd-musl_0.23.1_amd64.deb
sudo dpkg -i lsd-musl_0.23.1_amd64.deb
mkdir -p ~/.local/bin
rm lsd-musl_0.23.1_amd64.deb
ln -s /usr/bin/batcat ~/.local/bin/bat
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc
cp config/p10k.zsh ~/.p10k.zsh


echo "====================================================="
echo "                   Installing FZF                    "
echo "====================================================="
echo ""
sleep 2
#INSTALAMOS FZF
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
exit

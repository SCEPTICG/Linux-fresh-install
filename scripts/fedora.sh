#!/bin/bash

echo "================================================"
echo ""
echo "███████╗███████╗██████╗░░█████╗░██████╗░░█████╗░"
echo "██╔════╝██╔════╝██╔══██╗██╔══██╗██╔══██╗██╔══██╗"
echo "█████╗░░█████╗░░██║░░██║██║░░██║██████╔╝███████║"
echo "██╔══╝░░██╔══╝░░██║░░██║██║░░██║██╔══██╗██╔══██║"
echo "██║░░░░░███████╗██████╔╝╚█████╔╝██║░░██║██║░░██║"
echo "╚═╝░░░░░╚══════╝╚═════╝░░╚════╝░╚═╝░░╚═╝╚═╝░░╚═╝"
echo ""
echo "================================================"
echo "       Automated Fedora Config Installer        "  
echo "================================================"

echo "================================================"
echo "               Making DNF better                "
echo "================================================"
sleep 2

sudo cp config/dnf.conf /etc/dnf/dnf.conf

echo "================================================"
echo "                Updating Fedora                 "
echo "================================================"
sleep 2

sudo dnf upgrade -y

echo "================================================"
echo "              Enabling RPM Fusion               "
echo "================================================"
sleep 2

sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -y
sudo dnf groupupdate core -y

echo "================================================"
echo "            Add Flathub Repository              "
echo "================================================"
sleep 2

flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

echo "================================================"
echo "             Install media codecs               "
echo "================================================"
sleep 2

sudo dnf groupupdate multimedia --setop="install_weak_deps=False" --exclude=PackageKit-gstreamer-plugin -y
sudo dnf groupupdate sound-and-video -y
sudo dnf install intel-media-driver -y
sudo dnf swap mesa-va-drivers mesa-va-drivers-freeworld -y
sudo dnf swap mesa-vdpau-drivers mesa-vdpau-drivers-freeworld -y
sudo dnf swap mesa-va-drivers.i686 mesa-va-drivers-freeworld.i686 -y
sudo dnf swap mesa-vdpau-drivers.i686 mesa-vdpau-drivers-freeworld.i686 -y
sudo dnf install rpmfusion-free-release-tainted -y
sudo dnf install libdvdcss -y

echo "================================================"
echo "      Enable maximize and minimize button       "
echo "================================================"
sleep 2

gsettings set org.gnome.desktop.wm.preferences button-layout 'appmenu:minimize,maximize,close'

echo "================================================"
echo "               Installing packages              "
echo "================================================"
echo ""
sleep 2

sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc' > /etc/yum.repos.d/vscode.repo
sudo rpm --import https://packagecloud.io/shiftkey/desktop/gpgkey
sudo sh -c 'echo -e "[shiftkey]\nname=GitHub Desktop\nbaseurl=https://packagecloud.io/shiftkey/desktop/el/7/\$basearch\nenabled=1\ngpgcheck=0\nrepo_gpgcheck=1\ngpgkey=https://packagecloud.io/shiftkey/desktop/gpgkey' > /etc/yum.repos.d/shiftkey-desktop.repo
sudo dnf install firefox code VirtualBox git kitty neovim github-desktop neofetch -y

echo "================================================"
echo "              Installing Nerd Fonts             "
echo "================================================"
echo ""
sleep 2
git clone https://github.com/ryanoasis/nerd-fonts.git
cd nerd-fonts
./install.sh
cd ..
rm -rf nerd-fonts

echo "================================================"
echo "               Installing Astrovim              "
echo "================================================"
echo ""
sleep 2

mv ~/.local/share/nvim/site ~/.local/share/nvim/site.bak
git clone https://github.com/AstroNvim/AstroNvim ~/.config/nvim
nvim +PackerSync

echo "================================================"
echo "Installing and configuring ZSH with powerlevel10k"
echo "================================================"
echo ""
sleep 2

sudo dnf install zsh -y
hsh -s $(which zsh)
cp config/zshrc ~/.zshrc
sudo dnf install zsh-syntax-highlighting zsh-autosuggestions locate bat -y
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

echo "================================================"
echo "                 Installing FZF                 "
echo "================================================"
echo ""
sleep 2

git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
exit
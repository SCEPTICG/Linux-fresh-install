import os
from pick import pick

os.system('sudo apt update && sudo apt upgrade -y')

title = 'Which browser do you want to install: '
options = ['Google Chrome', 'Microsoft Edge', 'Brave', 'Opera', 'Vivaldi', 'Install .deb Firefox', 'Don\'t install a browser']

option, index = pick(options, title, indicator='=>', default_index=0)

match option:
    case 'Google Chrome':
        os.system('wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | sudo gpg --dearmour -o /usr/share/keyrings/google_linux_signing_key.gpg')
        os.system('sudo sh -c echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list')
        os.system('sudo apt update')
        os.system('sudo apt install google-chrome-stable -y')
    case 'Microsoft Edge':
        os.system('sudo apt install software-properties-common apt-transport-https wget -y')
        os.system('wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -')
        os.system('sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/edge stable main"')
        os.system('sudo apt update')
        os.system('sudo apt install microsoft-edge-stable -y')
    case 'Brave':
        os.system('sudo apt install apt-transport-https curl -y')
        os.system('sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg')
        os.system('echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list')
        os.system('sudo apt update')
        os.system('sudo apt install brave-browser -y')
    case 'Opera':
        os.system('sudo apt install software-properties-common apt-transport-https wget ca-certificates gnupg2 -y')
        os.system('wget -O- https://deb.opera.com/archive.key | sudo gpg --dearmor | sudo tee /usr/share/keyrings/opera.gpg')
        os.system('echo deb [arch=amd64 signed-by=/usr/share/keyrings/opera.gpg] https://deb.opera.com/opera-stable/ stable non-free | sudo tee /etc/apt/sources.list.d/opera.list')
        os.system('sudo apt update')
        os.system('sudo apt install opera-stable -y')
    case 'Vivaldi':
        os.system('sudo apt install wget gnupg2 ubuntu-keyring')
        os.system('wget -O- https://repo.vivaldi.com/archive/linux_signing_key.pub | sudo gpg --dearmor | sudo tee /usr/share/keyrings/vivaldi.gpg')
        os.system('echo deb [arch=amd64 signed-by=/usr/share/keyrings/vivaldi.gpg] https://repo.vivaldi.com/archive/deb/ stable main | sudo tee /etc/apt/sources.list.d/vivaldi.list')
        os.system('sudo apt update')
        os.system('sudo apt install vivaldi-stable -y')
    case 'Install .deb Firefox':
        os.system('sudo snap remove firefox')
        os.system('sudo add-apt-repository ppa:mozillateam/ppa')
        os.system('echo "Package: * Pin: release o=LP-PPA-mozillateam Pin-Priority: 1001 " | sudo tee /etc/apt/preferences.d/mozilla-firefox')
        os.system('echo "Unattended-Upgrade::Allowed-Origins:: "LP-PPA-mozillateam:${distro_codename}";" | sudo tee /etc/apt/apt.conf.d/51unattended-upgrades-firefox')
        os.system('sudo apt install firefox -y')
    case 'Don\'t install a browser':
        exit
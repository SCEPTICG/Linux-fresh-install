import os

os.system('sudo apt install git curl -y')
os.system('wget https://github.com/ryanoasis/nerd-fonts/releases/tag/v2.3.3/Hack.zip')
os.system('wget https://github.com/ryanoasis/nerd-fonts/releases/tag/v2.3.3/NerdFontsSymbolsOnly.zip')
os.system('unzip *.zip')
os.system('rm -rf *.zip')
os.system('sudo mv *.ttf /usr/local/share/fonts')
os.system('fc-cache -f -v')

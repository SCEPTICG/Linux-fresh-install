import os
import subprocess

os.system('sudo apt install git curl -y')
os.system('git clone https://github.com/ryanoasis/nerd-fonts.git')
os.system('cd nerd-fonts/')
os.system('./install.sh')
os.system('cd ..')
os.system('rm -rf nerd-fonts')
os.system('bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)"')
os.system('cp scripts/ubuntu/shells/.bashrc ~/.bashrc')
os.system('source ~/.bashrc')
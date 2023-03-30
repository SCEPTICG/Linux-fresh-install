import os
from pick import pick

os.system('sudo apt update && sudo apt upgrade -y')

title = 'Which browser do you want to install: '
options = ['Google Chrome', 'Microsoft Edge', 'Brave', 'Opera', 'Vivaldi', 'Keep Firefox']

option, index = pick(options, title, indicator='=>', default_index=0)

match option:
    case 'Google Chrome':
         os.system('wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | sudo gpg --dearmour -o /usr/share/keyrings/google_linux_signing_key.gpg')
         os.system('sudo sh -c echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list')
         os.system('sudo apt update')
         os.system('sudo apt install google-chrome-stable')
    case "Ubuntu based distribution":
          print ("opcion 2")
    case "Debian":
          print ("Debian")
    case "Debian based distribution":
         print ("Debian based distribution")
    case "Fedora":
         print ("Fedora")
    case "Arch linux":
         print ("Arch linux")
    case "Exit":
        exit
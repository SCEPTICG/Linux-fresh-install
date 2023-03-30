import os
from pick import pick

os.system('sudo apt update && sudo apt upgrade -y')

title = 'Which browser do you want to install: '
options = ['Google Chrome', 'Microsoft Edge', 'Brave', 'Opera', 'Vivaldi', 'Install .deb Firefox', 'Don\'t install a browser']

option, index = pick(options, title, indicator='=>', default_index=0)

match option:
    case 'Google Chrome':
        pass
    case 'Microsoft Edge':
        pass
    case 'Brave':
        pass
    case 'Opera':
        pass
    case 'Vivaldi':
        pass
    case 'Install .deb Firefox':
        pass
    case 'Don\'t install a browser':
        exit
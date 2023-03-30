import os
import subprocess
from pick import pick

title = 'Do you want to upgrade or just update '
options = ['Update and Upgrade', 'Just Update', 'Do nothing']

option, index = pick(options, title, indicator='=>', default_index=0)

match option:
    case 'Update and Upgrade':
        os.system('sudo apt update')
        os.system('sudo apt upgrade -y')
    case 'Just Update':
        os.system('sudo apt update')
    case 'Do nothing':
        quit

os.system('python3 ./browsers/browsers.py')
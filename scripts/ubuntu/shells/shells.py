import os
import subprocess
from pick import pick

title = 'which shell do you want to use? '
options = ['Bash','Zsh','Fish',]

option, index = pick(options, title, indicator='=>', default_index=0)

match option:
    case 'Bash':
        os.system('python3 ./scripts/ubuntu/shells/bash.py')
    case 'Zsh':
        os.system('python3 ./scripts/ubuntu/shells/zsh.py')
    case 'Fish':
        os.system('python3 ./scripts/ubuntu/shells/fish.py')
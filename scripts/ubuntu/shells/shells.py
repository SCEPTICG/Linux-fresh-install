import os
import subprocess
from pick import pick

title = 'which shell do you want to use? '
options = ['Zsh','Fish', 'Bash']

option, index = pick(options, title, indicator='=>', default_index=0)

match option:
    case 'Zsh':
        pass
    case 'Fish':
        pass
    case 'Bash (default)':
        pass
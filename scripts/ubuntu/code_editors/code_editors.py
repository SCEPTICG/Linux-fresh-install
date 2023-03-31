import os
import subprocess
from pick import pick

title = 'Which Code editor do you want to install: '
options = ['VS Code', 'Sublime Text 4', 'Pycharm', 'Vim', 'NeoVim',  'Don\'t install a code editor']

option, index = pick(options, title, indicator='=>', default_index=0)

match option:
    case 'VS Code':
        subprocess.call(['sh', './scripts/ubuntu/code_editors/vscode.sh'])
    case 'Sublime Text 4':
        subprocess.call(['sh', './scripts/ubuntu/code_editors/sublimetext4.sh'])
    case 'Pycharm':
        subprocess.call(['sh', './scripts/ubuntu/'])
    case 'Vim':
        subprocess.call(['sh', './scripts/ubuntu/'])
    case 'NeoVim':
        subprocess.call(['sh', './scripts/ubuntu/'])
    case 'Don\'t install a code editor':
        pass
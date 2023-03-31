import os
import subprocess
from pick import pick

title = 'Which browser do you want to install: '
options = ['Google Chrome', 'Microsoft Edge', 'Brave', 'Opera', 'Vivaldi', 'Install .deb Firefox', 'Don\'t install a browser']

option, index = pick(options, title, indicator='=>', default_index=0)

match option:
    case 'Google Chrome':
        subprocess.call(['sh', './scripts/ubuntu/browsers/chrome.sh'])
    case 'Microsoft Edge':
        subprocess.call(['sh', './scripts/ubuntu/browsers/edge.sh'])
    case 'Brave':
        subprocess.call(['sh', './scripts/ubuntu/browsers/brave.sh'])
    case 'Opera':
        subprocess.call(['sh', './scripts/ubuntu/browsers/opera.sh'])
    case 'Vivaldi':
        subprocess.call(['sh', './scripts/ubuntu/browsers/vivaldi.sh'])
    case 'Install .deb Firefox':
         subprocess.call(['sh', './scripts/ubuntu/browsers/firefoxdeb.sh'])
    case 'Don\'t install a browser':
        pass
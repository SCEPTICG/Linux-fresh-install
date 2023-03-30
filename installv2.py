#!/usr/bin/python

import os
from pick import pick

title = 'Choose your distribution: '
options = ['Ubuntu', 'Ubuntu based distribution', 'Debian', 'Debian based distribution', 'Fedora', 'Arch linux', 'Exit']

option, index = pick(options, title, indicator='=>', default_index=0)

match option:
    case "Ubuntu":
         os.system('python3 /scripts/ubuntu/ubuntu.py')
         
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
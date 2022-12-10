#!/bin/bash

. instalacion.sh

options=(Ubuntu "Debian based distribution" Fedora "Arch linux")
echo "Please choose an option:"
printf "%s\n" "${options[@]}" | fzy

printf options
#!/bin/bash

./instalacion.sh

options=(opt1 "option 2" another "option here")
echo "Please choose an option:"
printf "%s\n" "${options[@]}" | fzy
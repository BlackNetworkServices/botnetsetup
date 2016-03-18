#!/bin/bash


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


# Root Warning
echo -e "${br}This script mnust be run in Root in order to work properly!${normal}"

# Root variable identification
ROOT_UID=0		# Only users with $UID 0 have root privileges.
E_NOTROOT=65	# Non-root exit error.

# Check if script has root permissions
# If UID is not euqal to Root UID code 0, then exit
if [ "$UID" -ne "$ROOT_UID" ]
then
  echo -e "${br}Exit code 2: Script was not given Root permissions!${normal}"
  exit $E_NOTROOT
fi

echo -e "${yellow}Starting server update and upgrade before starting!${normal}"
echo -e "${yellow}Are you ready to update and upgrade? Y/N${normal}"
read INPUT

case "$INPUT" in "y" | "Y" )
	echo -e "${br}Updating please wait...${normal}"
	/usr/bin/apt-get -qy update > /dev/null
	/usr/bin/apt-get -qy dist-upgrade > /dev/null

;;

"n" | "N" )
	echo -e "${yellow}Please start script when you are ready!${normal}"
	exit 0;
;;
*)
	echo -e "${yellow}Not an option, try again!${normal}"
	exit 0;
;;
esac

echo -e "${yellow}Now downloading required packages!${normal}"
apt-get install git python-pip -y
echo -e "${yellow}Fixing future error!${normal}"
apt-get install python-paramiko -y

echo -e "${yelllow}Downloading python script from Github.${normal}"
git clone https://github.com/whitepacket/heavyaidra.git

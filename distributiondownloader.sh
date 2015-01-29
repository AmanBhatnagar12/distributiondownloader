#!/bin/bash

#----------------------------------------------------------------------------------|
#                     Distribution Downloader (c) 2015 - GPL V3                    |
#----------------------------------------------------------------------------------|
#       This program is free software: you can redistribute it and/or modify       |
#       it under the terms of the GNU General Public License as published by       |
#       the Free Software Foundation, either version 3 of the License, or          |
#       (at your option) any later version.                                        |
#                                                                                  |
#       This program is distributed in the hope that it will be useful,            |
#       but WITHOUT ANY WARRANTY; without even the implied warranty of             |
#       MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the              |
#       GNU General Public License for more details.                               |
#                                                                                  |
#----------------------------------------------------------------------------------|
#                               linux.softpedia.com                                |
#----------------------------------------------------------------------------------|


#  License GPLv3
directoriopr=`dirname $0`/
saltarlic=`dirname $0`/acceptlic
function LICENSE {
licgpl=`dirname $0`/LICENSE

zenity --text-info \
       --title="GNU General Public License V3" \
       --filename=$licgpl \
       --width=550 \
       --height=300
case $? in
    0)
       echo "Do not delete this file" > $saltarlic
       MAINMENU
esac
}
# I am the creator
function DDABOUT {
arabout=`dirname $0`/about.html
zenity --text-info \
       --title="About What" \
       --filename=$arabout \
       --html \
       --width=550 \
       --height=300
case $? in
    0)
       MAINMENU
esac
}
# The help
function DDHELP {
zenity --info --text "In construction"
MAINMENU
}
# Request a distribution
function ADDISTRO {
xdg-open "http://linux.softpedia.com/editors/browse/marius-nestor"
MAINMENU
}
# I want to download a distribution
function DOWNLOADS {
distroselec=`zenity --list \
             --title="Choose a distribution to download" \
             --text="Download your favorite Linux distribution with a single mouse click" \
             --width=600 \
             --height=600 \
             --column="Download" --column="Distribution" \
             --radiolist FALSE "ArchLinux" FALSE "CentOS" FALSE "Debian" FALSE "Fedora" FALSE "Korora" FALSE "Kubuntu" FALSE "LinuxMint" FALSE "Lubuntu" FALSE "Manjaro"  FALSE "OpenSuse"  FALSE "PuppyLinux" FALSE "Slackware" FALSE "Slax" FALSE "SliTaz" FALSE "Trisquel" FALSE "Ubuntu"`

if [ $? -eq 0 ]
then
       for distroselec in $distroselec
       do
                 if [ $distroselec = "ArchLinux" ];
                 then
                      ./$directoriopr/distros/archlinux.sh
                elif [ $distroselec = "CentOS" ]
                then
                      ./$directoriopr/distros/centos.sh
                elif [ $distroselec = "Debian" ]
                then
                      ./$directoriopr/distros/debian.sh
                elif [ $distroselec = "Fedora" ]
                then
                      ./$directoriopr/distros/fedora.sh
                elif [ $distroselec = "Kubuntu" ]
                then
                      ./$directoriopr/distros/kubuntu.sh
                elif [ $distroselec = "LinuxMint" ]
                then
                      ./$directoriopr/distros/mint.sh
                elif [ $distroselec = "Lubuntu" ]
                then
                      ./$directoriopr/distros/lubuntu.sh
                elif [ $distroselec = "Manjaro" ]
                then
                      ./$directoriopr/distros/manjaro.sh
                elif [ $distroselec = "PuppyLinux" ]
                then
                      ./$directoriopr/distros/puppy.sh
                elif [ $distroselec = "SliTaz" ]
                then
                      ./$directoriopr/distros/slitaz.sh
                elif [ $distroselec = "Ubuntu" ]
                then
                      ./$directoriopr/distros/ubuntu.sh
                elif [ $distroselec = "Korora" ]
                then
                      ./$directoriopr/distros/korora.sh
                elif [ $distroselec = "OpenSuse" ]
                then
                      ./$directoriopr/distros/suse.sh
                elif [ $distroselec = "Slackware" ]
                then
                      ./$directoriopr/distros/slack.sh
                elif [ $distroselec = "Slax" ]
                then
                      ./$directoriopr/distros/slax.sh
                elif [ $distroselec = "Trisquel" ]
                then
                      ./$directoriopr/distros/trisquel.sh
                fi
        done
fi 
}



# Main Menu
function MAINMENU {
miselect=`zenity --list \
                --title="Distribution Downloader 1.0.0 Alpha" \
                --text="Welcome to Distribution Downloader, please select one of the following options:" \
                --width=550 \
                --height=230 \
                --column="Select" --column="Options" \
                --radiolist FALSE "Download a distribution" FALSE "Request a distribution" FALSE "Help" FALSE "About" `
if [ $? -eq 0 ]
then
       for miselect in $miselect
       do
                if [ $miselect = "Download a distribution" ];
                then
                     DOWNLOADS
                elif [ $miselect = "Request a distribution" ]
                then
                     ADDISTRO
                elif [ $miselect = "Help" ]
                then
                     DDHELP
                elif [ $miselect = "About" ]
                then
                     DDABOUT
                fi
                
       done
fi
}
# running all crazy
if [ -f $saltarlic ];
then
     MAINMENU
else
     LICENSE
fi

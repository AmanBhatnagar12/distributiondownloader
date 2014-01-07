#!/bin/bash

#----------------------------------------------------------------------------------|
#                                                                                  |
#   '||'''|. '||'''|.              ||                  '\\  //`                    |
#    ||   ||  ||   ||  ''          ||                    \\//                      |
#    ||   ||  ||   ||  ||  ('''' ''||''  '||''| .|''|,    ><                       |
#    ||   ||  ||   ||  ||   `'')   ||     ||    ||  ||   //\\                      |
#   .||...|' .||...|' .||. `...'   `|..' .||.   `|..|' .//  \\.                    |
#                                                                                  |
#----------------------------------------------------------------------------------|
#                        BPSYS (c) 2014 - GPL V3                                   |
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
#                      IfTux.WordPress.Com                                         |
#----------------------------------------------------------------------------------|


#  License GPLv3
directoriopr=`dirname $0`/
saltarlic=`dirname $0`/aceptlic
function LICENCIA {
licgpl=`dirname $0`/gplv3

zenity --text-info \
       --title="GNU General Public License V3" \
       --filename=$licgpl \
       --width=550 \
       --height=300
case $? in
    0)
       echo "No borrar este archivo - Do not delete this file" > $saltarlic
       MENUINICIO
esac
}
# I am the creator
function DDABOUT {
arabout=`dirname $0`/acercade.html
zenity --text-info \
       --title="Acerca De" \
       --filename=$arabout \
       --html \
       --width=550 \
       --height=300
case $? in
    0)
       MENUINICIO
esac
}
# this is help
function DDAYUDA {
zenity --info --text "En construcción"
MENUINICIO
}
# I send my distribution
function ADDISTRO {
xdg-open "https://docs.google.com/forms/d/1QdlCex4HaS1ecPv7edVtA4gk7yBzfBv7-wsI9MsanY8/viewform"
MENUINICIO
}
# I want to download a distribution
function DDISTRO {
distroselec=`zenity --list \
             --title="Elige la distribución a descargar" \
             --text="Descarga tu distribucion de linux favorita con un clic" \
             --width=600 \
             --height=600 \
             --column="Descargar" --column="Distribución" \
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
# DDistrox Beta 1.0.2
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
function MENUINICIO {
miselect=`zenity --list \
                --title="DDistroX 1.0.2" \
                --text="Bienvenidos a DDistrox, por favor selecciona cualquiera de las siguientes opciones:" \
                --width=550 \
                --height=230 \
                --column="Seleccionar" --column="Opciones" \
                --radiolist FALSE "Descargas" FALSE "Agregar" FALSE "Ayuda" FALSE "About" `
if [ $? -eq 0 ]
then
       for miselect in $miselect
       do
                if [ $miselect = "Descargas" ];
                then
                     DDISTRO
                elif [ $miselect = "Agregar" ]
                then
                     ADDISTRO
                elif [ $miselect = "Ayuda" ]
                then
                     DDAYUDA
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
     MENUINICIO
else
     LICENCIA
fi

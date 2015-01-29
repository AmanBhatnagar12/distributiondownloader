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
function DDD {
descargaren=`zenity --file-selection --title="Save File In..." --save --directory `
urldedescarga="http://mirror.aarnet.edu.au/pub/archlinux/iso/2015.01.01/archlinux-2015.01.01-dual.iso"
cd $descargaren
wget $urldedescarga
zenity --info --text="Download completed successfully!"
}

function DOWNMAIN {
archinfo=`dirname $0`/archlinux.html
zenity --text-info \
       --title="Download ArchLinux" \
       --filename=$archinfo \
       --html \
       --width=550 \
       --height=550 \
       --ok-label="Download" \
       --cancel-label="Close"
case $? in
    0)
       DDD
       ;;
    1)
       zenity --info --text="the download operation has been canceled"
       ;;
esac
}
DOWNMAIN


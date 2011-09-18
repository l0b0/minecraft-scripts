#!/usr/bin/env bash
#
# NAME
#    install-Minecraft-shortcut-GNOME.sh - Install GNOME menu shortcut
#
# SYNOPSIS
#    ./install-Minecraft-shortcut-GNOME.sh
#
# DESCRIPTION
#    Creates a shortcut to Minecraft in the Games section of the GNOME menu.
#
#    If your Minecraft directory for some reason is not in your home directory,
#    then modify minecraft_home in minecraft-scripts.conf.
#
# BUGS
#    https://github.com/l0b0/minecraft-scripts/issues
#
# COPYRIGHT AND LICENSE
#    Copyright (C) 2011 Victor Engmark
#
#    This program is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with this program.  If not, see <http://www.gnu.org/licenses/>.
#
################################################################################

set -o errexit -o noclobber -o nounset -o pipefail

directory="$(dirname -- "$0")"
. "${directory}/minecraft-scripts.conf"

if [[ ! -d "$minecraft_home" ]]
then
    echo "Minecraft not found. Run install-Minecraft.sh" >&2
    exit 1
fi

icon_path="${minecraft_home}/icon.png"
wget -O "$icon_path" "http://www.minecraft.net/favicon.png"

shortcut_path="${minecraft_home}/Minecraft-shortcut.desktop"
set +o noclobber
echo "[Desktop Entry]
Version=1.0
Type=Application
Name=Minecraft
Comment=A game about placing blocks to build anything you can imagine
Exec=/usr/local/bin/minecraft
Icon=$icon_path
Categories=Game
Terminal=false" > "$shortcut_path"
set -o noclobber

xdg-desktop-menu install "$shortcut_path"
echo "The Minecraft shortcut should now be available in the Games menu"

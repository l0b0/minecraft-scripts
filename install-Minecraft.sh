#!/usr/bin/env bash
#
# NAME
#    install-Minecraft.sh - Install Minecraft (who would have though, right?)
#
# SYNOPSIS
#    ./install-Minecraft.sh
#
# DESCRIPTION
#    Backs up any existing installation and downloads the JAR file.
#
#    If your Minecraft directory for some reason is not in your home directory,
#    then modify "home" in minecraft-scripts.conf.
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

. "$(dirname -- "$0")/minecraft-scripts.conf"

if [[ -d "$home" ]]
then
    echo "$home exist; backing up."
    "${scripts}/backup.sh"
fi

mkdir -p "$home/bin"

wget -O "$startup_jar" "https://s3.amazonaws.com/MinecraftDownload/launcher/minecraft.jar"

echo "java -Xmx1024M -Xms512M -cp ${startup_jar} net.minecraft.LauncherFrame" > "$launcher"
chmod a+x "$launcher"

sudo ln -fs "$launcher" "$command"

echo "Minecraft is now installed."
echo "To start it, you can either run the \`minecraft\` command from the shell,"
echo "or run install-Minecraft-shortcut-GNOME.sh to make it available from the"
echo "Applications menu."

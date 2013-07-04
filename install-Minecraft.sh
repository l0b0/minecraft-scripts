#!/usr/bin/env bash
#
# NAME
#        install-Minecraft.sh - Install Minecraft
#
# SYNOPSIS
#        ./install-Minecraft.sh [OPTION...]
#
# DESCRIPTION
#        Backs up any existing installation and downloads the JAR file.
#
#        If your Minecraft directory for some reason is not in your home
#        directory, then modify "home" in minecraft-scripts.conf.
#
#        -o
#               Install old-style (pre-1.6.1) launcher.
#
# BUGS
#        https://github.com/l0b0/minecraft-scripts/issues
#
# COPYRIGHT AND LICENSE
#        Copyright (C) 2011-2013 Victor Engmark
#
#        This program is free software: you can redistribute it and/or modify
#        it under the terms of the GNU General Public License as published by
#        the Free Software Foundation, either version 3 of the License, or
#        (at your option) any later version.
#
#        This program is distributed in the hope that it will be useful,
#        but WITHOUT ANY WARRANTY; without even the implied warranty of
#        MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#        GNU General Public License for more details.
#
#        You should have received a copy of the GNU General Public License
#        along with this program.  If not, see <http://www.gnu.org/licenses/>.
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

if [[ "${1-}" = '-o' ]]
then
    # Old launcher
    launcher_url='https://s3.amazonaws.com/MinecraftDownload/launcher/minecraft.jar'
    launcher_cmd=(java -Xmx1024M -Xms512M -cp "${startup_jar}" net.minecraft.LauncherFrame)
else
    # New launcher
    launcher_url='https://s3.amazonaws.com/Minecraft.Download/launcher/Minecraft.jar'
    launcher_cmd=(java -jar "${startup_jar}")
fi

wget -O "$startup_jar" "$launcher_url"

echo "${launcher_cmd[@]}" > "$launcher"
chmod a+x "$launcher"

sudo ln -fs "$launcher" "$command"

echo "Minecraft is now installed."
echo "To start it, you can either run the \`minecraft\` command from the shell,"
echo "or run install-Minecraft-shortcut-GNOME.sh to make it available from the"
echo "Applications menu."

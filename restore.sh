#!/usr/bin/env bash
#
# NAME
#    restore.sh - Restore a backup of your Minecraft main directory
#
# SYNOPSIS
#    ./restore.sh
#
# DESCRIPTION
#    Moves the latest ~/.minecraft-<datetime> to ~/.minecraft. If ~/.minecraft
#    already exists, it is backed up first. This way, you can easily switch
#    between two Minecraft installations by subsequent calls to this script.
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

declare -a backups=( "$home"-* )
last_backup=${backups[@]:(-1)}

if [[ -d "$home" ]]
then
    echo "$home exist; backing up."
    "${scripts}/backup.sh"
fi
mv -T -- "$last_backup" "$home"
echo "Restored $last_backup"

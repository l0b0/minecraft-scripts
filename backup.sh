#!/usr/bin/env bash
#
# NAME
#    backup.sh - Create a backup of your Minecraft main directory
#
# SYNOPSIS
#    ./backup.sh
#
# DESCRIPTION
#    Moves ~/.minecraft to ~/.minecraft-<datetime>.
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

if [[ ! -d "$home" ]]
then
    echo "$home does not exist; did you back it up already?" >&2
    exit 1
fi

backup="${home}-$(date +%Y-%m-%dT%H:%M:%S)"
mv -T -- "$home" "$backup"
echo "Moved Minecraft folder to $backup"

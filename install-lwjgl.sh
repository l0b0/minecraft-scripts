#!/usr/bin/env bash
#
# NAME
#        install-lwjgl.sh - Install LWJGL
#
# SYNOPSIS
#        ./install-lwjgl.sh
#
# DESCRIPTION
#        Downloads and installs the Lightweight Java Game Library (LWJGL) in
#        your current Minecraft installation.
#
#        If your Minecraft directory for some reason is not in your home
#        directory, then modify "home" in minecraft-scripts.conf.
#
# BUGS
#        https://github.com/l0b0/minecraft-scripts/issues
#
# COPYRIGHT AND LICENSE
#        Copyright (C) 2012 Victor Engmark
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

cd -- "$(mktemp -d)"

wget  "http://downloads.sourceforge.net/project/java-game-lib/Official%20Releases/LWJGL%20${lwjgl_version}/lwjgl-${lwjgl_version}.zip"

unzip -jo "lwjgl-${lwjgl_version}.zip" \
    lwjgl-${lwjgl_version}/jar/jinput.jar \
    lwjgl-${lwjgl_version}/jar/lwjgl.jar lwjgl-${lwjgl_version}/jar/lwjgl_util.jar \
    -d "${home}/bin"
unzip -jo "lwjgl-${lwjgl_version}.zip" "lwjgl-${lwjgl_version}/native/linux/*" -d "${home}/bin/natives"

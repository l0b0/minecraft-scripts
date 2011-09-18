#!/usr/bin/env bash
#
# NAME
#    install-AudioMod.sh - Install AudioMod Beta 1.7_01
#
# SYNOPSIS
#    ./install-AudioMod.sh
#
# DESCRIPTION
#    Audio mod.
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

"$(dirname -- "$0")/install-mod.sh" http://dl.dropbox.com/u/20629262/Latest/AudioMod.zip

#!/usr/bin/env bash
#
# NAME
#    install-Aether.sh - Install Aether1.7.3 V1.02
#
# SYNOPSIS
#    ./install-Aether.sh
#
# DESCRIPTION
#    See
#    <http://www.minecraftforum.net/topic/495374-173-aether-collaboration-mod-v102-new-mobs-fixes-items-and-features/>
#    for details.
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

"$(dirname -- "$0")/install-ModLoader.sh"
"$(dirname -- "$0")/install-AudioMod.sh"
"$(dirname -- "$0")/install-PlayerAPI.sh"
"$(dirname -- "$0")/install-ShockAhPI.sh"

"$(dirname -- "$0")/install-mod.sh" http://download663.mediafire.com/5fbrb1dhakzg/fpe2e3oiejbfgl4/Aether1.7.3+V1.02.zip Jar Resources

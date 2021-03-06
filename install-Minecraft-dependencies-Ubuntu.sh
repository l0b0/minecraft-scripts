#!/usr/bin/env bash
#
# NAME
#    install-Minecraft-dependencies-Ubuntu.sh - Install Minecraft dependencies
#
# SYNOPSIS
#    ./install-Minecraft-dependencies-Ubuntu.sh
#
# DESCRIPTION
#    Installs the Sun Java Runtime Environment (JRE) and sets it as default.
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

sudo apt-get install sun-java6-jre
sudo update-java-alternatives --jre -s java-6-sun

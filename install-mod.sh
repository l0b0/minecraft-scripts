#!/usr/bin/env bash
#
# NAME
#    install-mod.sh - Install mod from URL
#
# SYNOPSIS
#    ./install-mod.sh URL [ARCHIVE_DIR] [RESOURCES_DIR]
#
# DESCRIPTION
#    Downloads URL (zip archive) and merges the contents with minecraft.jar and
#    the resources directory. Specify ARCHIVE_DIR / RESOURCES_DIR to include
#    only those directories from the archive into minecraft.jar (default all
#    files) / resources (default nothing).
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

. "$(dirname -- "$0")/minecraft-scripts.conf"

jar_path="$minecraft_home/bin/minecraft.jar"
if [[ ! -w "$jar_path" ]]
then
    echo "$jar_path is not writeable." >&2
    exit 1
fi

"$(dirname -- "$0")/clean-jar.sh" 2>/dev/null || true

tmp_dir="$(mktemp --tmpdir -d -- "$(basename -- "$0")".XXXXXXXX)"
mod_archive="$tmp_dir"/mod.zip
build_dir="$tmp_dir"/build

wget -O "$mod_archive" "$1"
unzip -d "$build_dir" "$mod_archive"
cd "$build_dir/${2-}"
zip -r "$jar_path" *
if [[ "${3+defined}" = defined ]]
then
    cp -rt "$minecraft_home/resources" "$build_dir/${3}"/*
fi
rm -r -- "$tmp_dir"

#!/bin/sh

set -e

DEP=$(pkg_info -z | grep -E '^(sdl2|sdl2-mixer|sdl2-image|smpeg2|bzip2|gmake)\-\-' | wc -l)

if [ "$DEP" -eq 6 ]
then
	echo "Dependencies installed"
else
	echo "Dependencies missing. Required packages are sdl2, sdl2-mixer, sdl2-image, smpeg2, bzip2, gmake"
	exit 1
fi

# Download the repository from chronotrig

git clone https://github.com/chronotrig/ponscripter-fork-wh -b wh-dev --single-branch
cd ponscripter-fork-wh

# Download the diff from my repository

ftp https://raw.githubusercontent.com/reivyr/openbsd-ponscripter/master/ponscripter-openbsd.diff

# Apply with patch(1)

patch -p0 < ponscripter-openbsd.diff

# Run configure before compilation

./configure

# Compile

gmake

# Final Message

echo "You can use Ponscripter in the src directory of ponscripter-fork-wh:"
echo "cd ponscripter-fork-wh/src"
echo "./ponscr -r /path-to-the-game-directory"
echo "For GOG, games are in data/noarch/game, ponscr wants the directory that contains 0.utf or pscript.dat"

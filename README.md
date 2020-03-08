# openbsd-ponscripter

Patch to run Ponscripter in OpenBSD -current.

Before you try this, please install the following packages on your system:

- `sdl2`
- `sdl2-mixer`
- `sdl2-image`
- `smpeg2`
- `bzip2`

First, you need to clone the wh-dev branch of the ponscripter-fork-wh repository from chronotrig


`git clone https://github.com/chronotrig/ponscripter-fork-wh -b wh-dev --single-branch`

Then, go to the directory, download the file  `ponscripter-openbsd.diff` and use patch(1)


`cd ponscripter-fork-wh`


`ftp https://raw.githubusercontent.com/reivyr/openbsd-ponscripter/master/ponscripter-openbsd.diff`


`patch -p0 < ponscripter-openbsd.diff`


Compile the project with:


`./configure`


`gmake`


You can use the binary ponscr located in the `src` directory


## Playing games

Currently, you can play Ciconia When They Cry (from steam, I downloaded the Windows version using depotdownloader on OpenBSD), Umineko When They Cry (question and answer arcs, I tested the GOG version), and Narcissu 1st & 2nd (it's free on Steam, use depotdownloader).


Also, if you want to try the demo for Ciconia When They Cry from the website of Witch-Hunt (https://witch-hunt.com/stage_cic.html)


After you download and unzip (only for GOG) the game, you can try it with:


`src/ponscr -r /path-to-the-game-directory`


For GOG games its in `data/noarch/game`, ponscr wants the directory that contains `0.utf` or `pscript.dat`


## Notes for Umineko When They Cry

You can use the PS3 voice and graphics patch! **I installed them manually** using the instructions from: http://07th-mod.com/wiki/Umineko/Umineko-Part-1---Voice-and-Graphics-Patch/ . Please make a copy of your original files before you try this. The only difference is, at the end, I rename the `0.u` file to `0.utf` because we don't use the Linux executable.


**IMPORTANT**: After you patch or not the Umineko game its necessary to make one change more before you launch the game. Edit `0.utf` and in the first line after **;value2500** add this:
- For an unpatched game (or only using PS3 voice patch): **,oldmode2x**
- If you use the PS3 graphics patch: **,modew1080,oldmode2x**


After that you can play it normally with


`src/ponscr -r /path-to-the-game-directory`


## Additional notes

Online documentation for Ponscripter: https://sekaiproject.github.io/ponscripter-fork/doc/

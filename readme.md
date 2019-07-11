<p align="center">
  <img src="img/banner.png">
</p>
<p align="center">
  <img src=https://img.shields.io/github/issues-closed-raw/QFSW/2048x86_64.svg?color=51c414>
  <img src=https://img.shields.io/github/issues-raw/QFSW/2048x86_64.svg?color=c41414&style=popout>
  <img src=https://img.shields.io/github/downloads/QFSW/2048x86_64/total.svg>
</p>

`2048x86_64` is the game _2048_ written purely in `x64` assembly

### Playing

Download [here](https://github.com/QFSW/2048x86_64/releases)

Use `wasd` to move the tiles along the grid, if two tiles of the same number touch, they'll merge
 - `w` : up
 - `a` : left
 - `s` : down
 - `d` : right

### Building
Open `2048x86_64.sln` in Visual Studio and build the project

The entirity of the game is found underneath `src` if you would like to assemble it without Visual Studio

### Notes
Assembled and tested with `Visual Studio 2019` (`MASM`) under `Windows 10` with a `i7-4790k` CPU

Likely works on all `x64` CPUs (and possibly other operating systems) but not tested

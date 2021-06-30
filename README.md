# ltstyle LaTeX package
A LaTeX configuration.

[![GitHub commit activity](https://img.shields.io/github/commit-activity/y/lucastorterotot/ltstyle.svg)](https://gitlab.com/lucastorterotot/ltstyle/commits)
[![GitHub last commit](https://img.shields.io/github/last-commit/lucastorterotot/ltstyle.svg)](https://gitlab.com/lucastorterotot/ltstyle/commits)
[![GitHub](https://img.shields.io/github/license/lucastorterotot/ltstyle.svg)](https://gitlab.com/lucastorterotot/ltstyle/blob/master/LICENSE)

[![LaTeX2e Version](https://img.shields.io/static/v1?label=LaTeX2e&message=2017-04-15&color=blue)](https://www.latex-project.org/)
[![pdfTeX Version](https://img.shields.io/static/v1?label=pdfTeX&message=3.14159265-2.6-1.40.18&color=blue)](https://www.tug.org/texlive/)
[![LuaTeX Version](https://img.shields.io/static/v1?label=LuaTeX&message=1.0.4&color=blue)](http://www.luatex.org/)

[![ChemFig Version](https://img.shields.io/static/v1?label=ChemFig&message=1.2e&color=blue)](https://ctan.org/pkg/chemfig)

## Introduction

This package has been created to keep my preamble common to all my documents for most of its part. Some packages have been re-edited inside this one to make them compatible with others or to extend them with new features.

## Installation
1. Get a TeX distribution. TexLive is a pretty good one. To make sure you have all you need, the full version is a safe solution, but you can try any other version of your choice.
``` 
sudo apt-get install texlive-full 
```
2. Get this package
```
mkdir -p ~/texmf/tex/latex
cd ~/texmf/tex/latex
git clone git@gitlab.com:lucastorterotot/ltstyle.git --origin lucas -b 18.04
```
In case you do not have a `ssh` key you may use `https`:
```
git clone https://gitlab.com/lucastorterotot/ltstyle.git --origin lucas -b 18.04
```
3. Install and update Pygments if you want to use minted.
First, install it with
```
pip install Pygments
```
Update Pygments with provided themes.
Find where Pygments is installed:
```
python
>>> import pygments
>>> pygments.__path__
```
Go in `<pygments.__path__>/styles/` and do
```
for f in $(ls ~/texmf/tex/latex/ltstyle/pygments_styles/); do ln -sf ~/texmf/tex/latex/ltstyle/pygments_styles/$f $f ; done
```
Then, in the `styles/__init__.py`, add for each style lines like for example
```
'ltstyletangodark': 'ltstyletangodark::ltTangodarkStyle',
'ltstyleemacs': 'ltstyleemacs::ltEmacsStyle',
```
in the `STYLE_MAP` dictionnary. The last names (`ltTangodarkStyle`, `ltEmacsStyle`) can be found in the styles files from this repository.
## Usage
### Guides
Documentation will be published later.

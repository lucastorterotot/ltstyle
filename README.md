# ltstyle LaTeX package
A LaTeX configuration.

[![GitHub commit activity](https://img.shields.io/github/commit-activity/y/lucastorterotot/ltstyle.svg)](https://gitlab.com/lucastorterotot/ltstyle/commits)
[![GitHub last commit](https://img.shields.io/github/last-commit/lucastorterotot/ltstyle.svg)](https://gitlab.com/lucastorterotot/ltstyle/commits)
[![GitHub](https://img.shields.io/github/license/lucastorterotot/ltstyle.svg)](https://gitlab.com/lucastorterotot/ltstyle/blob/master/LICENSE)

[![pdfTeX Version](https://img.shields.io/static/v1?label=pdfTeX&message=3.14159265-2.6-1.40.20&color=blue)](https://www.tug.org/texlive/)
[![ChemFig Version](https://img.shields.io/static/v1?label=ChemFig&message=1.53&color=blue)](https://ctan.org/pkg/chemfig)
[![simplekv Version](https://img.shields.io/static/v1?label=simplekv&message=0.2&color=blue)](https://ctan.org/pkg/simplekv)

## Introduction

This package has been created to keep my preamble common to all my documents for most of its part. Some packages have been re-edited inside this one to make them compatible with others or to extend them with new features.

## Installation
1. Get a TeX distribution. TexLive is a pretty good one. To make sure you have all you need, the full version is a safe solution, but you can try any other version of your choice.
``` 
sudo apt-get install texlive-full 
```
If your pdfTeX version is older than the one shown above, consider switching to [the 18.04 branch of this package](https://gitlab.com/lucastorterotot/ltstyle/-/tree/18.04).

2. Get this package
```
mkdir -p ~/texmf/tex/latex
cd ~/texmf/tex/latex
git clone git@gitlab.com:lucastorterotot/ltstyle.git --origin lucas
```
3. Get ChemFig and simplekv packages from Christian Tellechea
```
cd ~/texmf/tex/latex
for p in simplekv chemfig ; do wget http://mirrors.ctan.org/macros/generic/${p}.zip ; unzip ${p}.zip ; rm ${p}.zip ; done
```
## Usage
### Guides
Documentation will be published later.

### Some documents for education
One can find [here](https://www.dropbox.com/sh/kn9fxcoymh2nzmq/AAD4f_ximo6Pj4Mse9UPJIgSa?dl=0) some documents, written in french, produced with this LaTeX package and [this python package](https://gitlab.com/lucastorterotot/ltLaTeXpyplot).


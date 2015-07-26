# My Vim Configuration

## Setup
### Unixy Environment
* Choose a place to clone
* git clone https://github.com/phairoh/vimconfig.git
* ln -sfn vimconfig/ ~/.vim
* ln -sfn vimconfig/vimrc ~/.vimrc

### Windows
* Run cmd as admin
* Choose a place to clone
* git clone https://github.com/phairoh/vimconfig.git
> Note: For next commands if your path has spaces in it you must surround it with quotes
* mklink /D \<full\path\to\user\home\>\vimfiles \<path\to\clone\location\>\
* mklink \<full\path\to\user\home\>\_vimrc \<full\path\to\clone\location\>\vimrc

## Plugin installation
Uses pathogen for now.  Will be updating to vundle in the future


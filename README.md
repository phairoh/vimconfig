# My Vim Configuration
> NOTE: This is very much a work in progress!

## Setup
### All New Installation instructions!
New instructions are based off of [this](https://github.com/euclio/vimrc) repo.
It was super cool, so I ~~stole~~ borrowed it!

## Installation

Ensure that `$XDG_CONFIG_HOME`, `XDG_DATA_HOME`, and `XDG_CACHE_HOME` are set to
their defaults (or directories of your choosing). I use sh syntax here, but
setting the variables manually in Windows should work as well.

```sh
export XDG_CONFIG_HOME=$HOME/.config
export XDG_DATA_HOME=$HOME/.local/share
export XDG_CACHE_HOME=$HOME/.cache
```

Clone the repository to `$XDG_CONFIG_HOME`.

```sh
git clone https://github.com/euclio/vimrc ${XDG_CONFIG_HOME}/vim
```

Set the proper initialization variables.

```sh
export VIMINIT='let $MYVIMRC=$XDG_CONFIG_HOME . "/vim/vimrc" | source $MYVIMRC'
# Don't have a gvimrc yet.  working on it
# export GVIMINIT='let $MYGVIMRC=$XDG_CONFIG_HOME . "/vim/gvimrc" | source $MYGVIMRC'
```

Upon starting vim, all plugins should be installed automatically, provided
`wget` or `curl` is installed.

I found that I had to sue a :PlugUpdate in order to get plugins installed. Will
try to figure out why.

## Old vimrc
`oldvimrc` has the old version of my vimrc.  I kept most of my settings in so
far as my keymaps but I'm also trying out some of euclio's settings to see if I
like them. It also has my old settings for gvim so i don't lose them.

That's the great thing about vim!  Try it until you like it!

_Note_: I have not tested this in Windows so I have no clue if this will work



export ZSH=$HOME/.ohmyzsh

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="gozilla"

# zstyle ':omz:update' mode disabled  # disable automatic updates
plugins=(git zsh-vi-mode)

source $ZSH/oh-my-zsh.sh
source $HOME/.zsh/alias.zsh
source $HOME/.zsh/functions.zsh


export PATH="$HOME/go/bin:$PATH"
export _JAVA_AWT_WM_NONREPARENTING=1
#  Load Angular CLI autocompletion.
# source <(ng completion script)

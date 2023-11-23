export ZSH=$HOME/.ohmyzsh

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="gozilla"

# zstyle ':omz:update' mode disabled  # disable automatic updates
plugins=(git)

source $ZSH/oh-my-zsh.sh
source $HOME/.zsh/alias.zsh
source $HOME/.zsh/functions.zsh
# On-demand rehash
# zshcache_time="$(date +%s%N)"
#
# autoload -Uz add-zsh-hook
#
# rehash_precmd() {
#   if [[ -a /var/cache/zsh/pacman ]]; then
#     local paccache_time="$(date -r /var/cache/zsh/pacman +%s%N)"
#     if (( zshcache_time < paccache_time )); then
#       rehash
#       zshcache_time="$paccache_time"
#     fi
#   fi
# }
#
# add-zsh-hook -Uz precmd rehash_precmd

# the prompt
# function dir_icon {
#   if [[ "$PWD" == "$HOME" ]]; then
#     echo "%B%F{black}%f%b"
#   else
#     echo "%B%F{cyan}%f%b"
#   fi
# }
#
# PS1='%B%F{blue}%f%b  %B%F{magenta}%n%f%b $(dir_icon)  %B%F{red}%~%f%b${vcs_info_msg_0_} %(?.%B%F{green}.%F{red})%f%b '


export PATH="$HOME/go/bin:$PATH"
export _JAVA_AWT_WM_NONREPARENTING=1
#
#
#  Load Angular CLI autocompletion.
# source <(ng completion script)

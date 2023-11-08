export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
#ZSH_THEME="random"

zstyle ':omz:update' mode disabled  # disable automatic updates
plugins=(git)

source $ZSH/oh-my-zsh.sh

# On-demand rehash
zshcache_time="$(date +%s%N)"

autoload -Uz add-zsh-hook

rehash_precmd() {
  if [[ -a /var/cache/zsh/pacman ]]; then
    local paccache_time="$(date -r /var/cache/zsh/pacman +%s%N)"
    if (( zshcache_time < paccache_time )); then
      rehash
      zshcache_time="$paccache_time"
    fi
  fi
}

add-zsh-hook -Uz precmd rehash_precmd

# the prompt
function dir_icon {
  if [[ "$PWD" == "$HOME" ]]; then
    echo "%B%F{black}%f%b"
  else
    echo "%B%F{cyan}%f%b"
  fi
}

PS1='%B%F{blue}%f%b  %B%F{magenta}%n%f%b $(dir_icon)  %B%F{red}%~%f%b${vcs_info_msg_0_} %(?.%B%F{green}.%F{red})%f%b '



# config
alias zshconfig="nvim ~/.zshrc"
alias ohmyzsh="nvim ~/.oh-my-zsh"
alias config="nvim ~/.config/"
alias nvimconfig="nvim ~/.config/nvim/"
alias weztermconfig="nvim ~/.wezterm.lua"

# ls
alias ls='lsd -a --group-directories-first'
alias ll='lsd -la --group-directories-first'

# cd 
alias cdbspwm='cd ~/.config/bspwm'
alias cdnvim='cd ~/.config/nvim'
alias cdconfig='cd ~/.config/'
alias cdisk='cd /run/media/ayga/Disk/'

# mount
alias mountdisk='udisksctl mount --block-device /dev/sda1'

# git
alias gcl='git clone --depth 1'
alias gi='git init'
alias ga='git add'
alias gc='git commit -m'
alias gp='git push origin master'
#other
alias vim=nvim
alias mvnrun="mvn spring-boot:run"
alias sail=./vendor/bin/sail
# functions 

switchGraphic ()
{
     if [[ $# -eq 0 ]]; then
        echo "Usage: switchGraphic < nvidia | integrated | hybrid >"
        return 1
    fi
      prime-offload && optimus-manager --switch "$1"
  
}

function setdpi() {
    if [[ $# -eq 0 ]]; then
        echo "Usage: set_dpi <dpi_value>"
        return 1
    fi
    #xdpyinfo | grep resolution
    #new_dpi = current_dpi * scaling_factor
    #new_dpi = 96 * 1.25 = 120
    local dpi_value="$1"
    local xresources_file="/home/$USER/.Xresources"
    touch $xresources_file > /dev/null
    # Check if Xft.dpi already exists in the file
    if grep -q "Xft.dpi" "$xresources_file"; then
        # If it exists, update its value
        sudo sed -i "s/Xft.dpi:.*/Xft.dpi: ${dpi_value}/" "$xresources_file"
    else
        # If it doesn't exist, add it to the end of the file
        echo "Xft.dpi: ${dpi_value}" > "$xresources_file" 
    fi

    # Apply the changes using xrdb with sudo
    sudo xrdb -merge "$xresources_file"

    echo "DPI set to ${dpi_value}"
}

function fix_noto_arabic_fonts() {
  #a Here document (Heredoc) is a type of redirection
  #that allows you to pass multiple lines of input to a command.
  #The syntax of writing HereDoc takes the following form:
  #[COMMAND] <<[-] 'DELIMITER'
    # HERE-DOCUMENT
  #DELIMITER

  # The content to add to the file
  local content=$(cat <<EOF
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE fontconfig SYSTEM "urn:fontconfig:fonts.dtd">
<fontconfig>
  <selectfont>
    <rejectfont>
      <glob>/usr/share/fonts/noto/NotoNastaliq*</glob>
    </rejectfont>
  </selectfont>
</fontconfig>
EOF
)

    local custom_message="Arabic legibility fixed "

    local target_file="/etc/fonts/conf.d/66-noto-reject-nastaliq.conf"

    sudo echo '$content' > '$target_file'

    echo "$custom_message"
}
search() {
  if [ -z "$1" ]; then
    echo "Usage: findfile <name>"
  else
    find / -name "$1" 2>/dev/null
  fi
}

sourcezsh(){
  source ~/.zshrc
}

# git init dotfiles dir

gitdotfiles(){

  CURR_DIR=$(pwd) 
  mkdir -p ~/dotfiles
  cd ~/dotfiles
  git init
  git branch -M main
  git remote add origin git@github.com:AYGA2K/dotfiles.git
  cd $CURR_DIR
}

backupdotfiles() {
  if [ -z "$1" ]; then
    echo "Usage: backup_dotfiles <commit_message>"
  else
   CURR_DIR=$(pwd) 
   DIR=~/hyprland_dotfiles
   # Create the directory if it doesn't exist
   mkdir -p $DIR

     # Copy .wezterm.lua
   cp ~/.wezterm.lua $DIR
     # Copy .config  
   cd ~/.config
   cp -r nvim mpv hypr Thunar archlinux-logout  $DIR/.config

    # Copy .zshrc 
   cp ~/.zshrc $DIR

    # installed packages
   yay -Qqe  > $DIR/packages.txt

    # git
   cd $DIR 
   git add . && git commit -m "$1" && git push origin main 
   cd $CURR_DIR
 fi
}

export PATH="$HOME/go/bin:$PATH"
export _JAVA_AWT_WM_NONREPARENTING=1


# Load Angular CLI autocompletion.
source <(ng completion script)

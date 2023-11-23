search() {
  if [ -z "$1" ]; then
    echo "Usage: findfile <name>"
  else
  sudo find / -name "$1" 2>/dev/null
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
   cp -r ~/.zsh  $DIR

    # installed packages
   yay -Qqe  > $DIR/packages.txt

    # git
   cd $DIR
   git add . && git commit -m "$1" && git push origin main
   cd $CURR_DIR
 fi
}

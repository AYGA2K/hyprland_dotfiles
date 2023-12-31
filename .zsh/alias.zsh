# config
alias zshconfig="nvim ~/.zsh"
alias ohmyzsh="nvim ~/.oh-my-zsh"
alias config="nvim ~/.config/"
alias nvimconfig="nvim ~/.config/nvim/"
alias weztermconfig="nvim ~/.wezterm.lua"

# ls
alias ls='lsd -a --group-directories-first'
alias ll='lsd -la --group-directories-first'

# cd
alias cdhypr='cd ~/.config/hypr'
alias cdnvim='cd ~/.config/nvim'
alias cdconfig='cd ~/.config/'
alias cdisk='cd /run/media/ayga/Disk/'

# mount
alias mountdisk='sudo mkdir -p /run/media/ayga/Disk/ && sudo mount /dev/sda1 /run/media/ayga/Disk/ -t ntfs'

# git
alias gcl='git clone --depth 1'
alias gi='git init'
alias ga='git add'
alias gc='git commit -m'
alias gp='git push origin master'
#other
alias vim=nvim
alias mvnrun="mvn spring-boot:run"

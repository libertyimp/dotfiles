source /usr/share/defaults/etc/profile

neofetch

 eval "$(starship init bash)"

alias cl="clear && neofetch"
alias ..="cd .."
alias ...="cd ..."
alias ll="ls -la"
alias sdn="sudo shutdown -h now"
alias upgrade="sudo eopkg upgrade"
alias dsync="~/.emacs.d/bin/doom sync"
alias dupdate="~/.emacs.d/bin/doom upgrade"
alias web="cd ~/Documents/koreymoffett.com"
alias ls='ls -hN --color=auto --group-directories-first'
alias dotfiles='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'

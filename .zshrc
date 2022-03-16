# KaosFang's config of the ZSH Shell
source /home/kaosfang/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


# EXPORT
export EDITOR="nvim"
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
# Enable colors and change prompt
autoload -U colors && colors
PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "
setopt autocd   #Auto cd into a directory

autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)
# History in cache directory:
 HISTSIZE=10000000
 SAVEHIST=10000000
 HISTFILE=~/.cache/zsh/history

 # vi mode
  bindkey -v
  export KEYTIMEOUT=1

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# Change cursor shape for different vi modes.
function zle-keymap-select () {
    case $KEYMAP in
        vicmd) echo -ne '\e[1 q';;      # block
        viins|main) echo -ne '\e[5 q';; # beam
    esac
}

echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

# ALIASES
alias ls='exa --color=always --group-directories-first'                                                                            
alias ll='exa -alF'                                                                       
alias la='exa -A'                                                                         
alias vim='nvim'
alias cl='clear && neofetch'                                                              
alias sdn='sudo shutdown -f now'                                                          
alias mkd='mkdir'                                                                         
alias bat='batcat'
alias mine='./xmrig -o pool.supportxmr.com:443 -u 4AbQGHquyPMb1niz5oX5o9eViKW6Egu3VApcND1HEhDDLq2fkmnRdx3a3GW6EoEaUYW3gGFBVkhxHDCFb7XfMykF12KEfqz -k --tls -p KaosBlockbuster' 
alias rr='curl -s -L https://raw.githubusercontent.com/keroserene/rickrollrc/master/roll.sh | bash'

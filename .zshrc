# ██████╗ ███████╗██╗   ██╗ █████╗ ███████╗███╗   ███╗██████╗ ██╗  ██╗    ██████╗  ██████╗ ████████╗███████╗    ███████╗███████╗██╗  ██╗
# ██╔══██╗██╔════╝██║   ██║██╔══██╗██╔════╝████╗ ████║██╔══██╗╚██╗██╔╝    ██╔══██╗██╔═══██╗╚══██╔══╝██╔════╝    ╚══███╔╝██╔════╝██║  ██║
# ██║  ██║█████╗  ██║   ██║███████║███████╗██╔████╔██║██████╔╝ ╚███╔╝     ██║  ██║██║   ██║   ██║   ███████╗      ███╔╝ ███████╗███████║
# ██║  ██║██╔══╝  ╚██╗ ██╔╝██╔══██║╚════██║██║╚██╔╝██║██╔══██╗ ██╔██╗     ██║  ██║██║   ██║   ██║   ╚════██║     ███╔╝  ╚════██║██╔══██║
# ██████╔╝███████╗ ╚████╔╝ ██║  ██║███████║██║ ╚═╝ ██║██║  ██║██╔╝ ██╗    ██████╔╝╚██████╔╝   ██║   ███████║    ███████╗███████║██║  ██║
# ╚═════╝ ╚══════╝  ╚═══╝  ╚═╝  ╚═╝╚══════╝╚═╝     ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝    ╚═════╝  ╚═════╝    ╚═╝   ╚══════╝    ╚══════╝╚══════╝╚═╝  ╚═╝

#  ▄▄▄·▄▄▌  ▄• ▄▌ ▄▄ • ▪   ▐ ▄ .▄▄ · 
# ▐█ ▄███•  █▪██▌▐█ ▀ ▪██ •█▌▐█▐█ ▀. 
#  ██▀·██▪  █▌▐█▌▄█ ▀█▄▐█·▐█▐▐▌▄▀▀▀█▄
# ▐█▪·•▐█▌▐▌▐█▄█▌▐█▄▪▐█▐█▌██▐█▌▐█▄▪▐█
# .▀   .▀▀▀  ▀▀▀ ·▀▀▀▀ ▀▀▀▀▀ █▪ ▀▀▀▀ 

source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-sudo/sudo.plugin.zsh

# User configuration
export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8


# Compilation flags
export ARCHFLAGS="-arch x86_64"

# History
HISTSIZE=100000
SAVEHIST=100000
HISTFILE=~/.zsh_history

#·▄▄▄▄• ▄▌ ▐ ▄  ▄▄· ▄▄▄▄▄▪         ▐ ▄ .▄▄ · 
#▐▄▄·█▪██▌•█▌▐█▐█ ▌▪•██  ██ ▪     •█▌▐█▐█ ▀. 
#██▪ █▌▐█▌▐█▐▐▌██ ▄▄ ▐█.▪▐█· ▄█▀▄ ▐█▐▐▌▄▀▀▀█▄
#██▌.▐█▄█▌██▐█▌▐███▌ ▐█▌·▐█▌▐█▌.▐▌██▐█▌▐█▄▪▐█
#▀▀▀  ▀▀▀ ▀▀ █▪·▀▀▀  ▀▀▀ ▀▀▀ ▀█▄▀▪▀▀ █▪ ▀▀▀▀ 

# fzf improvement
function fzf-lovely(){

if [ "$1" = "h" ]; then
  fzf -m --reverse --preview-window down:20 --preview '[[ $(file --mime {}) =~ binary ]] &&
    echo {} is a binary file ||
    (bat --style=numbers --color=always {} ||
    highlight -O ansi -l {} ||
    coderay {} ||
    rougify {} ||
    cat {}) 2> /dev/null | head -500'

else
  fzf -m --preview '[[ $(file --mime {}) =~ binary ]] &&
    echo {} is a binary file ||
    (bat --style=numbers --color=always {} ||
    highlight -O ansi -l {} ||
    coderay {} ||
    rougify {} ||
    cat {}) 2> /dev/null | head -500'
fi
}


# rmk

function rmk(){
	scrub -p dod $1
	shred -zun 10 -v $1
}


#  ▄▄▄· ▄▄▌  ▪   ▄▄▄· .▄▄ · ▄▄▄ ..▄▄ · 
# ▐█ ▀█ ██•  ██ ▐█ ▀█ ▐█ ▀. ▀▄.▀·▐█ ▀. 
# ▄█▀▀█ ██▪  ▐█·▄█▀▀█ ▄▀▀▀█▄▐▀▀▪▄▄▀▀▀█▄
# ▐█ ▪▐▌▐█▌▐▌▐█▌▐█ ▪▐▌▐█▄▪▐█▐█▄▄▌▐█▄▪▐█
#  ▀  ▀ .▀▀▀ ▀▀▀ ▀  ▀  ▀▀▀▀  ▀▀▀  ▀▀▀▀ 

alias v=nvim
alias n=nvim

alias cat=bat

alias cls=clear
alias cl=clear
alias lc=clear

alias g=git
alias gc='git clone'
alias ga='git add'
alias gaa='git add .'
alias gcm='git commit'
alias gc-m='git commit -m'
alias gp='git push'
alias gpl='git pull'
alias gst='git status'

alias ls=lsd
alias l=ls
alias la='ls -a'
alias ll='l -l'
alias lla='ll -a'
alias ..='cd ..'

alias q=exit
alias r=ranger
alias h=htop
alias neo=neofetch
alias fast=fastfetch
alias nerd=nerdfetch
alias fixhour='sudo ntpd -qg && sudo hwclock -w'
alias udb='sudo updatedb'
alias sozsh='source .zshrc'

alias alaup='rm -rf ~/.config/alacritty/alacritty.toml && rm -rf ~/.config/alacritty/alacritty.toml.bak && alacritty migrate'
alias sdcu='sudo docker-compose up -d'
alias sdcd='sudo docker-compose down'

# ▄▄▄▄▄• ▌ ▄ ·. ▄• ▄▌▐▄• ▄ 
# •██  ·██ ▐███▪█▪██▌ █▌█▌▪
#  ▐█.▪▐█ ▌▐▌▐█·█▌▐█▌ ·██· 
#  ▐█▌·██ ██▌▐█▌▐█▄█▌▪▐█·█▌
#  ▀▀▀ ▀▀  █▪▀▀▀ ▀▀▀ •▀▀ ▀▀

# if [ "$TMUX" = "" ]; then exec tmux new-session -A -s home; fi

#  ▄ .▄      • ▌ ▄ ·. ▄▄▄ .▄▄▄▄· ▄▄▄  ▄▄▄ .▄▄▌ ▐ ▄▌
# ██▪▐█▪     ·██ ▐███▪▀▄.▀·▐█ ▀█▪▀▄ █·▀▄.▀·██· █▌▐█
# ██▀▐█ ▄█▀▄ ▐█ ▌▐▌▐█·▐▀▀▪▄▐█▀▀█▄▐▀▀▄ ▐▀▀▪▄██▪▐█▐▐▌
# ██▌▐▀▐█▌.▐▌██ ██▌▐█▌▐█▄▄▌██▄▪▐█▐█•█▌▐█▄▄▌▐█▌██▐█▌
# ▀▀▀ · ▀█▄▀▪▀▀  █▪▀▀▀ ▀▀▀ ·▀▀▀▀ .▀  ▀ ▀▀▀  ▀▀▀▀ ▀▪

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

#·▄▄▄▄•      ▐▄• ▄ ▪  ·▄▄▄▄  ▄▄▄ .
#▪▀·.█▌▪      █▌█▌▪██ ██▪ ██ ▀▄.▀·
#▄█▀▀▀• ▄█▀▄  ·██· ▐█·▐█· ▐█▌▐▀▀▪▄
#█▌▪▄█▀▐█▌.▐▌▪▐█·█▌▐█▌██. ██ ▐█▄▄▌
#·▀▀▀ • ▀█▄▀▪•▀▀ ▀▀▀▀▀▀▀▀▀▀•  ▀▀▀ 

eval "$(zoxide init zsh)"

# cowsay with fortune

# fortune | cowsay

# fastfetch

fastfetch

# powerlevel10k

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source ~/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# ███████╗███╗   ██╗██████╗      ██████╗ ███████╗    ██████╗  ██████╗ ████████╗███████╗
# ██╔════╝████╗  ██║██╔══██╗    ██╔═══██╗██╔════╝    ██╔══██╗██╔═══██╗╚══██╔══╝██╔════╝
# █████╗  ██╔██╗ ██║██║  ██║    ██║   ██║█████╗      ██║  ██║██║   ██║   ██║   ███████╗
# ██╔══╝  ██║╚██╗██║██║  ██║    ██║   ██║██╔══╝      ██║  ██║██║   ██║   ██║   ╚════██║
# ███████╗██║ ╚████║██████╔╝    ╚██████╔╝██║         ██████╔╝╚██████╔╝   ██║   ███████║
# ╚══════╝╚═╝  ╚═══╝╚═════╝      ╚═════╝ ╚═╝         ╚═════╝  ╚═════╝    ╚═╝   ╚══════╝

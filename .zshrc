# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# vars
export SUDO_PROMPT="If you want continue 
type your password %u: "

if [ -d "$HOME/.local/bin" ] ;
  then PATH="$HOME/.local/bin:$PATH"
fi

# load engine

autoload -Uz compinit

for dump in ~/.config/zsh/zcompdump(N.mh+24); do
  compinit -d ~/.config/zsh/zcompdump
done

compinit -C -d ~/.config/zsh/zcompdump

autoload -Uz add-zsh-hook
autoload -Uz vcs_info
precmd () { vcs_info }
_comp_options+=(globdots)

zstyle ':completion:*' verbose true
zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS} 'ma=48;5;197;1'
zstyle ':completion:*' matcher-list \
		'm:{a-zA-Z}={A-Za-z}' \
		'+r:|[._-]=* r:|=*' \
		'+l:|=*'
zstyle ':completion:*:warnings' format "%B%F{red}No matches for:%f %F{magenta}%d%b"
zstyle ':completion:*:descriptions' format '%F{yellow}[-- %d --]%f'
zstyle ':vcs_info:*' formats ' %B%F{yellow}%b%f'

# zsh options
setopt AUTOCD              # change directory just by typing its name
setopt PROMPT_SUBST        # enable command substitution in prompt
setopt MENU_COMPLETE       # Automatically highlight first element of completion menu
setopt LIST_PACKED		   # The completion menu takes less space.
setopt AUTO_LIST           # Automatically list choices on ambiguous completion.
setopt COMPLETE_IN_WORD    # Complete from both ends of a word.

# prompt

function dir_icon {
  if [[ "$PWD" == "$HOME" ]]; then
    echo "%B%F{cyan}%f%b"
  else
    echo "%B%F{cyan}%f%b"
  fi
}

PS1='%B%F{blue}%f%b  %B%F{magenta}%B%n $(dir_icon)  %B%F{red}%~%f%b${vcs_info_msg_0_} 
%(?.%B%F{green} .%F{red}  )%f%b '

# command not found
command_not_found_handler() {
	printf "%s%s? I don't know what is it\n" "$acc" "$0" >&2
    return 127
}

#  ▄▄▄·▄▄▌  ▄• ▄▌ ▄▄ • ▪   ▐ ▄ .▄▄ · 
# ▐█ ▄███•  █▪██▌▐█ ▀ ▪██ •█▌▐█▐█ ▀. 
#  ██▀·██▪  █▌▐█▌▄█ ▀█▄▐█·▐█▐▐▌▄▀▀▀█▄
# ▐█▪·•▐█▌▐▌▐█▄█▌▐█▄▪▐█▐█▌██▐█▌▐█▄▪▐█
# .▀   .▀▀▀  ▀▀▀ ·▀▀▀▀ ▀▀▀▀▀ █▪ ▀▀▀▀ 

source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
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
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

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


# ▄▄▄      • ▌ ▄ ·.     ▄ •▄ 
# ▀▄ █·    ·██ ▐███▪    █▌▄▌▪
# ▐▀▀▄     ▐█ ▌▐▌▐█·    ▐▀▀▄·
# ▐█•█▌    ██ ██▌▐█▌    ▐█.█▌
# .▀  ▀    ▀▀  █▪▀▀▀    ·▀  ▀

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

alias tb=taskbook
alias lt=utd

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
alias ...=cd

alias q=exit
alias r=ranger
alias b=btop
alias fast=fastfetch
alias clfs='clear && fastfetch'
alias fixhour='sudo ntpd -qg && sudo hwclock -w'
alias udb='sudo updatedb'
alias sozsh='source .zshrc'
alias mion='amixer sset Capture cap'
alias mioff='amixer sset Capture nocap'

alias sdcu='sudo docker-compose up -d'
alias sdcd='sudo docker-compose down'

alias grub-update="sudo grub-mkconfig -o /boot/grub/grub.cfg"
alias mainten="yay -Sc --noconfirm && sudo pacman -Scc --noconfirm"
alias update="yay -Syu --noconfirm"


#·▄▄▄▄•      ▐▄• ▄ ▪  ·▄▄▄▄  ▄▄▄ .
#▪▀·.█▌▪      █▌█▌▪██ ██▪ ██ ▀▄.▀·
#▄█▀▀▀• ▄█▀▄  ·██· ▐█·▐█· ▐█▌▐▀▀▪▄
#█▌▪▄█▀▐█▌.▐▌▪▐█·█▌▐█▌██. ██ ▐█▄▄▌
#·▀▀▀ • ▀█▄▀▪•▀▀ ▀▀▀▀▀▀▀▀▀▀•  ▀▀▀ 

eval "$(zoxide init zsh)"

# ███████╗███╗   ██╗██████╗      ██████╗ ███████╗    ██████╗  ██████╗ ████████╗███████╗
# ██╔════╝████╗  ██║██╔══██╗    ██╔═══██╗██╔════╝    ██╔══██╗██╔═══██╗╚══██╔══╝██╔════╝
# █████╗  ██╔██╗ ██║██║  ██║    ██║   ██║█████╗      ██║  ██║██║   ██║   ██║   ███████╗
# ██╔══╝  ██║╚██╗██║██║  ██║    ██║   ██║██╔══╝      ██║  ██║██║   ██║   ██║   ╚════██║
# ███████╗██║ ╚████║██████╔╝    ╚██████╔╝██║         ██████╔╝╚██████╔╝   ██║   ███████║
# ╚══════╝╚═╝  ╚═══╝╚═════╝      ╚═════╝ ╚═╝         ╚═════╝  ╚═════╝    ╚═╝   ╚══════╝


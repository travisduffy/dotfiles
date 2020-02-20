source ~/.git-prompt.sh

# Enable shell expansions on the prompt string
#shopt -u promptvars

# Enable 256 colours
export TERM='xterm-256color'

# Prompt styles & colours
bold=$(tput bold)
reset=$(tput sgr0)

colUser=$(tput setaf 87)
colHost=$(tput setaf 121)
colDir=$(tput setaf 147)
colGit=$(tput setaf 200)
colPointer=$(tput setaf 119)

# Builds bash prompt
buildPS1() {
    export PS1="\n\[${bold}${colUser}\]\u\[${colHost}\]@\h\[${reset}\]\[${colDir}\] \w \[${colGit}\]$(__git_ps1)\n\[${bold}${colPointer}\] ~> \[${reset}\]"
}

# Rebuild bash prompt every time to update git status in prompt
PROMPT_COMMAND=buildPS1
buildPS1

#--- Aliases
alias l='ls --color=auto'
alias ls='ls --color=auto'
alias ll='ls -laF --color=auto'
alias grep='grep --color=auto'

# LAMP stack
alias lamp-start='sudo /opt/lampp/lampp start'
alias lamp-stop='sudo /opt/lampp/lampp stop'
alias lamp-restart='sudo /opt/lampp/lampp restart'

# Quick bash profile edits
alias brc='nano ~/dotfiles/.bashrc'
alias brcr='source ~/dotfiles/.bashrc'

# Refresh Regolith desktop
alias rego='regolith-look refresh'

# Enable 256 colours
export TERM='xterm-256color'

# Prompt styles & colours
bold=$(tput bold)
reset=$(tput sgr0)
colUser=$(tput setaf 87)
colHost=$(tput setaf 121)
colDir=$(tput setaf 147)
colPointer=$(tput setaf 119)

# Build & export prompt
PS1="\[${bold}${colUser}\]\u"           #user
PS1+="\[${colHost}\]@\h\[${reset}\]"    #host
PS1+="\[${colDir}\] \w "                #directory
PS1+="\[${bold}${colPointer}\]#> "      #pointer
PS1+="\[${reset}\]"                     #reset all

export PS1

# Aliases
alias ls='ls --color=auto'
alias ll='ls -la --color=auto'
alias grep='grep --color=auto'

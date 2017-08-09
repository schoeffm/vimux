###########################################
##                aliases                ##
###########################################
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'
alias c='clear'
alias ll='ls -lahtrF'
alias sl='ls -lahtrF'
alias vi='vim'
alias cls='clear; ls'
alias df='df -k'
alias jg='ps -ef | grep java'
alias o='open .'
alias ws='cd ~/workspace'
alias tree='tree -latr'
alias mkcd=mkdircd
alias fuck='sudo $(fc -ln -1)'
alias diff='idea diff'              # use intellij's diff tool


###########################################
##            glocal aliases             ##
###########################################
alias -g L='| less'
alias -g NUL='> /dev/null 2>&1'


###########################################
##              GIT stuff                ##
###########################################

function gi() { curl -L -s https://www.gitignore.io/api/$@ ;}

function gitsubpull() { gsubpull }

function gsubpull() { 
    git pull;                           # first pull all pointers
    git submodule foreach git pull;     # now pull recursively 
}



###########################################
##           general stuff               ##
###########################################

# since a real pain in the ass to encode cli-input I've wrapped the pieces together (important is the
# -n to prevent a new-line at the end)
function ibase64() { echo -n "$1" | base64 }

function mkdircd() { mkdir $*; cd $*; }

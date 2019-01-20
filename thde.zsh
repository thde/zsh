## Modified commands ##
alias df='df -h'
alias du='du -c -h'
alias mkdir='mkdir -v'
alias nano='nano -w'
alias dmesg='dmesg -HL'
alias wget='wget -c'
##

## New commands ##
alias mountt='mount |column -t'
alias outgoingip='dig myip.opendns.com @resolver1.opendns.com +short'
alias rs='rsync -ahvP --stats'
alias dc='docker-compose'
alias docker-cleanup='docker system prune --volumes -f'
##

## OS specific ##
case "$(uname -s)" in
   Darwin) # Mac OS X
     ;;
   Linux)
     ;;
   CYGWIN*|MINGW32*|MSYS*) # Windows
     ;;
   # Add here more strings to compare (https://en.wikipedia.org/wiki/Uname#Examples)
   *) # not listed 
     ;;
esac
##

## Functions ##
extract () {
  if [ -f $1 ] ; then
      case $1 in
          *.tar.bz2)   tar xvjf $1    ;;
          *.tar.gz)    tar xvzf $1    ;;
          *.bz2)       bunzip2 $1     ;;
          *.rar)       rar x $1       ;;
          *.gz)        gunzip $1      ;;
          *.tar)       tar xvf $1     ;;
          *.tbz2)      tar xvjf $1    ;;
          *.tgz)       tar xvzf $1    ;;
          *.zip)       unzip $1       ;;
          *.Z)         uncompress $1  ;;
          *.7z)        7za x $1        ;;
          *)           echo "don't know '$1'..." ;;
      esac
  else
      echo "'$1' is not a valid file!"
  fi
}
##

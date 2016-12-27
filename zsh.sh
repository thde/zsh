## Exports ##
export PYTHONIOENCODING='UTF-8';

## Modified commands ##
if grep --color "a" <<<"a" &>/dev/null; then
    alias grep='grep --color=auto'
fi
if egrep --color "a" <<<"a" &>/dev/null; then
    alias egrep='egrep --color=auto'
fi
if fgrep --color "a" <<<"a" &>/dev/null; then
    alias fgrep='fgrep --color=auto'
fi
alias more='less'
alias df='df -h'
alias du='du -c -h'
alias mkdir='mkdir -v'
alias nano='nano -w'
alias dmesg='dmesg -HL'
alias wget='wget -c'
##

## New commands ##
alias cc='cd && clear'
alias ..='cd ..'
alias cd..='cd ..'
alias header='curl -I'
alias mountt='mount |column -t'
alias cl='wc -l'
alias share="curl -F upload=@- https://w1r3.net"
alias outgoingip='dig myip.opendns.com @resolver1.opendns.com +short'
alias rs='rsync -ahvP --stats'
##

## OS specific ##
case "$(uname -s)" in
   Darwin) # Mac OS X
     alias upgrade='brew update && brew upgrade && brew cleanup && brew cask cleanup && yes | apm upgrade'
     alias afk='/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend'
     alias flushdns='dscacheutil -flushcache && killall -HUP mDNSResponder'
     alias ds-cleanup='find . -type f -name "*.DS_Store" -ls -delete'
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
hostfromdomain () {
  dig "$1" +short | xargs dig +short -x
}

gccrun () {
  gcc "$1" -o ./gccrun
  ./gccrun
  rm -f ./gccrun
}

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

weather () {
    curl -s "http://wttr.in/${1}"
}
##

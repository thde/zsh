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
alias da='date "+%A, %B %d, %Y [%T]"'
alias cc='cd && clear'
alias hist='history | grep'         # requires an argument
alias openports='ss --all --numeric --processes --ipv4 --ipv6'
alias pgg='ps -Af | grep'           # requires an argument
alias ..='cd ..'
alias cd..='cd ..'
alias path='echo -e ${PATH//:/\\n}'
alias now='date "+%T"'
alias nowtime=now
alias nowdate='date +"%d-%m-%Y"'
alias fastping='ping -c 100 -s.2'
alias ports='netstat -tulanp'
alias header='curl -I'
alias mountt='mount |column -t'
alias tree="find . -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'"
alias lines='wc -l'
alias sprunge="curl -F 'sprunge=<-' http://sprunge.us"
alias outgoingip='dig myip.opendns.com @resolver1.opendns.com +short' #fastest
# alias outgoingip="wget -q -O - checkip.dyndns.org|sed -e 's/.*Current IP Address: //' -e 's/<.*$//'"
# alias outgoingip='curl ifconfig.me'
alias rs='rsync -ahvP --stats'
##

## OS specific ##
case "$(uname -s)" in
   Darwin) # Mac OS X
     alias upgrade-all='antigen update && brew update && brew upgrade && brew cleanup && yes | apm upgrade'
     alias afk='/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend'
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

create-crt () {
    openssl req -new -x509 -nodes -days 3650 -subj "/CN=$1" -keyout "/etc/ssl/private/self/$1.key" -out "/etc/ssl/private/self/$1.crt"
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

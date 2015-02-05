## Modified commands ##
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias more='less'
alias df='df -h'
alias du='du -c -h'
alias mkdir='mkdir -p -v'
alias nano='nano -w'
alias ping='ping -c 5'
alias dmesg='dmesg -HL'
alias wget='wget -c'
##

## New commands ##
alias da='date "+%A, %B %d, %Y [%T]"'
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
alias outgoingip='dig myip.opendns.com @resolver1.opendns.com +short' #fastest
# alias outgoingip="wget -q -O - checkip.dyndns.org|sed -e 's/.*Current IP Address: //' -e 's/<.*$//'"
# alias outgoingip='curl ifconfig.me'
##

## Functions ##
hostfromdomain() {
   for IP in $(dig a "$1" +short)
   do
        # host "$IP"
          dig -x "$IP" +short
   done
}
##

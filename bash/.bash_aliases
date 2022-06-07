alias ls='ls --color=auto'
alias grep='grep --colour=auto'
alias egrep='egrep --colour=auto'
alias fgrep='fgrep --colour=auto'

alias cp="cp -i"
alias df='df -h'
alias free='free -m'
alias more=less

alias cd='function _f(){ if [ -z $1 ]; then cd; elif [[ $1 =~ ^\.+$ ]]; then for i in $(STR=$1; seq 2 ${#STR}); do cd ..; done; else cd $1; fi; };_f'
alias date='function _f(){ if [ -z $1 ]; then date; elif [ $1 == "_" ]; then date +"%A, %d %B %Y"; else date "$1"; fi; };_f'
alias fzd='function _fzd(){ if [ -z $1 ]; then DIR="."; else DIR=$(realpath -s $1); fi; TGT=$(find $DIR -type d | fzf); echo $TGT; };_fzd'
alias fzcd='function _fzcd(){ cd $(fzd $@); };_fzcd'
alias :q=exit

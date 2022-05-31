alias ls='ls --color=auto'
alias grep='grep --colour=auto'
alias egrep='egrep --colour=auto'
alias fgrep='fgrep --colour=auto'

alias cp="cp -i"
alias df='df -h'
alias free='free -m'
alias more=less

alias fzd='function _fzd(){ if [ -z $1 ]; then DIR="."; else DIR=$(realpath -s $1); fi; TGT=$(find $DIR -type d | fzf); echo $TGT; };_fzd'
alias fzcd='function _fzcd(){ cd $(fzd $@); };_fzcd'
alias :q=exit

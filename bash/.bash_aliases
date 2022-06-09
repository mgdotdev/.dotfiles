alias ls='ls --color=auto'
alias grep='grep --colour=auto'
alias egrep='egrep --colour=auto'
alias fgrep='fgrep --colour=auto'

alias cp="cp -i"
alias df='df -h'
alias free='free -m'
alias more=less

alias tmux='function f(){ if [ -z $1 ]; then tmux; elif [ -d $1 ]; then DIR=$(readlink -f $1); tmux new-session -A -s $DIR -c $DIR; else tmux $@; fi; };f'
alias date='function f(){ if [ -z $1 ]; then date; elif [ $1 == "_" ]; then date +"%A, %d %B %Y"; else date "$1"; fi; };f'
alias fzd='function f(){ if [ -z $1 ]; then DIR="."; else DIR=$(realpath -s $1); fi; TGT=$(find $DIR -type d | fzf); echo $TGT; };f'
alias fzcd='function f(){ cd $(fzd $@); };f'
alias :q=exit

alias ls='ls --color=auto --group-directories-first'
alias grep='grep --colour=auto'
alias egrep='egrep --colour=auto'
alias fgrep='fgrep --colour=auto'

alias c="clear"
alias cp="cp -i"
alias df='df -h'
alias free='free -m'
alias more=less

alias cs="xclip -selection clipboard"
alias vs="xclip -o -selection clipboard"

alias t="tmux"
alias tl="tmux ls"
alias ta="tmux attach"

alias sus="systemctl suspend"
alias env='compgen -v | sort | while read var; do [ -z "${!var}" ] || echo $var=${!var} ; done'

alias mkcd='function f(){ mkdir $1; cd $1; };f'
alias tmux='function f(){ if [ -z $1 ]; then tmux -u; elif [ -d $1 ]; then DIR=$(readlink -f $1); tmux -u new-session -A -s $DIR -c $DIR; else tmux $@; fi; };f'
alias date='function f(){ if [ -z $1 ]; then date; elif [ $1 == "_" ]; then date +"%A %d %B %Y"; else date "$1"; fi; };f'
alias fzd='function f(){ if [ -z $1 ]; then DIR="."; else DIR=$(realpath -s $1); fi; TGT=$(find $DIR -type d | fzf); echo $TGT; };f'
alias fzcd='function f(){ cd $(fzd $@); };f'

alias :q=exit

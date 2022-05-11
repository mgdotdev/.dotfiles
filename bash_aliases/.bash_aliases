alias fzd='function _fzd(){ if [ -z $1 ]; then DIR="."; else DIR=$(realpath -s $1); fi; TGT=$(find $DIR -type d | fzf); echo $TGT; };_fzd'
alias fzcd='function _fzcd(){ cd $(fzd $@); };_fzcd'

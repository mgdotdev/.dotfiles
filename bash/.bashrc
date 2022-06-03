#
# ~/.bashrc
#

[[ $- != *i* ]] && return

[ -r /usr/share/bash-completion/bash_completion ] && source /usr/share/bash-completion/bash_completion

HISTSIZE=
HSTFILESIZE=
TERM=xterm-256color

DISTRO=$(cat /etc/os-release | sed -rn "s/\<ID=(.*?)/\u\1/p")
PS1="\e[38;5;45m$DISTRO\e[m [\u@\h] \e[38;5;45m\w\e[m \n"
unset DISTRO

[ -r $HOME/.dir_colors ] && eval $(dircolors ~/.dir_colors)

# Bash won't get SIGWINCH if another process is in the foreground.
# Enable checkwinsize so that bash will check the terminal size when
# it regains control.  #65623
# http://cnswww.cns.cwru.edu/~chet/bash/FAQ (E11)
shopt -s checkwinsize
shopt -s expand_aliases
shopt -s histappend

# exports
export PATH=$PATH:$HOME/Applications

[ -f $HOME/.bash_aliases ] && source $HOME/.bash_aliases
[ -f $HOME/.bash_hooks ] && source $HOME/.bash_hooks
[ -f $HOME/.cargo/env ] && source $HOME/.cargo/env
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

set -o vi


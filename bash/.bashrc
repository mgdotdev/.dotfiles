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
LANG=en_US.UTF-8
LC_CTYPE=en_US.UTF-8

unset DISTRO

[ -r $HOME/.dir_colors ] && eval $(dircolors ~/.dir_colors)

# Bash won't get SIGWINCH if another process is in the foreground.
# Enable checkwinsize so that bash will check the terminal size when
# it regains control.  #65623
shopt -s checkwinsize
shopt -s expand_aliases
shopt -s histappend

### exports

# app images
export PATH=$PATH:$HOME/Applications

# pyenv
PYENV_ROOT="$HOME/.pyenv"

if [[ -d PYENV_ROOT ]]
then
    export PYENV_ROOT=$PYENV_ROOT
    command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
    eval "$(pyenv init -)"
fi

# Go
if [[ -d /usr/local/go ]]
then
    export PATH=$PATH:/usr/local/go/bin
    GOPATH=$HOME/.local/lib/go
    export GOPATH=$GOPATH
    export PATH=$PATH:$GOPATH/bin
fi

[ -f $HOME/.bash_functions ] && source $HOME/.bash_functions
[ -f $HOME/.bash_aliases ] && source $HOME/.bash_aliases
[ -f $HOME/.bash_hooks ] && source $HOME/.bash_hooks
[ -f $HOME/.cargo/env ] && source $HOME/.cargo/env
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

set -o vi

[ -f /usr/share/nvm/init-nvm.sh ] && source /usr/share/nvm/init-nvm.sh

[ -s "$HOME/.nvm/nvm.sh" ] && source "$HOME/.nvm/nvm.sh"
[ -s "$HOME/.nvm/bash_completion" ] && source "$HOME/.nvm/bash_completion"


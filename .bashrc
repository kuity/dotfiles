#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '
PATH="$HOME/.cargo/bin:$PATH"
PATH="$HOME/.scripts:$PATH"
export PATH
. ~/.bash_aliases

if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
	exec startx;
fi


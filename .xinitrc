[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources
xmodmap ~/.xmodmap
exec i3

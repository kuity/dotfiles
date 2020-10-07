#!/bin/zsh

cd $HOME/dotfiles
./get_cfgs.sh
git add .
git commit -m 'sync'
git push
echo "done"

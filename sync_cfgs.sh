#!/bin/zsh

cd $HOME/dotfiles
./get_configs.sh
git add .
git commit -m 'sync'
git push
echo "done"

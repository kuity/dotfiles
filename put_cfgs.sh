#!/bin/zsh

source custom_cfg.zsh

cd $HOME/dotfiles 
if [ $? -ne 0 ]; then
  exit
fi

echo "Putting dotfiles in dirs"

#neovim
mkdir -p $HOME/.config/nvim
cp -R .config/nvim $HOME/.config/

# tmux
cp .tmux.conf $HOME/

# zsh
cp .zshrc $HOME/
cp zsh_custom/*.zsh $ZSH_CUSTOM/

# X 
cp .Xresources $HOME/
cp .xinitrc $HOME/

# ranger
mkdir -p $HOME/.config/ranger
cp -R .config/ranger/ $HOME/.config/ranger/


echo "Done putting dotfiles in dirs"

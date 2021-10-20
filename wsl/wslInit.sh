#!/bin/bash

if [ `whoami` = "root" ];then
echo " don't use root privileges"
exit 1
fi

sudo apt-get update
sudo apt-get  install git vim curl zsh autojump -y

cd ~/

sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting


sed 's/robbyrussell/ys/g' ~/.zshrc
sed '/plugins/ c plugins = (git z autojump zsh-syntax-highlighting zsh-autosuggestions extract)' ~/.zshrc


sudo chsh -s /bin/zsh

#!/bin/bash

SUDO=''
if (($EUID != 0 )); then
    if [[ -t 1 ]]; then
        SUDO='sudo'
    fi
fi

echo installing python + curl/
$SUDO apt-get update
$SUDO apt-get install python-rpi.gpio python3-rpi.gpio curl

echo installing konsole
$SUDO apt-get install konsole

echo installing zsh
$SUDO apt-get install zsh

echo installing oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo installing fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

echo installing vscode
curl https://go.microsoft.com/fwlink/\?LinkID\=760868 -L -o ~/vscode.deb
$SUDO apt-get install ~/vscode.deb

echo cleaning up
rm ~/vscode.deb

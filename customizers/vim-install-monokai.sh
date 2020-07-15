#!/bin/bash

[[ $EUID != 0 ]] && { "Missing permissions. Run as root." ; exit 1 ; }

USER_HOME=$(eval echo ~${SUDO_USER})

printf "[*] Downloading color scheme" && { curl -o /usr/share/vim/vim81/colors/monokai.vim https://raw.githubusercontent.com/crusoexia/vim-monokai/master/colors/monokai.vim ; }

printf "\nWriting to .vimrc in users home dir: ${USER_HOME}\n"
cd ${USER_HOME} &&
printf "\n[*] Editing .vimrc" && { echo "colorscheme monokai" >> .vimrc ; }

printf "\nDone!"

#!/bin/bash

[[ $EUID != 0 ]] && { "Missing permissions. Run as root." ; exit 1 ; }

USER_HOME=$(eval echo ~${SUDO_USER})
COLOR_DIR=$(echo "$(ls -d /usr/share/vim/vim*/)" | awk '{print $1}')

echo "Color path: $COLOR_DIR"

printf "[*] Downloading color scheme" && { curl -o ${COLOR_DIR}colors/monokai.vim https://raw.githubusercontent.com/crusoexia/vim-monokai/master/colors/monokai.vim ; }

printf "\nWriting to .vimrc in users home dir: ${USER_HOME}\n"
cd ${USER_HOME} &&
printf "\n[*] Editing .vimrc" && { echo "colorscheme monokai" >> .vimrc ; }

printf "\nDone!"

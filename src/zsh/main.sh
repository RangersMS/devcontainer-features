#!/bin/bash

set -e 

source ./functions.sh

ZSH_CONFIG="${HOME}/.zshrc"

install_package zsh

chsh -s "$(which zsh)"

if [ -e "${HOME}/.oh-my-zsh/tools/upgrade.sh" ]; then
    echo "omz already installed"
    exec /bin/bash "${HOME}/.oh-my-zsh/tools/upgrade.sh"
else
    echo "omz needs to be installed "
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

if [ -n "$ZSH_PLUGINS" ]; then
    update_config "^plugins=\\(.*\\)$" "plugins=($ZSH_PLUGINS)" "$ZSH_CONFIG"
else
    echo "No Plugin Config"
fi

if [ -n "$ZSH_THEME" ]; then
    update_config "^ZSH_THEME=.*$" "ZSH_THEME=\"$ZSH_THEME\"" "$ZSH_CONFIG"
else
    echo "No Theme Config"
fi

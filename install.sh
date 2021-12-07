#!/bin/bash

set -e

if [[ $(id -u) = 0 ]]; then
    echo "Run as user!"
    exit 1
fi

DOTDIR=$(dirname $(readlink -f $0))
cd $DOTDIR

# Install yay
sudo pacman -S git base-devel --needed --noconfirm
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si --needed --noconfirm
cd ../
rm -rf yay &&

# Install required packages
yay -Sy --noconfirm
yay -S xorg-server sddm multicolor-sddm-theme xorg-xset neovim i3-gaps polybar dunst libnotify nitrogen kitty zsh adobe-source-code-pro-fonts jq pulseaudio-control bat rofi rofi-emoji noto-fonts-emoji picom nodejs --needed --noconfirm
yay -R vim --noconfirm

# Local config
rm -rf ~/.config/dunst ~/.config/fontconfig ~/.config/i3 ~/.config/kitty ~/.config/nvim ~/.config/picom ~/.config/polybar ~/.config/rofi ~/.config/xaskpass ~/.oh-my-zsh

# Install oh-my-zsh
CHSH=yes RUNZSH=no sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Install plug.vim
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'


# Link all config files
mkdir -p ~/.config/dunst \
    ~/.config/fontconfig/conf.d \
    ~/.config/i3 \
    ~/.config/kitty \
    ~/.config/nvim \
    ~/.config/picom \
    ~/.config/polybar \
    ~/.config/rofi/themes \
    ~/.config/xaskpass \
    ~/.local/bin \
    ~/.local/share/fonts/otf \
    ~/.scripts \
    ~/.wallpapers

ln -sf $DOTDIR/.config/chromium-flags.conf ~/.config/chromium-flags.conf
ln -sf $DOTDIR/.config/dunst/dunstrc ~/.config/dunst/dunstrc
ln -sf $DOTDIR/.config/fontconfig/conf.d/57-add-emoji-support.conf ~/.config/fontconfig/conf.d/57-add-emoji-support.conf
ln -sf $DOTDIR/.config/i3/* ~/.config/i3/
ln -sf $DOTDIR/.config/kitty/* ~/.config/kitty/
ln -sf $DOTDIR/.config/picom/* ~/.config/picom/
ln -sf $DOTDIR/.config/polybar/* ~/.config/polybar/
ln -sf $DOTDIR/.config/xaskpass/* ~/.config/xaskpass/
ln -sf $DOTDIR/.config/nvim/* ~/.config/nvim/
ln -sf $DOTDIR/.config/rofi/config.rasi ~/.config/rofi
ln -sf $DOTDIR/.config/rofi/themes/minimal.rasi ~/.config/rofi/themes/

ln -sf $DOTDIR/.local/bin/* ~/.local/bin/
ln -sf $DOTDIR/.local/share/fonts/otf/* ~/.local/share/fonts/otf/

ln -sf $DOTDIR/.scripts/* ~/.scripts/
ln -sf $DOTDIR/.wallpapers/* ~/.wallpapers

ln -sf $DOTDIR/.Xresources ~/
ln -sf $DOTDIR/.zshrc ~/
ln -sf $DOTDIR/.profile ~/

# Global config
sudo systemctl enable sddm
echo -e "[Theme]\nCurrent=multicolor-sddm-theme" | sudo tee -a /etc/sddm.conf
sudo ln -s /usr/bin/nvim /usr/bin/vim
sudo ln -s /usr/bin/nvim /usr/bin/vi

# Finalize installation
clear
echo "Installation is finished!"
echo "You will have to run !PlugInstall in vim to install all plugins"
read -p "Press enter to start i3..."

sudo systemctl start sddm # the last line to be executed

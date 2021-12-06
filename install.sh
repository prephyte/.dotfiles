#!/bin/bash

if [[ $(id -u) = 0 ]]; then
    echo "Run as user!"
    exit 1
fi

pacman -Syyu
pacman -S i3-gaps polybar dunst libnotify nitrogen kitty zsh adobe-source-code-pro-fonts jq pulseaudio-control bat rofi rofi-emoji noto-fonts-emoji

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

mkdir -p backup/.config

mv ~/.config/dunst ~/.config/fontconfig ~/.config/i3 ~/.config/kitty ~/.config/nvim ~/.config/picom ~/.config/polybar ~/.config/rofi ~/.config/xaskpass backup/.config

mkdir -p ~/.config/dunst \
    ~/.config/fontconfig/conf.d \
    ~/.config/i3 \
    ~/.config/kitty \
    ~/.config/nvim/colors \
    ~/.config/picom \
    ~/.config/polybar \
    ~/.config/rofi/themes \
    ~/.config/xaskpass \
    ~/.local/bin \
    ~/.local/share/fonts/otf \
    ~/.scripts \
    ~/.wallpapers

ln -sf ./.config/chromium-flags.conf ~/.config/chromium-flags.conf
ln -sf ./.config/dunst/dunstrc ~/.config/dunst/dunstrc
ln -sf ./.config/fontconfig/conf.d/57-add-emoji-support.conf ~/.config/fontconfig/conf.d/57-add-emoji-support.conf
ln -sf ./.config/i3/* ~/.config/i3/
ln -sf ./.config/kitty/* ~/.config/kitty/
ln -sf ./.config/nvim/* ~/.config/nvim/
ln -sf ./.config/picom/* ~/.config/picom/
ln -sf ./.config/polybar/* ~/.config/polybar/
ln -sf ./.config/xaskpass/* ~/.config/xaskpass/
ln -sf ./.config/rofi/config.rasi ~/.config/rofi
ln -sf ./.config/rofi/themes/minimal.rasi ~/.config/rofi/themes/

ln -sf ./.local/bin/* ~/.local/bin/
ln -sf ./.local/share/fonts/otf/* ~/.local/share/fonts/otf/

ln -sf ./.scripts/* ~/.scripts/

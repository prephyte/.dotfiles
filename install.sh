#!/bin/bash

if [[ $(id -u) = 0 ]]; then
    echo "Run as user!"
    exit 1
fi

DOTDIR=dirname $(readlink -f $0)

yay -Sy
yay -S xorg-server lightdm lightdm-gtk-greeter neovim i3-gaps polybar dunst libnotify nitrogen kitty zsh adobe-source-code-pro-fonts jq pulseaudio-control bat rofi rofi-emoji noto-fonts-emoji

mkdir -p backup/.config

mv ~/.config/dunst ~/.config/fontconfig ~/.config/i3 ~/.config/kitty ~/.config/nvim ~/.config/picom ~/.config/polybar ~/.config/rofi ~/.config/xaskpass backup/.config
mv ~/.oh-my-zsh backup/

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

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

ln -sf $DOTDIR/.config/chromium-flags.conf ~/.config/chromium-flags.conf
ln -sf $DOTDIR/.config/dunst/dunstrc ~/.config/dunst/dunstrc
ln -sf $DOTDIR/.config/fontconfig/conf.d/57-add-emoji-support.conf ~/.config/fontconfig/conf.d/57-add-emoji-support.conf
ln -sf $DOTDIR/.config/i3/* ~/.config/i3/
ln -sf $DOTDIR/.config/kitty/* ~/.config/kitty/
ln -sf $DOTDIR/.config/picom/* ~/.config/picom/
ln -sf $DOTDIR/.config/polybar/* ~/.config/polybar/
ln -sf $DOTDIR/.config/xaskpass/* ~/.config/xaskpass/
ln -sf $DOTDIR/.config/nvim/init.vim ~/.config/nvim/
ln -sf $DOTDIR/.config/nvim/colors/* ~/.config/nvim/colors/
ln -sf $DOTDIR/.config/rofi/config.rasi ~/.config/rofi
ln -sf $DOTDIR/.config/rofi/themes/minimal.rasi ~/.config/rofi/themes/

ln -sf $DOTDIR/.local/bin/* ~/.local/bin/
ln -sf $DOTDIR/.local/share/fonts/otf/* ~/.local/share/fonts/otf/

ln -sf $DOTDIR/.scripts/* ~/.scripts/

# dotfiles

## Vim
Can't currently autoinstall everything needed for my vimrc.
You need to install [vim-youcompleteme-git](https://aur.archlinux.org/packages/vim-youcompleteme-git/)
and finish up the install of [ternjs/tern_for_vim](https://github.com/ternjs/tern_for_vim)
```
pacaur -S vim-youcompleteme-git
cd .vim/plugged/tern_for_vim  && npm install
```

On ubuntu, you might need to install vim-plug youself
```
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

Then after running vim: `:PlugInstall`

## forge
download from http://www.slightlymagic.net/wiki/Forge
```
cd bin
mkdir -p scratch/forge
cd scratch/forge
tar xjvf ~/Downloads/forge-gui-desktop-1.5.51.tar.bz2
mv ~/forge-icon.png ~/scratch/forge/
```

create .local/share/applications/forge.desktop
```
[Desktop Entry]
Name=Forge
Exec=/home/jp/scratch/forge/forge.sh
Icon=/home/jp/scratch/forge/forge-icon.png
Type=Application
Categories=Games;
```

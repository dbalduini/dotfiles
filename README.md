# dotfiles

## Upgrade VIM MacOs

```shell
brew update
brew install vim
echo 'PATH=/usr/local/Cellar/vim/7.4.1724/bin:$PATH' >> ~/.bash_profile
```

```
vim --version | head -n 2
VIM - Vi IMproved 7.4 (2013 Aug 10, compiled Apr 15 2016 16:13:30)
MacOS X (unix) version
```

### MacVim (Opcional)

```
brew install macvim
brew link macvim

defaults write org.vim.MacVim MMZoomBoth 1
```

## Install Vundle

```
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```

## Config git

```
git config --global core.excludesfile ~/.gitignore_global
```

## dotfiles.sh

### Installing

To install these dotfiles in your machine, run

```
./dotfiles.sh -i
```

### Updating

To keep these dotfiles up-to-date, run

```
./dotfiles.sh
```

Don't forget to commit and push to git after updating.

## Fonts

Fire Code https://github.com/tonsky/FiraCode

## Themes

Dracula Theme for Iterm https://draculatheme.com/iterm/

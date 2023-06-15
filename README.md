# dotfiles
Configuration for the system

## terminal font

JetBrainsMono Nerd Font

## usage

```shell
git clone git@github.com:daniel1302/dotfiles.git $HOME/.cfg


alias gitdotfiles='/usr/bin/git --git-dir=$HOME/.cfg/.git --work-tree=$HOME'
gitdotfiles config --local status.showUntrackedFiles no
gitdotfiles checkout
```


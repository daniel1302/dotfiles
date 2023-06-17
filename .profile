# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi
. "$HOME/.cargo/env"

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"

# credentials
touch ~/.credentials
source ~/.credentials

# ask for gpg passphrase
GPG_TTY=$(tty)
export GPG_TTY
export PATH="$HOME/.tfenv/bin:$PATH"
export PATH="$HOME/.tfenv/bin:$PATH"

# export for external ssh terminal
export TERM=xterm-256color

source "$HOME/.cargo/env"

# dotfiles command
alias gitdotfiles='/usr/bin/git --git-dir=$HOME/.cfg/.git --work-tree=$HOME'

export PATH=$HOME/go/bin:$PATH

if [ -d /usr/local/share/google-cloud-sdk/bin ]; then
    export PATH=/usr/local/share/google-cloud-sdk/bin:$PATH
fi;

if [ -d $HOME/.local/bin ]; then
    export PATH=$HOME/.local/bin:$PATH
fi;
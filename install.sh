#! /bin/sh
# Derived from the oh-my-zsh install.sh script

set -e
if [ -d ~/.oh-my-zsh ]; then
    echo "Found ~/.oh-my-zsh. Updating Git repository."
    pushd ~/.oh-my-zsh
    /usr/bin/env git pull
    popd
else
    /usr/bin/env git clone git://github.com/jacintos/oh-my-zsh.git ~/.oh-my-zsh
fi
if [ -r ~/.zshrc ]; then
    echo "Found ~/.zshrc. Backing up to ~/.zshrc.bak"
    mv ~/.zshrc ~/.zshrc.bak
fi
tmpdir=$(mktemp -d -t tmp)
/usr/bin/env git clone git://github.com/jacintos/zsh-config.git $tmpdir
mv $tmpdir/dot.zshrc ~/.zshrc
rm -rf $tmpdir
source ~/.zshrc

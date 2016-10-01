#!/bin/zsh

set -e

pushd ~/dotfiles
rm .*

pushd ~
ls -lad .* | awk '{ print $9 }' | while read dotfile; do
    ln -s $dotfile ~/dotfiles/$dotfile
done

popd
popd


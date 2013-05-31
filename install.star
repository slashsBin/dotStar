#!/usr/bin/env bash

echo
echo "Installing dotStar Files"
echo

echo "Updating Repo to the HEAD"
#git pull origin master --verbose
echo

dotStarBaseDir=$PWD
echo "dotStar Files are Located @${dotStarBaseDir}"
cd ~
if [[ -e ~/dotStar ]]; then
    echo "SymLink to dotStar files Found @Home"
    ls -la ~/dotStar
else
    echo "Making SymLink to them @Home"
    echo "~/dotStar -> $dotStarBaseDir"
    ln -s $dotStarBaseDir dotStar
fi
echo

echo "Copy dotStar files to Home"
read -p "This MAY OverWrite your existing dotFiles @Home, Copy anyway ? (y/n)" -n 1
echo
if [[ $REPLY =~ ^[yY]$ ]]; then
    cd ${dotStarBaseDir}
    rsync --exclude ".git/" --exclude "README.md" --exclude "install.star" --verbose --no-perms . ~
else
    echo "CP Aborted by User"
fi
echo

echo "Trigger BashRC"
source ~/.bashrc
echo "Done"




exit 0


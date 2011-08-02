#!/bin/bash

echo ----------------------------------------
echo UPDATING BREW INSTALLS
echo ----------------------------------------
brew update
OUTDATEDS=(`brew outdated`)
for outdated in "${OUTDATEDS[@]}"
do
	echo installing $outdated
	brew install $outdated
	echo cleaning $outdated
	brew cleanup $outdated
done

echo ----------------------------------------
echo UPDATING RVM
echo ----------------------------------------
rvm use system
rvm reload
gem update rvm
bash < <(curl -s -B https://rvm.beginrescueend.com/install/rvm)
rvm use 1.9.2
rvm reload

echo ----------------------------------------
echo UPDATING GEMS
echo ----------------------------------------
gem update

echo ----------------------------------------
echo UPDATING NPM
echo ----------------------------------------
npm update

echo ----------------------------------------
echo UPDATING JANUS
echo ----------------------------------------
cd ~/.vim
git pull
rake
cd ~

echo ----------------------------------------
echo UPDATING TEXTMATE BUNDLES
echo ----------------------------------------

cd ~/Library/Application\ Support/TextMate/Bundles

for file in *; do
echo updating "$file"
	cd "$file"
	git pull
	cd ..
done

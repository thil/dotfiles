#!/bin/bash -e

function brewInstall {
	if command -v brew; then
		echo "Installed brew skipping"
	else
		echo "======================================================"
		echo "Installing Homebrew, the OSX package manager...If it's"
		echo "already installed, this will do nothing."
		echo "======================================================"
		echo ""
		ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	fi
}

function brewRun {
	brew bundle
}

function plugInstall {
  echo "======================================================"
  echo "Installing and updating plugs."
  echo "The installer will now proceed to run PlugInstall."
  echo "======================================================"

  echo ""

  curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
}

function plugRun {
  vim --noplugin -u .vim/bundle.vim -N \"+set hidden\" \"+syntax on\" +PlugClean +PlugInstall +qall
}

brewInstall
brewRun

plugInstall
PlugRun

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
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/thil/.zprofile
    eval "$(/opt/homebrew/bin/brew shellenv)"
	fi
}

function brewRun {
	brew bundle
	set -U fish_user_paths /opt/homebrew/bin/ $fish_user_path
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

function installFisher {
  fish
  curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher
}

function installFisherPlugins {
  fish
  fisher install pure-fish/pure
  fisher install jethrokuan/z
  fisher install PatrickF1/fzf.fish
  echo -e "\nsource "(brew --prefix asdf)"/asdf.fish" >> ~/.config/fish/config.fish
}

function setUpAliases {
  fish
  alias vi 'nvim'
  alias vim 'nvim'
  alias ls 'exa'

  funcsave vi
  funcsave vim
  funcsave exa
}

brewInstall
brewRun

plugInstall
PlugRun

installFisher
installFisherPlugins

setupAliases

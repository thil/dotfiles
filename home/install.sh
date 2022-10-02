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

function installPrezto {
  zsh
  git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
  
  setopt EXTENDED_GLOB
  for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
    ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
  done
  
  chsh -s /bin/zsh
}


function fasterScrollSublimeText {
  defaults write com.sublimetext.4 ApplePressAndHoldEnabled -bool false
}

brewInstall
brewRun

plugInstall
PlugRun

installPrezto

fasterScrollSbulimeText

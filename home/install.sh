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
    echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
    eval "$(/opt/homebrew/bin/brew shellenv)"
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

function installPrezto {
  zsh
  git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
  
  ln -sf ~/.zprezto/runcoms/zlogin ~/.zlogin
  ln -sf ~/.zprezto/runcoms/zlogout ~/.zlogout
  ln -sf ~/.zprezto/runcoms/zpreztorc ~/.zpreztorc
  ln -sf ~/.zprezto/runcoms/zprofile ~/.zprofile
  ln -sf ~/.zprezto/runcoms/zshenv ~/.zshenv
  ln -sf ~/.zprezto/runcoms/zshrc ~/.zshrc

  chsh -s /bin/zsh
}

function setupVim {
  curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  vim --noplugin -u .vim/bundle.vim -N \"+set hidden\" \"+syntax on\" +PlugClean +PlugInstall +qall
  
  ln -sf ~/.vim ~/.vim
  ln -sf ~/.vimrc ~/.vimrc

}

function setupForDev {
  ln -sf .irbrc ~/.irbrc
  ln -sf .gemrc ~/.gemrc
  ln -sf .pryrc ~/.pryrc
  ln -sf .tigrc ~/.tigrc
  ln -sf .rspec ~/.rspec
  ln -sf .gitmessage ~/.gitmessage
  ln -sf .gitignore ~/.gitignore
  ln -sf .gitconfig ~/.gitconfig
}

function fasterScrollSublimeText {
  defaults write com.sublimetext.4 ApplePressAndHoldEnabled -bool false
}

brewInstall
brewRun

plugInstall

installPrezto

setupVim
plugRun
setupForDev

fasterScrollSublimeText

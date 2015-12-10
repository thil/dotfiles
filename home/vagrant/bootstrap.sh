#!/usr/bin/env bash

#Docker
sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
echo "deb https://apt.dockerproject.org/repo ubuntu-trusty main" > /etc/apt/sources.list.d/docker.list

#Elixir
wget https://packages.erlang-solutions.com/erlang-solutions_1.0_all.deb && sudo dpkg -i erlang-solutions_1.0_all.deb

apt-get update
apt-get install -y git zsh linux-image-extra-$(uname -r) docker-engine elixir

#Ruby

wget -O chruby-0.3.9.tar.gz https://github.com/postmodern/chruby/archive/v0.3.9.tar.gz
tar -xzvf chruby-0.3.9.tar.gz
cd chruby-0.3.9/; sudo make install; cd ..; rm -rf chruby-0.3.9

wget -O ruby-install-0.5.0.tar.gz https://github.com/postmodern/ruby-install/archive/v0.5.0.tar.gz
tar -xzvf ruby-install-0.5.0.tar.gz
cd ruby-install-0.5.0/;sudo make install; cd ..; rm -rf ruby-install-0.5.0

git clone https://github.com/clvv/fasd.git ~/fasd
cd ~/fasd/; sudo make install; cd ..; rm -rf fasd

rm -f *.gz *.deb

sh -s /bin/zsh

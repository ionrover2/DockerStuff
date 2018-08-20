#!/bin/bash

cd /root
git clone https://github.com/jgaeddert/liquid-dsp
git clone https://github.com/miek/inspectrum.git
git clone https://github.com/tresacton/dspectrumgui.git

# install RVM and Ruby 2.2.8
curl -sSL https://rvm.io/mpapis.asc | gpg --import -
curl -L https://get.rvm.io | bash -s stable

source /etc/profile.d/rvm.sh
echo "source /etc/profile.d/rvm.sh" >> ~/.bashrc
rvm install 2.2.8

# Installing LiquidDSP
cd /root/liquid-dsp
./bootstrap.sh
./configure
make
make install

# Installing Inspectrum
cd /root/inspectrum
mkdir build
cd build
cmake ..
make
make install

# Installing DSpectrumGUI
cd /root/dspectrumgui
gem install bundler
gem install nokogiri -v '1.6.7.2' --source 'https://rubygems.org/'
# run.sh fails here. 
#bundle config build.nokogiri --use-system-libraries
#bundle
#rake db:setup && rake db:migrate && rake db:seed

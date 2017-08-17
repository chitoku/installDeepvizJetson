#!/bin/bash

##
## Make sure the home directory is /home/nvidia (as it has been changed since JetPack 3.0)
##
## cd ~
## pwd 
##

# Might as well ask for password up-front, right?
sudo -v

# Keep-alive: update existing sudo time stamp if set, otherwise do nothing.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Install dependencies
sudo apt-get -y install build-essential make cmake g++
sudo apt-get -y install \
    libboost-all-dev \
    libprotobuf-dev \
    libhdf5-dev \
    liblmdb-dev \
    libleveldb-dev \
    libsnappy-dev \
    libatlas-dev \
    libatlas-base-dev \
    libgflags-dev \
    libgoogle-glog-dev 
	
sudo apt-get -y install python-dev python-numpy python-py python-pytest libboost-python-dev python-pip python-protobuf
sudo pip install scipy scikit-image

# Install NVCaffe 0.16.3
cd ~
git clone https://github.com/NVIDIA/caffe.git
cd caffe
git checkout a863549
mkdir build
cd build
cmake -D NO_NVML:BOOL="ON" ..
make -j4
sudo make install 

# Install Deep Visuzalization Toolbox
cd ~
git clone https://github.com/yosinski/deep-visualization-toolbox
cd deep-visualization-toolbox
cd models/caffenet-yos/

# This part is a lengthy process, as it downloads the complete models
./fetch.sh
./fetch.sh all

cd ../..
cp models/caffenet-yos/settings_local.template-caffenet-yos.py settings_local.py
# vi settings_local.py
# --> caffevis_caffe_root      = '/home/nvidia/caffe'
sed -i -e 's|/path/to/caffe|/home/nvidia/caffe|g' settings_local.py
sudo cp /usr/local/lib/python2.7/dist-packages/matplotlib/mpl-data/matplotlibrc /usr/local/lib/python2.7/dist-packages/matplotlib/mpl-data/matplotlibrc.orig
# sudo vi /usr/local/lib/python2.7/dist-packages/matplotlib/mpl-data/matplotlibrc
# --> backend      : TkAgg
sudo sed -i -e 's|gtk3agg|TkAgg|g' /usr/local/lib/python2.7/dist-packages/matplotlib/mpl-data/matplotlibrc
# vi settings.py
# --> USB cam number to 1
sed -i -e "s|input_updater_capture_device', 0|input_updater_capture_device', 1|g" settings.py

# installDeepvizJetson
Install Deep Visualization Toolbox on the NVIDIA Jetson TX1/TX2 Development Kit.

Deep Visualization Toolbox: Great tool to visualize how AlexNet classify images implemented by Jason Yosinski

GitHub repository is here: https://github.com/yosinski/deep-visualization-toolbox
Quick tour YouTube video (4 min) : https://www.youtube.com/watch?v=AgkfIQ4IGaM

Scripts to install Deep Visualization Toolbox and dependencies on the NVIDIA Jetson TX1/TX2 Development Kit.
This script is for L4T 28.1 (released along with JetPack 3.1 on 2017-07-25.

For best results on the Jetson TX1/TX2 install:

<ul>
<li>L4T 28.1 (64-bit Ubuntu 16.04)</li>
<li>OpenCV4Tegra</li>
<li>CUDA 8.0</li>
<li>cuDNN v6.0</li>
</ul>

These can all be installed with JetPack 3.1.

## How to install

To install, run the installDeepvizJetson.sh script:

	$ cd /home/nvidia/
    $ {DIR}/installDeepvizJetson/install.sh

## Caution (For Jetson TX1)

Note, on Jetson TX1, you need SD card (>= 16GB) or SSD to accomodate model and visualization images (downloaded by the script).
After mounting SD card on Jetson TX1, move to the SD card directory, and then 

    $ cd /media
    $ sudo mkdir sdcard
    $ sudo vi /etc/fstab
    # UUID=~~~~     /media/sdcard   ext4   defaults   0   0
    $ sudo mount -a
    $ cd /media/sdcard
    $ {DIR}/installDeepvizJetson/install.sh

!#/bin/bash

echo "getting necessary packages"
sudo apt-get update && sudo apt-get upgrade
sudo apt-get install -y build-essential cmake pkg-config
sudo apt-get install -y Ylibjpeg-dev libtiff5-dev libjasper-dev libpng-dev
sudo apt-get install -y libavcodec-dev libavformat-dev libswscale-dev libv4l-dev
sudo apt-get install -y libxvidcore-dev libx264-dev
sudo apt-get install -y libfontconfig1-dev libcairo2-dev
sudo apt-get install -y libgdk-pixbuf2.0-dev libpango1.0-dev
sudo apt-get install -y libgtk2.0-dev libgtk-3-dev
sudo apt-get install -y libatlas-base-dev gfortran
sudo apt-get install -y libhdf5-dev libhdf5-serial-dev libhdf5-103
sudo apt-get install -y libjasper1
sudo apt-get install -y libatlas-base-dev
sudo apt-get install -y libqtgui4 libqtwebkit4 libqt4-test python3-pyqt5
sudo apt-get install -y python3-dev

echo "Installing OpenCV and NumPy on a virtual envirnonment"
wget https://bootstrap.pypa.io/get-pip.py
sudo python get-pip.py
sudo python3 get-pip.py
sudo rm -rf ~/.cache/pip
sudo python3 -m pip install virtualenv
sudo python3 -m pip install virtualenvwrapper

echo "# virtualenv and virtualenvwrapper
export WORKON_HOME=$HOME/.virtualenvs
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3
export LD_PRELOAD=/usr/lib/arm-linux-gnueabihf/libatomic.so.1.2.0
source /usr/local/bin/virtualenvwrapper.sh" >> ~/.bashrc

source ~/.bashrc
mkvirtualenv cv -p python3

pip install "picamera[array]"
pip install opencv-python
pip3 install opencv-python
pip install opencv-contrib-python
pip3 install opencv-contrib-python
deactivate
wget https://github.com/opencv/opencv/tree/master/data/haarcascades/haarcascade_frontalface_default.xml

directory="/home/pi/Pictures/"
config="/boot/config.txt"
configtemp="/boot/config.temp"

cat ${config} > ${configtemp}
sudo echo "# Enable Camera
start_x=1" >> ${configtemp}
cat ${configtemp} > ${config}

echo "Verify your install worked by the following commands:"
echo ""
echo "cd ~"
echo "workon cv"
echo "python3"
echo "import cv2"
echo "cv2.__version__"
echo ""
echo "You should see \"4.1.1\" or higher if it worked."
echo "If installation is successful, you'll need to restart to get the camera working."
echo "Upon reboot, run the following to verify the camera works: "
echo ""
echo "sudo raspistill -e png -n -o /home/pi/Pictures/activation_test.png"

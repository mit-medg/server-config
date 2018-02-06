#!/bin/bash

# install CUDA Toolkit v9.1
# instructions from https://developer.nvidia.com/cuda-downloads (linux -> x86_64 -> Ubuntu -> 16.04 -> deb (network))

CUDA_REPO_PKG="cuda-repo-ubuntu1604_9.0.176-1_amd64.deb"
wget http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1604/x86_64/${CUDA_REPO_PKG}
sudo dpkg -i ${CUDA_REPO_PKG}
sudo apt-key adv --fetch-keys http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1604/x86_64/7fa2af80.pub
sudo apt-get update
sudo apt-get -y install cuda
ln -s /usr/local/cuda-9.1 /usr/local/cuda

# install cuDNN v7.0.5
# https://developer.nvidia.com/compute/machine-learning/cudnn/secure/v7.0.5/prod/9.0_20171129/cudnn-9.0-linux-x64-v7
CUDNN_TAR_FILE="cudnn-9.0-linux-x64-v7.tgz"
wget http://developer.download.nvidia.com/compute/redist/cudnn/v7.0.5/${CUDNN_TAR_FILE}
tar -xzvf ${CUDNN_TAR_FILE}
sudo cp cuda/include/cudnn.h /usr/local/cuda/include
sudo cp cuda/lib64/libcudnn* /usr/local/cuda/lib64
sudo chmod a+r /usr/local/cuda/include/cudnn.h /usr/local/cuda/lib64/libcudnn*

# set environment variables
export CUDA_HOME=/usr/local/cuda
export LD_LIBRARY_PATH=${CUDA_HOME}/lib64:$LD_LIBRARY_PATH
export PATH=${CUDA_HOME}/bin:${PATH}

# Test installation
cuda-install-samples-9.1.sh .
cd NVIDIA_CUDA-9.1_Samples/1_Utilities/deviceQuery
make
./deviceQuery\

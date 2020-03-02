# base image
FROM nvidia/cuda:10.0-cudnn7-devel-ubuntu16.04
MAINTAINER hhp <hanxiaohui93@163.com>
# install basic dependencies
RUN apt-get update
RUN apt-get install -y wget zip bzip2 \
                   libgl1-mesa-glx
# install Anaconda3 python3.7
RUN wget https://repo.anaconda.com/archive/Anaconda3-5.3.1-Linux-x86_64.sh -O ~/anaconda3.sh
RUN bash ~/anaconda3.sh -b -p /usr/local/anaconda3 \
                   && rm ~/anaconda3.sh
ENV PATH /usr/local/anaconda3/bin:$PATH
# update repo
# RUN sh -c echo -e "y\n" | conda update conda
RUN pip install --upgrade pip PyHamcrest setuptools
RUN pip install -U --ignore-installed wrapt enum34 simplejson netaddr
# install opencv-python
RUN pip install -i https://pypi.tuna.tsinghua.edu.cn/simple/ opencv-python==4.1.2.30
# install tensorflow
#RUN pip install --upgrade tensorflow
RUN pip install -i https://pypi.tuna.tsinghua.edu.cn/simple/ tensorflow-gpu==1.14.0
# solve import warning
RUN pip install --upgrade h5py

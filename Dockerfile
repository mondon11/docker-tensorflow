# base image
FROM nvidia/cuda:10.0-cudnn7-devel-ubuntu18.04
MAINTAINER hjt <houjiateng@aliyun.com>
# install basic dependencies
RUN apt-get update
RUN apt-get install -y wget zip bzip2 \
                   libgl1-mesa-glx \
                   net-tools inetutils-ping vim git \
                   openssh-server openssh-client

# install Anaconda3 python3.7
RUN wget https://mirrors.aliyun.com/anaconda/archive/Anaconda3-5.3.1-Linux-x86_64.sh -O ~/anaconda3.sh
RUN bash ~/anaconda3.sh -b -p /usr/local/anaconda3 \
                   && rm ~/anaconda3.sh
ENV PATH /usr/local/anaconda3/bin:$PATH

# update repo
# RUN sh -c echo -e "y\n" | conda update conda
RUN pip install -i https://pypi.tuna.tsinghua.edu.cn/simple/ --trusted-host pypi.tuna.tsinghua.edu.cn --upgrade pip PyHamcrest setuptools
RUN pip install -U -i https://pypi.tuna.tsinghua.edu.cn/simple/ --trusted-host pypi.tuna.tsinghua.edu.cn --ignore-installed wrapt enum34 simplejson netaddr

# install tensorflow
RUN pip install -i https://pypi.tuna.tsinghua.edu.cn/simple/ --trusted-host pypi.tuna.tsinghua.edu.cn tensorflow-gpu==1.14.0

# solve import warning
#RUN pip install -i https://pypi.tuna.tsinghua.edu.cn/simple/ --trusted-host pypi.tuna.tsinghua.edu.cn --upgrade h5py

#install others
RUN pip install -i https://pypi.tuna.tsinghua.edu.cn/simple/ --trusted-host pypi.tuna.tsinghua.edu.cn pandas==0.23.4
RUN pip install -i https://pypi.tuna.tsinghua.edu.cn/simple/ --trusted-host pypi.tuna.tsinghua.edu.cn Keras==2.3.1
RUN pip install -i https://pypi.tuna.tsinghua.edu.cn/simple/ --trusted-host pypi.tuna.tsinghua.edu.cn keras_bert==0.83.0
RUN pip install -i https://pypi.tuna.tsinghua.edu.cn/simple/ --trusted-host pypi.tuna.tsinghua.edu.cn numpy==1.16.4
RUN pip install -i https://pypi.tuna.tsinghua.edu.cn/simple/ --trusted-host pypi.tuna.tsinghua.edu.cn scikit_learn==0.24.0
RUN pip install -i https://pypi.tuna.tsinghua.edu.cn/simple/ --trusted-host pypi.tuna.tsinghua.edu.cn pydub
RUN pip install -i https://pypi.tuna.tsinghua.edu.cn/simple/ --trusted-host pypi.tuna.tsinghua.edu.cn Levenshtein
RUN pip install -i https://pypi.tuna.tsinghua.edu.cn/simple/ --trusted-host pypi.tuna.tsinghua.edu.cn h5py==2.10
RUN pip install -i https://pypi.tuna.tsinghua.edu.cn/simple/ --trusted-host pypi.tuna.tsinghua.edu.cn openpyxl==3.0.3




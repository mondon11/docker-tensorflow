# base image
# FROM nvidia/cuda:10.0-cudnn7-devel-ubuntu18.04
FROM nvidia/cuda:11.4.1-cudnn8-devel-ubuntu18.04
MAINTAINER hjt <houjiateng@aliyun.com>
# install basic dependencies
RUN apt-get update && apt-get install --no-install-recommends -y wget zip unzip bzip2 \
                   libgl1-mesa-glx \
                   net-tools inetutils-ping vim git \
                   openssh-server openssh-client \
		   build-essential cmake \
 		&& apt-get clean && rm -rf /var/lib/apt/lists/*

# install Anaconda3 python3.7
RUN wget https://mirrors.aliyun.com/anaconda/archive/Anaconda3-5.3.1-Linux-x86_64.sh -O ~/anaconda3.sh
RUN bash ~/anaconda3.sh -b -p /usr/local/anaconda3 \
                   && rm ~/anaconda3.sh
ENV PATH /usr/local/anaconda3/bin:$PATH

# install python packages
COPY requirements.txt .
RUN pip install --no-cache-dir -i https://pypi.tuna.tsinghua.edu.cn/simple/ --trusted-host pypi.tuna.tsinghua.edu.cn --upgrade pip PyHamcrest setuptools \
	&& pip install --no-cache-dir -U -i https://pypi.tuna.tsinghua.edu.cn/simple/ --trusted-host pypi.tuna.tsinghua.edu.cn --ignore-installed wrapt enum34 simplejson netaddr \
	&& pip install --no-cache-dir torch==1.10.1+cu113 torchvision==0.11.2+cu113 torchaudio==0.10.1+cu113 -f https://download.pytorch.org/whl/cu113/torch_stable.html \
	&& pip install --no-cache-dir -r requirements.txt -i https://pypi.tuna.tsinghua.edu.cn/simple/ --trusted-host pypi.tuna.tsinghua.edu.cn
RUN rm requirements.txt

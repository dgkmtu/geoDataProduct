	
FROM ubuntu:latest
 
ENV DEBIAN_FRONTEND=noninteractive

# update
RUN apt-get -y update && apt-get install -y \
sudo \
wget \
vim \
libopencv-dev \
&& apt-get clean \
&& rm -rf /var/lib/apt/lists/*
 
#install anaconda3
WORKDIR /opt
# download anaconda package and install anaconda
# archive -> https://repo.continuum.io/archive/
RUN wget https://repo.continuum.io/archive/Anaconda3-2019.10-Linux-x86_64.sh && \
sh /opt/Anaconda3-2019.10-Linux-x86_64.sh -b -p /opt/anaconda3 && \
rm -f Anaconda3-2019.10-Linux-x86_64.sh
# set path
ENV PATH /opt/anaconda3/bin:$PATH
 
# update pip and conda
RUN conda install gdal

WORKDIR /usr/src/app
RUN pip install --upgrade pip
COPY requirements.txt ./
RUN pip install -r requirements.txt


WORKDIR /
RUN mkdir /work
 
# execute jupyterlab as a default command
CMD ["jupyter", "lab", "--ip=0.0.0.0", "--allow-root", "--LabApp.token=''"]
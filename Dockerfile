FROM ubuntu:16.04

RUN apt-get update && apt-get -y dist-upgrade
RUN apt-get install -y \
    build-essential \
    git \
    libargtable2-dev \
    ffmpeg \
    libsdl1.2-dev
RUN apt-get install -y \
    autoconf \
    libtool \
    libavutil-dev \
    libavformat-dev \
    libavcodec-dev
RUN add-apt-repository ppa:stebbins/handbrake-releases
RUN apt-get install handbrake-cli
RUN  mv Comskip/comcut /usr/local/bin/comcut
RUN chmod +x /usr/local/bin/comcut
 
RUN git clone https://github.com/erikkaashoek/Comskip.git
RUN cd Comskip && ./autogen.sh && ./configure && make && make install

FROM ubuntu 


RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive TZ=Etc/UTC apt-get -y install tzdata
RUN apt-get -y install qtbase5-dev qtbase5-dev-tools qt5-qmake qt5-qmake-bin qttools5-dev-tools cmake gcc g++ git

WORKDIR /usr/src/
RUN git clone https://gitlab.freedesktop.org/freetype/freetype.git
WORKDIR /usr/src/freetype
RUN apt-get -y install automake libtool autoconf
RUN sh autogen.sh
RUN ./configure
RUN make
RUN make install 

WORKDIR /usr/src/
RUN git clone https://gitlab.freedesktop.org/poppler/poppler.git
WORKDIR /usr/src/poppler
RUN mkdir build
WORKDIR /usr/src/poppler/build
RUN apt-get -y install pkg-config 
RUN apt-get -y install libfontconfig-dev libjpeg-dev libnss3-dev
RUN apt-get -y install libboost-dev libopenjp2-7-dev
RUN cmake ..
RUN make HAVE_GLUT=no prefix=/usr/local -j2 
RUN make install -j2 





RUN ls 
RUN cd ..
WORKDIR /usr/src/
RUN git clone https://github.com/Luciferovich/summatra_like.git
WORKDIR /usr/src/summatra_like/
VOLUME [ "/mnt/dir" ]
RUN ["chmod", "+x", "/usr/src/summatra_like/dock_build.sh"]
CMD [ "/usr/src/summatra_like/dock_build.sh" ]

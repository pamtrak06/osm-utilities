FROM ubuntu:14.04

RUN apt-get update
RUN apt-get -y install build-essential
RUN apt-get -y install zlib1g-dev
RUN apt-get -y install wget git unzip

ADD .bashrc /root/

# osmconvert
RUN wget -O - http://m.m.i24.cc/osmconvert.c | cc -x c - -lz -O3 -o osmconvert
RUN mv osmconvert /usr/local/bin

# osmfilter
RUN  wget -O - http://m.m.i24.cc/osmfilter.c |cc -x c - -O3 -o osmfilter
RUN mv osmfilter /usr/local/bin

# osmcctools
#RUN git clone https://gitlab.com/osm-c-tools/osmctools.git
#RUN cd osmctools; ./configure; make; make install

# osmosis
RUN wget http://bretth.dev.openstreetmap.org/osmosis-build/osmosis-latest.zip
RUN mkdir osmosis; mv osmosis-latest.zip osmosis; cd osmosis; unzip osmosis-latest.zip; chmod a+x bin/osmosis; ln -s ./bin/osmosis /usr/local/bin/osmosis

RUN echo "echo \"# AVAILABLE OSM UTILITIES\"" > osmhelp
RUN echo "echo \"# osmconvert, wiki:http://wiki.openstreetmap.org/wiki/Osmconvert\"" >> osmhelp
RUN echo "echo \"# osmfilter, wiki:http://wiki.openstreetmap.org/wiki/Osmfilter\"" >> osmhelp
RUN echo "echo \"# osmosis, wiki:http://wiki.openstreetmap.org/wiki/Osmosis\"" >> osmhelp
RUN chmod 755 osmhelp
RUN echo "alias osmhelp=\". osmhelp\"" >> /root/.bashrc


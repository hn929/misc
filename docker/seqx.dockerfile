# Docker container for SEQPower and SEQLinkage

# Pull base image
FROM gaow/debian-py2:latest

# :)
MAINTAINER Gao Wang, gaow@uchicago.edu

# Install tools
WORKDIR /data
ADD http://bioinformatics.org/spower/download/.private/cstatgen.tar.gz ./
ADD https://github.com/gaow/SEQPower/archive/master.zip spower-master.zip
ADD https://github.com/gaow/SEQLinkage/archive/master.zip seqlink-master.zip
RUN pip install brewer2mpl==1.4.1 prettyplotlib==0.1.7
RUN pip install statsmodels
RUN tar zxvf cstatgen.tar.gz && python setup.py install
RUN unzip spower-master.zip && cd SEQPower-master && \
    python setup.py install
RUN unzip seqlink-master.zip && cd SEQLinkage-master && \
    python setup.py install
RUN rm -rf /data/*

# Default command
CMD ["bash"]
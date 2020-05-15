FROM oraclelinux:7.8

RUN yum install -y wget && \
    yum install -y gcc readline readline-devel && \
    yum install -y zlib zlib-devel && \
    yum install -y libffi-devel openssl-devel

RUN yum install -y tk tk-devel && \
    yum install -y sqlite sqlite-devel && \
    yum install -y bzip2 bzip2-devel && \
    yum install -y xz xz-devel && \
    yum install -y libuuid libuuid-devel && \
    yum install -y uuid

RUN yum install -y make && \
    yum clean all

WORKDIR /opt

RUN wget https://www.python.org/ftp/python/3.8.3/Python-3.8.3.tgz && \
    tar -xf Python-3.8.3.tgz

WORKDIR /opt/Python-3.8.3

RUN ./configure --enable-optimizations && \
    make install

RUN python3 -m pip install pyinstaller


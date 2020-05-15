FROM oraclelinux:7.8

RUN yum install wget && \
    yum install gcc readline readline-devel && \
    yum install zlib zlib-devel && \
    yum install libffi-devel openssl-devel

RUN yum install tk tk-devel && \
    yum install sqlite sqlite-devel && \
    yum install bzip2 bzip2-devel && \
    yum install xz xz-devel && \
    yum install libuuid libuuid-devel && \
    yum install uuid

WORKDIR /opt

RUN wget https://www.python.org/ftp/python/3.8.3/Python-3.8.3.tgz && \
    tar -xf Python-3.8.3.tgz

WORKDIR /opt/Python-3.8.3

RUN ./configure --enable-optimizations && \
    make install && \
    yum clean all

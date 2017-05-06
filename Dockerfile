# Docker image for security CTF/pwn tools
# https://github.com/bananactf

FROM ubuntu
MAINTAINER Alex James <theracermaster@gmail.com>

ENV TERM linux

USER root
WORKDIR /root

# Install general tools/dependencies
RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y --no-install-recommends apt-utils dialog
RUN apt-get install -y binutils build-essential curl gdb git git-extras  \
    lib32stdc++6 libc6-dev-i386 libcapstone3 libcapstone-dev libffi-dev  \
    libssl-dev nmap python-dev python-lzma python-pip                    \
    software-properties-common ssh sudo unzip wget z3

# Upgrade pip and setuptools
RUN pip install --upgrade pip setuptools

# Install Binwalk
## Requires X11, so be prepared to wait...
RUN apt-get install -y binwalk

# Install Manticore
RUN git clone https://github.com/trailofbits/manticore
WORKDIR /root/manticore
RUN pip install --no-binary capstone .
WORKDIR /root

# Install NoSQLMap
RUN git clone https://github.com/tcstool/NoSQLMap
WORKDIR /root/NoSQLMap
RUN python setup.py install
WORKDIR /root

# Install pwndbg
RUN git clone https://github.com/pwndbg/pwndbg
WORKDIR /root/pwndbg
RUN ./setup.sh
WORKDIR /root

# Install pwntools
RUN pip install pwntools

# Install SageMath
## Also requires X11
RUN add-apt-repository -y ppa:aims/sagemath
RUN apt-get update
RUN apt-get install -y sagemath-upstream-binary

# Install sqlmap
RUN pip install sqlmap

# Install SymPy
RUN pip install sympy

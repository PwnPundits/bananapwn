# bananapwn
Docker image for security CTF/pwn tools

### Tools
The following tools are included with the Docker image:
 - [angr](http://angr.io)
 - [binwalk](https://github.com/devttys0/binwalk)
 - [Manticore](https://github.com/trailofbits/manticore)
 - [NoSQLMap](https://github.com/tcstool/NoSQLMap)
 - [pwndbg](https://github.com/pwndbg/pwndbg)
 - [pwntools](https://github.com/Gallopsled/pwntools)
 - [SageMath](http://www.sagemath.org)
 - [sqlmap](http://sqlmap.org)

### Usage
```
$ docker build -t bananapwn https://github.com/bananactf/bananapwn.git
$ docker run -it bananapwn bash
```

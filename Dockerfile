FROM alpine:latest

MAINTAINER DeedWark "github.com/DeedWark"

RUN apk update &&\
    apk add python2

WORKDIR /root/kitterman

RUN cd /root/kitterman &&\
    wget https://github.com/DeedWark/Kitterman-Docker/raw/master/spf-validate.tar.gz &&\
    wget https://bootstrap.pypa.io/get-pip.py &&\
    tar xvf spf-validate.tar.gz &&\
    rm spf-validate.tar.gz &&\
    python get-pip.py && rm get-pip.py &&\
    pip install dnspython pydns

ENTRYPOINT ["python","spf.py"]

FROM alpine:latest

MAINTAINER DeedWark "github.com/DeedWark"

RUN apk update &&\
    apk add python2

WORKDIR /root/kitterman

COPY spf-python.tar.gz /root/kitterman

RUN cd /root/kitterman &&\
    tar xvf spf-python.tar.gz &&\
    rm spf-python.tar.gz &&\
    python get-pip.py && rm get-pip.py &&\
    pip install dnspython pydns

ENTRYPOINT ["python","spf.py"]

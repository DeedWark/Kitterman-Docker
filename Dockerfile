FROM alpine:3.11

MAINTAINER DeedWark "github.com/DeedWark"

RUN apk update &&\
    apk add python2 &>/dev/null

WORKDIR /root/kitterman

COPY spf-python.tar.gz /root/kitterman

RUN cd /root/kitterman &&\
    tar xvf spf-python.tar.gz &&\
    rm spf-python.tar.gz &&\
    python get-pip.py 2>/dev/null && rm get-pip.py &&\
    pip install dnspython pydns 2>/dev/null

ENTRYPOINT ["python","spf.py"]

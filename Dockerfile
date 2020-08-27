FROM photon:latest

MAINTAINER me

RUN tdnf update -y &&\
    tdnf install -y vim python2 python3 wget &&\
    tdnf install -y python-pip python3-pip &&\
    pip install dnspython && pip install pydns

WORKDIR /root/kitterman

RUN cd /root/kitterman &&\
    wget http://www.kitterman.com/spf-validate.tar.gz &&\
    tar xvf spf-validate.tar.gz && rm spf-validate.tar.gz

ENTRYPOINT ["python"]

#Alpine instead of python img coz of pip install & gcc
FROM alpine:3.11 

LABEL maintainer="DeedWark - github.com/DeedWark"

WORKDIR /opt/kitterman

COPY requirements.txt spf-python.tar.gz /opt/kitterman/

RUN apk add --no-cache python2 &>/dev/null &&\
    cd /opt/kitterman &&\
    tar xvf spf-python.tar.gz &&\
    rm spf-python.tar.gz &&\
    python get-pip.py 2>/dev/null && rm get-pip.py &&\
    pip install -r requirements.txt 2>/dev/null &&\
    adduser -D spfuser && chown -R spfuser:spfuser /opt/kitterman

USER spfuser

ENTRYPOINT ["python","spf.py"]

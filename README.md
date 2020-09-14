# SPFtools-Docker

SPF python tools in a Docker image -> [DockerHub](https://hub.docker.com/repository/docker/deedwark/spftools)
## Installation

You need docker installed on your machine -> [install](https://docs.docker.com/get-docker/)

```bash
git clone https://github.com/DeedWark/SPFtools-Docker && cd SPFtools-Docker
docker build -t spftools .
```

## Usage

```bash
#docker run --rm spftools IP sender_address helo
docker run --rm spftools 10.11.12.13 mail@spftools.com smtp.spftools.com

#Custom SPF
docker run --rm spftools "v=spf1 include:spf.spftools.com -all" 10.11.12.13 mail@spftools.com smtp.spftools.com
```
Reply
```bash
('pass', 250, 'sender SPF authorized')
#or
('fail', 550, 'SPF fail - not authorized')
...etc
```
## Alias
Put that into your aliases file
```
alias spftools='docker run --rm spftools'
```

Then you can just do

- SPF
```bash
#spftools IP sender helo
spftools 10.11.12.13 mail@spftools.com smtp.spftools.com
```
- Custom SPF
```bash
#spftools "SPF" IP sender helo
spftools "v=spf1 include:spf.spftools.com -all" mail@spftools.com smtp.spftools.com
```

# index website
[Kitterman](https://www.kitterman.com/spf/validate.html)

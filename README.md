# Kitterman-Docker

This is Kitterman SPF python tools in a Docker image -> [DockerHub](https://hub.docker.com/repository/docker/deedwark/kitterman)
## Installation

You need docker installed on your machine -> [install](https://docs.docker.com/get-docker/)

```bash
git clone https://github.com/DeedWark/Kitterman-Docker && cd Kitterman-Docker
docker build -t kitterman .
```

## Usage

```bash
#docker run --rm kitterman IP sender_address helo
docker run --rm kitterman 10.11.12.13 mail@kitterman.com smtp.kitterman.com

#Custom SPF
docker run --rm kitterman "v=spf1 include:spf.kitterman.com -all" 10.11.12.13 mail@kitterman.com smtp.kitterman.com
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
alias kitterman='docker run --rm kitterman'
```

Then you can just do

- SPF
```bash
#kitterman IP sender helo
kitterman 10.11.12.13 mail@kitterman.com smtp.kitterman.com
```
- Custom SPF
```bash
#kitterman "SPF" IP sender helo
kitterman "v=spf1 include:spf.kitterman.com -all" mail@kitterman.com smtp.kitterman.com
```

# Official website
[Kitterman](https://www.kitterman.com/spf/validate.html)

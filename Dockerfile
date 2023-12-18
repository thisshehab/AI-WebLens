FROM golang:latest

LABEL maintainer="shehabalhayee82@gmail.com"

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y git python3 python3-pip python3.11-venv zip

RUN go install github.com/sensepost/gowitness@latest

WORKDIR /app

COPY . .

RUN python3 -m venv /venv

# Activate the virtual environment
ENV PATH="/venv/bin:$PATH"

RUN cd ./eyeballer; pip install --upgrade pip && pip install -r requirements.txt
RUN cd ..

USER root

RUN chmod +x ./command.sh

ENTRYPOINT ["./command.sh"]

FROM ubuntu:latest

RUN apt update && apt-get install -y
RUN apt install pip -y

COPY src /opt/app/src

COPY . /opt/app/
COPY requirements.txt /opt/app/scr/requirements.txt
WORKDIR /opt/app/src/
RUN pip install -r /opt/app/scr/requirements.txt
RUN python3 manage.py collectstatic 
RUN python3 manage.py migrate
EXPOSE 8080

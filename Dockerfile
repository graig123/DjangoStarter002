FROM ubuntu:latest

RUN apt update && apt-get install -y
RUN apt install pip -y

COPY src/app /opt/app/src/core
COPY src/manage.py /opt/app/src/manage.py
COPY . /opt/app/
COPY requirements.txt /opt/app/requirements.txt
WORKDIR /opt/app/src
RUN pip install -r /opt/app/requirements.txt
RUN python3 manage.py collectstatic 
RUN python3 manage.py migrate
EXPOSE 8080

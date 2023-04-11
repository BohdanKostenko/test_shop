FROM python:3.10
MAINTAINER Bohdan Kostenko

ENV PYTHONUNBUFFERED 1
COPY ./requirements.txt /requirements.txt

RUN apt-get update -y \
    && apt-get install gcc python3-dev musl-dev -y
RUN pip install --upgrade pip
RUN pip install -r /requirements.txt

RUN mkdir /app
WORKDIR /app
COPY ./app /app

#RUN adduser user
#RUN chown user:user -R /app/
#
#USER user
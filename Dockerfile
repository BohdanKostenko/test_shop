FROM python:3.8.3-alpine
MAINTAINER Bohdan Kostenko

ENV PYTHONUNBUFFERED 1
COPY ./requirements.txt /requirements.txt

RUN apk update \
    && apk add postgresql-dev gcc python3-dev musl-dev
RUN pip install --upgrade pip
RUN pip install -r /requirements.txt

COPY ./entrypoint.sh .

RUN mkdir /app
WORKDIR /app
COPY ./app /app

RUN adduser -D user

USER user
FROM python:3.6-alpine

RUN apk add --update --no-cache git build-base linux-headers python-dev openjdk8
RUN pip install esrally==0.4.8
COPY rally.ini /root/.rally/

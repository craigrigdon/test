FROM python:3-slim AS build-env
ADD . /app
WORKDIR /app

WORKDIR /app
CMD "pwd"

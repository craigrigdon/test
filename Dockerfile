FROM python:3-slim
ADD . /app
WORKDIR /app

RUN set -xe \
    && apt-get update \
    && apt-get install python-pip
RUN pip install --upgrade pip
RUN pip install bcdc-apitests-dev

ENTRYPOINT pytest --pyargs bcdc_apitests

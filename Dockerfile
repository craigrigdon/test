FROM python:3-slim
ADD . /app
WORKDIR /app

RUN pip install bcdc-apitests-dev

ENTRYPOINT pytest --pyargs bcdc_apitests

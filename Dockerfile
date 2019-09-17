FROM python:3.7-alpine

COPY . /app
WORKDIR /app
RUN pip install bcdc-apitests

ENTRYPOINT ["pytest" "--pyargs bcdc_apitests" "--junitxml=report.xml"]


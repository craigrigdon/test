FROM python:3.7-alpine

COPY . /app
WORKDIR /app
RUN pip install bcdc-apitests

CMD pytest --pyargs ckanext_bcdc_apitests --junitxml=<report.xml>

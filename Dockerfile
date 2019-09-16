FROM python:3.7-alpine

COPY . /app
WORKDIR /app
RUN pip install ckanext-bcdc-apitests

CMD pytest --pyargs ckanext_bcdc_apitests --junitxml=<report.xml>

FROM python:2.7-alpine

RUN apt-get update -y
RUN apt-get update -y python-pip
RUN pip install ckanext-bcdc-apitests

CMD pytest --pyargs ckanext_bcdc_apitests --junitxml=<report.xml>

FROM python:2.7-alpine

ENV LANG C.UTF-8

RUN apt-get update && apt-get install -y python-pip

RUN pip install ckanext-bcdc-apitests
RUN pytest --pyargs ckanext_bcdc_apitests --junitxml=<xml report name.xml>

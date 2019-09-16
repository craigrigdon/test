FROM python:3.7-alpine

COPY . /app
WORKDIR /app
RUN pip install bcdc-apitests

CMD pytest --pyargs bcdc-apitests --junitxml=<report.xml>

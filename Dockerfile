FROM python:3-slim AS build-env
ADD . /app
WORKDIR /app

FROM gcr.io/distroless/python3
COPY --from=build-env /app /app
WORKDIR /app
CMD pip install ckanext-bcdc-apitests
CMD pytest --pyargs ckanext_bcdc_apitests --junitxml=<xml report name.xml>

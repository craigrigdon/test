FROM python:3-slim AS build-env
ADD . /app
WORKDIR /app

FROM gcr.io/distroless/python3
COPY --from=build-env /app /app
WORKDIR /app

RUN set -xe \
    && apt-get update \
    && apt-get install python-pip
RUN pip install --upgrade pip
RUN pip install bcdc-apitests-dev

ENTRYPOINT pytest --pyargs bcdc_apitests

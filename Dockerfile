FROM python:3-slim AS build-env
ADD . /app
WORKDIR /app

FROM gcr.io/distroless/python3
COPY --from=build-env /app /app
WORKDIR /app

RUN pip install bcdc-apitests-dev

CMD pytest --pyargs bcdc_apitests

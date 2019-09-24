FROM python:3-slim
ADD . /app
WORKDIR /app

RUN pip install bcdc-apitests-dev
RUN pip install matterhook

COPY pytest-run.py .

ENTRYPOINT [ "python", "./pytest-run.py" ]

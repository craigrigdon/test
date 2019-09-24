FROM python:3-slim
ADD . /app
WORKDIR /app

RUN pip install bcdc-apitests-dev
RUN pip install matterhook
RUN pip install pytest-emoji

COPY pytest-run.py .

ENTRYPOINT [ "python", "./pytest-run.py" ]

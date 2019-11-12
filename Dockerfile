FROM python:3-slim
ADD . /app
WORKDIR /app

RUN pip install pypandoc
RUN pip install --upgrade --force-reinstall bcdc-apitests-dev
RUN pip install matterhook

COPY pytest-run.py .

ENTRYPOINT [ "python", "./pytest-run.py" ]

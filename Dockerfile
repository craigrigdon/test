FROM python:3-slim
ADD . /app
WORKDIR /app

RUN useradd -ms /bin/bash admin
RUN chown -R admin:admin /app
RUN chmod 755 /app

RUN pip install bcdc-apitests-dev
RUN pip install matterhook

COPY pytest-run.py .

USER admin
ENTRYPOINT [ "python", "./pytest-run.py" ]

FROM python:3-slim
ADD . /app
WORKDIR /app

RUN apt-get update
RUN apt-get -y install git
RUN pip install matterhook
RUN pip install requests
RUN git clone https://github.com/craigrigdon/test.git

RUN pwd
RUN ls -l

ENTRYPOINT [ "python", "./data-run.py" ]

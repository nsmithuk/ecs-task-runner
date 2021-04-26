FROM python:3-alpine

RUN apk add --update --no-cache --virtual .build-dependencies jq \
  && apk del .build-dependencies

RUN mkdir /app
WORKDIR /app

COPY runner.py /usr/local/bin/runner
RUN chmod a+x /usr/local/bin/runner

COPY requirements.txt /tmp/requirements.txt
RUN pip install -r /tmp/requirements.txt

CMD ["runner"]
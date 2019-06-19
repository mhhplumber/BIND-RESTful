FROM python:alpine3.9
MAINTAINER Michael Humkey "michael.humkey1@t-mobile.com"

RUN apk update
RUN apk add --no-cache --virtual .build-deps gcc musl-dev
RUN apk add jq

COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt

RUN apk del .build-deps

COPY . ./

ENTRYPOINT ["python"]
CMD ["src/bind-api.py"]

EXPOSE 5000
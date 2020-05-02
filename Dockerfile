FROM python:3.8.0-alpine

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# install psycopg2 dependencies
RUN apk update \
    && apk add postgresql-dev gcc python3-dev musl-dev

# libssl-dev is a dependency for python cryptography package
# libffi-dev is a dependency for cffi package (that in turn is a dependency of cryptography package)

RUN apk --update add \
    build-base \
    jpeg-dev \
    zlib-dev \
    libressl-dev \
    libffi-dev

# install dependencies
RUN pip install --upgrade pip

RUN mkdir /app
WORKDIR /app

COPY requirements.txt /app/

RUN pip install -r requirements.txt

COPY . /app/
# start server
EXPOSE 8000
EXPOSE 5432

# run entrypoint.sh
ENTRYPOINT ["/app/entrypoint.sh"]
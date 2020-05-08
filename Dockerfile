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

RUN wget http://ftp.gnu.org/pub/gnu/libiconv/libiconv-1.16.tar.gz \
    && tar -xvzf libiconv-1.16.tar.gz \
    && cd libiconv-1.16 \
    && ./configure --prefix=/usr/local/lib \
    && make \
    && make install \
    && cd /usr/local/lib \
    && ln -s lib/libiconv.so libiconv.so \
    && ln -s libpython3.8.so.1.0 libpython.so \
    && ln -s lib/libiconv.so.2 libiconv.so.2

# install dependencies
RUN pip install --upgrade pip

# install uwsgi now because it takes a little while
RUN pip install uwsgi

# setup uwsgi logging directory
RUN mkdir -p /var/log/uwsgi

RUN mkdir /app
WORKDIR /app

COPY requirements.txt /app/

RUN pip install -r requirements.txt

COPY . /app/
# start server
EXPOSE 8000
EXPOSE 5432
EXPOSE 3031

# run entrypoint.sh
ENTRYPOINT ["/app/entrypoint.sh"]
CMD ["uwsgi", "--ini", "/app/uwsgi.ini"]
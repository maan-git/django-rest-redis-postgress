"""
WSGI config for django_redis_poc project.

It exposes the WSGI callable as a module-level variable named ``application``.

For more information on this file, see
https://docs.djangoproject.com/en/3.0/howto/deployment/wsgi/
"""

import os
import gevent.socket
import redis.connection

redis.connection.socket = gevent.socket
os.environ.update(DJANGO_SETTINGS_MODULE='django_redis_poc.settings')
from ws4redis.uwsgi_runserver import uWSGIWebsocketServer

application = uWSGIWebsocketServer()

FROM python:2.7

RUN groupadd user && useradd --create-home --home-dir /home/user -g user user
WORKDIR /home/user

ENV REDIS_VERSION 2.10.3
RUN pip install redis=="$REDIS_VERSION"

ENV CELERY_VERSION 3.1.18
RUN pip install celery=="$CELERY_VERSION"

RUN { \
	echo 'import os'; \
	echo "BROKER_URL = os.environ.get('CELERY_BROKER_URL', 'amqp://')"; \
} > celeryconfig.py

# --link some-rabbit:rabbit "just works"
ENV CELERY_BROKER_URL amqp://guest@rabbit

ENV DJANGO_VERSION 1.8.17
RUN pip install Django=="$DJANGO_VERSION"

ENV RAVEN_VERSION 6.2.1
RUN pip install raven=="$RAVEN_VERSION"

ENV DJANGO_REDIS_VERSION 4.3.0
RUN pip install django-redis=="$DJANGO_REDIS_VERSION"

ENV TENANT_VERSION 0.1.5
RUN pip install tenant-schemas-celery=="$TENANT_VERSION"

USER user
CMD ["celery", "worker"]

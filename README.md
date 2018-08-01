# python-celery-django

Docker image for sites which need to run:

* Python 2.7
* Celery 3.1.18
* Redis 2.10.3
* Django 1.8.17
* Raven 6.2.1

## Installation

    docker build -t "kmturley:python-celery-django" .

## Usage

Within your own Dockerfile:

    FROM: kmturley/python-celery-django

Within a CI pipeline:

    image: kmturley/python-celery-django

## Contact

For more information please contact kmturley

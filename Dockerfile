#FROM python:3.11.1-alpine
FROM python:3.9-alpine3.13
LABEL maintainer="someone@help.com"

ENV PYTHONUNBUFFERED 1

COPY ./requirements.txt /tmp/requirements.txt
COPY ./requirements.dev.txt /tmp/requirements.dev.txt
COPY ./app /app
WORKDIR /app
EXPOSE 8000

ARG DEV=false
# python -m venv /py -> new virtual environment. Probably not recommended.
#												Use when base image conflict with your application dependencies

RUN python -m venv /py && \ 
		/py/bin/pip install --upgrade pip && \
		/py/bin/pip install -r /tmp/requirements.txt && \
		if [ $DEV = "true" ]; \
			then /py/bin/pip install -r /tmp/requirements.dev.txt ; \
		fi && \
		rm -rf /tmp && \
		adduser \
			--disabled-password \
			--no-create-home \
			django-user


ENV PATH="/py/bin:$PATH"

USER django-user



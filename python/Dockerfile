FROM alpine:latest
ENV LANG C.UTF-8
ENV PYTHONUNBUFFERED 1
RUN apk add python3 python3-dev gcc musl-dev linux-headers git bash mariadb-dev gettext
WORKDIR /app
RUN pip3 install --upgrade pip setuptools
RUN pip3 install uwsgi
COPY InventoryManager /app
RUN pip3 install -r requirements.txt
# TODO:
# - admin account
# - secret key generation https://stackoverflow.com/questions/4664724/distributing-django-projects-with-unique-secret-keys
COPY uwsgi-app.ini .
COPY init_and_run.sh .
COPY wait-for-it.sh .
EXPOSE 3031
CMD ["bash", "/app/init_and_run.sh"]

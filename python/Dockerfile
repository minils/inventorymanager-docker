FROM alpine:latest
ENV LANG C.UTF-8
ENV PYTHONUNBUFFERED 1
RUN apk add python3 python3-dev gcc musl-dev linux-headers git bash mariadb-dev
WORKDIR /app
RUN pip3 install --upgrade pip setuptools
COPY InventoryManager /app
RUN pip3 install -r requirements.txt
RUN pip3 install uwsgi
#RUN python3 manage.py migrate
#RUN yes "yes" | python3 manage.py collectstatic
#RUN python3 manage.py loaddata inventory/fixtures/datasetup.json
# TODO:
# - admin account
# - secret key generation https://stackoverflow.com/questions/4664724/distributing-django-projects-with-unique-secret-keys
COPY uwsgi-app.ini .
COPY init_and_run.sh .
COPY wait-for-it.sh .
EXPOSE 3031
CMD ["bash", "/app/init_and_run.sh"]
#CMD ["/app/tools/wait-for-it.sh", "db:3306", "--", "uwsgi", "--ini", "uwsgi-app.ini"]

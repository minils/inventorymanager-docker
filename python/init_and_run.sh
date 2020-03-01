cd /app
./wait-for-it.sh -h db -p 3306 -t 0
python3 manage.py migrate || { echo 'migrate failed' ; exit 1; }
yes "yes" | python3 manage.py collectstatic
DATA=$(python3 manage.py dumpdata inventory)
if [[ "$DATA" == "[]" ]]; then
    python3 manage.py loaddata inventory/fixtures/datasetup.json
fi
python3 manage.py compilemessages
uwsgi --ini uwsgi-app.ini

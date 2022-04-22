#!/bin/bash

# käynnistetään Flask-palvelin taustalle
poetry run python3 viikko3/web-login-robot/src/index.py &

# odotetaan, että palvelin on valmiina ottamaan vastaan pyyntöjä
while [[ "$(curl -s -o /dev/null -w ''%{http_code}'' localhost:5000/ping)" != "200" ]]; 
  do sleep 1; 
done

# suoritetaan testit
poetry run robot viikko3/web-login-robot/src/tests

status=$?

# pysäytetään Flask-palvelin portissa 5000
kill $(lsof -t -i:5000)

exit $status

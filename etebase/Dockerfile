FROM python

ENV BASE_DIR "/etebase"
ENV ETEBASE_DB_PATH "/data/db.sqlite3"

ENV SERVER 0.0.0.0
ENV PORT 8000

WORKDIR $BASE_DIR
COPY source $BASE_DIR
ADD etebase-server.ini .

RUN pip install virtualenv
RUN virtualenv -p python3 venv
RUN . venv/bin/activate
RUN pip install -r requirements.txt

RUN set -ex ;\
    mkdir -p /data
    
RUN ./manage.py migrate

EXPOSE $PORT
VOLUME /data

CMD ["sh", "-c", "./manage.py migrate && ./manage.py runserver $SERVER:$PORT"]
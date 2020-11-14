FROM python

ENV BASE_DIR /etesync
ENV SERVER "0.0.0.0"
ENV PORT 37358
ENV ETESYNC_DATA_DIR "/data"
ENV ETESYNC_SERVER_HOSTS "$SERVER:$PORT,[::]:$PORT"

WORKDIR $BASE_DIR
COPY source $BASE_DIR

RUN pip install virtualenv
RUN virtualenv -p python3 venv
RUN . venv/bin/activate
RUN pip install -r requirements.txt
RUN pip install etesync-dav

RUN set -ex ;\
    mkdir -p /data

EXPOSE $PORT
VOLUME /data

CMD etesync-dav
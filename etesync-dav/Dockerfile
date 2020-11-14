FROM python

ENV BASE_DIR /etesync
ENV SERVER "0.0.0.0"
ENV PORT 37358
ENV ETESYNC_DATA_DIR "/data"
ENV ETESYNC_SERVER_HOSTS "$SERVER:$PORT,[::]:$PORT"

WORKDIR $BASE_DIR

ADD https://github.com/etesync/etesync-dav/releases/download/v0.30.4/linux-etesync-dav etesync-dav
RUN chmod +x etesync-dav

EXPOSE $PORT
VOLUME $ETESYNC_DATA_DIR

RUN set -ex ;\
    mkdir -p /data
    # useradd etesync ;\
    # chown -R etesync: /data;\
    # chmod 777 /data
# RUN chown etesync etesync-dav
# USER etesync

CMD ./etesync-dav
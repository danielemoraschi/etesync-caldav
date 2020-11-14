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

# RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs --output rust.sh
# RUN chmod +x rust.sh
# RUN ./rust.sh -y
# RUN . $HOME/.cargo/env
# #RUN pip install sentencepiece
# #RUN pip install transformers

RUN . venv/bin/activate
RUN pip install etesync-dav

RUN set -ex ;\
    mkdir -p /data

EXPOSE $PORT
VOLUME /data

CMD etesync-dav
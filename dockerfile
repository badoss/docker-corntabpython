FROM alpine:3.14

ENV PYTHONUNBUFFERED=1

WORKDIR /

RUN echo "**** install Python ****" && \
    apk add --no-cache python3 && \
    if [ ! -e /usr/bin/python ]; then ln -sf python3 /usr/bin/python ; fi && \
    \
    echo "**** install pip ****" && \
    python3 -m ensurepip && \
    rm -r /usr/lib/python*/ensurepip && \
    pip3 install --no-cache --upgrade pip setuptools wheel && \
    if [ ! -e /usr/bin/pip ]; then ln -s pip3 /usr/bin/pip ; fi

COPY requirement.txt ./requirement.txt
RUN pip install --no-cache-dir -r ./requirement.txt

RUN echo "install lib python success !!"

COPY root /var/spool/cron/crontabs/root
COPY test.py /test.py
CMD crond -l 2 -f

#CMD [ "python", "./test.py" ]



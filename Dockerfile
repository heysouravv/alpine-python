FROM arm64v8/alpine:3.19

# This hack is widely applied to avoid python printing issues in docker containers.

ENV PYTHONUNBUFFERED=1

RUN echo "**** install Python ****" && \

    apk add --no-cache python3 && \

    if [ ! -e /usr/bin/python ]; then ln -sf python3 /usr/bin/python ; fi && \

    \

    echo "**** install pip ****" && \

    rm /usr/lib/python3.11/EXTERNALLY-MANAGED && \

    python -m ensurepip && \

    rm -r /usr/lib/python*/ensurepip && \

    if [ ! -e /usr/bin/pip ]; then ln -s pip3 /usr/bin/pip ; fi && \

    pip install --no-cache --upgrade pip setuptools wheel

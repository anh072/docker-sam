FROM alpine:3.13

ENV SAM_VERSION=1.15.0

RUN apk -v --no-cache --update add \
  musl-dev \
  gcc \
  python3 \
  python3-dev \
  py-pip \
  bash \
  make \
  curl \
  zip \
  wget
RUN python3 -m ensurepip --upgrade \
        && pip3 install --upgrade pip
RUN pip3 install --no-cache-dir --upgrade aws-sam-cli==${SAM_VERSION}

VOLUME [ "/root/.aws" ]
VOLUME [ "/opt/app" ]
WORKDIR /opt/app

CMD ["sam", "--version"]
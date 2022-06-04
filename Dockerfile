FROM alpine AS builder

ENV HatH_VERSION 1.6.1
ENV HatH_SHA256 b8889b2c35593004be061064fcb6d690ff8cbda9564d89f706f7e3ceaf828726

RUN apk --no-cache add unzip \
    && mkdir -p /hath \
    && cd /hath \
    && wget https://repo.e-hentai.org/hath/HentaiAtHome_$HatH_VERSION.zip -O hath.zip \
    && echo -n ""$HatH_SHA256"  hath.zip" | sha256sum -c \
    && unzip hath.zip \
    && mkdir -p /hath/data \
    && mkdir -p /hath/download

FROM eclipse-temurin:8-jre AS release

ENV HatH_ARGS --cache-dir=/hath/data/cache --data-dir=/hath/data/data --download-dir=/hath/download --log-dir=/hath/data/log --temp-dir=/hath/data/temp

COPY --from=builder /hath /hath
COPY build/start.sh /hath/start.sh
WORKDIR /hath

RUN apt-get update \
    && apt-get install -y sqlite \
    && rm -rf /var/lib/apt/lists/*
    && chmod +x /hath/start.sh

CMD ["/hath/start.sh"]

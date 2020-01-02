FROM alpine AS builder

ENV HatH_VERSION 1.6.0
ENV HatH_SHA256 597f0ae2d114a86e021013b0146d59b1f2f8be2025bfae6b38c181515b795018

RUN apk --no-cache add unzip \
    && wget https://github.com/Disappear9/H-at-H-docker/archive/master.zip \
    && unzip master.zip \
    && mkdir -p /builder \
    && cp -R H-at-H-docker-master/build/* /builder \
    && mkdir -p /hath \
    && cd /hath \
    && wget https://repo.e-hentai.org/hath/HentaiAtHome_$HatH_VERSION.zip -O hath.zip \
    && echo -n ""$HatH_SHA256"  hath.zip" | sha256sum -c \
    && unzip hath.zip \
    && rm hath.zip \
    && mkdir -p /hath/data \
    && mkdir -p /hath/download

FROM arm64v8/openjdk:8-jre-alpine AS release

COPY --from=builder /builder/qemu/qemu-aarch64-static /usr/bin

ENV HatH_ARGS --cache-dir=/hath/data/cache --data-dir=/hath/data/data --download-dir=/hath/download --log-dir=/hath/data/log --temp-dir=/hath/data/temp

COPY --from=builder /hath /hath
COPY --from=builder /builder/start.sh /hath/start.sh
WORKDIR /hath

RUN apk --no-cache add sqlite \
    && chmod +x /hath/start.sh

CMD ["/hath/start.sh"]



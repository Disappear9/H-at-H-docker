FROM alpine AS builder

ENV HatH_VERSION 1.4.2
ENV HatH_SHA256 da25fdec0a9535b265677a230e5cf84c75f0cfe790cffc51a520cf7cf3b01b2f

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



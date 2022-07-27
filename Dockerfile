FROM alpine:3.3

LABEL org.opencontainers.image.source https://github.com/luizpaulorosaabrantes/s3-mounter

ENV MNT_POINT /var/s3

VOLUME /var/s3

ARG S3FS_VERSION=v1.86

RUN apk --update --no-cache add fuse alpine-sdk automake autoconf libxml2-dev fuse-dev curl-dev git bash; \
    git clone https://github.com/s3fs-fuse/s3fs-fuse.git; \
    cd s3fs-fuse; \
    git checkout tags/${S3FS_VERSION}; \
    ./autogen.sh; \
    ./configure --prefix=/usr; \
    make; \
    make install; \
    make clean; \
    rm -rf /var/cache/apk/*; \
    apk del git automake autoconf;

# RUN mkdir -p "$MNT_POINT"

RUN sed -i s/"#user_allow_other"/"user_allow_other"/g /etc/fuse.conf

COPY run.sh run.sh
CMD ./run.sh

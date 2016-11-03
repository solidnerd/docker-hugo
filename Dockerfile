FROM alpine:3.4

ARG HUGO_VERSION=0.17
ARG HUGO_DOWNLOAD_URL="https://github.com/spf13/hugo/releases/download/v$HUGO_VERSION/hugo_"$HUGO_VERSION"_Linux-64bit.tar.gz"
ARG HUGO_DOWNLOAD_FILE_NAME=hugo.tar.gz


ENV HUGO_USER=hugo \
    HUGO_UID=1000 \
    HUGO_GID=1000 \
    HUGO_HOME=/hugo

RUN addgroup -S $HUGO_USER -g ${HUGO_GID} \
      && adduser -S  \
        -g $HUGO_USER \
        -h $HUGO_HOME \
        -u ${HUGO_UID} \
        $HUGO_USER

RUN apk add --no-cache curl tar \
    &&  curl -L "$HUGO_DOWNLOAD_URL" -o "$HUGO_DOWNLOAD_FILE_NAME" \
	&&  tar xvz -C /tmp  -f "$HUGO_DOWNLOAD_FILE_NAME"  \
    &&  mv /tmp/hugo_${HUGO_VERSION}_linux_amd64/hugo_${HUGO_VERSION}_linux_amd64 /usr/local/bin/hugo \
	&&  apk del curl tar \
    &&  rm -rf /tmp/hugo_${HUGO_VERSION}_linux_amd64/ \
    &&  rm -fr /var/cache/apk/*

USER $HUGO_USER

WORKDIR $HUGO_HOME

EXPOSE 1313
VOLUME  ["$HUGO_HOME"]

ENTRYPOINT ["hugo"]

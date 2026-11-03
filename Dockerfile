FROM pandoc/minimal:3.11-alpine

ENV XDG_CACHE_HOME=/tmp/fontconfig-cache

RUN apk add --no-cache \
  weasyprint \
  fontconfig \
  font-dejavu

RUN mkdir -p $XDG_CACHE_HOME && chmod 777 $XDG_CACHE_HOME


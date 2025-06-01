FROM ubuntu:24.04
LABEL maintainer="jfw-1989"
ARG DEBIAN_FRONTEND=noninteractive

RUN \
    apt -y update && apt -y upgrade && \
    apt -y install supervisor curl wget bzip2 locales tzdata --no-install-recommends && \
    locale-gen de_DE.utf8 && \
    update-locale LANG=de_DE.utf8 && \
    apt -y clean && \
    rm -rf /var/lib/apt/lists/*

ENV \
    SUPERVISORD_EXIT_ON_FATAL=1 \
    LC_ALL=de_DE.utf8 \
    LANG=de_DE.utf8 \
    LANGUAGE=de_DE.utf8 \
    TZ=Europe/Berlin \
    SUPERVISORD_LOGLEVEL=WARN

COPY overlay/ /
RUN chmod -R 755 /init /hooks
ENTRYPOINT ["/bin/bash", "-e", "/init/entrypoint"]
CMD ["/init/supervisord"]

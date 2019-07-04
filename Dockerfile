FROM alpine:3.10

LABEL maintainer="frncsdrk@protonmail.com"

ENV BASH_VERSION 5.0.0-r0
ENV CURL_VERSION 7.65.1-r0
ENV DOWNLOAD_SCRIPT_URL "https://raw.githubusercontent.com/frncsdrk/dcc.sh/master/download.sh"

RUN apk -q update \
  && apk -q upgrade \
  && apk -q --no-progress add bash="$BASH_VERSION" \
  && apk -q --no-progress add curl="$CURL_VERSION" \
  && rm -rf /var/cache/apk/*

# download and install
RUN curl "$DOWNLOAD_SCRIPT_URL" -sSf | bash

ENTRYPOINT ["/usr/local/bin/dcc.sh"]
CMD ["--help"]

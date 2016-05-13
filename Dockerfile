FROM msaraiva/erlang:18.1

ENV PORT 80
EXPOSE $PORT

RUN apk --update add \
  erlang-crypto && \
  rm -rf /var/cache/apk/*

COPY helloworld /usr/local/bin/helloworld

ENTRYPOINT ["/usr/local/bin/helloworld"]

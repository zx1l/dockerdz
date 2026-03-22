ADD alpine-minirootfs-3.21.3-x86_64.tar.gz 

CMD ["/bin/sh"]

ENV NODE_VERSION=23.9.0

RUN /bin/sh -c addgroup -g

ENV YARN_VERSION=1.22.22

RUN /bin/sh -c apk add

COPY docker-entrypoint.sh /usr/local/bin/ # buildkit

ENTRYPOINT ["docker-entrypoint.sh"]

CMD ["node"]

ENV PORT=80

RUN /bin/sh -c npm install

COPY /usr/src/app/build /usr/src/html 

CMD ["/bin/sh" "-c" "serve -l" "80"]

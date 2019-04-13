FROM alpine:3.7

ENV MOUNTEBANK_VERSION=1.8.0

RUN apk add --update nodejs
RUN npm install -g mountebank@${MOUNTEBANK_VERSION} --production

EXPOSE 2525

ARG service
ENV profile=dev

ADD ${service} /imposters

ADD bootstrap.sh /usr/local/bin/bootstrap.sh

CMD ["/usr/local/bin/bootstrap.sh"]

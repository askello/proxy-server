FROM alpine

RUN apk add --no-cache tinyproxy

EXPOSE 8888

COPY entrypoint.sh ./

CMD ["sh", "/entrypoint.sh"]
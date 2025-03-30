FROM golang:alpine AS builder

RUN apk add --no-cache git

ARG VERSION

LABEL org.opencontainers.image.source=https://github.com/skx/rss2email/

RUN git clone --branch release-"$VERSION" https://github.com/skx/rss2email $GOPATH/src/github.com/skx/rss2email/

WORKDIR $GOPATH/src/github.com/skx/rss2email/

RUN go build -ldflags "-X main.version=$VERSION" -o /go/bin/rss2email


FROM alpine

COPY --from=builder /go/bin/rss2email /usr/local/bin/

ENTRYPOINT [ "/usr/local/bin/rss2email" ]

CMD help

WORKDIR /root

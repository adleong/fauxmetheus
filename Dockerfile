FROM golang:1.16.2-alpine as golang
WORKDIR /fauxmetheus-build
COPY . .
RUN go build .

FROM alpine
COPY --from=golang /fauxmetheus-build/fauxmetheus /
COPY --from=golang /fauxmetheus-build/*.json /
ENTRYPOINT ["/fauxmetheus"]

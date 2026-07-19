FROM golang:1.22-alpine AS builder

RUN adduser \
  --disabled-password \
  --gecos "" \
  --home "/nonexistent" \
  --shell "/sbin/nologin" \
  --no-create-home \
  --uid 65532 \
  small-user

WORKDIR /go/src/broadlinkac2mqtt_for_docker/app

COPY . .

RUN go mod download
RUN go mod verify

ARG TARGETOS TARGETARCH
RUN --mount=target=. \
    --mount=type=cache,target=/root/.cache/go-build \
    --mount=type=cache,target=/go/pkg \
    GOOS=$TARGETOS GOARCH=$TARGETARCH \
    go build -o /out/main .

FROM scratch

COPY --from=builder /etc/passwd /etc/passwd
COPY --from=builder /etc/group /etc/group
COPY --from=builder /out/main /main
COPY config/config.yml /config/config.yml

USER small-user:small-user

CMD ["/main"]
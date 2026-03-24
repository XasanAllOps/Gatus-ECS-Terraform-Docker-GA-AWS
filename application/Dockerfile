FROM golang:1.26.1-alpine AS builder

RUN apk update && apk add --no-cache ca-certificates tzdata && \
    addgroup -S appgroup && \
    adduser -S nonrootuser -G appgroup

RUN CGO_ENABLED=0 GOOS=linux go install -trimpath -ldflags="-w -s" github.com/TwiN/gatus/v5@v5.22.0

FROM scratch

COPY --from=builder /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/
COPY --from=builder /usr/share/zoneinfo /usr/share/zoneinfo
COPY --from=builder /etc/passwd /etc/passwd
COPY --from=builder /etc/group /etc/group

COPY --from=builder /go/bin/gatus /gatus

COPY ./config/config.yaml /config/config.yaml

USER nonrootuser

ENV GATUS_CONFIG_PATH=/config/config.yaml

EXPOSE 8080

ENTRYPOINT [ "/gatus" ]
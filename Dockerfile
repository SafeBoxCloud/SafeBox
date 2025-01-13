# Dockerfile
FROM golang:1.23.4 AS builder
WORKDIR /app
COPY . .
RUN go build -o safebox

FROM alpine:latest
WORKDIR /app
COPY --from=builder /app/safebox .
CMD ["./safebox"]
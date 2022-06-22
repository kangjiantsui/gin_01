FROM golang:1.17 AS builder
ENV GOPROXY https://goproxy.cn
WORKDIR /app

COPY . .

RUN  go mod download

RUN  CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build

EXPOSE 8899

FROM alpine:3.14.6
WORKDIR /app

COPY --from=builder /app /app

EXPOSE 8899

RUN chmod 777 /app/gin_01

CMD ["./gin_01"]
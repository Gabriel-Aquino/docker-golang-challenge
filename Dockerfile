FROM golang:1.7.4-alpine3.5 AS builder
WORKDIR /app
COPY . . 

RUN CGO_ENABLED=0 GOOS=linux go build hello-world.go

FROM hello-world
WORKDIR /app
COPY --from=builder /app .

ENTRYPOINT ["./hello-world"]


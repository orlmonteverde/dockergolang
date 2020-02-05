FROM golang:1.13.4-alpine AS builder
WORKDIR /app
COPY . .
RUN go mod download
RUN go build -o app ./...

FROM alpine:3.11.2
WORKDIR /root
COPY --from=builder /app/app .
EXPOSE 8080
CMD ["./app"]


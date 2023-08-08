FROM golang:1.20.6 AS builder
WORKDIR /
COPY demo-api.go .
RUN go mod init demo-api
RUN go mod tidy
RUN GOARCH=amd64 GOOS=linux CGO_ENABLED=0 go build -a -installsuffix cgo -o demo-api .

FROM alpine
WORKDIR /
COPY --from=builder /demo-api .
CMD ["./demo-api"]

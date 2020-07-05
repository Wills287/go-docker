FROM golang:1.14-alpine AS builder
RUN apk add --no-cache git
WORKDIR /tmp/go-docker
COPY go.mod .
#COPY go.sum .
RUN go mod download
COPY . .
#RUN CGO_ENABLED=0 go test -v
RUN go build -o ./out/go-docker .


FROM alpine:3.9
RUN apk add ca-certificates
COPY --from=builder /tmp/go-docker/out/go-docker /app/go-docker
EXPOSE 8080
CMD ["/app/go-docker"]

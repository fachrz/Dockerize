FROM golang:1.19.3-alpine3.17
LABEL maintainer = "Fachrurozi <rfachru3@outlook.com>"

WORKDIR /go/src

#install package needed
RUN apk update && apk add --no-cache git nodejs npm && npm install -g nodemon@2.0.18

COPY go.mod .

RUN go mod download && go mod tidy

#run go project
CMD ["nodemon", "--exec", "go", "run", "main.go", "--signal", "SIGTERM"]
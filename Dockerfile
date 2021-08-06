FROM golang:alpine

WORKDIR /go/src/goiban-service
COPY go.* ./
COPY metrics ./metrics
COPY ./*.go ./

RUN adduser -D openiban \
&& apk add --no-cache git \
&& go get -d -v ./... \
&& go install -v ./...
RUN LOADER=$(go list -f '{{.Dir}}' -m github.com/marcapo/goiban-data-loader) && ln -s ${LOADER}/data /data

USER openiban

CMD ["/go/bin/goiban-service","-dataPath","/data"]
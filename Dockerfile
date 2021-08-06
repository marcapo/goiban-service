FROM golang:alpine AS build

WORKDIR /go/src/goiban-service
COPY go.* ./
COPY metrics ./metrics
COPY ./*.go ./

ENV CGO_ENABLED=0
RUN adduser -D openiban \
&& apk add --no-cache git \
&& go get -d -v ./... \
&& go install -v ./...
RUN LOADER=$(go list -f '{{.Dir}}' -m github.com/marcapo/goiban-data-loader) && ln -s ${LOADER}/data /data

FROM scratch
COPY --from=build --chown=1000:1000 /go/bin/goiban-service /go/bin/goiban-service
COPY --from=build --chown=1000:1000 /data /data
USER 1000

CMD ["/go/bin/goiban-service","-dataPath","/data"]
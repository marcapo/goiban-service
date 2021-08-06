module github.com/marcapo/goiban-service

go 1.16

replace github.com/marcapo/goiban-service/metrics => ./metrics

require (
	github.com/armon/go-metrics v0.3.9
	github.com/franela/goblin v0.0.0-20210519012713-85d372ac71e2 // indirect
	github.com/franela/goreq v0.0.0-20171204163338-bcd34c9993f8
	github.com/go-sql-driver/mysql v1.6.0
	github.com/julienschmidt/httprouter v1.3.0
	github.com/marcapo/goiban v0.0.0-20210806062339-4718315b9329
	github.com/marcapo/goiban-data v0.0.0-20210805141159-a3af3c71fa29
	github.com/marcapo/goiban-data-loader v0.0.0-20210806084712-82af583b9ac2
	github.com/onsi/gomega v1.14.0 // indirect
	github.com/pmylund/go-cache v2.1.0+incompatible
	github.com/rs/cors v1.8.0
)

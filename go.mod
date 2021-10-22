module github.com/GaloisZhou/go-micro-demo-service-user

go 1.16

require (
	github.com/asim/go-micro/plugins/registry/consul/v4 v4.0.0-20211019191242-9edc569e68bb
	github.com/golang/protobuf v1.5.2
	go-micro.dev/v4 v4.1.0
	google.golang.org/grpc v1.27.1
	google.golang.org/protobuf v1.27.1
)

// This can be removed once etcd becomes go gettable, version 3.4 and 3.5 is not,
// see https://github.com/etcd-io/etcd/issues/11154 and https://github.com/etcd-io/etcd/issues/11931.
replace google.golang.org/grpc => google.golang.org/grpc v1.26.0

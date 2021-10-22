GOPATH:=$(shell go env GOPATH)

.PHONY: init
init:
	@go install google.golang.org/protobuf/cmd/protoc-gen-go@1.26.0
	@go install github.com/asim/go-micro/cmd/protoc-gen-micro/v4@latest
	@go get -u google.golang.org/protobuf/proto
	@go get -u github.com/asim/go-micro/plugins/registry/consul/v4

.PHONY: proto
proto:
	@protoc --proto_path=. --micro_out=. --go_out=plugins=grpc:. proto/user.proto

.PHONY: tidy
tidy:
	@go mod tidy

.PHONY: build
build:
	@go build -o user *.go

.PHONY: test
test:
	@go test -v ./... -cover

.PHONY: docker
docker:
	@docker build -t user:latest .

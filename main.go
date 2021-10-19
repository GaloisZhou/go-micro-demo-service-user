package main

import (
	"github.com/asim/go-micro/plugins/registry/consul/v4"
	"go-micro.dev/v4/registry"
	"user/handler"
	pb "user/proto"

	"go-micro.dev/v4"
	log "go-micro.dev/v4/logger"
)

var (
	service = "user"
	version = "latest"
)

func main() {
	consulRegistry := consul.NewRegistry(func(options *registry.Options) {
		options.Addrs = []string{"127.0.0.1:18500"}
	})
	// Create service
	srv := micro.NewService(
		micro.Name(service),
		micro.Version(version),
		micro.Registry(consulRegistry),
	)
	srv.Init()

	// Register handler
	pb.RegisterUserHandler(srv.Server(), new(handler.User))

	// Run service
	if err := srv.Run(); err != nil {
		log.Fatal(err)
	}
}

# Yet another gRPC echo server

## Use

## Build

First you want to generate the stubs based on the protobuf schema. 

Requires: the Go gRPC runtime and plug-in installed incl. `protoc` v3 set up,  see [grpc.io](https://grpc.io/blog/installation).

Do the following:

```bash
$ protoc \
  --proto_path=$GOPATH/src/github.com/mhausenblas/yages \
  --go_out=plugins=grpc:yages \
  yages-schema.proto
```

Executing above command results in the auto-generated file `yages/yages-schema.pb.go`. Do not manually edit this file, or in other words: if you add a new message or service to the schema, just run above `protoc` command again and you'll get an updated version of `yages-schema.pb.go`. 

Now you can run `go run main.go` or `go install` and in a second terminal session, using [grpcurl](https://github.com/fullstorydev/grpcurl), you do:

```bash
$ grpcurl -plaintext localhost:9000 list
```

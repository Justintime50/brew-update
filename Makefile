## help - Display help about make targets for this Makefile
help:
	@cat Makefile | grep '^## ' --color=never | cut -c4- | sed -e "`printf 's/ - /\t- /;'`" | column -s "`printf '\t'`" -t

## install - Install globally from source
install:
	go build -o $(go env GOPATH)/bin/alchemist

## clean - Clean the project
clean:
	rm dist
	rm $(go env GOPATH)/bin/alchemist

## build - Build the project
build:
	go build -o dist/alchemist

## test - Test the project
test:
	go clean -testcache && go test ./...

## coverage - Get test coverage
coverage: 
	go clean -testcache && go test ./... -coverprofile=covprofile

## lint - Lint the project
lint:
	golangci-lint run

.PHONY: help install clean build test lint

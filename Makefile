.PHONY: menv build run test testv buildexample runexample

PARENT_DIR := $(notdir $(CURDIR))
EXAMPLE_DIR := $(PARENT_DIR)/example

menv:
	@echo "Current directory: $(CURDIR)"
	@echo "Parent directory name: $(PARENT_DIR)"
	@echo "Example directory: $(EXAMPLE_DIR)"

build:
	@echo "Size before build:"; \
	ls -la |grep $(PARENT_DIR); \
	ls -lh |grep $(PARENT_DIR); \
	echo "\n\nSize after build:"; \
	CGO_ENABLED=0 go build --ldflags "-s -w"; \
	strip $(PARENT_DIR); \
	ls -la |grep $(PARENT_DIR); \
	ls -lh |grep $(PARENT_DIR)

run:
	@go run .

test:
	@go test ./...

testv:
	@go test -v ./...

buildexample:
	@cd $(EXAMPLE_DIR); \
	ls -la; \
	ls -lh; \
	CGO_ENABLED=0 go build --ldflags "-s -w"; \
	strip example; \
	ls -la; \
	ls -lh; \
	cd ..

runexample:
	@cd $(EXAMPLE_DIR); \
	go run main.go; \
	cd ..

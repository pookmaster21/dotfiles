BUILD_DIR=..
BUILD_FILE=.upgrade_system

default: build

run: build
	@$(BUILD_DIR)/$(BUILD_FILE)

build:
	@go build -o $(BUILD_DIR)/$(BUILD_FILE) .

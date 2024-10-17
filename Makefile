# Define the command to check if Node.js is installed
CHECK_NODE := node -v
INSTALL_NODE_LINUX := sudo apt-get update && sudo apt-get install -y nodejs
INSTALL_NODE_MAC := brew install node

# Define the command to check if Homebrew is installed
CHECK_BREW := brew --version
INSTALL_BREW := /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

.PHONY: all install_node install_brew

all: install_node

install_brew:
	@if [ "$(shell uname)" = "Darwin" ]; then \
		if ! $(CHECK_BREW) > /dev/null 2>&1; then \
			echo "Homebrew not found. Installing..."; \
			$(INSTALL_BREW); \
		else \
			echo "Homebrew is already installed."; \
		fi \
	else \
		echo "Not macOS. Skipping Homebrew installation."; \
	fi

install_node: install_brew
	@if ! $(CHECK_NODE) > /dev/null 2>&1; then \
		echo "Node.js not found. Installing..."; \
		if [ "$(shell uname)" = "Linux" ]; then \
			$(INSTALL_NODE_LINUX); \
		elif [ "$(shell uname)" = "Darwin" ]; then \
			$(INSTALL_NODE_MAC); \
		else \
			echo "Unsupported OS. Please install Node.js manually."; \
			exit 1; \
		fi \
	else \
		echo "Node.js is already installed."; \
	fi

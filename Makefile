# Define commands to check installations
CHECK_NODE := node -v
CHECK_BREW := brew --version
CHECK_PYTHON := python3 --version
CHECK_PIP := pip3 --version
CHECK_PLOTLY := pip3 show plotly

# Define installation commands
INSTALL_NODE_LINUX := sudo apt-get update && sudo apt-get install -y nodejs
INSTALL_NODE_MAC := brew install node
INSTALL_BREW := /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
INSTALL_PYTHON_LINUX := sudo apt-get update && sudo apt-get install -y python3
INSTALL_PYTHON_MAC := brew install python
INSTALL_PIP_LINUX := sudo apt-get install -y python3-pip
INSTALL_PLOTLY := pip3 install plotly

.PHONY: all install_node install_brew install_python install_pip install_plotly

all: install_python install_pip install_plotly install_node

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

install_python: install_brew
	@if ! $(CHECK_PYTHON) > /dev/null 2>&1; then \
		echo "Python3 not found. Installing..."; \
		if [ "$(shell uname)" = "Linux" ]; then \
			$(INSTALL_PYTHON_LINUX); \
		elif [ "$(shell uname)" = "Darwin" ]; then \
			$(INSTALL_PYTHON_MAC); \
		else \
			echo "Unsupported OS. Please install Python3 manually."; \
			exit 1; \
		fi \
	else \
		echo "Python3 is already installed."; \
	fi

install_pip: install_python
	@if ! $(CHECK_PIP) > /dev/null 2>&1; then \
		echo "pip3 not found. Installing..."; \
		if [ "$(shell uname)" = "Linux" ]; then \
			$(INSTALL_PIP_LINUX); \
		elif [ "$(shell uname)" = "Darwin" ]; then \
			echo "pip3 is usually included with Python3 on macOS."; \
		else \
			echo "Unsupported OS. Please install pip3 manually."; \
			exit 1; \
		fi \
	else \
		echo "pip3 is already installed."; \
	fi

install_plotly: install_pip
	@if ! $(CHECK_PLOTLY) > /dev/null 2>&1; then \
		echo "Plotly not found. Installing..."; \
		$(INSTALL_PLOTLY); \
	else \
		echo "Plotly is already installed."; \
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

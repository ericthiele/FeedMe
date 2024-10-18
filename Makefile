# Define commands to check installations
CHECK_BREW := brew --version
CHECK_PYTHON := python3 --version
CHECK_PIP := pip3 --version

# Define installation commands
INSTALL_BREW := /bin/bash -c "`curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh`"
INSTALL_PYTHON_LINUX := sudo apt-get update && sudo apt-get install -y python3
INSTALL_PYTHON_MAC := brew install python
INSTALL_PIP_LINUX := sudo apt-get install -y python3-pip

# Python Virtual Environment vars
VENV_DIR := FeedMeEnv
PYTHON = $(VENV_DIR)/bin/python
PIP = $(VENV_DIR)/bin/pip

.PHONY: all install_brew install_python create_venv install_venv run clean install_pip

all: install_python create_venv install_venv install_pip

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

create_venv: install_python
	python3 -m venv $(VENV_DIR)
	. $(VENV_DIR)/bin/activate
                        
install_venv: create_venv
	. $(VENV_DIR)/bin/activate
	$(PIP) install -r requirements.txt
        
run: all install_venv
	. $(VENV_DIR)/bin/activate
	$(PYTHON) feedme.py
	deactivate

clean:
	rm -rf $(VENV_DIR)

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

help:
	@echo "Please use \`make <target>' where <target> is one of"
	@echo "  build               to build the project"
	@echo "  run                 to run the project"
	@echo "  requirements_freeze to freeze the requirements"
	@echo "  requirements_install to install the requirements"
	@echo "  venv_create         to create a virtual environment"
	@echo "  venv_activate       to activate the virtual environment"
	@echo "  nix-shell           to enter the nix shell"

run:
	export  LIBTORCH_BYPASS_VERSION_CHECK=1 && export LIBTORCH_USE_PYTORCH=1
	cargo run

requirements_freeze:
	pip freeze > requirements.txt

requirements_install:
	pip install -r requirements.txt

venv_create:
	python3 -m venv .venv

venv_activate:
	source .venv/bin/activate

nix-shell:
	nix-shell ./shell.nix

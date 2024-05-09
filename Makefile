# tool
PY  = bin/python3
PIP = bin/pip3

# install
.PHONY: install update gz ref
install: gz ref
	$(MAKE) update
update: $(PIP)
	sudo apt update
	sudo apt install -uy `cat apt.txt`
	$(PIP) install -U -r requirements.txt
gz:
ref: ref/jupyter-wire/README.md

ref/jupyter-wire/README.md:
	git clone -o gh https://github.com/symmetryinvestments/jupyter-wire.git ref/jupyter-wire

$(PY) $(PIP):
	python3 -m venv .

# var
MODULE = $(notdir $(CURDIR))

# tool
PY  = bin/python3
PIP = bin/pip3
DC  = /usr/bin/dmd
DUB = /usr/bin/dub
RUN = $(DUB) run --compiler=$(DC)

# src
D += $(wildcard src/*.d)
F += lib/$(MODULE).ini $(wildcard lib/*.f)

# all
.PHONY: all
all: $(D) $(F)
	$(RUN) -- $(F)

# format
.PHONY: format
format: tmp/format_d
tmp/format_d: $(D)
	dub run dfmt -- -i $? && touch $@

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

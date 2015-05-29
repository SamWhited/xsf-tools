REBUILD_FLAG =
VENV=env
BIN=$(VENV)/bin
ACTIVATE=source $(BIN)/activate

.PHONY: all
all: build

$(VENV): $(VENV)/bin/activate

$(VENV)/bin/activate: requirements-dev.txt
	test -d $(VENV) || virtualenv -p /usr/bin/python3 $(VENV)
	$(ACTIVATE); pip install -r requirements-dev.txt
	touch $(BIN)/activate


.PHONY: test
test: $(VENV)
	$(ACTIVATE); tox $(REBUILD_FLAG)

.PHONY: clean
clean:
	find . -iname '*.pyc' | xargs rm -f
	rm -rf .tox
	rm -rf dist
	rm -rf $(VENV)

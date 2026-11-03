SHELL := /bin/sh
PYTHON ?= python3
RSCRIPT ?= Rscript
VENV ?= .venv

.DEFAULT_GOAL := help
.PHONY: help setup-python setup-r test test-python test-r lint lint-python lint-r format check clean

help: ## Show available commands.
	@awk 'BEGIN {FS = ":.*## "; printf "Usage: make <target>\n\n"} /^[a-zA-Z_-]+:.*## / {printf "  %-16s %s\n", $$1, $$2}' $(MAKEFILE_LIST)

setup-python: ## Create a virtual environment and install Python dependencies.
	$(PYTHON) -m venv $(VENV)
	$(VENV)/bin/python -m pip install --upgrade pip
	$(VENV)/bin/python -m pip install --editable ".[analysis,bio,dev]"

setup-r: ## Initialise or restore the renv environment.
	$(RSCRIPT) scripts/bootstrap_renv.R

test: test-python test-r ## Run all tests.

test-python: ## Run Python tests.
	$(PYTHON) -m pytest

test-r: ## Run R tests.
	$(RSCRIPT) tests/testthat.R

lint: lint-python lint-r ## Run all linters.

lint-python: ## Check Python formatting and lint rules.
	$(PYTHON) -m ruff check .
	$(PYTHON) -m ruff format --check .

lint-r: ## Lint R functions and scripts.
	$(RSCRIPT) scripts/lint.R

format: ## Format Python and R source files.
	$(PYTHON) -m ruff check --fix .
	$(PYTHON) -m ruff format .
	$(RSCRIPT) -e 'styler::style_dir("R"); styler::style_dir("scripts")'

check: lint test ## Run the same checks used by continuous integration.

clean: ## Remove caches and generated local artifacts.
	$(PYTHON) -c 'import pathlib, shutil; [shutil.rmtree(p, ignore_errors=True) for p in pathlib.Path(".").rglob("__pycache__")]; [shutil.rmtree(p, ignore_errors=True) for p in map(pathlib.Path, [".pytest_cache", ".ruff_cache", "htmlcov", "build", "dist"])]'
	find . -name '*.py[co]' -delete
	find . -name '.coverage*' -delete

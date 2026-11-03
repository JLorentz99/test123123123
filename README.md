# Project title

> One sentence describing the biological question and the purpose of this
> repository.

This repository is a reusable starting point for reproducible bioinformatics
projects that use both Python and R. It separates source code, workflow logic,
metadata, data, and generated results; provides lightweight examples; and runs
both language stacks in continuous integration.

## Start a new project

1. Select **Use this template** on GitHub and create your repository.
2. Clone the new repository and enter it.
3. Replace the template values listed in [Customise the template](#customise-the-template).
4. Choose one of the setup routes below.
5. Complete the [colleague and agent setup guide](docs/agent_setup.md), then
   run `make check` before the first commit.

## Environment setup

### One environment for R and Python

[Mamba](https://mamba.readthedocs.io/) is recommended for mixed-language and
Bioconda-based projects:

```bash
mamba env create --file environment.yml
mamba activate science-project
pre-commit install
make check
```

The environment file is intentionally small. Add project-specific tools and
libraries, then consider producing a lock file with `conda-lock` for long-term
reproducibility.

### Separate native environments

Use a Python virtual environment and `renv` when you want each language to
manage its own packages. Use Python 3.11 or newer; set `PYTHON` if your
system `python3` is older:

```bash
make setup-python
source .venv/bin/activate
make setup-r
Rscript -e 'renv::install(c("lintr", "styler", "testthat", "rmarkdown"))'
pre-commit install
make check
```

After changing R dependencies, run `renv::snapshot()` and commit `renv.lock`.
For Python, add runtime dependencies to `pyproject.toml` and commit the lock file
created by the package manager used by your project.

## Common commands

```bash
make help          # Show all available commands
make test          # Run Python and R tests
make lint          # Check Python and R code
make format        # Format Python and R code
make check         # Run linting and tests
make clean         # Remove disposable local artifacts
```

Run a script only after installing the Python project in editable mode:

```bash
python scripts/run_analysis.py
Rscript scripts/run_analysis.R
```

## Repository layout

```text
.
├── R/                    # Reusable R functions
├── AGENTS.md             # Shared coding-agent entry point
├── CLAUDE.md             # Claude Code imports the shared instructions
├── HANDOFF.md            # Current state and exact next step
├── RULES.md              # Scientific, coding, and review standards
├── config/               # Human-readable analysis configuration
├── data/                 # Raw, intermediate, and processed data (ignored)
├── docs/                 # Colleague and agent onboarding
├── metadata/             # Small tracked sample sheets and data dictionaries
├── notebooks/            # Exploratory work; move stable logic into src/ or R/
├── reports/              # Quarto/R Markdown manuscripts and reports
├── results/              # Generated figures and tables (ignored by default)
├── scripts/              # Thin command-line entry points
├── src/project_name/     # Installable Python package
├── tests/                # Python pytest and R testthat suites
└── workflow/             # Snakemake, Nextflow, or other workflow definitions
```

Keep reusable logic in `src/project_name/` or `R/`; keep scripts thin. Notebooks
should call those functions instead of becoming the only record of an analysis.
The scripts under `scripts/` are smoke tests; follow `RULES.md` for a real
scientific analysis and its reviewable HTML report.

## Working with a colleague or coding agent

The repository carries the same project instructions for Codex, Claude Code,
other agents, and human contributors. `AGENTS.md` is the shared entry point;
`CLAUDE.md` imports it for Claude Code. `RULES.md` contains the detailed
standards, and `HANDOFF.md` carries the current state between sessions.

Follow [docs/agent_setup.md](docs/agent_setup.md) when handing a new project to
a colleague. It covers tool setup, local credentials, instruction loading,
and the first reproducible analysis. Personal agent settings and access to
protected data are deliberately configured by each contributor.

## Data and reproducibility

- Never commit patient-identifiable, sensitive, controlled-access, or secret
  data. Follow the applicable ethics approval and data-management plan.
- Raw and derived data are ignored by default. Document how authorised users
  obtain them in `data/README.md`.
- Track small, non-sensitive metadata and configuration when permitted.
- Treat `data/raw/` as immutable. Create intermediate and processed files via a
  script or workflow.
- Record software versions with an environment lock file and record input data
  versions with checksums, accessions, or a data registry.
- Set random seeds where stochastic methods are used and record them in
  `config/config.yaml`.
- Do not use GitHub as a backup for large results. Publish durable research
  outputs in an appropriate archive and add the DOI here.

## Customise the template

Before starting an analysis, search for and replace these placeholders:

```bash
rg -n "Project title|project-name|project_name|maintainer@example.com|Project Contributors|Replace with|YYYY-MM-DD|uncustomised"
```

- Rename the Python import directory `src/project_name/` and update imports,
  tests, `pyproject.toml`, and the Makefile if needed.
- Update the project title, summary, authors, repository links, and citation
  metadata.
- Review `LICENSE`; replace it if MIT is not appropriate.
- Add runtime dependencies to `pyproject.toml` and R dependencies to
  `DESCRIPTION` or `renv.lock`.
- Adjust ignored scientific file formats to match the project's data policy.
- Replace the example functions and tests, while keeping at least one fast test
  for each language in CI.
- Fill in `HANDOFF.md`, review `RULES.md`, and document authorised data access.
- Decide whether generated figures and tables should remain ignored or be
  versioned for a manuscript release.

## Quality checks

Pull requests and pushes to `main` run separate Python and R jobs. Python is
checked with Ruff and pytest; R is checked with lintr and testthat. Pre-commit
also catches malformed configuration, accidental large files, private keys,
and notebook output before code reaches GitHub.

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md) for the development workflow and pull
request expectations.

## Citation

Update `CITATION.cff` with the project authors and release information. GitHub
will then expose a **Cite this repository** entry. Add publication and archive
DOIs as they become available.

## License

This template uses the MIT License. Review [LICENSE](LICENSE) before using the
template for a new project.

# Contributing

## Before making changes

Read `AGENTS.md`, `RULES.md`, and the current `HANDOFF.md`. The same research
and review standards apply whether a person or an agent makes the change.

Open an issue for changes that affect the scientific question, input data,
statistical design, public interfaces, or workflow architecture. Small fixes
can go directly to a focused branch.

Do not include sensitive data, credentials, or large generated files in an
issue, commit, or pull request.

## Development workflow

1. Create a branch from an up-to-date `main` branch.
2. Set up the environment described in `README.md`.
3. Install the hooks with `pre-commit install`.
4. Add or update tests alongside code changes.
5. Run `make check` locally.
6. Update `HANDOFF.md` if the result, decision, environment, or next step changed.
7. Open a pull request using the repository template.

Prefer small commits that explain why a change is needed. Separate mechanical
formatting from scientific or behavioural changes when practical.

## Scientific changes

A pull request that changes an analysis should state:

- which inputs, cohorts, samples, and configuration were used;
- the expected scientific effect of the change;
- whether existing outputs must be regenerated;
- how the result was validated; and
- any effect on reproducibility, privacy, or interpretation.

Keep exploratory work in notebooks, but move stable transformations and
statistics into tested functions in `src/project_name/` or `R/`.

## Code style

- Python is formatted and linted with Ruff.
- R is formatted with styler and linted with lintr.
- Public functions should have concise documentation and type information where
  the language supports it.
- Use paths relative to the repository root. Do not commit machine-specific
  absolute paths.

## Review checklist

- Tests cover the changed behaviour.
- `make check` passes.
- Configuration and documentation are current.
- Outputs are reproducible from tracked code and declared inputs.
- No secrets, personal data, or unnecessary large files are included.

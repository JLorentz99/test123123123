# Agent instructions

These instructions apply to coding agents working anywhere in this repository.
They are also the entry point for human contributors who want to understand the
project's working agreements.

## At the start of a session

1. Read `HANDOFF.md` for the current state and next step. Treat it as a handoff,
   not as proof that an analysis has been run; verify claims against the code and
   recorded outputs.
2. Read `RULES.md` before editing code, analyses, configuration, or results.
3. Read `README.md` and the relevant `data/README.md`, `metadata/README.md`,
   and project documentation before making scientific decisions.
4. Check `git status --short` and preserve existing work.

## Working agreement

- Follow `RULES.md` for reproducibility, evidence, data handling, review,
  documentation, and Git workflow. It is the source of truth for those rules.
- Keep reusable Python functions in `src/project_name/`, reusable R functions
  in `R/`, and analysis entry points in `scripts/` or `notebooks/`. Replace
  `project_name` when customising a new repository.
- Use configuration and relative paths; never embed a colleague's home
  directory, credentials, or a private data location in committed code.
- Do not invent biological metadata, sample relationships, statistical
  independence, or results. Record uncertainties and ask the project owner
  when they change the scientific interpretation.
- Make the smallest complete change, run the relevant checks (`make check` for
  code changes), and report what ran and what could not be verified.
- Update `HANDOFF.md` when a result, decision, environment, or next step
  changes. Update `README.md` and other documentation when the workflow changes.

## Before sharing work

Review the diff for generated data, identifying metadata, private paths, and
secrets. Never commit `.env` or unapproved research data. Describe the inputs,
outputs, validation, and scientific impact in the pull request.

For a new project, complete `docs/agent_setup.md` before asking an agent to run
an analysis. Until then, this repository is only a scaffold.

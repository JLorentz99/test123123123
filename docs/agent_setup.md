# Reproduce the project working setup

This guide is for a colleague starting a repository from this template. The
tracked files reproduce the **project rules and tooling**. Each person still
needs their own GitHub/agent login, permitted data access, and local secrets.

## 1. Create and customise the repository

1. On GitHub, select **Use this template**, create a new repository, and clone
   it. Work from the new repository's root so agents find `AGENTS.md`.
2. Replace the placeholders identified in `README.md` (project name, authors,
   package/import name, citation, and license). Add the actual scientific
   question and scope to the README.
3. Fill in `HANDOFF.md` with the current state and next step. Add data sources
   and access instructions to `data/README.md`; define metadata fields in
   `metadata/README.md`.
4. Review `RULES.md` with the project owner. Record any project-specific
   exception there, including the biological unit of replication and the
   approved location for large or sensitive outputs.

## 2. Install the analysis tools

Choose one route from the README. The mixed R/Python route is:

```bash
mamba env create --file environment.yml
mamba activate science-project
pre-commit install
make check
```

The separate-environment route is `make setup-python`, activation of `.venv`,
and `make setup-r` as documented in the README. Pass `PYTHON=python3.12` to
`make setup-python` if `python3` is older than 3.11. After adding real analysis
dependencies, commit exact-version manifests or lock files. The starter
version ranges are not a record of a completed scientific run.

Copy `.env.example` to `.env` only if the project uses local environment
variables. Fill it with your own permitted values. The `.env` file is ignored
by Git. Never share tokens through a commit, issue, report, or agent prompt.

## 3. Start a coding agent

- **Codex:** Open the new repository root as the project. Codex loads the
  root `AGENTS.md`; ask it to summarise the project instructions and current
  handoff before the first task. If your client supports trusted project
  settings, trust only repositories you know. No personal model or permission
  settings are required by this template.
- **Claude Code:** Start from the new repository root. `CLAUDE.md` imports
  `AGENTS.md` and `RULES.md` so the same standards are in its context. Use
  `/context` to confirm the instruction files loaded.
- **Other agents:** Give them `AGENTS.md`, `RULES.md`, `HANDOFF.md`, and the
  README as project context. Check their product's instruction-file behavior;
  file discovery is not identical across clients.

A useful first request is: “Read the project instructions and handoff, inspect
the repository state, and tell me the next reproducible step and what access
or data it requires.”

## 4. Run and hand off an analysis

1. Declare the input data, environment, seed, and output paths before a run.
2. Keep a reviewable analysis source and render its actual output to HTML as
   described in `RULES.md`. Record the exact render command in the handoff or
   report. The example scripts in `scripts/` are smoke tests, not scientific
   analyses.
3. Run `make check` and any data-dependent validation. Review the diff for
   private data and generated files.
4. Update `HANDOFF.md` with the run, evidence, unresolved issues, and exact
   next action. Open a focused pull request using the included template.

The repository can reproduce the instructions and code. A colleague can
reproduce a scientific result only after authorised input data and the exact
analysis environment are available to them.

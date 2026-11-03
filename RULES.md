# Research and coding rules

These rules apply to agents and people working in a repository made from this
template. Replace the example paths and commands as the project evolves, but
keep the underlying decisions explicit. If a rule conflicts with an approved
study protocol or data-management plan, document the project-specific decision
here and in the relevant method or plan.

## 1. Reproducible results

- A result must be traceable to declared inputs, committed code, configuration,
  and a recorded software environment. Keep manual steps in a runbook or turn
  them into code.
- For each analysis run, record input identifiers or checksums, command or
  notebook, output paths, date, package versions, parameters, and random seeds.
  Put durable run notes beside the report or in the project documentation.
- Set seeds explicitly for stochastic steps. Document sources of remaining
  nondeterminism, such as parallel algorithms or hardware differences.
- Treat `data/raw/` as immutable. Correct a generated table, figure, or object
  by changing its generating code and rerunning it.
- Separate exploratory observations from formally tested claims. Name the
  biological unit of replication and the statistical test. Cells from one
  donor, embryo, animal, or sample may not be independent replicates.
- Record biological assumptions and unresolved metadata questions. Do not
  infer a sample's meaning from its identifier alone.

## 2. Environments and dependencies

- `environment.yml` and `pyproject.toml` provide the starter environment.
  Before producing a project result, pin the actual analysis environment in
  a committed lock file or equivalent exact-version manifest. Commit `renv.lock`
  when using `renv`; record R `sessionInfo()` with each R result.
- Add a dependency because an analysis needs it, then record its version and
  why it was added. Use established scientific packages for standard methods.
- Run a result with the environment declared for that result. Print the key
  package versions in the rendered report or run log; a lock file alone does
  not prove what was used in an earlier run.
- Keep machine-specific paths, access tokens, and user settings outside Git.
  `.env.example` documents variable names; `.env` holds local values.

## 3. Analysis files and review reports

- Start each analysis file with five short fields: **Script**, **Goal**,
  **Docs**, **Input**, and **Output**. The file should stand alone when a
  colleague reviews it later.
- Use R Markdown (`.Rmd`) for a reviewable R analysis: prose and code in
  execution order, rendered with `rmarkdown::render()`. Plain `.R` is suitable
  for reusable functions, small CLI entry points, and tooling. Document
  reusable R functions with roxygen comments.
- Use a Jupytext percent-format `.py` file (`# %%` cells) for a reviewable
  Python analysis, or a Quarto document if the project adopts Quarto. Keep
  reusable Python functions in `src/` with docstrings and useful type hints.
- Render analyses that produce findings to HTML with code and actual output
  visible. Display plots inline in the report; in R Markdown, explicitly
  `print(plot)` when a plot is created inside a loop or function.
- For R, run `rmarkdown::render("notebooks/01_analysis.Rmd")`. For Python,
  run `jupytext --to notebook --execute notebooks/01_analysis.py`, then
  `jupyter nbconvert --to html notebooks/01_analysis.ipynb`. Replace the
  example name and record the exact command used. Resolve data paths from a
  known project root; notebook execution may use the notebook's directory.
- Keep small review reports in Git when permitted by the data policy. Store
  large or sensitive reports in the approved project location and record their
  path and checksum in the handoff or methods. Do not publish identifiable
  metadata in HTML, notebook outputs, or figure labels.
- Move stable logic out of exploratory notebooks into a tested function or a
  reproducible analysis step. Do not make a notebook's hidden execution state
  necessary to reproduce a result.

## 4. Code and configuration

- Put paths, column names, thresholds, and seeds in `config/config.yaml` or at
  the top of a single analysis file. State units and the reason for important
  thresholds.
- Prefer a plain function and a thin script to a framework. Add abstractions
  when they have a real second use.
- Write comments for biological reasoning, statistical choices, and data
  quirks. Avoid comments that repeat the next line of code.
- Tests should cover transformations and failure cases that affect scientific
  results. Keep tests runnable on small, non-sensitive fixtures.

## 5. Git and review

- Inspect existing changes before editing. Keep commits focused and explain
  the reason for the change in the message. Do not rewrite shared history.
- Run `make check` for code changes and the relevant analysis validation before
  presenting a result. State any checks that require unavailable data or
  compute access.
- Review nontrivial diffs for scientific assumptions, changed inputs, broken
  outputs, privacy, and reproducibility. Use the pull request template.
- Update `HANDOFF.md` after a meaningful result or decision and keep it short
  enough that the next contributor can act without reading a chat transcript.

## 6. Data and scope

- Follow the project's ethics approval, data-use agreement, and data-management
  plan. Treat unpublished and controlled-access data as confidential.
- Never commit credentials, raw data, individual-level data, or large processed
  objects. Track only small metadata explicitly approved for the repository.
- Read external or shared datasets as inputs. Write new outputs only to the
  assigned project location. Check the target before overwriting or deleting
  any result or data file.
- If a collaborator is actively reviewing a document on a remote server, edit
  the agreed live copy and verify the change there. Then commit the matching
  source change so the server and repository do not drift apart. Do not stop
  another person's session or process to make an edit.
- Access to an external server, bucket, or database is configured per person.
  This template grants no access and contains no credentials.

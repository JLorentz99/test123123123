# Notebooks

Use notebooks for exploration and communication. Name them in execution order,
for example `01_quality_control.ipynb` and `02_exploration.qmd`.

Clear notebook outputs before committing; the configured pre-commit hook does
this automatically for Jupyter notebooks. Keep the rendered HTML report from a
result-producing run as a separate review artifact, as described in `RULES.md`.
Move stable logic into tested Python or R functions so the analysis can run
without manual notebook steps.

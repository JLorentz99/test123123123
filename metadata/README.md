# Metadata

Track small, non-sensitive metadata required to interpret the analysis, such as
sample identifiers, experimental groups, batches, and data dictionaries. Use
pseudonymous identifiers and comply with the project's data-management plan.

`samples.tsv` provides a minimal schema. Extend it deliberately and document
every field here.

| Field | Description |
|---|---|
| `sample_id` | Stable, non-identifying sample identifier |
| `group` | Experimental or comparison group |
| `batch` | Processing or sequencing batch |
| `file` | Path or durable identifier for the input file |

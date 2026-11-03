# Data

Data files are deliberately excluded from Git. Describe the source, ownership,
access procedure, expected checksums, and retention policy for every dataset
used by the project. Never place identifiable or controlled-access data in the
repository.

## Directories

- `raw/`: immutable inputs exactly as received or downloaded;
- `interim/`: temporary outputs from individual workflow stages; and
- `processed/`: analysis-ready derived datasets.

Generated files should move from `raw/` to `processed/` through tracked code or
a workflow. Do not edit raw inputs in place.

Example registry:

| Dataset | Source/accession | Version/date | Checksum | Access notes |
|---|---|---|---|---|
| Replace me | Replace me | Replace me | Replace me | Replace me |

# Workflow

Add a workflow engine only when the analysis benefits from explicit dependency
tracking, parallelism, retries, or cluster execution. Common choices include
Snakemake and Nextflow. Keep profiles and portable workflow definitions here;
keep machine- or cluster-specific secrets outside Git.

Whichever engine is chosen, pin its version and provide one documented command
that recreates the analysis from declared inputs.

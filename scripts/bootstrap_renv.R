if (!requireNamespace("renv", quietly = TRUE)) {
  install.packages("renv", repos = "https://cloud.r-project.org")
}

if (file.exists("renv.lock")) {
  renv::restore(prompt = FALSE)
} else {
  renv::init(bare = TRUE)
  message(
    "Initialised renv. Install R dependencies, then run renv::snapshot()."
  )
}

paths <- c("R", "scripts")
lints <- unlist(lapply(paths, lintr::lint_dir), recursive = FALSE)

print(lints)
quit(status = as.integer(length(lints) > 0L))

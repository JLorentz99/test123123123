source(file.path("R", "summary.R"))

result <- project_mean(c(1, 2, 3))
message(sprintf("Example mean: %.2f", result))

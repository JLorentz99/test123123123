test_that("project_mean calculates the arithmetic mean", {
  expect_equal(project_mean(c(1, 2, 3)), 2)
})

test_that("project_mean rejects invalid input", {
  expect_error(project_mean(numeric()), "non-empty numeric vector")
  expect_error(project_mean("1"), "non-empty numeric vector")
})

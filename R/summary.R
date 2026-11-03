#' Calculate an arithmetic mean
#'
#' @param values A non-empty numeric vector.
#' @return A numeric scalar.
#' @export
project_mean <- function(values) {
  if (!is.numeric(values) || length(values) == 0L) {
    stop("values must be a non-empty numeric vector", call. = FALSE)
  }

  mean(values)
}

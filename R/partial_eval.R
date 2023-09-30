#' Partially evaluate expressions
#'
#' @param expr An expression (i.e. a list of calls)
#' @param values A list or an environment object
#' consists of some variable names in given expression and values for them.
#'
#' @return An expression of the same length as `expr`.
#' Substitute given values to some variables according to `values`
#'
#' @export
#'
#' @examples
#' expr <- expression(x + y, x + z, y + z)
#' values <- list(x = 1)
#' partial_eval(expr = expr, values = values)
partial_eval <- function(expr, values) {
  as.expression(lapply(expr, partial_eval_call, values = values))
}

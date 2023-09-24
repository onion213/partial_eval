#' Partially evaluate expressions.
#'
#' @param expr An expression (i.e. list of calls)
#' @param values A list or an environment object
#' consists of some variable names and values.
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
  partial_eval_one_call <- function(call, values) {
    do.call("substitute", args = list(call, env = values))
  }
  as.expression(lapply(expr, partial_eval_one_call, values = values))
}

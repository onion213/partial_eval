#' Partially evaluate a call
#'
#' @param call A call to be evaluated
#' @param values A list or an environment object
#' consists of some variable names in given call and values for them.
#'
#' @return A call.
#' Substitute given values to some variables according to `values`
#'
#' @export
#'
#' @examples
#' call <- expression(x + y)[[1]]
#' values <- list(x = 1)
#' partial_eval_call(call = call, values = values)
partial_eval_call <- function(call, values) {
  do.call("substitute", args = list(call, env = values))
}

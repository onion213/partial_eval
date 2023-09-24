test_that("Can evaluate 1 element expr", {
  # Arrange
  expr <- expression(x + y)
  values <- list(x = 1)

  # Act
  evaluated_expr <- partial_eval(expr = expr, values = values)

  # Assert
  expect_equal(class(evaluated_expr), "expression")
  expect_equal(length(evaluated_expr), 1)
  expect_equal(evaluated_expr[[1]], expression(1 + y)[[1]])
})

test_that("Can evaluate 2 element expr", {
  # Arrange
  expr <- expression(x + y, x + z)
  values <- list(x = 1)

  # Act
  evaluated_expr <- partial_eval(expr = expr, values = values)

  # Assert
  expect_equal(class(evaluated_expr), "expression")
  expect_equal(length(evaluated_expr), 2)
  expect_equal(evaluated_expr[[1]], expression(1 + y)[[1]])
  expect_equal(evaluated_expr[[2]], expression(1 + z)[[1]])
})

test_that("Can deal with 0 element expr", {
  # Arrange
  expr <- expression()
  values <- list(x = 1)

  # Act
  evaluated_expr <- partial_eval(expr = expr, values = values)

  # Assert
  expect_equal(class(evaluated_expr), "expression")
  expect_equal(length(evaluated_expr), 0)
})

test_that("Can deal with unknown variable name in values", {
  # Arrange
  expr <- expression(x + y)
  values <- list(x = 1, z = 2)

  # Act
  evaluated_expr <- partial_eval(expr = expr, values = values)

  # Assert
  expect_equal(length(evaluated_expr), 1)
  expect_equal(evaluated_expr[[1]], expression(1 + y)[[1]])
})

test_that("Can partially evaluate a call", {
  # Arrange
  call <- expression(x+y)[[1]]
  values <- list(x = 1)

  # Act
  evaluated_call <- partial_eval_call(call = call, values = values)

  # Assert
  expect_equal(class(evaluated_call), "call")
  expect_equal(evaluated_call, expression(1+y)[[1]])
})

test_that("Can fully evaluate a call", {
  # Arrange
  call <- expression(x+y)[[1]]
  values <- list(x = 1, y = 2)

  # Act
  evaluated_call <- partial_eval_call(call = call, values = values)

  # Assert
  expect_equal(class(evaluated_call), "call")
  expect_equal(evaluated_call, expression(1+2)[[1]])
})

test_that("Can deal with empty values", {
  # Arrange
  call <- expression(x+y)[[1]]
  values <- list()

  # Act
  evaluated_call <- partial_eval_call(call = call, values = values)

  # Assert
  expect_equal(class(evaluated_call), "call")
  expect_equal(evaluated_call, expression(x+y)[[1]])
})

test_that("Can deal with unknown name in values", {
  # Arrange
  call <- expression(x+y)[[1]]
  values <- list(z=3)

  # Act
  evaluated_call <- partial_eval_call(call = call, values = values)

  # Assert
  expect_equal(class(evaluated_call), "call")
  expect_equal(evaluated_call, expression(x+y)[[1]])
})


<!-- README.md is generated from README.Rmd. Please edit that file -->

# partialeval

<!-- badges: start -->
<!-- badges: end -->

R Package for Partially Evaluating Expressions

## Installation

You can install the development version of partialeval from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("onion213/partial_eval")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(partialeval)

expr <- expression(x + y, x + z, y + z)
values <- list(x = 1)
partial_eval(expr = expr, values = values)
#> expression(1 + y, 1 + z, y + z)
```

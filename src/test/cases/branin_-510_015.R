## This file should provide following objects, when loaded:
# f : function
# input.f : list of input dimensions, contains list of properties like lower & upper bounds of each dimensions
# output.f : list of output dimensions
# *.f : list of math properties. To be compared with algorithm results
# [print.f] : method to print/plot the function for information

f <- function(x) {
	x1 <- x[1] #*15-5   
	x2 <- x[2] #*15     
	(x2 - 5/(4*pi^2)*(x1^2) + 5/pi*x1 - 6)^2 + 10*(1 - 1/(8*pi))*cos(x1) + 10
}
input.f = list(
    x1=list(min=-5,max=10),
    x2=list(min=0,max=15)
)
output.f = "branin_-510_015"
argmin1.f = c(0.9616520*15-5, 0.15*15) 
argmin2.f = c(0.1238946*15-5, 0.8166644*15)
argmin3.f = c(0.5427730*15-5, 0.15*15)
min.f = 0.3978874

library(testthat)
if (!isTRUE(test_that("f(armgin.f) == f.min",{expect_equal(f(matrix(argmin1.f,nrow=1))[1],min.f,tolerance = .0001)}))) quit(status=1)

test = function(algorithm_file) {
    results = run.algorithm(algorithm_file, options=list(yminimization='true',x0='0.5',ytol='0.01'),fun=list(input=input.f,output=output.f,fun=f))
    if (!isTRUE(test_that("branin_-510_015 min",{expect_equal(as.numeric(results$min),min.f,tolerance = .1)}))) quit(status=1)
}


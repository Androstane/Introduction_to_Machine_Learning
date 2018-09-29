y = c( 1, 1-0.3125^2, 1-(0.3125+0.234375*2)^2, 1-(0.3125+0.234375*2+0.09375*2)^2, 0)
x = c(0, 1/6, 1/3, 1/2)
plot(stepfun(x,y), xlim = c(0,1), ylim = c(0, 4), main = "Plot of epsilon aginst Probability", col = "red", xlab = "epsilon", ylab = "probability", lty = 1)
fun <- function(x) 4*exp(-12*x^2)
plot(fun, col= "blue", lty = 2, xlim = c(0,1), add = TRUE)
legend("right", 0, 1, legend=c("Actual Bound", "Hoeffding Bound"), col=c("red", "blue"), lty=1:2, cex=0.8, box.lty=0)


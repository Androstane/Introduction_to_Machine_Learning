#true function 
f= function(x){
  result = x^2
  return(result)
}

a_list = numeric()
b_list = numeric()
#make sure result is same for testing 
set.seed(0)
#train the model using random x1 and x2 
for (i in 1:100000){
  data= runif(2, -1, 1)
  result= data.frame(x = data, y = f(data))
  a = data[1] + data[2]
  b = data[1] * data[2]
  a_list = c(a_list, a)
  b_list = c(b_list, b)
}
mean_a = mean(a_list)
mean_b = mean(b_list)

x_test = runif(100000, -1, 1)
E_out = mean(x_test^4) - 2*a_list * mean(x_test^3) + (a_list*a_list - 2*b_list) * mean(x_test^2) + 2*a_list*b_list*mean(x_test)+b_list^2
bias = (mean_a*x_test - mean_b - f(x_test))^2
var = mean((a_list - mean_a)^2)*x_test^2 + 2* mean((a_list - mean_a)*(b_list - mean_b))*x_test + mean((b_list - mean_b)^2)
mean(E_out)
mean(bias)
mean(var)






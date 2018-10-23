function [ w, e_in,t ] = logistic_reg2( X, y, w_init, max_its, eta )
%LOGISTIC_REG Learn logistic regression model using gradient descent
%   Inputs:
%       X : data matrix (without an initial column of 1s)
%       y : data labels (plus or minus 1)
%       w_init: initial value of the w vector (d+1 dimensional)
%       max_its: maximum number of iterations to run for
%       eta: learning rate
    
%   Outputs:
%       w : weight vector
%       e_in : in-sample error (as defined in LFD)

tolerance = 1e-6; 
w = w_init;
n = size(X);
n = n(1);
cn = zeros(n,1)+1;
X = [cn,X];
num_iteration = 0;
for run = 1:max_its   
    t=run;
    grad = mean(-(y.*X)./(exp(y.*(X*w))+1),1);
    if max(abs(grad))<tolerance
        break;
    end
    num_iteration = num_iteration + 1;
    w = w-eta*grad'; 
end
num_iteration;
e_in = mean(log(1+exp(-y.*(X*w))));
end
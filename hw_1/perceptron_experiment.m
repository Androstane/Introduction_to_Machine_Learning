function [ num_iters, bound_minus_ni] = perceptron_experiment ( N, d, num_samples )
%perceptron_experiment Code for running the perceptron experiment in HW1
%   Inputs: N is the number of training examples
%           d is the dimensionality of each example (before adding the 1)
%           num_samples is the number of times to repeat the experiment
%   Outputs: num_iters is the # of iterations PLA takes for each sample
%            bound_minus_ni is the difference between the theoretical bound
%               and the actual number of iterations
%      (both the outputs should be num_samples long)
num_iters = zeros(num_samples,1);
bound_minus_ni = zeros(num_samples,1);
for i=1:num_samples
    w0 = [0;rand(d,1)];
    x = 2*rand(N,d)-1;
    y = sign(x*w0(2:d+1));
    tmp = zeros(N,1)+1;
    data_in = [tmp,x,y];
    [w,iteration] = perceptron_learn(data_in);
    num_iters(i) = iteration;
    rho = min(abs(w.'*x.'));
    upper_bound = (max(norm(x,2))^2)*(norm(w,2))^2/rho^2;
    bound_minus_ni(i) = upper_bound - iteration; 
end

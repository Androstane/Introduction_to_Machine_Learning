function [ w, iterations ] = perceptron_learn( data_in )
%perceptron_learn Run PLA on the input data
%   Inputs: data_in: Assumed to be a matrix with each row representing an
%                    (x,y) pair, with the x vector augmented with an
%                    initial 1, and the label (y) in the last column
%   Outputs: w: A weight vector (should linearly separate the data if it is
%               linearly separable)
%            iterations: The number of iterations the algorithm ran for
N = size(data_in);
d = N(2)-2;
n = N(1);
x = data_in(:,2:d+1);

y0 = data_in(:,d+2);
w = zeros(d,1);
r = 0.1;
iterations = 0;
while 1

    y = sign(x*w);
    if norm(y0-y) == 0
        break;
    end
    w = w+r*x'*(y0-y);
    iterations = iterations +1;
end
end


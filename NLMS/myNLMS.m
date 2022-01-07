function [w, e, w_list, J] = myNLMS(x, desired, alpha, M, epsilon)
% x   :   input signal
% desired :   desired signal
% alpha   :   step-size
% M   :   order of filter
% w :   filter tap weights
% e :   error vector
% w_list    :   list of filter tap weight updates
% J :   cost function
% epsilon   :   small number to be added to the denominator


N = length(x); w = zeros(M, 1); w_list = zeros(M, N);
for i=M:N
    u = x(i:-1:i-M+1);
    y(i) = w' * u;
    e(i) = desired(i) - y(i);
    w =  w + alpha*e(i)*u/(u'*u + epsilon);
    w_list(:, i) = w;
end
J = e.^2;


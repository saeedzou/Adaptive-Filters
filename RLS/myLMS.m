function [w, e, w_list, J] = myLMS(x, desired, alpha, M)
% x   :   input signal
% desired :   desired signal
% alpha   :   step-size
% M   :   order of filter
% w :   filter tap weights
% e :   error vector
% w_list    :   list of filter tap weight updates
% J :   cost function


N = length(x); w = zeros(M, 1); w_list = zeros(M, N);e=zeros(N,1);
for i=M:N
    u = x(i:-1:i-M+1);
    y = w' * u;
    e(i) = desired(i) - y;
    w =  w + alpha*e(i)*u;
    w_list(:, i) = w;
end
J = e.^2;


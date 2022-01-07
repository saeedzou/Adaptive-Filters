function [w, e, w_list, J] = myRLS(x, desired, lambda, M)
% x   :   input signal
% desired :   desired signal
% M   :   order of filter
% w :   filter tap weights
% e :   error vector
% w_list    :   list of filter tap weight updates
% J :   cost function
% lambda : forgetting factor


N = length(x); w = zeros(M, 1); w_list = zeros(M, N);delta=1e-10;P=delta*eye(M);e=zeros(N,1);
for i=M:N
    u = x(i:-1:i-M+1);
    y = w' * u;
    k = (P*u)/(lambda + u'*P*u);
    e(i) = desired(i) - y;
    w =  w + k*e(i);
    P = (P - k*u'*P)/lambda;
    w_list(:, i) = w;
end
J = e.^2;


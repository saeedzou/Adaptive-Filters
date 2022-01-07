function [w, e, w_list, J] = myVSLMS(x, desired, mu_min, mu_max, M, ro)
% x   :   input signal
% desired :   desired signal
% alpha   :   step-size
% M   :   order of filter
% w :   filter tap weights
% e :   error vector
% w_list    :   list of filter tap weight updates
% J :   cost function
% ro    :   increment multiplier in VSLMS


N = length(x); w = zeros(M, 1); w_list = zeros(M, N);g = zeros(M,N);alpha=mu_max.*ones(M, N);

for i=M:N
    u = x(i:-1:i-M+1);
    y(i) = w' * u;
    e(i) = desired(i) - y(i);
    for j=1:M
        g(j, i) = e(i) * u(j);
        if sign(g(j, i))==sign(g(j, i-1))
            alpha(j, i) = ro * alpha(j, i-1);
        else
            alpha(j, i) = alpha(j, i-1)/ro;
        end
        if alpha(j, i) > mu_max
            alpha(j, i) = mu_max;
        end
        if alpha(j, i) < mu_min
            alpha(j, i) = mu_min;
        end
        w(j) = w(j) + alpha(j, i) * g(j, i);
    end
    w_list(:, i) = w;
end
J = e.^2;


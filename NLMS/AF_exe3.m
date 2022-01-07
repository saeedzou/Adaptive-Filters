% Saeedreza Zouashkiani
% 400206262
clear all; clc
% initial parameters
mu=0.3;N=4;J_estimate=0;fignum=1;
excess_mse = zeros(3,1);

% filtering
a = [1 0.5];
b = [1 -0.9];
u = randn(300, 1);
d = filter(a, b, u);
v = randn(300, 1);

% Trying LMS algorithm for different amplitudes of noise
for gamma = [0, 0.1, 0.3, 1] % noise amplitudes
    d_hat = d + gamma .* v;
    for i=0:5
        [w, ~, ~, J] = myNLMS(u, d_hat, mu, N, 1e-15);
        J_estimate = J_estimate + J;
     end
    figure(fignum);plot(J_estimate);
    title(['Mean square error for filter of order ',num2str(N), ' for step size of ', num2str(mu)]);
    xlabel('Number of iterations');
    fignum = fignum + 1;
    w
end



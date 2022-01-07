% Saeedreza Zouashkiani
% 400206262
clearvars; clc
% initial parameters
lambda=0.9;N=4;J_estimate=0;fignum=1;
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
        [~, ~, ~, J] = myRLS(u, d_hat, lambda, N);
        J_estimate = J_estimate + J;
     end
    figure(fignum);plot(J_estimate);
    title(['Mean square error for filter of order ',num2str(N)]);
    xlabel('Number of iterations');
    fignum = fignum + 1;
end



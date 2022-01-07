% Saeedreza Zouashkiani
% 400206262
% IF YOU RUN THIS M-FILE, IT WOULD PLOT THE MSE ERROR FUNCTION FOR SAID
% GAMMA AND NUMBER OF TAP FILTERS
clearvars; clc
% initial parameters
lambda=0.6;J_estimate=0;fignum=1;

% filtering
h = [1 1.8 0.81];
u = randn(100, 1);
d = filter(h, 1, u);
v = randn(100, 1);
for N=[4 5]
    for gamma=[1 0.1]
        d_hat = d + gamma * v;
        for i=0:5
            [w, ~, ~, J] = myRLS(u, d_hat, lambda, N);
            J_estimate = J_estimate + J;
        end
        figure(fignum);plot(J);fignum=fignum+1;
        title(['Mean square error for filter of order ',num2str(N), ' for gamma of ', num2str(gamma)]);
        xlabel('Number of iterations');
        w
    end
end

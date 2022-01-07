% Saeedreza Zouashkiani
% 400206262
% IF YOU RUN THIS M-FILE, IT WOULD PLOT THE MSE ERROR FUNCTION FOR SAID
% STEP-SIZE AND NUMBER OF TAP FILTERS
clear all; clc
% initial parameters
J_estimate=0;excess_mse = zeros(3,1);fig_num = 1;ro=2;%increment multiplier in VSLMS

% filtering
h = [1 1.8 0.81];
u = randn(100, 1);
d = filter(h, 1, u);


for M = 2:4
    for i=0:5
        [w, ~, ~, J] = myVSLMS(u, d, 1e-6, 1e-1, M, ro);
        J_estimate = J_estimate + J;
    end
    J_estimate = J_estimate/5;
    figure(fig_num);plot(J_estimate);
    fig_num = fig_num +1;
    title(['Mean square error for filter of order ',num2str(M)]);
    xlabel('Number of iterations');
    disp('the final set of coefficients is ')
    w
end

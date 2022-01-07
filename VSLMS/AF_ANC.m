% Saeedreza Zouashkiani
% 400206262
% RUN EACH SECTION AND UNCOMMENT  "sound(e, Fs)" TO LISTEN TO ANC OUTPUT
clear all; clc
%% FIR Filter with unit variance noise
% initial parameters
M = 10;ro=2;
[s, Fs] = audioread("rec.mp3");
% normalizing
s = s - mean(s);
s = s/std(s);

n0 = sqrt(1).*randn(size(s)); % refrence input
Hz = randn(5, 1);
n = filter(Hz, [1], n0);
d = s+n;

[~, e, ~, ~] =  myVSLMS(n0, d, 1e-17, 1e-3, M, ro);
plot(e'-s);
% sound(e, Fs)

%% FIR Filter with a noise of variance 10
n0 = sqrt(10).*randn(size(s)); % refrence input
Hz = randn(5, 1);
n = filter(Hz, [1], n0);
d = s+n;
[~, e, ~, ~] =  myVSLMS(n0, d, 1e-17, 1e-3, M, ro);
figure(2)
plot(e'-s)
% sound(e, Fs)
%% Using IIR filter
n = filter([1 0.5], [1 -0.9], n0);
d = s+n;
[~, e, ~, ~] =  myVSLMS(n0, d, 1e-30, 1e-5, M, ro);
figure(3)
plot(e'-s)
% sound(e, Fs)
% it cannot remove noise in this case, but if we increase the number of
% tap-filters say 50, it would result in a better output (N=10 is not
% enough to cancel the noise)
%% Using IIR filter and increasing M to 50
n = filter([1 0.5], [1 -0.9], n0);
d = s+n;
[~, e, ~, ~] =  myVSLMS(n0, d, 1e-7, 1e-3, 50, ro);
figure(4)
plot(e'-s)
% sound(e, Fs)
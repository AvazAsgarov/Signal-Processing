% Composite Signal Analysis
% This script generates a composite signal made of two cosine waves, visualizes
% it using multiple plotting methods, and computes key statistical measures:
% - Mean
% - Variance
% - Standard Deviation
% - Signal-to-Noise Ratio (SNR)
% - Coefficient of Variation (CV)

clc;
clear;

%% Signal Parameters
f1 = 100;          % Frequency 1 [Hz]
f2 = 200;          % Frequency 2 [Hz]
Fs = 10000;        % Sampling Frequency [Hz]
T = 1 / Fs;        % Sampling Period [s]
t = 0:T:0.05;      % Time Vector [0 to 50 ms]

%% Composite Signal
x = cos(2 * pi * f1 * t) + cos(2 * pi * f2 * t);

%% Signal Visualization
figure();

% 1. Line Plot
subplot(2, 2, 1);
plot(t, x, 'b');
title('Composite Signal - Line Plot');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;

% 2. Stem Plot (Discrete)
subplot(2, 2, 2);
stem(t, x, 'r');
title('Discrete Signal - Stem Plot');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;

% 3. Stairs Plot (Zero-Order Hold)
subplot(2, 2, 3);
stairs(t, x, 'k--');
title('Zero-Order Hold - Stairs Plot');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;

% 4. Bar Plot
subplot(2, 2, 4);
bar(t, x);
title('Bar Plot');
xlabel('Sample Index');
ylabel('Amplitude');
grid on;

%% Statistical Analysis
mean_val = mean(x);
variance_val = var(x);
std_val = std(x);
snr_val = mean_val / std_val;    % Signal-to-Noise Ratio
cv_val = 1 / snr_val;            % Coefficient of Variation

%% Display Results
fprintf('--- Statistical Summary ---\n');
fprintf('Mean: %.4f\n', mean_val);
fprintf('Variance: %.4f\n', variance_val);
fprintf('Standard Deviation: %.4f\n', std_val);
fprintf('Signal-to-Noise Ratio (SNR): %.4f\n', snr_val);
fprintf('Coefficient of Variation (CV): %.4f\n', cv_val);
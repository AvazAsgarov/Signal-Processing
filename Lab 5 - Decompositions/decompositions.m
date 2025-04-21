% SIGNAL_DECOMPOSITIONS
% Lab 5: Signal Decomposition Analysis

clc; clear;

%% Signal Parameters
N = 1000;                           % Increased resolution
t = linspace(-pi, pi, N);           % Time vector [-π, π]
x = 1 + 0.9*cos(8*t) + sin(3*t + 10*t.^2);  % Original signal

%% Impulse Decomposition
impulse_points = [20, 40, 100];     % Selected impulse locations
x_imp = zeros(length(impulse_points), N);

figure('Name', 'Impulse Decomposition', 'Position', [100 100 900 800]);
subplot(4,1,1);
plot(t, x, 'LineWidth', 1.5);
title('Original Signal: x(t) = 1 + 0.9cos(8t) + sin(3t + 10t^2)');
xlabel('Time (rad)'); ylabel('Amplitude'); grid on;

for i = 1:length(impulse_points)
    idx = impulse_points(i);
    x_imp(i,:) = (1:N == idx) .* x(idx);
    
    subplot(4,1,i+1);
    stem(t, x_imp(i,:), 'filled', 'MarkerSize', 4);
    title(sprintf('Impulse at t = %.2f (Sample %d)', t(idx), idx));
    xlabel('Time (rad)'); ylabel('Amplitude'); grid on;
end

%% Step Decomposition
step_points = [10, 40, 100];        % Selected step locations
dx = [0, diff(x)];                  % Signal difference

figure('Name', 'Step Decomposition', 'Position', [200 200 900 800]);
subplot(4,1,1);
plot(t, x, 'LineWidth', 1.5);
title('Original Signal');
xlabel('Time (rad)'); ylabel('Amplitude'); grid on;

for i = 1:length(step_points)
    idx = step_points(i);
    step_comp = dx(idx) * (t >= t(idx));
    
    subplot(4,1,i+1);
    plot(t, step_comp, 'LineWidth', 1.5);
    title(sprintf('Step Component at t = %.2f (Sample %d)', t(idx), idx));
    xlabel('Time (rad)'); ylabel('Amplitude'); grid on;
end

%% Odd-Even Decomposition
x_even = zeros(1,N);
x_odd = zeros(1,N);

for i = 1:N
    j = N + 1 - i;                  % Mirror index
    x_even(i) = (x(i) + x(j))/2;    % Even component
    x_odd(i) = (x(i) - x(j))/2;     % Odd component
end

figure('Name', 'Odd-Even Decomposition', 'Position', [300 300 900 600]);
subplot(3,1,1);
plot(t, x, 'LineWidth', 1.5); title('Original Signal'); grid on;

subplot(3,1,2);
plot(t, x_odd, 'LineWidth', 1.5); title('Odd Component'); grid on;

subplot(3,1,3);
plot(t, x_even, 'LineWidth', 1.5); title('Even Component'); grid on;

%% Interlaced Decomposition
x_odd_idx = zeros(1,N);
x_odd_idx(1:2:end) = x(1:2:end);    % Odd-indexed samples

x_even_idx = zeros(1,N);
x_even_idx(2:2:end) = x(2:2:end);   % Even-indexed samples

figure('Name', 'Interlaced Decomposition', 'Position', [400 400 900 600]);
subplot(3,1,1);
plot(t, x, 'LineWidth', 1.5); title('Original Signal'); grid on;

subplot(3,1,2);
stem(t, x_odd_idx, 'filled', 'MarkerSize', 3); 
title('Odd-Indexed Components'); grid on;

subplot(3,1,3);
stem(t, x_even_idx, 'filled', 'MarkerSize', 3); 
title('Even-Indexed Components'); grid on;
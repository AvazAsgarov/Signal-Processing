clc; clear;

% Parameters
f_max = 1e3;             % Signal frequency (1 kHz)
cycles = 8;              % Number of cycles
f_sampling = 1e6;        % High sampling rate for continuous-like signal
t_end = cycles / f_max;  % Total time to cover 8 cycles

% Time vector for continuous-like signal
t = 0: 1 / f_sampling : t_end;
x = sin(2 * pi * f_max * t);  % Continuous-like signal

% Proper Sampling: f_sampling1 > 2 * f_max (Nyquist satisfied)
f_sampling1 = 2.5 * f_max;
t1 = 0: 1 / f_sampling1 : t_end;
x1 = sin(2 * pi * f_max * t1);

% Improper Sampling: f_sampling2 < 2 * f_max (Nyquist violated)
f_sampling2 = 1.5 * f_max;
t2 = 0 : 1 / f_sampling2 : t_end;
x2 = sin(2 * pi * f_max * t2);   

% === Plotting ===
figure;

% Plot 1 - Continuous-like Signal
subplot(3, 1, 1);
plot(t, x, 'b'); title("Continuous-like Signal"); xlabel("Time (s)"); ylabel("Amplitude"); grid on;

% Plot 2 - Properly Sampled Signal
subplot(3, 1, 2);
plot(t, x, 'b');
hold on;
stem(t1, x1, 'r');
title("Proper Sampling");
xlabel("Time (s)"); ylabel("Amplitude");
grid on;

% Plot 3 - Improperly Sampled Signal 
subplot(3, 1, 3);
plot(t, x, 'b');
hold on;
stem(t2, x2, 'm');
title("Improper Sampling");
xlabel("Time (s)"); ylabel("Amplitude");
grid on;
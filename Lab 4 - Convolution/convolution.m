% CONVOLUTION_DEMO
% Lab 4: Convolution of Sinusoidal Signal with Triangular Pulse

clc; clear; 

%% Parameters
step = 0.01;        % Time resolution (s)
t_total = 5;        % Total simulation time (s)
t_impulse = 2;      % Impulse response duration (s)

%% Signal Generation
t = 0:step:t_total;                     % Time vector
x = sin(2*pi*t);                        % Input signal (sine wave)

% Triangular impulse response
t1 = 0:step:t_impulse;                  % Active portion
t2 = (t_impulse+step):step:t_total;     % Zero portion
h1 = 1 - abs(t1 - 1);                   % Triangle function
h2 = zeros(size(t2));
h = [h1, h2];                           % Complete impulse response

%% Convolution Operation
y = conv(x, h) * step;                  % Numerical convolution
ty = 0:step:(length(y)-1)*step;         % Output time vector

%% Enhanced Visualization
figure('Name', 'Convolution Demo', 'Position', [100 100 1200 800]);

% Input Signal x(t)
subplot(3,1,1);
plot(t, x, 'b', 'LineWidth', 1.5);
title('Input Signal: x(t) = sin(2πt)');
xlabel('Time (s)'); ylabel('Amplitude');
xlim([0 t_total]); grid on;

% Impulse Response h(t)
subplot(3,1,2);
plot(t, h, 'r', 'LineWidth', 1.5);
title('Impulse Response: h(t) (Triangular Pulse)');
xlabel('Time (s)'); ylabel('Amplitude');
xlim([0 t_total]); grid on;

% Convolution Result y(t)
subplot(3,1,3);
plot(ty, y, 'g', 'LineWidth', 1.5);
title('Convolution Result: y(t) = x(t)*h(t)');
xlabel('Time (s)'); ylabel('Amplitude');
xlim([0 t_total*2]); grid on;
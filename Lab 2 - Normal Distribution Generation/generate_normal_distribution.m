% Normal Distribution Generation from Uniform Signals
% Two Methods: Signal Summation and Box-Muller Transform

clc; clear;

%% Parameters
N = 12800;       % Number of samples
mu = 50;         % Target mean
sigma = 3;       % Target standard deviation
num_iterations = 12; % Number of uniform signals to sum

%% Method 1: Summing Uniform Signals
x_sum = zeros(1, N);

% Create figure for summation process
figure();
for i = 1:num_iterations
    x_sum = x_sum + rand(1, N);  % Sum uniform signals
    
    subplot(4, 3, i);
    histogram(x_sum, 200);
    title(["Iteration:", num2str(i)]);
    grid on;
end

%% Normalization - Method 1
x_normal1 = (x_sum - 6) * sigma + mu;

% Plot results for Method 1
figure();
subplot(2, 1, 1);
plot(x_normal1(1:100));
title('First 100 Samples (Summation Method)');
grid on;

subplot(2,1,2);
histogram(x_normal1, 200, 'FaceColor', [0.8 0.2 0.2]);
title('Final Distribution (Summation Method)');
grid on;

%% Method 2: Box-Muller Transform
R1 = rand(1, N);
R2 = rand(1, N);

% Generate standard normal distribution
x = sqrt(-2 * log(R1)) .* cos(2 * pi * R2);

x_normal2 = x * sigma + mu;

% Plot results for Method 2
figure();
subplot(2,1,1);
plot(x_normal2(1:100)); 
title('First 100 Samples (Box-Muller Method)');
grid on;

subplot(2,1,2);
histogram(x_normal2, 200);
title('Final Distribution (Box-Muller Method)');
grid on;
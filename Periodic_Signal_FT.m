T = 8;                      % Period
w0 = 2*pi/T;           % Fundamental frequency
t = -8:0.01:8;          % Time vector
NH = 900;               % Number of harmonics
% x(t)
x = zeros(size(t));
x(abs(t) < 1) = 2;                              % x(t) = 2 for |t| < 1
x(abs(t) >= 1 & abs(t) < 2) = 1;        % x(t) = 1 for 1 <= |t| < 2
% Fourier coefficients
a0 = 3/4;                               % DC term
a_k = zeros(1, NH);
for k = 1:NH
   a_k(k) = (1/(k*pi)) * (sin(k*pi/4) + 0.5*sin(k*pi/2));
end
% Display coefficients
fprintf('Fourier Series Coefficients:\n');
fprintf('a0 = %.4f\n', a0);
disp('First 10 a_k coefficients:');
for k = 1:10
   fprintf('a_%d = %.6f\n', k, a_k(k));
end
% Reconstruct signal
x_hat = a0 * ones(size(t));
for k = 1:NH
   x_hat = x_hat + 2*a_k(k)*cos(k*w0*t);
end
% Plot
figure;
plot(t, x_hat, 'b', 'LineWidth', 1.5); hold on;
plot(t, x, 'r--', 'LineWidth', 1.2);
xlabel('t');
ylabel('x(t), x̂(t)');
title('Reconstruction of x(t) using Fourier Series (Number of Harmonics = 900)');
legend('Reconstructed x̂(t)', 'Original x(t)');
grid on;

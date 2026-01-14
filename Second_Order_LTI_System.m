% time vector
t = 0:0.01:20;
% Impulse response
h = 3*exp(-2*t).*sin(t);  
figure;
plot(t, h, 'linewidth', 1.4);
xlabel('t (s)');
ylabel('h(t)');
title('Impulse response h(t) = 3 e^(-2t) sin t');
grid on;
% Input x(t) = e^{-t} u(t)
x = exp(-t);
% Analytic output
y_analytic = (3/2)*exp(-t) - (3/2)*exp(-2*t).*(cos(t)+sin(t));
% Numeric convolution (discrete approximation)
y_conv_full = 0.01 * conv(h, x);          % convolution integral approximation
y_conv = y_conv_full(1:length(t));      % keeping the same length
% Plot outputs
figure;
plot(t, y_conv, 'linewidth', 1.4);
hold on;
plot(t, y_analytic, '  ', 'linewidth', 1.2);
xlabel('t (s)');
ylabel('y(t)');
title('Output y(t) for x(t)=e^{-t}u(t)');
grid on;

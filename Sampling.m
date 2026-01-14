% Case (1)
dt = 0.05;
t = -10:dt:10;
x1 = sin(5*t) + cos(10*t);
x = x1;
% CTFT approximation
X = fft(x)*dt;
X = fftshift(X);
Nw = length(X);
k = -(Nw-1)/2 : 1 : (Nw-1)/2;
w = k*2*pi/(Nw*dt);    
figure
subplot(211);
plot(t,x);
grid
xlabel('t');
title('x(t) = x_1(t)')
subplot(212);
plot(w, abs(X));
grid
xlabel('\omega');
title('|X(j\omega)|')
%Case 2
dt = 0.05;
t = -10:dt:10;
x1 = sin(5*t) + cos(10*t);
u = double(t >= 0);
x2 = exp(-2*t).*u;
x = x1.*x2;
% CTFT approximation
X = fft(x)*dt;
X = fftshift(X);
Nw = length(X);
k = -(Nw-1)/2 : 1 : (Nw-1)/2;
w = k*2*pi/(Nw*dt);    
figure
subplot(211);
plot(t,x);
grid
xlabel('t');
title('x(t) = x_1(t) \times x_2(t)')
subplot(212);
plot(w, abs(X));
grid
xlabel('\omega');
title('|X(j\omega)|')

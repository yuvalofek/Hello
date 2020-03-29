%Yuval Epstain Ofek - MATLAB HW 6
clear
close all
clc
%%
close all;
%%%Problem 1
%%%a. storing as variables:
nums = [ 2/7, 2/3, 0.5];
dens = [ .5, 0, 1/3, 2];

%Finding zeros and poles
[zeros,poles, ~] = tf2zp (nums, dens);

%plotting
figure
zplane(zeros, poles)
title('H(z) pole-zero plot')


%%%b. first 50 points of the impulse response
[IR, n] = impz(nums, dens, 50);

%Plotting impulse response
figure
stem(n, IR)
title('Impulse Response')
xlabel('n')
ylabel('h[n]')
grid on


%%%c. getting x[n] for n = 0 to 99 
xn = (3/4).^(0:99);
[xIR, n2] = impz(nums, dens, 100); %need more values now
%Method 1, using the filter function 
y = filter(nums, dens, xn);

%plotting method 1
figure
subplot(2,1,1)
stem(n2, y)
title('Application of H to x using Filter function');
xlabel('n');
ylabel('y1[n]');

%d. Method 2, convolutions
y2 = conv(xIR, xn);
y2 = y2(1:100);

%Plotting method 2
subplot(2,1,2)
stem(n2, y)
title('Application of H to x using convolution with the impulse response');
xlabel('n');
ylabel('y2[n]');


%%
%%%Problem 2
clear
%Generating the fibbonacci numbers 1 to 100
fib = zeros(1,100);
fib([1,2]) = 1;
for n = 3:100
    fib(n) = fib(n-1) + fib(n-2);
end

%Plotting fib using semilogy
figure
semilogy(fib)
title('First 100 values of the Fibonacci sequence')
xlabel('n')
ylabel('Fibonacci(n)')
%Input
xn = (3/4).^(0:99);

%Output
y = conv(fib, xn)
y = y(1:100)
%Plotting output
figure;
stem(0:99, y)
title('Fibbonacci sequence convolution with x[n]')
xlabel('n');
ylabel('y3[n]');

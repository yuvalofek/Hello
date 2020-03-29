%Yuval Epstain Ofek - MATLAB assignment 4:
clear;
close all; 
clc;
%Want to thank Michael Lendino for helping me with the isOrthonormal
%funtion
%%
close all;
clear;
%%% Testing: 
%%%NOTE: This will run a number of tests using a loop

n = 5; % number of vectors equals vector length (denote #=l)
m = 3; % number of vectors < vector length (denote #<l)

vector = rand (n,1);                    %Generates a complex vector
Mat = rand(n,n)+ 1j*rand(n,n);          %Generates complex matrix s.t. #=l
Mat2 = rand(n,m)+ 1j*rand(n,m);         %Generates complex matrix s.t. #<l  
GS = gramSchmidt(Mat);                 
GS2 = gramSchmidt(Mat2);  
Check = isOrthonormal(GS);
Check2 = isOrthonormal(GS2);
proj1 = orthoProj(vector, GS);          %Finds projection onto the span of the orthonormal set
error1 = norm(abs(proj1 - vector))      %Calculates error in the projection
proj2 = orthoProj(vector, GS2);         
error2 = norm(abs(proj2 - vector))             

%%%Looking through at the errors, it is obvious that the closer the # of vectors 
%%%is to the vector length, the closer the approximation is to the
%%%vector.



%%
close all;
%Sampling for sine and mu values
SampNum = 50;
spl = linspace(0,2*pi,SampNum);
sinS = sin(spl);
mu = linspace(0, 2*pi, 5);

%Generating points
[X,Y] = ndgrid(spl, mu);
gauss = 1/(sqrt(2*pi))*exp(-(X-Y).^2);   %Columns represent each curve

%Plotting
figure;
plot(spl, sinS, spl, gauss(:,1), spl, gauss(:,2), spl, gauss(:,3), spl, gauss(:,4), spl, gauss(:,5))
legend('Sine', 'Gaussian with \mu = \pi/2', 'Gaussian with \mu = \pi', 'Gaussian with \mu = 3\pi/2', 'Gaussian with \mu = 2\pi')
xlabel('x')
ylabel('f(x)')
title('Plot of the Sinusoid and Gaussian Curves (\sigma = 1)')
grid on
xticks(linspace(0, 2*pi, 5))
xticklabels({'0','\pi/2','\pi', '3\pi/2','2\pi'})
xlim([0, 2*pi])

%Finding orthonormal set and projection
orth = gramSchmidt(gauss);
estimate = orthoProj(sinS.', orth).';

%Plotting
figure;
subplot(2,1,1)
plot(spl, sinS, 'DisplayName', 'sin(x)')
hold on;
plot(spl, estimate.', 'DisplayName', 'sine estimate')
legend('show')
grid on
title('Estimated Sine Function Plotted Alongside a Sine Function')
xlabel('x')
ylabel('f(x)')
xticks(linspace(0, 2*pi, 5))
xticklabels({'0','\pi/2','\pi', '3\pi/2','2\pi'})
xlim([0, 2*pi])

%plotting again
subplot(2,1,2)
plot(spl, orth(:,1).', spl, orth(:,2).',spl, orth(:,3).', spl, orth(:,4).', spl, orth(:,5).' )
grid on
title('Orthonormal Basis Functions Used in Estimation')
xlabel('x')
ylabel('f(x)')
xticks(linspace(0, 2*pi, 5))
xticklabels({'0','\pi/2','\pi', '3\pi/2','2\pi'})
xlim([0, 2*pi])

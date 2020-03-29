%Yuval Epstain Ofek - MATLAB assignment 2:
clear;
close all; 
clc;
%%
%%%QUESTION 1:
%In this problem you will explore the use of MATLAB to approximate derivatives and integrals.
%Create two vectors of length 100 and 1000, each containing evenly spaced samples of the sine
%function over one period.

Hundred= linspace(0, 2*pi, 100);
Thousand = linspace(0, 2*pi, 1000);

VSineH = sin(Hundred);
VSineT = sin(Thousand);

%• Approximate the derivatives of both vectors by taking the differences of adjacent elements
%and dividing by the spacing between them.

%%%Estimating the derivatives
dsinHdx = diff(VSineH)./diff(Hundred);
dsinTdx = diff(VSineT)./diff(Thousand);

%• You now have length 99 and 999 approximations to some other function; what is it? Find out
%how well you approximated the values of this function by creating length 99 and 999 vectors of
%evenly spaced samples over the same interval, and compute the respective differences. Find the
%maximum of the absolute value of these differences; which is a better estimate? The answer
%had better not surprise you!

%%%function is cosine
%%%Creating the cosine approximation vectos
ninetynine =  linspace(0, 2*pi, 99);
nineHninetynine =  linspace(0, 2*pi, 999);
cos99 = cos(ninetynine);
cos999= cos(nineHninetynine);
%%%Finding error values
maxdiff99 = max(abs(cos99 - dsinHdx));
maxdiff999 = max(abs(cos999 - dsinTdx));
%%% The thousand element approximation is better!!

%• Now approximate the integrals of your original vectors using both cumtrapz and cumsum,
%yielding 4 approximations for the integral of the sine function. As with above, compare the
%error values to the analytic integral of the sine over one period; it will be pretty clear if you’ve
%made an error.

%%%Creating Sum Vectors
SumSin99 = cumsum(VSineH);
SumSin999 = cumsum(VSineT);
TrapzSin99 = cumtrapz(VSineH);
TrapzSin999 = cumtrapz(VSineT);
%%%Approximating the integrals
IntSinSum99 = SumSin99(1:end-1)*(2*pi/100);
IntSinSum999 = SumSin999(1:end-1)*(2*pi/1000);
IntSinTrapz99 = TrapzSin99(1:end-1)*(2*pi/100);
IntSinTrapz999 = TrapzSin999(1:end-1)*(2*pi/1000);
%%%Finding error differences
maxErrorSum99 = max(abs(cos99 + IntSinSum99));
maxErrorSum999 = max(abs(cos999 + IntSinSum999));
maxErrorTrapz99 = max(abs(cos99 + IntSinTrapz99));
maxErrorTrapz999 = max(abs(cos999 + IntSinTrapz999));

%• Plot your better approximation for the derivative. Give the plot a title.
figure;
plot(nineHninetynine , dsinTdx)
title('Best Derivative')

%%
%%%Question 2
%Perform the following matrix operations:
%• Use reshape to create a 10 × 10 matrix A 
a = linspace(1,100);
A = reshape(a, [10,10]);
%• Flip the second column of B such that the column is inverted up down.
A(:,2) = flipud(A(:,2));
%• Flip the matrix A from left to right.
A = fliplr(A);
%• Make a vector that is the the column-wise sum of every column of A. The result should be
%a row vector.
AColSum = sum(A);
%• Make a vector that is the row-wise mean of every row of A. The result should be a column
%vector.
ARowMean = mean(A,2);
%• Delete the last column of A
A(:,10)= [];
%%
%%%Question 3
%3. Generate a 300 × 500 matrix with entries () using the following methods and use tic
%toc to time the speed of each and write a comment noting the order of the speeds of these methods.
%You will have to find out, using doc, Google, or frantically messaging me, how tic toc works.
%• Using for loops and no pre-allocation.
N = 300;
M = 500;

tic
for i = 1:N
    for j = 1:M
        A(i,j) = (i^2+j^2)/(i+j+3);
    end
end
time1 = toc

%• Using for loops and pre-allocating memory with zeros.
A2 = zeros(N,M);
tic
for i = 1:N
    for j = 1:M
        A2(i,j) = (i^2+j^2)/(i+j+3);
    end
end
time2 = toc


%• Using only elementwise matrix operations. Note: repmat and meshgrid will be useful here.
x = 1:500;
y = 1:300;
[X,Y] = meshgrid(x,y);

tic
Den = X+Y+3;
A3 = (X.*X+Y.*Y)./(Den);
time3 = toc

%%%Speeds from fastest to slowest: Matrices, Pre-allocation and for loops, and
%%%just a for loop. 


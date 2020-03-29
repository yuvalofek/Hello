%Yuval Epstain Ofek - MATLAB assignment 3:
clear;
close all; 
clc;
%%
%%%Question 1
%This question guides you through some basic image processing techniques
%in MATLAB. You will create interesting images with relational and logical indexing, as well as the
%imshow function to visualize what you have created.
%• Create a 100 × 100 A where its contents are all ones.
A = ones(100,100);
%• Create a 100 × 100 B where its contents are all zeros.
B = zeros(100, 100); 
%• In matrix A, set the values of entry ai,j equal to 0 if relationship true
%meshgrid would be useful in creating the indices.
Hundy = 1:100;
[I,J] = meshgrid(Hundy);
RAD = 50;
Expr = (((I-RAD).^2 + (J-RAD).^2).^0.5);
A( Expr <20)= 0;

%• In matrix B, set the values of entry ai,j equal to 1 if expr true
RAD2 = 40;
Expr2 = (((I-RAD2).^2 + (J-RAD2).^2).^0.5);
B(Expr2 < 20) = 1;

%• Visualize the following results with figure and imshow. Describe each of the results with one
%sentence each.
%– A
figure;
imshow(A)
title('1. A: Black at the coordinate (i,j) if ((i-50)^2 + (j-50)^2)^0.5 > 20, otherwise white.')
%– B
figure;
imshow(B)
title('2. B: White at the coordinate (i,j) if ((i-40)^2 + (j-40)^2)^0.5 > 20, otherwise black.')
%– Intersection between A and B
A = logical(A);
B = logical(B);
AIntB = and(A, B);
figure;
imshow(AIntB)
title('3. The intersection of A and B')
%– Union between A and B
AUB = or(A,B);
figure;
imshow(AUB)
title('4. The union of A and B')
%– Complement of intersection between A and B
figure;
imshow(~AIntB)
title('5. The complement of the intersection of A and B')
%– Complement of union between A and B
figure;
imshow(~AUB)
title('6. The complement union of A and B')

%%
%%%Question 2
%2.  Write a function to return the value and index of a number in a vector / matrix that 
%is closest to a desired value. The function should be called as [val, ind] =
%f indClosest(x, desiredV alue). This function can be accomplished in less than five lines. You will
%find abs, min and/or find useful, Hint: You may have some trouble using min when x is a matrix.
%To convert the matrix to a vector, you can use y = x(:). Show that it works by finding the value
%closest to 3/2 (and index of said value) in sin( linspace(0,5,100) ) + 1.

set = sin( linspace(0,5,100) ) + 1;
[value, index] = findClosest(set, 3/2);

%%
%%%Question 3
close all; 
interval = linspace(-2*pi, 2*pi, 1001);
sample = sinc(interval);

%plotting
figure;
plot(interval, sample)

%Function Zeros
Zeros = findZero(sample);
xRoots = interval(Zeros);
yRoots = sample(Zeros);
%Plotting
hold on;
plot(xRoots, yRoots, 'ko')

%%%Function derivative and plotting
dsincdx = diff(sample)./diff(interval);
dZeros = findZero(dsincdx);
dxRoots = interval(dZeros);
dyRoots = sample(dZeros);

hold on;
plot(dxRoots, dyRoots, '*r')





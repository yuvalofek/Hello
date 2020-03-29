%Homework 1- ECE210A: Yuval Epstain Ofek
%%
%Question 1: Creating the four scalars
nat = log(9);
trigy = asin(exp(-9)) * 10^4;
loggy = log10(2*pi/9);
imaginy = 9 + 1j;

% making the column vector
colvect = [nat; trigy; loggy; imaginy];
%%
%Question 2: computing different 
real_imaginy = real(imaginy);
imaginary_imaginy = imag(imaginy);
magnitude_imaginy = abs(imaginy);
phase_imaginy = angle(imaginy);

rowvect_imaginy = [real_imaginy, imaginary_imaginy, magnitude_imaginy, phase_imaginy];

%%
%Question 3: Multiplying the vectors
 row_col = rowvect_imaginy * colvect;
 col_row = colvect * rowvect_imaginy;
 
 %%
 %Question 4: Transpose row vector (no transpose conjugate) and find
 %elementwise product. Use repmat to create a 4x4 matrix with columns
 %being this vector
 
 rowvect_imaginyT = rowvect_imaginy.';
 elem_product = rowvect_imaginyT .* colvect;
 repmat_matrix = repmat(elem_product, 1, 4);
 
 %%
 %Question 5: matrix stuff
 mmult1 = col_row*repmat_matrix;
 mmult2 = repmat_matrix*col_row;
 elem_mmult = col_row.*repmat_matrix;
 adj1 = repmat_matrix';
 adj2 = col_row';
 inv_sum_identity1 = (repmat_matrix+eye(4))^(-1);
 inv_sum_identity2 = (col_row+eye(4))^(-1);
 sq1 = repmat_matrix^2;
 sq2 = col_row^2;

 %%
 %Question 6: numberline things
n = fix(row_col);
new_vect1 = linspace(1, n, 1000);
new_vect2 = 1: 0.1:n;


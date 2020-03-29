function [ortho] = isOrthonormal(Matrix)
%Function Checks if the columns of a given matrix are orthogonal. 

%%%Assume matrix orthogonal, thus the product with its conjugate transpose
%%%should be the identity matrix. 
%%%Taking difference should yield some matrix approximately equal to the
%%%zero matrix.
Diff =  (Matrix*Matrix') - eye(size(Matrix, 1));
%%%To make this into one quantity we simply take the norm along both
%%%columns and rows:
redDiff = norm(vecnorm(Diff));
%%% Threashold using eps:
ortho = redDiff < 25000*eps;
    
end

function [Estimation] = orthoProj(vector, Others)
%Function projects the vector onto the space of the orthonormal vectors,
%which come in the form of a matrix with the columns being vectors.
%   
ColNum = size(Others, 2);   %%%Determmine how many vectors there are in Others

vect=vector(:);              %%%Ensure vector is in the right format
Coef = zeros(ColNum,1);
for i = 1:ColNum
    Coef(i) =  sum(vector.*conj(Others(:,i)));
end
Estimation = Others * Coef;
end


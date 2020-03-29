function [OMatrix] = gramSchmidt(Matrix)
%Function Gram Schmidts a matrix with each column being a vector

%%%Determining input size and generating output matrix
[m,n] = size(Matrix);
psy = zeros(m,n);       %%Psy stores the orthogonalized vectors, just in case those will be needed
OMatrix = zeros(m,n);

OMatrix(:,1) = Matrix(:,1)/norm(Matrix(:,1)); %Gets the first vector normalized

for j = 2:n
    psy(:,j) = Matrix(:,j); %%%Obtain a vector 
    for i = 1:j-1  %Loops on previous vectors
        psy(:,j) = psy(:,j) - sum(Matrix(:,j).*conj(OMatrix(:,i)))*OMatrix(:,i);    %Subtracts proj onto prev vectors
    end
    OMatrix(:,j) = psy(:,j)/norm(psy(:,j)); %normalizes
end
end


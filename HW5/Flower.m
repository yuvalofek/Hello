%Yuval Epstain Ofek - MATLAB HW 5
classdef Flower
    %Class as required by the HW: Flower class, you should have the
    %following properties – petalWidth (double), petalLength(double), 
    %sepalWidth(double), sepalLength(double) and species(char)
    
    properties
        petalWidth
        petalLength
        sepalWidth
        sepalLength
        species
    end
    
    methods
        function obj = Flower(pW,pL, sW, sL, spe)
            %Class Constructor
            if nargin > 0
                obj.petalWidth = pW;
                obj.petalLength = pL;
                obj.sepalWidth = sW;
                obj.sepalLength = sL;
                obj.species = spe;
            else
                error('Need Input, 4 doubles and a char')
            end
        end
        function SLength = getSLength(obj)
            %returns the sepal length
            SLength = obj.sepalLength;
        end
        function report(obj)
            %Prints out flower info
            fprintf('The length and width of its sepal are %g cm and %g cm \nrespectively, while the length and width of its petal are %g cm \nand %g cm respectively. It belongs to the %s species.\n\n', obj.sepalLength, obj.sepalWidth, obj.petalLength, obj.petalWidth, obj. species)
        end
    end
end


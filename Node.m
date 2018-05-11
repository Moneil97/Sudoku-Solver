classdef Node < handle
    
    properties
        isSolved
        value
        possibleValues
    end
    
    methods
        %constructor
        function obj = Node(val)
            if nargin == 0
                obj.isSolved = 0;
                obj.value = 0;
            else
                obj.isSolved = 1;
                obj.value = val;
            end
        end
    end
end

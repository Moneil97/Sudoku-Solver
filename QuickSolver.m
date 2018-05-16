classdef QuickSolver
    %QUICKSOLVER Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
    end
    
    methods
        %constructor
        function obj = QuickSolver()
        end
        
        function start(~, numFields, nodes)
            contin = 1;
            while contin
                contin = 0;
                if findNodesWithOneValue(numFields, nodes)
                    contin = 1;
                end

                if findValuesWithOnePossibleNode(numFields, nodes)
                    contin = 1;
                end
            end
        end
    end
end

function modified = findNodesWithOneValue(numFields, nodes)
    modified = 0;
    for r = 1:9
        for c = 1:9
            if ~nodes(r,c).isSolved && length(nodes(r,c).possibleValues) == 1
                disp("node(" + r + "," + c + ") = " + nodes(r,c).possibleValues(1));
                nodes(r,c).value = nodes(r,c).possibleValues(1);
                nodes(r,c).isSolved = 1;
                deleteFromPossibilities(nodes, r, c, nodes(r,c).value);
                modified = 1;
                numFields(9*(r-1)+c).Value = nodes(r,c).value;
            end
        end
    end
end

function modified = findValuesWithOnePossibleNode(numFields, nodes)
    modified = 0;

    %check each row
    for r = 1:9
        %count number of nodes each value is possible in
        count = zeros(1,9);
        index = zeros(1,9); %stores col of last counted value
        for c = 1:9
            if ~nodes(r,c).isSolved
               for i = nodes(r,c).possibleValues
                   count(i) = count(i)+1;
                   index(i) = c;
               end
            end
        end

        %if any col has only one place for a value, then that value must go there
        for i = 1:9
            if count(i) == 1
                modified = 1;
                disp("only place for " + i + " is nodes(" + r + "," + index(i) + ")");
                nodes(r,index(i)).value = i;
                nodes(r,index(i)).isSolved = 1;
                deleteFromPossibilities(nodes, r, index(i), i);
                numFields(9*(r-1)+index(i)).Value = nodes(r,index(i)).value;
            end
        end
    end

    %check each col
    for c = 1:9
        %count number of nodes each value is possible in
        count = zeros(1,9);
        index = zeros(1,9); %stores row of last counted value
        for r = 1:9
            if ~nodes(r,c).isSolved
               for i = nodes(r,c).possibleValues
                   count(i) = count(i)+1;
                   index(i) = r;
               end
            end
        end

        %if any row has only one place for a value, then that value must go there
        for i = 1:9
            if count(i) == 1
                modified = 1;
                disp("only place for " + i + " is nodes(" + index(i) + "," + c + ")");
                nodes(index(i), c).value = i;
                nodes(index(i), c).isSolved = 1;
                deleteFromPossibilities(nodes, index(i), c, i);
                numFields(9*(index(i)-1)+c).Value = nodes(index(i),c).value;
            end
        end
    end

    %check each square
    for rSquare = 0:2
        for cSquare = 0:2
            count = zeros(1,9);
            index = zeros(2,9);

            for r = 1+rSquare*3:3+rSquare*3
                for c = 1+cSquare*3:3+cSquare*3
                    if ~nodes(r,c).isSolved
                        for i = nodes(r,c).possibleValues
                            count(i) = count(i)+1;
                            index(1,i) = r;
                            index(2,i) = c;
                        end
                    end
                end
            end

            %if any square has only one place for a value, then that value must go there
            for i = 1:9
                if count(i) == 1
                    modified = 1;
                    disp("only place for " + i + " is nodes(" + index(1,i) + "," + index(2,i) + ")");
                    nodes(index(1,i), index(2,i)).value = i;
                    nodes(index(1,i), index(2,i)).isSolved = 1;
                    deleteFromPossibilities(nodes, index(1,i), index(2,i), i);
                    numFields(9*(index(1,i)-1)+index(2,i)).Value = nodes(index(1,i), index(2,i)).value;
                end
            end
        end
    end

end

function deleteFromPossibilities(nodes, row, col, value)

    %delete from row
    for c = 1:9
        remove(nodes, row, c, value);
    end

    %delete from cols
    for r = 1:9
        remove(nodes, r, col, value);
    end

    %delete from square
    rSquare = floor((row-1)/3);
    cSquare = floor((col-1)/3);

    for r = 1+rSquare*3:3+rSquare*3
        for c = 1+cSquare*3:3+cSquare*3
            remove(nodes, r, c, value);
        end
    end

end

function remove(nodes, r, c, value)
    pv = nodes(r, c).possibleValues;
    nodes(r, c).possibleValues = pv(pv ~= value); %removes value from possibleValues
end

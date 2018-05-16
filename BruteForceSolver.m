classdef BruteForceSolver
    %BRUTEFORCESOLVER Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
    end
    
    methods
        function obj = BruteForceSolver()
        end
        
        function start(~, numFields, nodes)
            total = 1;
            bruteForceNeeded = 0;
            for r = 1:9
                for c = 1:9
                    if ~nodes(r,c).isSolved
                        total = total * length(nodes(r,c).possibleValues);
                        bruteForceNeeded = 1; 
                    end
                end
            end

            disp("total combinations: " + total);

            if bruteForceNeeded
                count = 0;
                while true
                    count = count +1;
                    if mod(count,10000) == 0
                        disp(count);
                    end
                    %increment first node
                    nodes(1,1).inc(nodes, 1, 1);
                    %check solution
                    if testBruteForceSolution(nodes)
                        disp("found a solution");
                        break;
                    end
                end

                %put values into GUI
                for r = 1:9
                    for c = 1:9
                        if ~nodes(r,c).isSolved
                            disp("node(" + r + "," + c + ") = " + nodes(r,c).possibleValues(nodes(r,c).currentIndex));
                            nodes(r,c).value = nodes(r,c).possibleValues(nodes(r,c).currentIndex);
                            nodes(r,c).isSolved = 1;
                            numFields(9*(r-1)+c).Value = nodes(r,c).value;
                        end
                    end
                end
            end
        end
        
    end
end


function valid = testBruteForceSolution(nodes)

    valid = 1;

    %test rows
    for r = 1:9
        if testBruteForceRow(nodes, r) == 0
            valid = 0;
            return;
        end
    end
    
    %test cols
    for c = 1:9
        if testBruteForceCol(nodes, c) == 0
            valid = 0;
            return;
        end
    end
    
    %test squares
    for r = 1:3:7
        for c = 1:3:7
            if testBruteForceSquare(nodes, r , c) == 0
                valid = 0;
                return;
            end
        end
    end
    
end

function valid = testBruteForceRow(nodes, r)

    count = zeros(1,9);

    %count the # of appearances of each value in the row
    for c = 1:9
        if (nodes(r,c).isSolved)
            count(nodes(r,c).value) = count(nodes(r,c).value)+1;
        else
            count(nodes(r,c).getBFval()) = count(nodes(r,c).getBFval())+1;
        end
    end
    
    %if there is more than 1 of any number in the row then it is not valid
    if max(count) > 1
        valid = 0;
    else
        valid = 1;
    end
    
end

function valid = testBruteForceCol(nodes, c)

    count = zeros(1,9);
    
    %count the # of appearances of each value in the col
    for r = 1:9
        if (nodes(r,c).isSolved)
            count(nodes(r,c).value) = count(nodes(r,c).value)+1;
        else
            count(nodes(r,c).getBFval()) = count(nodes(r,c).getBFval())+1;
        end
    end
    
    %if there is more than 1 of any number in the col then it is not valid
    if max(count) > 1
        valid = 0;
    else
        valid = 1;
    end
    
end

function valid = testBruteForceSquare(nodes, r, c)
    
    count = zeros(1,9);
    
    rSquare = floor((r-1)/3);
    cSquare = floor((c-1)/3);
    
    for row = 1+rSquare*3:3+rSquare*3
        for col = 1+cSquare*3:3+cSquare*3
            if (nodes(row,col).isSolved)
                count(nodes(row,col).value) = count(nodes(row,col).value)+1;
            else
                count(nodes(row,col).getBFval()) = count(nodes(row,col).getBFval())+1;
            end
        end
    end
    
    %if there is more than 1 of any number in the square then it is not valid
    if max(count) > 1
        valid = 0;
    else
        valid = 1;
    end
    
end



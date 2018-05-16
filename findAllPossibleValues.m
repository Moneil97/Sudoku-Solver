
function findAllPossibleValues(nodes)
    %find all possible values for each Node
    for r = 1:9
        for c = 1:9
            if ~nodes(r,c).isSolved
                findNodeValues(nodes, r, c);
            end
        end
    end
end

function findNodeValues(nodes, r, c)
    for i = 1:9
        if isValid(nodes, r, c, i)
            nodes(r,c).possibleValues(end+1) = i;
        end
    end
end

function valid = isValid(nodes, r, c, value)
    if checkRow(nodes, r, value) && checkCol(nodes, c, value) && checkSqaure(nodes, r, c, value)
        valid = 1;
    else
        valid = 0;
    end
end

function valid = checkRow(nodes, r, value)

    count = zeros(1,9);
    count(value) = 1;

    %count the # of appearances of each value in the row
    for c = 1:9
        if (nodes(r,c).isSolved)
            count(nodes(r,c).value) = count(nodes(r,c).value)+1;
        end
    end
    
    %if there is more than 1 of any number in the row then it is not valid
    if max(count) > 1
        valid = 0;
    else
        valid = 1;
    end
    
end

function valid = checkCol(nodes, c, value)

    count = zeros(1,9);
    count(value) = 1;
    
    %count the # of appearances of each value in the col
    for r = 1:9
        if (nodes(r,c).isSolved)
            count(nodes(r,c).value) = count(nodes(r,c).value)+1;
        end
    end
    
    %if there is more than 1 of any number in the col then it is not valid
    if max(count) > 1
        valid = 0;
    else
        valid = 1;
    end
    
end

function valid = checkSqaure(nodes, r, c, value)
    
    count = zeros(1,9);
    count(value) = 1;
    
    rSquare = floor((r-1)/3);
    cSquare = floor((c-1)/3);
    
    for row = 1+rSquare*3:3+rSquare*3
        for col = 1+cSquare*3:3+cSquare*3
            if (nodes(row,col).isSolved)
                count(nodes(row,col).value) = count(nodes(row,col).value)+1;
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

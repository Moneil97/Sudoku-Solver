fig = uifigure;
fig.Position = [100 100 580 654];

% Create SodukuSolverLabel
label = uilabel(fig);
label.FontSize = 26;
label.Position = [203 616 175 39];
label.Text = 'Soduku Solver';

%create 9x9 grid of Numeric Text Fields
shift = 59;
for y = 1:9
    for x = 1:9
        i = 9*(y-1)+x;
        numFields(i) = uieditfield(fig, 'numeric'); %#ok<SAGROW>
        numFields(i).Limits = [0 9];%#ok<SAGROW>
        numFields(i).ValueDisplayFormat = '%.0f';%#ok<SAGROW>
        numFields(i).HorizontalAlignment = 'center';%#ok<SAGROW>
        numFields(i).FontSize = 48;%#ok<SAGROW>
        numFields(i).Position = [(24+(x-1)*shift) (549-((y-1)*shift)) 60 60];%#ok<SAGROW>
    end
end

% Create SolveButton
button = uibutton(fig, 'push');
button.FontSize = 26;
button.Position = [241 17 100 40];
button.ButtonPushedFcn = @(btn,event) solveButtonPushed(numFields);
button.Text = 'Solve';

function solveButtonPushed(numFields)
    
    %generate 9x9 grid of Nodes
    nodes(9,9) = Node();
    for r = 1:9
        for c = 1:9
            if numFields(9*(r-1)+c).Value == 0
                nodes(r,c) = Node();
            else
                nodes(r,c) = Node(numFields(9*(r-1)+c).Value);
            end
        end
    end
    
    findAllPossibleValues(nodes);
    
    tic
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
    toc
    
    tic
    bruteForce(nodes, numFields);
    toc
    
end

function bruteForce(nodes, numFields)

    total = 1;
    bruteForceNeeded = 0;
    for r = 1:9
        for c = 1:9
            if ~nodes(r,c).isSolved
                total = total * length(nodes(r,c).possibleValues);
            else
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

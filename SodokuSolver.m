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
    
    findNodesWithOneValue(nodes);
    findValuesWithOnePossibleNode(nodes);
    
    
end

function modified = findNodesWithOneValue(nodes)
    modified = 0;
    for r = 1:9
        for c = 1:9
            if length(nodes(r,c).possibleValues) == 1
                disp("node(" + r + "," + c + ") = " + nodes(r,c).possibleValues(1));
                nodes(r,c).value = nodes(r,c).possibleValues(1);
                nodes(r,c).isSolved = 1;
                %delete from other possibleValues
                
                modified = 1;
            end
        end
    end
end

function modified = findValuesWithOnePossibleNode(nodes)
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
                end
            end
        end
    end
    
end

function deleteFromPossibilities(nodes, r, c, value)
    
%delete from rows

%delete from cols

%delete from square

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

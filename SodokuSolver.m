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

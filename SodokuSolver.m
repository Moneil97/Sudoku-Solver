fig = uifigure;
fig.Position = [100 100 580 654];

% Create SodukuSolverLabel
label = uilabel(fig);
label.FontSize = 26;
label.Position = [203 616 175 39];
label.Text = 'Soduku Solver';

shift = 59;

for y = 1:9
    for x = 1:9
        i = 9*(y-1)+x;
        cells(i) = uieditfield(fig, 'numeric'); %#ok<SAGROW>
        cells(i).Limits = [0 9];%#ok<SAGROW>
        cells(i).ValueDisplayFormat = '%.0f';%#ok<SAGROW>
        cells(i).HorizontalAlignment = 'center';%#ok<SAGROW>
        cells(i).FontSize = 48;%#ok<SAGROW>
        cells(i).Position = [(24+(x-1)*shift) (549-((y-1)*shift)) 60 60];%#ok<SAGROW>
    end
end

% Create SolveButton
button = uibutton(fig, 'push');
button.FontSize = 26;
button.Position = [241 17 100 40];
button.ButtonPushedFcn = @(btn,event) solveButtonPushed(cells);
button.Text = 'Solve';

function solveButtonPushed(cells)
    vals = zeros(9);
    for y = 1:9
        for x = 1:9
            vals(y,x) = cells(9*(y-1)+x).Value;
        end
    end
    disp(vals);
end

function valid = isValid(cells, r, c, value)
    %save the previous value and replace it with the new value to test
    oldValue = cells(r,c);
    cells(r,c) = value;
    
    cells(r,c) = oldValue;
end

function valid = checkRow()
end

function valid = checkCol()
end

function valid = checkThree()
end

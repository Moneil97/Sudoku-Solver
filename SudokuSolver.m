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

% Create FileMenu
fileMenu = uimenu(fig);
fileMenu.Text = 'File';

% Create Save submenu
saveMenu = uimenu(fileMenu);
saveMenu.Text = 'Save .sudoku';
saveMenu.MenuSelectedFcn = @(btn,event) saveMenuSelected(numFields);

% Create Load submenu
loadMenu = uimenu(fileMenu);
loadMenu.Text = 'Load .sudoku';
loadMenu.MenuSelectedFcn = @(btn,event) loadMenuSelected(numFields);

% Create InputMenu
inputMenu = uimenu(fig);
inputMenu.Text = 'Input';

% Create Clear submenu
clearMenu = uimenu(inputMenu);
clearMenu.Text = 'Clear Input';
clearMenu.MenuSelectedFcn = @(btn,event) clearMenuSelected(numFields);

% Create SolveButton
solveButton = uibutton(fig, 'push');
solveButton.FontSize = 26;
solveButton.Position = [241 17 100 40];
solveButton.ButtonPushedFcn = @(btn,event) solveButtonPushed(numFields);
solveButton.Text = 'Solve';

function clearMenuSelected(numFields)
    for i = 1:81
        numFields(i).Value = 0;
    end
end

function saveMenuSelected(numFields)
    file = uiputfile('*.sudoku');
    if file == 0
        disp('User selected Cancel')
        return;
    end
    
    fileID = fopen(file,'w');
    if fileID == -1
        disp("failed to open file");
        return;
    end
    
    f(81) = 0;
    for i = 1:81
        f(i) = numFields(i).Value;
    end
    
    fprintf(fileID,'%d ', f);
    fclose(fileID);
end

function loadMenuSelected(numFields)
    file = uigetfile('*.sudoku');
    
    if file == 0
        disp('User selected Cancel')
        return;
    end
    
    fileID = fopen(file,'r');
    if fileID == -1
        disp("failed to open file");
        return;
    end
    
    f = fscanf(fileID, '%d');
    fclose(fileID);
    
    for i = 1:81
        numFields(i).Value = f(i);
    end
    
end

function solveButtonPushed(numFields)

    %lock all fields
    for i = 1:81
        numFields(i).Enable = 'off';
    end
    
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
    QuickSolver().start(numFields, nodes);
    toc
    
    tic
    BruteForceSolver().start(numFields, nodes);
    toc
    
    %unlock all fields
    for i = 1:81
        numFields(i).Enable = 'on';
    end
    
end

classdef sudokuSolver < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        UIFigure           matlab.ui.Figure
        SodukuSolverLabel  matlab.ui.control.Label
        EditField          matlab.ui.control.NumericEditField
        EditField_2        matlab.ui.control.NumericEditField
        EditField_3        matlab.ui.control.NumericEditField
        EditField_4        matlab.ui.control.NumericEditField
        EditField_5        matlab.ui.control.NumericEditField
        EditField_6        matlab.ui.control.NumericEditField
        EditField_7        matlab.ui.control.NumericEditField
        EditField_8        matlab.ui.control.NumericEditField
        EditField_9        matlab.ui.control.NumericEditField
        EditField_10       matlab.ui.control.NumericEditField
        EditField_11       matlab.ui.control.NumericEditField
        EditField_12       matlab.ui.control.NumericEditField
        EditField_13       matlab.ui.control.NumericEditField
        EditField_14       matlab.ui.control.NumericEditField
        EditField_15       matlab.ui.control.NumericEditField
        EditField_16       matlab.ui.control.NumericEditField
        EditField_17       matlab.ui.control.NumericEditField
        EditField_18       matlab.ui.control.NumericEditField
        EditField_19       matlab.ui.control.NumericEditField
        EditField_20       matlab.ui.control.NumericEditField
        EditField_21       matlab.ui.control.NumericEditField
        EditField_22       matlab.ui.control.NumericEditField
        EditField_23       matlab.ui.control.NumericEditField
        EditField_24       matlab.ui.control.NumericEditField
        EditField_25       matlab.ui.control.NumericEditField
        EditField_26       matlab.ui.control.NumericEditField
        EditField_27       matlab.ui.control.NumericEditField
        EditField_28       matlab.ui.control.NumericEditField
        EditField_29       matlab.ui.control.NumericEditField
        EditField_30       matlab.ui.control.NumericEditField
        EditField_31       matlab.ui.control.NumericEditField
        EditField_32       matlab.ui.control.NumericEditField
        EditField_33       matlab.ui.control.NumericEditField
        EditField_34       matlab.ui.control.NumericEditField
        EditField_35       matlab.ui.control.NumericEditField
        EditField_36       matlab.ui.control.NumericEditField
        EditField_37       matlab.ui.control.NumericEditField
        EditField_38       matlab.ui.control.NumericEditField
        EditField_39       matlab.ui.control.NumericEditField
        EditField_40       matlab.ui.control.NumericEditField
        EditField_41       matlab.ui.control.NumericEditField
        EditField_42       matlab.ui.control.NumericEditField
        EditField_43       matlab.ui.control.NumericEditField
        EditField_44       matlab.ui.control.NumericEditField
        EditField_45       matlab.ui.control.NumericEditField
        EditField_46       matlab.ui.control.NumericEditField
        EditField_47       matlab.ui.control.NumericEditField
        EditField_48       matlab.ui.control.NumericEditField
        EditField_49       matlab.ui.control.NumericEditField
        EditField_50       matlab.ui.control.NumericEditField
        EditField_51       matlab.ui.control.NumericEditField
        EditField_52       matlab.ui.control.NumericEditField
        EditField_53       matlab.ui.control.NumericEditField
        EditField_54       matlab.ui.control.NumericEditField
        EditField_55       matlab.ui.control.NumericEditField
        EditField_56       matlab.ui.control.NumericEditField
        EditField_57       matlab.ui.control.NumericEditField
        EditField_58       matlab.ui.control.NumericEditField
        EditField_59       matlab.ui.control.NumericEditField
        EditField_60       matlab.ui.control.NumericEditField
        EditField_61       matlab.ui.control.NumericEditField
        EditField_62       matlab.ui.control.NumericEditField
        EditField_63       matlab.ui.control.NumericEditField
        EditField_64       matlab.ui.control.NumericEditField
        EditField_65       matlab.ui.control.NumericEditField
        EditField_66       matlab.ui.control.NumericEditField
        EditField_67       matlab.ui.control.NumericEditField
        EditField_68       matlab.ui.control.NumericEditField
        EditField_69       matlab.ui.control.NumericEditField
        EditField_70       matlab.ui.control.NumericEditField
        EditField_71       matlab.ui.control.NumericEditField
        EditField_72       matlab.ui.control.NumericEditField
        EditField_73       matlab.ui.control.NumericEditField
        EditField_74       matlab.ui.control.NumericEditField
        EditField_75       matlab.ui.control.NumericEditField
        EditField_76       matlab.ui.control.NumericEditField
        EditField_77       matlab.ui.control.NumericEditField
        EditField_78       matlab.ui.control.NumericEditField
        EditField_79       matlab.ui.control.NumericEditField
        EditField_80       matlab.ui.control.NumericEditField
        EditField_81       matlab.ui.control.NumericEditField
        SolveButton        matlab.ui.control.Button
    end

    methods (Access = private)

        % Button pushed function: SolveButton
        function SolveButtonPushed(app, event)
            
        end
    end

    % App initialization and construction
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Create UIFigure
            app.UIFigure = uifigure;
            app.UIFigure.Position = [100 100 580 654];
            app.UIFigure.Name = 'UI Figure';

            % Create SodukuSolverLabel
            app.SodukuSolverLabel = uilabel(app.UIFigure);
            app.SodukuSolverLabel.FontSize = 26;
            app.SodukuSolverLabel.Position = [203 616 175 39];
            app.SodukuSolverLabel.Text = 'Soduku Solver';

            % Create EditField
            app.EditField = uieditfield(app.UIFigure, 'numeric');
            app.EditField.Limits = [0 9];
            app.EditField.ValueDisplayFormat = '%.0f';
            app.EditField.HorizontalAlignment = 'center';
            app.EditField.FontSize = 48;
            app.EditField.Position = [24 549 60 60];

            % Create EditField_2
            app.EditField_2 = uieditfield(app.UIFigure, 'numeric');
            app.EditField_2.Limits = [0 9];
            app.EditField_2.ValueDisplayFormat = '%.0f';
            app.EditField_2.HorizontalAlignment = 'center';
            app.EditField_2.FontSize = 48;
            app.EditField_2.Position = [83 549 60 60];

            % Create EditField_3
            app.EditField_3 = uieditfield(app.UIFigure, 'numeric');
            app.EditField_3.Limits = [0 9];
            app.EditField_3.ValueDisplayFormat = '%.0f';
            app.EditField_3.HorizontalAlignment = 'center';
            app.EditField_3.FontSize = 48;
            app.EditField_3.Position = [142 549 60 60];

            % Create EditField_4
            app.EditField_4 = uieditfield(app.UIFigure, 'numeric');
            app.EditField_4.Limits = [0 9];
            app.EditField_4.ValueDisplayFormat = '%.0f';
            app.EditField_4.HorizontalAlignment = 'center';
            app.EditField_4.FontSize = 48;
            app.EditField_4.Position = [24 490 60 60];

            % Create EditField_5
            app.EditField_5 = uieditfield(app.UIFigure, 'numeric');
            app.EditField_5.Limits = [0 9];
            app.EditField_5.ValueDisplayFormat = '%.0f';
            app.EditField_5.HorizontalAlignment = 'center';
            app.EditField_5.FontSize = 48;
            app.EditField_5.Position = [83 490 60 60];

            % Create EditField_6
            app.EditField_6 = uieditfield(app.UIFigure, 'numeric');
            app.EditField_6.Limits = [0 9];
            app.EditField_6.ValueDisplayFormat = '%.0f';
            app.EditField_6.HorizontalAlignment = 'center';
            app.EditField_6.FontSize = 48;
            app.EditField_6.Position = [142 490 60 60];

            % Create EditField_7
            app.EditField_7 = uieditfield(app.UIFigure, 'numeric');
            app.EditField_7.Limits = [0 9];
            app.EditField_7.ValueDisplayFormat = '%.0f';
            app.EditField_7.HorizontalAlignment = 'center';
            app.EditField_7.FontSize = 48;
            app.EditField_7.Position = [24 431 60 60];

            % Create EditField_8
            app.EditField_8 = uieditfield(app.UIFigure, 'numeric');
            app.EditField_8.Limits = [0 9];
            app.EditField_8.ValueDisplayFormat = '%.0f';
            app.EditField_8.HorizontalAlignment = 'center';
            app.EditField_8.FontSize = 48;
            app.EditField_8.Position = [83 431 60 60];

            % Create EditField_9
            app.EditField_9 = uieditfield(app.UIFigure, 'numeric');
            app.EditField_9.Limits = [0 9];
            app.EditField_9.ValueDisplayFormat = '%.0f';
            app.EditField_9.HorizontalAlignment = 'center';
            app.EditField_9.FontSize = 48;
            app.EditField_9.Position = [142 431 60 60];

            % Create EditField_10
            app.EditField_10 = uieditfield(app.UIFigure, 'numeric');
            app.EditField_10.Limits = [0 9];
            app.EditField_10.ValueDisplayFormat = '%.0f';
            app.EditField_10.HorizontalAlignment = 'center';
            app.EditField_10.FontSize = 48;
            app.EditField_10.Position = [202 549 60 60];

            % Create EditField_11
            app.EditField_11 = uieditfield(app.UIFigure, 'numeric');
            app.EditField_11.Limits = [0 9];
            app.EditField_11.ValueDisplayFormat = '%.0f';
            app.EditField_11.HorizontalAlignment = 'center';
            app.EditField_11.FontSize = 48;
            app.EditField_11.Position = [261 549 60 60];

            % Create EditField_12
            app.EditField_12 = uieditfield(app.UIFigure, 'numeric');
            app.EditField_12.Limits = [0 9];
            app.EditField_12.ValueDisplayFormat = '%.0f';
            app.EditField_12.HorizontalAlignment = 'center';
            app.EditField_12.FontSize = 48;
            app.EditField_12.Position = [320 549 60 60];

            % Create EditField_13
            app.EditField_13 = uieditfield(app.UIFigure, 'numeric');
            app.EditField_13.Limits = [0 9];
            app.EditField_13.ValueDisplayFormat = '%.0f';
            app.EditField_13.HorizontalAlignment = 'center';
            app.EditField_13.FontSize = 48;
            app.EditField_13.Position = [202 490 60 60];

            % Create EditField_14
            app.EditField_14 = uieditfield(app.UIFigure, 'numeric');
            app.EditField_14.Limits = [0 9];
            app.EditField_14.ValueDisplayFormat = '%.0f';
            app.EditField_14.HorizontalAlignment = 'center';
            app.EditField_14.FontSize = 48;
            app.EditField_14.Position = [261 490 60 60];

            % Create EditField_15
            app.EditField_15 = uieditfield(app.UIFigure, 'numeric');
            app.EditField_15.Limits = [0 9];
            app.EditField_15.ValueDisplayFormat = '%.0f';
            app.EditField_15.HorizontalAlignment = 'center';
            app.EditField_15.FontSize = 48;
            app.EditField_15.Position = [320 490 60 60];

            % Create EditField_16
            app.EditField_16 = uieditfield(app.UIFigure, 'numeric');
            app.EditField_16.Limits = [0 9];
            app.EditField_16.ValueDisplayFormat = '%.0f';
            app.EditField_16.HorizontalAlignment = 'center';
            app.EditField_16.FontSize = 48;
            app.EditField_16.Position = [202 431 60 60];

            % Create EditField_17
            app.EditField_17 = uieditfield(app.UIFigure, 'numeric');
            app.EditField_17.Limits = [0 9];
            app.EditField_17.ValueDisplayFormat = '%.0f';
            app.EditField_17.HorizontalAlignment = 'center';
            app.EditField_17.FontSize = 48;
            app.EditField_17.Position = [261 431 60 60];

            % Create EditField_18
            app.EditField_18 = uieditfield(app.UIFigure, 'numeric');
            app.EditField_18.Limits = [0 9];
            app.EditField_18.ValueDisplayFormat = '%.0f';
            app.EditField_18.HorizontalAlignment = 'center';
            app.EditField_18.FontSize = 48;
            app.EditField_18.Position = [320 431 60 60];

            % Create EditField_19
            app.EditField_19 = uieditfield(app.UIFigure, 'numeric');
            app.EditField_19.Limits = [0 9];
            app.EditField_19.ValueDisplayFormat = '%.0f';
            app.EditField_19.HorizontalAlignment = 'center';
            app.EditField_19.FontSize = 48;
            app.EditField_19.Position = [380 549 60 60];

            % Create EditField_20
            app.EditField_20 = uieditfield(app.UIFigure, 'numeric');
            app.EditField_20.Limits = [0 9];
            app.EditField_20.ValueDisplayFormat = '%.0f';
            app.EditField_20.HorizontalAlignment = 'center';
            app.EditField_20.FontSize = 48;
            app.EditField_20.Position = [439 549 60 60];

            % Create EditField_21
            app.EditField_21 = uieditfield(app.UIFigure, 'numeric');
            app.EditField_21.Limits = [0 9];
            app.EditField_21.ValueDisplayFormat = '%.0f';
            app.EditField_21.HorizontalAlignment = 'center';
            app.EditField_21.FontSize = 48;
            app.EditField_21.Position = [498 549 60 60];

            % Create EditField_22
            app.EditField_22 = uieditfield(app.UIFigure, 'numeric');
            app.EditField_22.Limits = [0 9];
            app.EditField_22.ValueDisplayFormat = '%.0f';
            app.EditField_22.HorizontalAlignment = 'center';
            app.EditField_22.FontSize = 48;
            app.EditField_22.Position = [380 490 60 60];

            % Create EditField_23
            app.EditField_23 = uieditfield(app.UIFigure, 'numeric');
            app.EditField_23.Limits = [0 9];
            app.EditField_23.ValueDisplayFormat = '%.0f';
            app.EditField_23.HorizontalAlignment = 'center';
            app.EditField_23.FontSize = 48;
            app.EditField_23.Position = [439 490 60 60];

            % Create EditField_24
            app.EditField_24 = uieditfield(app.UIFigure, 'numeric');
            app.EditField_24.Limits = [0 9];
            app.EditField_24.ValueDisplayFormat = '%.0f';
            app.EditField_24.HorizontalAlignment = 'center';
            app.EditField_24.FontSize = 48;
            app.EditField_24.Position = [498 490 60 60];

            % Create EditField_25
            app.EditField_25 = uieditfield(app.UIFigure, 'numeric');
            app.EditField_25.Limits = [0 9];
            app.EditField_25.ValueDisplayFormat = '%.0f';
            app.EditField_25.HorizontalAlignment = 'center';
            app.EditField_25.FontSize = 48;
            app.EditField_25.Position = [380 431 60 60];

            % Create EditField_26
            app.EditField_26 = uieditfield(app.UIFigure, 'numeric');
            app.EditField_26.Limits = [0 9];
            app.EditField_26.ValueDisplayFormat = '%.0f';
            app.EditField_26.HorizontalAlignment = 'center';
            app.EditField_26.FontSize = 48;
            app.EditField_26.Position = [439 431 60 60];

            % Create EditField_27
            app.EditField_27 = uieditfield(app.UIFigure, 'numeric');
            app.EditField_27.Limits = [0 9];
            app.EditField_27.ValueDisplayFormat = '%.0f';
            app.EditField_27.HorizontalAlignment = 'center';
            app.EditField_27.FontSize = 48;
            app.EditField_27.Position = [498 431 60 60];

            % Create EditField_28
            app.EditField_28 = uieditfield(app.UIFigure, 'numeric');
            app.EditField_28.Limits = [0 9];
            app.EditField_28.ValueDisplayFormat = '%.0f';
            app.EditField_28.HorizontalAlignment = 'center';
            app.EditField_28.FontSize = 48;
            app.EditField_28.Position = [24 371 60 60];

            % Create EditField_29
            app.EditField_29 = uieditfield(app.UIFigure, 'numeric');
            app.EditField_29.Limits = [0 9];
            app.EditField_29.ValueDisplayFormat = '%.0f';
            app.EditField_29.HorizontalAlignment = 'center';
            app.EditField_29.FontSize = 48;
            app.EditField_29.Position = [83 371 60 60];

            % Create EditField_30
            app.EditField_30 = uieditfield(app.UIFigure, 'numeric');
            app.EditField_30.Limits = [0 9];
            app.EditField_30.ValueDisplayFormat = '%.0f';
            app.EditField_30.HorizontalAlignment = 'center';
            app.EditField_30.FontSize = 48;
            app.EditField_30.Position = [142 371 60 60];

            % Create EditField_31
            app.EditField_31 = uieditfield(app.UIFigure, 'numeric');
            app.EditField_31.Limits = [0 9];
            app.EditField_31.ValueDisplayFormat = '%.0f';
            app.EditField_31.HorizontalAlignment = 'center';
            app.EditField_31.FontSize = 48;
            app.EditField_31.Position = [24 312 60 60];

            % Create EditField_32
            app.EditField_32 = uieditfield(app.UIFigure, 'numeric');
            app.EditField_32.Limits = [0 9];
            app.EditField_32.ValueDisplayFormat = '%.0f';
            app.EditField_32.HorizontalAlignment = 'center';
            app.EditField_32.FontSize = 48;
            app.EditField_32.Position = [83 312 60 60];

            % Create EditField_33
            app.EditField_33 = uieditfield(app.UIFigure, 'numeric');
            app.EditField_33.Limits = [0 9];
            app.EditField_33.ValueDisplayFormat = '%.0f';
            app.EditField_33.HorizontalAlignment = 'center';
            app.EditField_33.FontSize = 48;
            app.EditField_33.Position = [142 312 60 60];

            % Create EditField_34
            app.EditField_34 = uieditfield(app.UIFigure, 'numeric');
            app.EditField_34.Limits = [0 9];
            app.EditField_34.ValueDisplayFormat = '%.0f';
            app.EditField_34.HorizontalAlignment = 'center';
            app.EditField_34.FontSize = 48;
            app.EditField_34.Position = [24 253 60 60];

            % Create EditField_35
            app.EditField_35 = uieditfield(app.UIFigure, 'numeric');
            app.EditField_35.Limits = [0 9];
            app.EditField_35.ValueDisplayFormat = '%.0f';
            app.EditField_35.HorizontalAlignment = 'center';
            app.EditField_35.FontSize = 48;
            app.EditField_35.Position = [83 253 60 60];

            % Create EditField_36
            app.EditField_36 = uieditfield(app.UIFigure, 'numeric');
            app.EditField_36.Limits = [0 9];
            app.EditField_36.ValueDisplayFormat = '%.0f';
            app.EditField_36.HorizontalAlignment = 'center';
            app.EditField_36.FontSize = 48;
            app.EditField_36.Position = [142 253 60 60];

            % Create EditField_37
            app.EditField_37 = uieditfield(app.UIFigure, 'numeric');
            app.EditField_37.Limits = [0 9];
            app.EditField_37.ValueDisplayFormat = '%.0f';
            app.EditField_37.HorizontalAlignment = 'center';
            app.EditField_37.FontSize = 48;
            app.EditField_37.Position = [202 371 60 60];

            % Create EditField_38
            app.EditField_38 = uieditfield(app.UIFigure, 'numeric');
            app.EditField_38.Limits = [0 9];
            app.EditField_38.ValueDisplayFormat = '%.0f';
            app.EditField_38.HorizontalAlignment = 'center';
            app.EditField_38.FontSize = 48;
            app.EditField_38.Position = [261 371 60 60];

            % Create EditField_39
            app.EditField_39 = uieditfield(app.UIFigure, 'numeric');
            app.EditField_39.Limits = [0 9];
            app.EditField_39.ValueDisplayFormat = '%.0f';
            app.EditField_39.HorizontalAlignment = 'center';
            app.EditField_39.FontSize = 48;
            app.EditField_39.Position = [320 371 60 60];

            % Create EditField_40
            app.EditField_40 = uieditfield(app.UIFigure, 'numeric');
            app.EditField_40.Limits = [0 9];
            app.EditField_40.ValueDisplayFormat = '%.0f';
            app.EditField_40.HorizontalAlignment = 'center';
            app.EditField_40.FontSize = 48;
            app.EditField_40.Position = [202 312 60 60];

            % Create EditField_41
            app.EditField_41 = uieditfield(app.UIFigure, 'numeric');
            app.EditField_41.Limits = [0 9];
            app.EditField_41.ValueDisplayFormat = '%.0f';
            app.EditField_41.HorizontalAlignment = 'center';
            app.EditField_41.FontSize = 48;
            app.EditField_41.Position = [261 312 60 60];

            % Create EditField_42
            app.EditField_42 = uieditfield(app.UIFigure, 'numeric');
            app.EditField_42.Limits = [0 9];
            app.EditField_42.ValueDisplayFormat = '%.0f';
            app.EditField_42.HorizontalAlignment = 'center';
            app.EditField_42.FontSize = 48;
            app.EditField_42.Position = [320 312 60 60];

            % Create EditField_43
            app.EditField_43 = uieditfield(app.UIFigure, 'numeric');
            app.EditField_43.Limits = [0 9];
            app.EditField_43.ValueDisplayFormat = '%.0f';
            app.EditField_43.HorizontalAlignment = 'center';
            app.EditField_43.FontSize = 48;
            app.EditField_43.Position = [202 253 60 60];

            % Create EditField_44
            app.EditField_44 = uieditfield(app.UIFigure, 'numeric');
            app.EditField_44.Limits = [0 9];
            app.EditField_44.ValueDisplayFormat = '%.0f';
            app.EditField_44.HorizontalAlignment = 'center';
            app.EditField_44.FontSize = 48;
            app.EditField_44.Position = [261 253 60 60];

            % Create EditField_45
            app.EditField_45 = uieditfield(app.UIFigure, 'numeric');
            app.EditField_45.Limits = [0 9];
            app.EditField_45.ValueDisplayFormat = '%.0f';
            app.EditField_45.HorizontalAlignment = 'center';
            app.EditField_45.FontSize = 48;
            app.EditField_45.Position = [320 253 60 60];

            % Create EditField_46
            app.EditField_46 = uieditfield(app.UIFigure, 'numeric');
            app.EditField_46.Limits = [0 9];
            app.EditField_46.ValueDisplayFormat = '%.0f';
            app.EditField_46.HorizontalAlignment = 'center';
            app.EditField_46.FontSize = 48;
            app.EditField_46.Position = [380 371 60 60];

            % Create EditField_47
            app.EditField_47 = uieditfield(app.UIFigure, 'numeric');
            app.EditField_47.Limits = [0 9];
            app.EditField_47.ValueDisplayFormat = '%.0f';
            app.EditField_47.HorizontalAlignment = 'center';
            app.EditField_47.FontSize = 48;
            app.EditField_47.Position = [439 371 60 60];

            % Create EditField_48
            app.EditField_48 = uieditfield(app.UIFigure, 'numeric');
            app.EditField_48.Limits = [0 9];
            app.EditField_48.ValueDisplayFormat = '%.0f';
            app.EditField_48.HorizontalAlignment = 'center';
            app.EditField_48.FontSize = 48;
            app.EditField_48.Position = [498 371 60 60];

            % Create EditField_49
            app.EditField_49 = uieditfield(app.UIFigure, 'numeric');
            app.EditField_49.Limits = [0 9];
            app.EditField_49.ValueDisplayFormat = '%.0f';
            app.EditField_49.HorizontalAlignment = 'center';
            app.EditField_49.FontSize = 48;
            app.EditField_49.Position = [380 312 60 60];

            % Create EditField_50
            app.EditField_50 = uieditfield(app.UIFigure, 'numeric');
            app.EditField_50.Limits = [0 9];
            app.EditField_50.ValueDisplayFormat = '%.0f';
            app.EditField_50.HorizontalAlignment = 'center';
            app.EditField_50.FontSize = 48;
            app.EditField_50.Position = [439 312 60 60];

            % Create EditField_51
            app.EditField_51 = uieditfield(app.UIFigure, 'numeric');
            app.EditField_51.Limits = [0 9];
            app.EditField_51.ValueDisplayFormat = '%.0f';
            app.EditField_51.HorizontalAlignment = 'center';
            app.EditField_51.FontSize = 48;
            app.EditField_51.Position = [498 312 60 60];

            % Create EditField_52
            app.EditField_52 = uieditfield(app.UIFigure, 'numeric');
            app.EditField_52.Limits = [0 9];
            app.EditField_52.ValueDisplayFormat = '%.0f';
            app.EditField_52.HorizontalAlignment = 'center';
            app.EditField_52.FontSize = 48;
            app.EditField_52.Position = [380 253 60 60];

            % Create EditField_53
            app.EditField_53 = uieditfield(app.UIFigure, 'numeric');
            app.EditField_53.Limits = [0 9];
            app.EditField_53.ValueDisplayFormat = '%.0f';
            app.EditField_53.HorizontalAlignment = 'center';
            app.EditField_53.FontSize = 48;
            app.EditField_53.Position = [439 253 60 60];

            % Create EditField_54
            app.EditField_54 = uieditfield(app.UIFigure, 'numeric');
            app.EditField_54.Limits = [0 9];
            app.EditField_54.ValueDisplayFormat = '%.0f';
            app.EditField_54.HorizontalAlignment = 'center';
            app.EditField_54.FontSize = 48;
            app.EditField_54.Position = [498 253 60 60];

            % Create EditField_55
            app.EditField_55 = uieditfield(app.UIFigure, 'numeric');
            app.EditField_55.Limits = [0 9];
            app.EditField_55.ValueDisplayFormat = '%.0f';
            app.EditField_55.HorizontalAlignment = 'center';
            app.EditField_55.FontSize = 48;
            app.EditField_55.Position = [24 193 60 60];

            % Create EditField_56
            app.EditField_56 = uieditfield(app.UIFigure, 'numeric');
            app.EditField_56.Limits = [0 9];
            app.EditField_56.ValueDisplayFormat = '%.0f';
            app.EditField_56.HorizontalAlignment = 'center';
            app.EditField_56.FontSize = 48;
            app.EditField_56.Position = [83 193 60 60];

            % Create EditField_57
            app.EditField_57 = uieditfield(app.UIFigure, 'numeric');
            app.EditField_57.Limits = [0 9];
            app.EditField_57.ValueDisplayFormat = '%.0f';
            app.EditField_57.HorizontalAlignment = 'center';
            app.EditField_57.FontSize = 48;
            app.EditField_57.Position = [142 193 60 60];

            % Create EditField_58
            app.EditField_58 = uieditfield(app.UIFigure, 'numeric');
            app.EditField_58.Limits = [0 9];
            app.EditField_58.ValueDisplayFormat = '%.0f';
            app.EditField_58.HorizontalAlignment = 'center';
            app.EditField_58.FontSize = 48;
            app.EditField_58.Position = [24 134 60 60];

            % Create EditField_59
            app.EditField_59 = uieditfield(app.UIFigure, 'numeric');
            app.EditField_59.Limits = [0 9];
            app.EditField_59.ValueDisplayFormat = '%.0f';
            app.EditField_59.HorizontalAlignment = 'center';
            app.EditField_59.FontSize = 48;
            app.EditField_59.Position = [83 134 60 60];

            % Create EditField_60
            app.EditField_60 = uieditfield(app.UIFigure, 'numeric');
            app.EditField_60.Limits = [0 9];
            app.EditField_60.ValueDisplayFormat = '%.0f';
            app.EditField_60.HorizontalAlignment = 'center';
            app.EditField_60.FontSize = 48;
            app.EditField_60.Position = [142 134 60 60];

            % Create EditField_61
            app.EditField_61 = uieditfield(app.UIFigure, 'numeric');
            app.EditField_61.Limits = [0 9];
            app.EditField_61.ValueDisplayFormat = '%.0f';
            app.EditField_61.HorizontalAlignment = 'center';
            app.EditField_61.FontSize = 48;
            app.EditField_61.Position = [24 75 60 60];

            % Create EditField_62
            app.EditField_62 = uieditfield(app.UIFigure, 'numeric');
            app.EditField_62.Limits = [0 9];
            app.EditField_62.ValueDisplayFormat = '%.0f';
            app.EditField_62.HorizontalAlignment = 'center';
            app.EditField_62.FontSize = 48;
            app.EditField_62.Position = [83 75 60 60];

            % Create EditField_63
            app.EditField_63 = uieditfield(app.UIFigure, 'numeric');
            app.EditField_63.Limits = [0 9];
            app.EditField_63.ValueDisplayFormat = '%.0f';
            app.EditField_63.HorizontalAlignment = 'center';
            app.EditField_63.FontSize = 48;
            app.EditField_63.Position = [142 75 60 60];

            % Create EditField_64
            app.EditField_64 = uieditfield(app.UIFigure, 'numeric');
            app.EditField_64.Limits = [0 9];
            app.EditField_64.ValueDisplayFormat = '%.0f';
            app.EditField_64.HorizontalAlignment = 'center';
            app.EditField_64.FontSize = 48;
            app.EditField_64.Position = [202 193 60 60];

            % Create EditField_65
            app.EditField_65 = uieditfield(app.UIFigure, 'numeric');
            app.EditField_65.Limits = [0 9];
            app.EditField_65.ValueDisplayFormat = '%.0f';
            app.EditField_65.HorizontalAlignment = 'center';
            app.EditField_65.FontSize = 48;
            app.EditField_65.Position = [261 193 60 60];

            % Create EditField_66
            app.EditField_66 = uieditfield(app.UIFigure, 'numeric');
            app.EditField_66.Limits = [0 9];
            app.EditField_66.ValueDisplayFormat = '%.0f';
            app.EditField_66.HorizontalAlignment = 'center';
            app.EditField_66.FontSize = 48;
            app.EditField_66.Position = [320 193 60 60];

            % Create EditField_67
            app.EditField_67 = uieditfield(app.UIFigure, 'numeric');
            app.EditField_67.Limits = [0 9];
            app.EditField_67.ValueDisplayFormat = '%.0f';
            app.EditField_67.HorizontalAlignment = 'center';
            app.EditField_67.FontSize = 48;
            app.EditField_67.Position = [202 134 60 60];

            % Create EditField_68
            app.EditField_68 = uieditfield(app.UIFigure, 'numeric');
            app.EditField_68.Limits = [0 9];
            app.EditField_68.ValueDisplayFormat = '%.0f';
            app.EditField_68.HorizontalAlignment = 'center';
            app.EditField_68.FontSize = 48;
            app.EditField_68.Position = [261 134 60 60];

            % Create EditField_69
            app.EditField_69 = uieditfield(app.UIFigure, 'numeric');
            app.EditField_69.Limits = [0 9];
            app.EditField_69.ValueDisplayFormat = '%.0f';
            app.EditField_69.HorizontalAlignment = 'center';
            app.EditField_69.FontSize = 48;
            app.EditField_69.Position = [320 134 60 60];

            % Create EditField_70
            app.EditField_70 = uieditfield(app.UIFigure, 'numeric');
            app.EditField_70.Limits = [0 9];
            app.EditField_70.ValueDisplayFormat = '%.0f';
            app.EditField_70.HorizontalAlignment = 'center';
            app.EditField_70.FontSize = 48;
            app.EditField_70.Position = [202 75 60 60];

            % Create EditField_71
            app.EditField_71 = uieditfield(app.UIFigure, 'numeric');
            app.EditField_71.Limits = [0 9];
            app.EditField_71.ValueDisplayFormat = '%.0f';
            app.EditField_71.HorizontalAlignment = 'center';
            app.EditField_71.FontSize = 48;
            app.EditField_71.Position = [261 75 60 60];

            % Create EditField_72
            app.EditField_72 = uieditfield(app.UIFigure, 'numeric');
            app.EditField_72.Limits = [0 9];
            app.EditField_72.ValueDisplayFormat = '%.0f';
            app.EditField_72.HorizontalAlignment = 'center';
            app.EditField_72.FontSize = 48;
            app.EditField_72.Position = [320 75 60 60];

            % Create EditField_73
            app.EditField_73 = uieditfield(app.UIFigure, 'numeric');
            app.EditField_73.Limits = [0 9];
            app.EditField_73.ValueDisplayFormat = '%.0f';
            app.EditField_73.HorizontalAlignment = 'center';
            app.EditField_73.FontSize = 48;
            app.EditField_73.Position = [380 193 60 60];

            % Create EditField_74
            app.EditField_74 = uieditfield(app.UIFigure, 'numeric');
            app.EditField_74.Limits = [0 9];
            app.EditField_74.ValueDisplayFormat = '%.0f';
            app.EditField_74.HorizontalAlignment = 'center';
            app.EditField_74.FontSize = 48;
            app.EditField_74.Position = [439 193 60 60];

            % Create EditField_75
            app.EditField_75 = uieditfield(app.UIFigure, 'numeric');
            app.EditField_75.Limits = [0 9];
            app.EditField_75.ValueDisplayFormat = '%.0f';
            app.EditField_75.HorizontalAlignment = 'center';
            app.EditField_75.FontSize = 48;
            app.EditField_75.Position = [498 193 60 60];

            % Create EditField_76
            app.EditField_76 = uieditfield(app.UIFigure, 'numeric');
            app.EditField_76.Limits = [0 9];
            app.EditField_76.ValueDisplayFormat = '%.0f';
            app.EditField_76.HorizontalAlignment = 'center';
            app.EditField_76.FontSize = 48;
            app.EditField_76.Position = [380 134 60 60];

            % Create EditField_77
            app.EditField_77 = uieditfield(app.UIFigure, 'numeric');
            app.EditField_77.Limits = [0 9];
            app.EditField_77.ValueDisplayFormat = '%.0f';
            app.EditField_77.HorizontalAlignment = 'center';
            app.EditField_77.FontSize = 48;
            app.EditField_77.Position = [439 134 60 60];

            % Create EditField_78
            app.EditField_78 = uieditfield(app.UIFigure, 'numeric');
            app.EditField_78.Limits = [0 9];
            app.EditField_78.ValueDisplayFormat = '%.0f';
            app.EditField_78.HorizontalAlignment = 'center';
            app.EditField_78.FontSize = 48;
            app.EditField_78.Position = [498 134 60 60];

            % Create EditField_79
            app.EditField_79 = uieditfield(app.UIFigure, 'numeric');
            app.EditField_79.Limits = [0 9];
            app.EditField_79.ValueDisplayFormat = '%.0f';
            app.EditField_79.HorizontalAlignment = 'center';
            app.EditField_79.FontSize = 48;
            app.EditField_79.Position = [380 75 60 60];

            % Create EditField_80
            app.EditField_80 = uieditfield(app.UIFigure, 'numeric');
            app.EditField_80.Limits = [0 9];
            app.EditField_80.ValueDisplayFormat = '%.0f';
            app.EditField_80.HorizontalAlignment = 'center';
            app.EditField_80.FontSize = 48;
            app.EditField_80.Position = [439 75 60 60];

            % Create EditField_81
            app.EditField_81 = uieditfield(app.UIFigure, 'numeric');
            app.EditField_81.Limits = [0 9];
            app.EditField_81.ValueDisplayFormat = '%.0f';
            app.EditField_81.HorizontalAlignment = 'center';
            app.EditField_81.FontSize = 48;
            app.EditField_81.Position = [498 75 60 60];

            % Create SolveButton
            app.SolveButton = uibutton(app.UIFigure, 'push');
            app.SolveButton.ButtonPushedFcn = createCallbackFcn(app, @SolveButtonPushed, true);
            app.SolveButton.FontSize = 26;
            app.SolveButton.Position = [241 17 100 40];
            app.SolveButton.Text = 'Solve';
        end
    end

    methods (Access = public)

        % Construct app
        function app = sudokuSolver

            % Create and configure components
            createComponents(app)

            % Register the app with App Designer
            registerApp(app, app.UIFigure)

            if nargout == 0
                clear app
            end
        end

        % Code that executes before app deletion
        function delete(app)

            % Delete UIFigure when app is deleted
            delete(app.UIFigure)
        end
    end
end
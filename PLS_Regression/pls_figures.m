
function pls_figures(RESULTS, PLS_NumComp,X_TABLE, Y_TABLE,...
    Table_permuted_index)

if PLS_NumComp == 1
    %disp('Cannot build plots with only one PLS component');
    pls_figures_OnePLS(RESULTS, X_TABLE, Y_TABLE, ...
        Table_permuted_index);
    return
end
    
if size(Y_TABLE,2) >2
figure
plot(scaledata(RESULTS.X_Loadings(:,1),-1,1), ...
    scaledata(RESULTS.X_Loadings(:,2),-1,1), 'o',...
    'MarkerFaceColor', 'blue',...
    'MarkerEdgeColor', 'blue')
text(scaledata(RESULTS.X_Loadings(:,1),-1,1)+0.02,...
    scaledata(RESULTS.X_Loadings(:,2),-1,1)+0.02, ...
    X_TABLE.Properties.VariableNames,...
    'HorizontalAlignment','left')
hold on
plot(scaledata(RESULTS.Y_Loadings(:,1),-1,1), ...
    scaledata(RESULTS.Y_Loadings(:,2),-1,1), 'v',...
    'MarkerFaceColor', 'black', ...
    'MarkerEdgeColor', 'black')
text(scaledata(RESULTS.Y_Loadings(:,1),-1,1)+0.02,...
    scaledata(RESULTS.Y_Loadings(:,2),-1,1)+0.02, ...
    Y_TABLE.Properties.VariableNames,...
    'HorizontalAlignment','left')
axis([-1.2,1.2,-1.2,1.2]);
title('X- and Y-loadings on PLS-1 and PLS-2 - Scaled in [-1,1]');
xlabel('PLS-1');
ylabel('PLS-2');

figure
plot(scaledata(RESULTS.X_Scores(:,1),-1,1), ...
    scaledata(RESULTS.X_Scores(:,2),-1,1), 'o',...
    'MarkerFaceColor', 'blue',...
    'MarkerEdgeColor', 'blue')
text(scaledata(RESULTS.X_Scores(:,1),-1,1)+0.02,...
    scaledata(RESULTS.X_Scores(:,2),-1,1)+0.02, ...
    X_TABLE.Properties.RowNames,...
    'HorizontalAlignment','left')
axis([-1.2,1.2,-1.2,1.2]);
title('Scores on PLS-1 and PLS-2 - Scaled in [-1,1]');
xlabel('PLS-1');
ylabel('PLS-2');

figure
plot(scaledata(RESULTS.X_Scores(:,1),-1,1), ...
    scaledata(RESULTS.X_Scores(:,2),-1,1), 'o',...
    'MarkerFaceColor', 'blue',...
    'MarkerEdgeColor', 'blue')
text(scaledata(RESULTS.X_Scores(:,1),-1,1)+0.02,...
    scaledata(RESULTS.X_Scores(:,2),-1,1)+0.02, ...
    X_TABLE.Properties.RowNames,...
    'HorizontalAlignment','left')
hold on
plot(scaledata(RESULTS.Y_Loadings(:,1),-1,1), ...
    scaledata(RESULTS.Y_Loadings(:,2),-1,1), 'v',...
    'MarkerFaceColor', 'black', ...
    'MarkerEdgeColor', 'black')
text(scaledata(RESULTS.Y_Loadings(:,1),-1,1)+0.02,...
    scaledata(RESULTS.Y_Loadings(:,2),-1,1)+0.02, ...
    Y_TABLE.Properties.VariableNames,...
    'HorizontalAlignment','left')

title('BIPLOT of PLS-1 and PLS-2  - Scaled in [-1,1]');
xlabel('PLS-1');
ylabel('PLS-2');
axis([-1.2,1.2,-1.2,1.2]);
  
    
    
elseif size(Y_TABLE,2) == 1
    figure
plot((RESULTS.X_Loadings(:,1)), ...
    (RESULTS.X_Loadings(:,2)), 'o',...
    'MarkerFaceColor', 'blue',...
    'MarkerEdgeColor', 'blue')
text((RESULTS.X_Loadings(:,1)),...
    (RESULTS.X_Loadings(:,2)), ...
    X_TABLE.Properties.VariableNames,...
    'HorizontalAlignment','left')
hold on
plot((RESULTS.Y_Loadings(:,1)), ...
    (RESULTS.Y_Loadings(:,2)), 'v',...
    'MarkerFaceColor', 'black', ...
    'MarkerEdgeColor', 'black')
text((RESULTS.Y_Loadings(:,1)),...
    (RESULTS.Y_Loadings(:,2)), ...
    Y_TABLE.Properties.VariableNames,...
    'HorizontalAlignment','left')
title('X- and Y-loadings on PLS-1 and PLS-2 - Scaled in [-1,1]');
xlabel('PLS-1');
ylabel('PLS-2');

figure
plot((RESULTS.X_Scores(:,1)), ...
    (RESULTS.X_Scores(:,2)), 'o',...
    'MarkerFaceColor', 'blue',...
    'MarkerEdgeColor', 'blue')
text((RESULTS.X_Scores(:,1))+0.02,...
    (RESULTS.X_Scores(:,2))+0.02, ...
    X_TABLE.Properties.RowNames,...
    'HorizontalAlignment','left')
title('Scores on PLS-1 and PLS-2');
xlabel('PLS-1');
ylabel('PLS-2');

figure
plot((RESULTS.X_Scores(:,1)), ...
    (RESULTS.X_Scores(:,2)), 'o',...
    'MarkerFaceColor', 'blue',...
    'MarkerEdgeColor', 'blue')
text((RESULTS.X_Scores(:,1))+0.02,...
    (RESULTS.X_Scores(:,2))+0.02, ...
    X_TABLE.Properties.RowNames,...
    'HorizontalAlignment','left')
hold on
plot((RESULTS.Y_Loadings(:,1)), ...
    (RESULTS.Y_Loadings(:,2)), 'v',...
    'MarkerFaceColor', 'black', ...
    'MarkerEdgeColor', 'black')
text((RESULTS.Y_Loadings(:,1))+0.02,...
    (RESULTS.Y_Loadings(:,2))+0.02, ...
    Y_TABLE.Properties.VariableNames,...
    'HorizontalAlignment','left')

title('BIPLOT of PLS-1 and PLS-2');
xlabel('PLS-1');
ylabel('PLS-2');




end

figure
plot(RESULTS.Y, RESULTS.Y_PREDICTED, 'o');
hold on
title('PLS model results - Scaled');
xlabel('Original Y');
ylabel('PLS-predicted Y');


figure
plot(Table_permuted_index, RESULTS.X_ResidualMatrix, '*');
title('X RESIDUALS');
xlabel('RowNum');
ylabel('Y Residuals');

figure
plot(Table_permuted_index, RESULTS.Y_ResidualMatrix, '*');
title('Y RESIDUALS');
xlabel('RowNum');
ylabel('Y Residuals');

figure
normplot(RESULTS.Y_ResidualMatrix)
title('Normal probability plot of Y residuals')









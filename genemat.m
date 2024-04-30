rxnGeneMat = model.rxnGeneMat;

% Get reaction and gene names
reactionNames = model.rxns;  % replace 'rxns' with the correct field name in your model
geneNames = model.genes;     % replace 'genes' with the correct field name in your model

% Create a table from the sparse matrix
rxnGeneTable = array2table(full(rxnGeneMat), 'RowNames', reactionNames, 'VariableNames', geneNames);

% Specify the file name
g5_ctrl_rxnGeneMat = 'rxnGeneMat_data.xlsx';

% Write the table to an Excel file
writetable(rxnGeneTable, g5_ctrl_rxnGeneMat, 'WriteRowNames', true);

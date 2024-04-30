RS_g5_ctrl = readCbModel('RS_g25_ctrl.mat');
RS_g5_MG = readCbModel('RS_g25_MG.mat');
RS_g25_ctrl = readCbModel('RS_g25_ctrl.mat');
RS_g25_MG = readCbModel('RS_g25_MG.mat');

% g5_ctrl
rxnGeneMat = RS_g5_ctrl.rxnGeneMat;
reactionNames = RS_g5_ctrl.rxns;  
geneNames = RS_g5_ctrl.genes;     
rxnGeneTable = array2table(full(rxnGeneMat), 'RowNames', reactionNames, 'VariableNames', geneNames);
g5_ctrl_rxnGeneMat = 'fullrxnGeneMat_data_g5_ctrl.xlsx';
writetable(rxnGeneTable, g5_ctrl_rxnGeneMat, 'WriteRowNames', true);


% g5_MG
rxnGeneMat = RS_g5_MG.rxnGeneMat;
reactionNames = RS_g5_MG.rxns;  
geneNames = RS_g5_MG.genes;     
rxnGeneTable = array2table(full(rxnGeneMat), 'RowNames', reactionNames, 'VariableNames', geneNames);
g5_MG_rxnGeneMat = 'fullrxnGeneMat_data_g5_MG.xlsx';
writetable(rxnGeneTable, g5_MG_rxnGeneMat, 'WriteRowNames', true);

% g25_ctrl
rxnGeneMat = RS_g25_ctrl.rxnGeneMat;
reactionNames = RS_g25_ctrl.rxns;  
geneNames = RS_g25_ctrl.genes;     
rxnGeneTable = array2table(full(rxnGeneMat), 'RowNames', reactionNames, 'VariableNames', geneNames);
g25_ctrl_rxnGeneMat = 'fullrxnGeneMat_data_g25_ctrl.xlsx';
writetable(rxnGeneTable, g25_ctrl_rxnGeneMat, 'WriteRowNames', true);


% g25_MG
rxnGeneMat = RS_g25_MG.rxnGeneMat;
reactionNames = RS_g25_MG.rxns;  
geneNames = RS_g25_MG.genes;     
rxnGeneTable = array2table(full(rxnGeneMat), 'RowNames', reactionNames, 'VariableNames', geneNames);
g25_MG_rxnGeneMat = 'fullrxnGeneMat_data_g25_MG.xlsx';
writetable(rxnGeneTable, g25_MG_rxnGeneMat, 'WriteRowNames', true);


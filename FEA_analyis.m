
clearvars;


% rxnGeneMat = RS_g5_ctrl.rxnGeneMat;
% [row, col, values] = find(rxnGeneMat);
% nonZeroData = [row, col, values];
% g5_ctrl_rxnGeneMat = 'g5_MG_rxnGeneMat_data.xlsx';
% writematrix(nonZeroData, g5_ctrl_rxnGeneMat);

ctrl_model = readCbModel('RS_g25_ctrl.mat');
MG_model = readCbModel('RS_g25_MG.mat');
% 
% 
% %% Calculation of FVA ratios
% common_rxns = intersect(ctrl_model.rxns, MG_model.rxns);
% 
% [minFlux, maxFlux] = fluxVariability(ctrl_model,'rxnNameList',common_rxns);
% [minFlux_1, maxFlux_1] = fluxVariability(MG_model,'rxnNameList',common_rxns);
% 
% 
% nums = [];
% denoms = [];
% 
% for i = 1:length(common_rxns)
%     num = maxFlux_1(i) - minFlux_1(i);
%     denom = maxFlux(i) - minFlux(i);
%     nums(i) = num;
%     denoms(i) = denom;
%     FVA_ratios(i) = num / denom;
% end
% 
% nums = nums';
% denoms = denoms';
% FVA_ratios = FVA_ratios';
% %% Downregulated and upregulated gene
% Down = MG_model.rxns(FVA_ratios >= 0.1 & FVA_ratios <= 0.5);
% UP = MG_model.rxns(FVA_ratios >= 2 & FVA_ratios <= 10);


% %% Flux enrichment analysis of UP and down regulated reactions from flux
% sampling

% data_1 = readtable('rxn_dysdata.xlsx','Sheet', 'g5_Down');
% data_2 = readtable('rxn_dysdata.xlsx','Sheet', 'g5_Up');
% Down_g5= data_1{:, 1};
% UP_g5 =data_2{:, 1};
% rxn_idsup_g5 = findRxnIDs(MG_model, UP_g5);
% rxn_idsdown_g5 = findRxnIDs(MG_model, Down_g5);
% resultCell_Down_g5 = FEA(MG_model, rxn_idsdown_g5,'subSystems');
% resultCell_UP_g5 = FEA(MG_model, rxn_idsup_g5,'subSystems');

data_3 = readtable('rxn_dysdata.xlsx','Sheet', 'g25_Down');
data_4 = readtable('rxn_dysdata.xlsx','Sheet', 'g25_Up');
Down_g25= data_3{:, 1};
UP_g25 =data_4{:, 1};
rxn_idsup_g25 = findRxnIDs(MG_model, UP_g25); 
rxn_idsdown_g25 = findRxnIDs(MG_model, Down_g25);
valid_rxn_idsup_g25 = rxn_idsup_g25(rxn_idsup_g25 > 0);
valid_rxn_idsdown_g25 = rxn_idsdown_g25(rxn_idsdown_g25 > 0);
resultCell_Down_g25 = FEA(MG_model,valid_rxn_idsdown_g25,'subSystems');
resultCell_UP_g25 = FEA(MG_model,valid_rxn_idsup_g25,'subSystems');


%% For finding blocked reactions and dead end metabolites %%
% outputMets = detectDeadEnds(model);
% DeadEnds = model.mets(outputMets);
% [rxnList, rxnFormulaList] = findRxnsFromMets(model, DeadEnds);
% model.lb(find(ismember(model.rxns,rxnList)));
% model.ub(find(ismember(model.rxns,rxnList)));
% [allGaps, rootGaps, downstreamGaps] = gapFind(model, 'true');
% BlockedReactions = findBlockedReaction(model);
%getjaccard(A,B)


%cobra.flux_analysis.find_blocked_reactions(test_model)%
%%% result = FEA(model,1:10,'subSystems');
%%% (model,indices,field_to_be_enriched);
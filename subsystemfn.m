function subsys_fn = subsystemfn(work_model)
    %% Subsystem extraction
    % c = categorical(work_model.subSystems);
    % a1 = categories(c);
    % a2 = countcats(c);
    % rxn_tab1 = table(a1, a2);
    
    %% Subsystem enrichment
    FBAsolution = optimizeCbModel(work_model);
    energySubSystems = {'S_Citric_Acid_Cycle'};
    energyReactions = work_model.rxns(ismember(work_model.subSystems, energySubSystems));
    [~, energy_rxnID] = ismember(energyReactions, work_model.rxns);
    reactionNames = work_model.rxnNames(energy_rxnID);
    reactionFormulas = printRxnFormula(work_model, energyReactions, 0);
    T = table(reactionNames, reactionFormulas, 'RowNames', energyReactions);
    subsys_fn = T;
   
    % Use validIndex to access elements in XValues
    printLabeledData(energyReactions, FBAsolution.x(energy_rxnID));
end

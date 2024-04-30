% rxns_model1 = model.rxns;
% rxnNames_model1 = model.rxnNames;
% subsystems_model1 = model.subSystems;
% 
% rxns_model2 = GIMME_Model_g25_MG.rxns;
% unique_rxns_model1 = setdiff(rxns_model1, rxns_model2);
% unique_rxnNames_model1 = model.rxnNames(ismember(rxns_model1, unique_rxns_model1));

% unique_rxns_subsystems = subsystems_model1(ismember(rxns_model1, unique_rxns_model1));
% unique_rxns_subsystems = unique_rxns_subsystems(~cellfun('isempty', unique_rxns_subsystems));
% disp(unique_rxns_subsystems);

% result_model1 = [unique_rxns_model1, unique_rxnNames_model1];

% disp('Reactions unique to Model 1:');
% disp('Reaction ID\tReaction Name');
% for i = 1:numel(unique_rxns_model1)
%     fprintf('%s\t%s\n', unique_rxns_model1{i}, unique_rxnNames_model1{i});
% end

% Assuming you have two models: model1 and model2

% Get the list of reactions and subsystems in each model
rxns_model1 = model.rxns;
subsystems_model1 = model.subSystems;

rxns_model2 = GIMME_Model_g5_ctrl.rxns;
subsystems_model2 = GIMME_Model_g5_ctrl.subSystems;

% Find reactions specific to the citric acid cycle subsystem in model1
tca_rxns_model1 = rxns_model1(strcmp(subsystems_model1, 'S_Oxidative_Phosphorylation'));

% Find reactions specific to the citric acid cycle subsystem in model2
tca_rxns_model2 = rxns_model2(strcmp(subsystems_model2, 'S_Oxidative_Phosphorylation'));

% Find missing reactions specific to the citric acid cycle subsystem in model1
missing_tca_rxns_model1 = setdiff(tca_rxns_model2, intersect(tca_rxns_model1, rxns_model1));

% Display the missing reactions in the citric acid cycle subsystem
%disp('Missing reactions in the Citric Acid Cycle subsystem in Model 1:');
disp(missing_tca_rxns_model1);

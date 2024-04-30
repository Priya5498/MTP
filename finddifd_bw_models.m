


control_rxn_ids = (1:length(control_model.rxns))';
MG_rxn_ids = findRxnIDs(MG_model, control_model.rxns);
control_unique_rxn_ids = setdiff(control_rxn_ids, MG_rxn_ids);
MG_unique_rxn_ids = setdiff(MG_rxn_ids, control_rxn_ids);
control_unique_rxns = control_model.rxns(control_unique_rxn_ids);
MG_unique_rxns = MG_model.rxns(MG_unique_rxn_ids);
unique_reactions_control_model = control_unique_rxns;
unique_reactions_MG_model = MG_unique_rxns;

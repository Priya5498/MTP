function reaction_subsystem_table = findSubsystemOfReactions(model, reaction_ids)
    reaction_subsystem_table = cell(length(reaction_ids), 2);
    for i = 1:length(reaction_ids)
        rxn_id = reaction_ids{i};
        % Find index of the reaction in the model
        rxn_index = find(strcmp(model.rxns, rxn_id));
        % Get the subsystem name of the reaction
        if ~isempty(rxn_index)
            reaction_subsystem_table{i, 1} = rxn_id; % Reaction ID
            reaction_subsystem_table{i, 2} = model.subSystems{rxn_index}; % Subsystem
        else
            reaction_subsystem_table{i, 1} = rxn_id;
            reaction_subsystem_table{i, 2} = 'Reaction not found';
        end
    end
    % Convert to table for better readability
    reaction_subsystem_table = cell2table(reaction_subsystem_table, 'VariableNames', {'Reaction', 'Subsystem'});
end





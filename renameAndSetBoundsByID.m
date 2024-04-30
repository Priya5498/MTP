function updatedModel = renameAndSetBoundsByID(model, reactionIDs, newNames)
    % Check if the provided reaction IDs are valid
    if any(reactionIDs < 1 | reactionIDs > numel(model.rxns))
        error('Invalid reaction ID(s).');
    end

    % Rename the specified reactions by ID
    model.rxns(reactionIDs) = newNames;

    % Set lower and upper bounds to 0 for the renamed reactions
    model.lb(reactionIDs) = 0;
    model.ub(reactionIDs) = 0;

    % Return the updated model
    updatedModel = model;
end
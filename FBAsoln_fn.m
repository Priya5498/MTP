function FBAsoln = FBAsoln_fn(modelCellArray)
    modelNames = {};
    fValues = [];
    for i = 1:length(modelCellArray) currentModel = modelCellArray{i};
        sol = optimizeCbModel(currentModel);
        modelNames{i} = sprintf('Model %d', i);
        if sol.stat == 1  % 1 indicates an optimal solution
         
         fValues(i) = sol.f;
        else
            fValues(i) = NaN;  % NaN to indicate that optimization failed
        end
    end
    FBAsoln.modelNames = modelNames;
    FBAsoln.fValues = fValues;
end
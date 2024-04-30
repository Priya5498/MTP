function iMAT_model = iMAT_modelfn(model,expression_genes,expression_values)
    identifiers = expression_genes.Platform_ORF;
    max_length = max(cellfun(@length, identifiers));
    for i = 1:numel(identifiers)
        identifiers{i}(end+1:max_length) = NaN;
    end
    numeric_identifier = cell2mat(identifiers);
    a1_expression_genes = table(numeric_identifier, 'VariableNames', {'Column1'});
    a1_expression_genes.Column1 = a1_expression_genes.Column1 + 0.1;
    a1_expression_genes.Column1 = num2str(a1_expression_genes.Column1);
    a1_expression_genes.Column1 = strtrim(a1_expression_genes.Column1);
    a_expression_values = table2array( expression_values ); %converitng to command readable data-types _gene vallue:
    
    % Create a table for gene expression data
    exprsdat = table(expression_genes.Platform_ORF, a_expression_values, 'VariableNames', {'gene', 'value'});
    
    
    % Map expression to reactions
    cur_ID = exprsdat.gene;
    expression_common = struct;
    expression_common.gene = cur_ID; % Use the converted 'cur_ID'
    expression_common.value = exprsdat.value;
    
    % Find common genes
    [gene_id, gene_expr] = findUsedGenesLevels(model, expression_common);
    
    % Map expression to reactions
    
    %Preprocessing to find the core set of reactions:
    expression_common_map = struct;
    expression_common_map.gene = gene_id;
    expression_common_map.value = gene_expr ;
    [expressionRxns, ~] = mapExpressionToReactions(model, expression_common_map);
    
    
    %Threshold
    PUB = prctile(expressionRxns,90,"all");
    PLB = prctile(expressionRxns,10,"all");

    %Extraction of model using iMAT:
    coreReactions = {'BIOMASS_SC5_notrace'};
    iMAT_model = iMAT(model, expressionRxns,PLB,PUB,1e-5,coreReactions);     
     
end


















































































































































































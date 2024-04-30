function INIT_model = INIT_modelfn(model,expression_genes,expression_values)

%% CONVERSION TO READABLE FORMAT
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
    
       
    %Preprocessing to find the core set of reactions:
    expression_common_map = struct;
    expression_common_map.gene = gene_id;
    expression_common_map.value = gene_expr ;
    [expressionRxns, ~] = mapExpressionToReactions(model, expression_common_map);
    
    
    % setting Threshold
    PLB = prctile(expressionRxns,10,"all");
    %weights = 5* log(expression_common_map.value/PUB);
 

    % Extraction of model using iMAT:
    %coreReactions = {'BIOMASS_SC5_notrace'}
    %INIT_model = INIT(model,weights,1e-6); 
    INIT_model = INIT(model,expressionRxns,PLB); 
end


















































































































































































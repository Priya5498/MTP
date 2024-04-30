function [genename_rxn_mat,genesymbol] = genes_rxn(model,ref_model)

for i = 1:numel(model.rxns)
    
    index = find(strcmp(ref_model.rxns,model.rxns{i}));
    gene_name = ref_model.geneDescription(find(ref_model.rxnGeneMat(index,:)==1));
    gene_symbol = ref_model.geneSymbol(find(ref_model.rxnGeneMat(index,:)==1));
    
    for j = 1:numel(gene_name)
        genename_rxn_mat(j,i) = gene_name(j);
        genesymbol(j,i) = gene_symbol(j);
    end
    if numel(gene_name)==0
        genename_rxn_mat(1,i) = {""};
        genesymbol(1,i) = {""};
    end
end

end
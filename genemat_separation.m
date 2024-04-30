gene_ncbi = readtable('gene_data.xlsx','VariableNamingRule', 'preserve');
load('RS_g5_ctrl.mat')
load('RS_g5_MG.mat')
load('RS_g25_ctrl.mat')
load('RS_g25_MG.mat')

parentmodel = readCbModel('RS_integrated_parent_yeastmodel.mat');



% For adding genesymbol and geneDescription into the model
% % genes = unique(genes);
ncbi_platform_orf = (gene_ncbi.Platform_ORF);
genes = RS_g5_ctrl.genes;
len = numel(genes);
geneName = {}; geneSymbol = {};
for i = 1:len
    yn = ismember(string(ncbi_platform_orf),genes(i));
    ind = find(yn==1);
    if numel(ind)==1
        gene = gene_ncbi.Gene_Description(ind);
        geneName(end+1,1) = gene;
        geneSymbol(end+1,1) = (gene_ncbi.Symbol(ind));
    else if numel(ind)==0
        geneName(end+1,1) = {''};
        geneSymbol(end+1,1) = {''};
    end
    end
end
% 
RS_g5_ctrl.geneDescription = geneName;
RS_g5_MG.geneDescription = geneName;
RS_g25_ctrl.geneDescription = geneName;
RS_g25_MG.geneDescription = geneName;
parentmodel.geneDescription = geneName;

RS_g5_ctrl.geneSymbol = geneSymbol;
RS_g5_MG.geneSymbol = geneSymbol;
RS_g25_ctrl.geneSymbol = geneSymbol;
RS_g25_MG.geneSymbol = geneSymbol;
parentmodel.geneSymbol = geneSymbol;

%%

% RS_g5_ctrl.rxnGeneMat = RS_g5_ctrl_1.rxnGeneMat;
% RS_g25_ctrl.rxnGeneMat = RS_g25_ctrl_1.rxnGeneMat;


%%
[RS_g5_ctrl_genes,RS_g5_ctrl_symbol] = genes_rxn(RS_g5_ctrl,parentmodel);
[RS_g25_ctrl_genes,RS_g25_ctrl_symbol] = genes_rxn(RS_g25_ctrl,parentmodel);


writetable(cell2table(RS_g5_ctrl_genes),'RS_g5_ctrl_genes_file.csv')
writetable(cell2table(RS_g25_ctrl_genes),'RS_g25_ctrl_genes_file.csv')

writetable(cell2table(RS_g5_ctrl_symbol),'RS_g5_ctrl_symbol_file.csv')
writetable(cell2table(RS_g25_ctrl_symbol),'RS_g25_ctrl_symbol_file.csv')




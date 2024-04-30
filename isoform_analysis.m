clearvars;
%load 'yeast_iMM904.mat';
model = readCbModel('yeast_iMM904.mat');
opts = detectImportOptions('updated_yeast_exp_file - Copy.xlsx');
opts.VariableNamingRule = 'preserve';
expression_data = readtable('updated_yeast_exp_file - Copy.xlsx',opts);

expression_genes = expression_data(:,1);
identifiers = expression_genes.Platform_ORF;
max_length = max(cellfun(@length, identifiers));
for i = 1:numel(identifiers)
    identifiers{i}(end+1:max_length) = NaN;
end
numeric_identifier = cell2mat(identifiers);
a_expression_genes = table(numeric_identifier, 'VariableNames', {'Column1'});

Model_genes = model.genes();
genes_1 = str2double(Model_genes);
genes_2 = floor(genes_1);
edges = unique(genes_2);

% Ensure edges is a numeric vector
edges = edges(isfinite(edges) & ~isnan(edges) & isreal(edges));

% Use histcounts to count occurrences in each bin
[N, edges] = histcounts(genes_2, [-inf; edges(:); inf]);

% Create the model_tab table
model_tab = table(edges(1:end-1)', N);
toDelete = model_tab.N == 1;
model_tab(toDelete, :) = [];

%% Data isoform detection
unique_values = unique(a_expression_genes.Column1);
counts_d = histc(a_expression_genes.Column1, unique_values);

% Create the data_tab table
data_tab = table(unique_values, counts_d, 'VariableNames', {'edges_d', 'counts_d'});
toDelete = data_tab.counts_d == 1;
if any(toDelete)
    data_tab(toDelete, :) = [];
end

%Common isoforms in model and data
model_values = model_tab.Var1(model_tab.Var1 ~= -Inf);

% Common isoforms in model and data
Comm = intersect(model_values, data_tab.edges_d);



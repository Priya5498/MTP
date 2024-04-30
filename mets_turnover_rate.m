clearvars;
model = readCbModel('RS_g25_ctrl.mat');
filepath = 'C:\Users\priya\Desktop\Programming\Jupyter notebook files\Mtech project\samples_g25_ctrl.csv';
fluxTable = readtable(filepath,'VariableNamingRule', 'preserve');
fluxData = table2array(fluxTable);
medianFluxValues = median(fluxData, 1);

numMetabolites = size(model.S, 1);
turnoverRates = zeros(numMetabolites, 1);

for i = 1:numMetabolites
    involvedReactions = find(model.S(i, :) ~= 0);   
    fluxSum = 0;
    for j = 1:length(involvedReactions)
        fluxSum = fluxSum + abs(model.S(i, involvedReactions(j)) * medianFluxValues(involvedReactions(j)));
    end    
    turnoverRates(i) = 0.5 * fluxSum;
end





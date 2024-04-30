clearvars;
%Load Yeast model and change the objective to ATP reaction
model = readCbModel('Yeast_MG_Parent_HARV_model.mat');
yeast_ATP_Model1 = changeObjective(model,'ATPtm_H');
soln1 = optimizeCbModel(yeast_ATP_Model1);
yeast_ATP_Model2 = changeObjective(model,'ATPtp_H');
soln2 = optimizeCbModel(yeast_ATP_Model2);
yeast_ATP_Model3 = changeObjective(model,'ATP2tp_H');
soln3 = optimizeCbModel(yeast_ATP_Model3);
yeast_ATP_Model4 = changeObjective(model,'ATPS3v');
soln4 = optimizeCbModel(yeast_ATP_Model4);
yeast_ATP_Model5 = changeObjective(model,'ATPS3g');
soln5 = optimizeCbModel(yeast_ATP_Model5);
yeast_ATP_Model6 = changeObjective(model,'ATPS3m');
soln6 = optimizeCbModel(yeast_ATP_Model6);
yeast_ATP_Model7 = changeObjective(model,'ATPM');
soln7 = optimizeCbModel(yeast_ATP_Model7);

%Load context specific model and optimize the biomass rxn
GIMME_Model_g5_ctrl = readCbModel('GIMME_Model_g5_ctrl.mat');
GIMME_Model_g5_MG = readCbModel('GIMME_Model_g5_MG.mat');
GIMME_Model_g25_ctrl = readCbModel('GIMME_Model_g25_ctrl.mat');
GIMME_Model_g25_MG = readCbModel('GIMME_Model_g25_MG.mat');

modelCellArray_GIMME ={GIMME_Model_g5_ctrl,GIMME_Model_g5_MG,GIMME_Model_g25_ctrl,GIMME_Model_g25_MG};
result_GIMME = FBAsoln_fn(modelCellArray_GIMME);


%Adding ATP demand reactions and optimize the biomass rxn
ATP_Model_g5_ctrl=ATP_modelfn(GIMME_Model_g5_ctrl);
ATP_Model_g5_MG=ATP_modelfn(GIMME_Model_g5_MG);
ATP_Model_g25_ctrl=ATP_modelfn(GIMME_Model_g25_ctrl);
ATP_Model_g25_MG=ATP_modelfn(GIMME_Model_g25_MG);
modelCellArray_ATPdemand = {ATP_Model_g5_ctrl,ATP_Model_g5_MG,ATP_Model_g25_ctrl,ATP_Model_g25_MG};
result_ATPdemand = FBAsoln_fn(modelCellArray_ATPdemand);




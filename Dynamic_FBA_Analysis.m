clearvars;
model = readCbModel('RS_g25_ctrl.mat');
model_amplified = changeRxnBounds(model,'EX_glc__D_e',-28,'l');
%model_altered = changeRxnBounds(model,'EX_glc__D_e',-1.5,'l');
%model_ammonia_altered = changeRxnBounds(model_amplified,'EX_nh4_e',-1,'l');
substrateRxns = {'EX_glc__D_e'};
initConcentrations = [7.2];
initBiomass = 0.06;                                                                                                                                                                                                                                                                                                                                                                                                                                                             
timestep = 0.1;
nSteps = 100;
plotRxns = {'EX_glc__D_e'};
[concentrationMatrix,excRxnNames,timeVec,biomassVec]=dynamicFBA(model_amplified,substrateRxns,initConcentrations,initBiomass,timestep,nSteps,plotRxns);


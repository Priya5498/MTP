clearvars;
%Load RS Eukaryote model
RSmodule = readCbModel('RSmodel_Recon3D1_revised.mat');
model = readCbModel('Yeast_MG_Parent_HARV_model.mat');

%% Modifying the mets names of RS module matching with yeast model
metabolites_model1 = model.mets;
metabolites_model2 = RSmodule.mets;
%% Find common mets between parent and RS module by finding intersction between metNames
metabolite_names_model1 = model.metNames;
metabolite_names_model2 = RSmodule.metNames;
common_metabolite_names = intersect(metabolite_names_model1, metabolite_names_model2);
%% Rename the mets in RS module

% Define the metabolites you want to rename and their new names
metabolites_to_rename = {'rib_D[c]', 'arab_L[c]','arg_L[c]', 'citr_L[c]', 'cyst_L[c]', 'cys_L[c]', 'glu_L[c]', 'gln_L[c]','hcys_L[c]','ser_L[c]','trp_L[c]','tyr_L[c]','Lcystin[c]'} ;
new_names = {'rib__D[c]', 'arab__L[c]', 'arg__L[c]', 'citr__L[c]', 'cyst__L[c]', 'cys__L[c]', 'glu__L[c]', 'gln__L[c]','hcys__L[c]','ser__L[c]','trp__L[c]','tyr__L[c]','cysi__L[c]'}; 

% Check if metabolites to rename are present in model2
valid_metabolites_indices = ismember(metabolites_model2, metabolites_to_rename);

% Update metabolite names in model2
metabolites_model2(valid_metabolites_indices) = new_names;
RSmodule.mets = metabolites_model2;

metabolites_model3 = RSmodule.mets;
rxns_model13 = RSmodule.rxns;

replace_special_characters = @(str) strrep(strrep(strrep(strrep(strrep(strrep(strrep(strrep(str, '[c]', '_c'), '[e]', '_e'), '[g]', '_g'), '[l]', '_l'), '[m]', '_m'), '[n]', '_n'), '[r]', '_r'), '[x]', '_x');
new_metabolite_names = cellfun(replace_special_characters, metabolites_model3, 'UniformOutput', false);
RSmodule.mets = new_metabolite_names;


new_rxn_names = cellfun(replace_special_characters, rxns_model13, 'UniformOutput', false);
RSmodule.rxns = new_rxn_names;

% Update model2 with the modified metabolite names
metabolites_model3 = RSmodule.mets;
common_metabolites = intersect(metabolites_model1, metabolites_model3);



%Load Context specific model
GIMME_Model_g5_ctrl = readCbModel('GIMME_Model_g5_ctrl.mat');
GIMME_Model_g5_MG = readCbModel('GIMME_Model_g5_MG.mat');
GIMME_Model_g25_ctrl = readCbModel('GIMME_Model_g25_ctrl.mat');
GIMME_Model_g25_MG = readCbModel('GIMME_Model_g25_MG.mat');



GIMME_Model_g5_ctrl = readCbModel('GIMME_Model_g5_ctrl_HARV.mat');
GIMME_Model_g5_MG = readCbModel('GIMME_Model_g5_MG_HARV.mat');
GIMME_Model_g25_ctrl = readCbModel('GIMME_Model_g25_ctrl_HARV.mat');
GIMME_Model_g25_MG = readCbModel('GIMME_Model_g25_MG_HARV.mat');


RSmodule_yeast = readCbModel('RSmodule_curated_yeast.mat');
RSmodule_yeast=changeRxnBounds(RSmodule_yeast, 'RS_136',-0.001,'l');
RSmodule_yeast=changeRxnBounds(RSmodule_yeast, 'RS_137',-0.001,'l');
RSmodule_yeast=changeRxnBounds(RSmodule_yeast, 'RS_138 ',-0.001,'l');
RSmodule_yeast=changeRxnBounds(RSmodule_yeast, 'RS_139',-0.001,'l');
RSmodule_yeast=changeRxnBounds(RSmodule_yeast, 'RS_140',-0.001,'l');
RSmodule_yeast=changeRxnBounds(RSmodule_yeast, 'RS_141',-0.001,'l');
RSmodule_yeast=changeRxnBounds(RSmodule_yeast, 'RS_142',-0.001,'l');
RSmodule_yeast=changeRxnBounds(RSmodule_yeast, 'RS_143',-0.001,'l');
RSmodule_yeast=changeRxnBounds(RSmodule_yeast, 'RS_144',-0.001,'l');
RSmodule_yeast=changeRxnBounds(RSmodule_yeast, 'RS_145',-0.001,'l');
RSmodule_yeast=changeRxnBounds(RSmodule_yeast, 'RS_146',-0.001,'l');
RSmodule_yeast=changeRxnBounds(RSmodule_yeast, 'RS_147',-0.001,'l');

RSmodule_yeast=changeRxnBounds(RSmodule_yeast, 'EX_HC00250_e',-0.001,'l');
RSmodule_yeast=changeRxnBounds(RSmodule_yeast, 'EX_h2o2_e',-0.001,'l');
RSmodule_yeast=changeRxnBounds(RSmodule_yeast, 'EX_o2_e',-0.001,'l');
RSmodule_yeast=changeRxnBounds(RSmodule_yeast, 'EX_h2o_e',-0.001,'l');
RSmodule_yeast=changeRxnBounds(RSmodule_yeast, 'EX_h_e',-0.001,'l');

RSmodule_yeast=changeRxnBounds(RSmodule_yeast, 'sink_3pyol_c',-0.2,'l');
RSmodule_yeast=changeRxnBounds(RSmodule_yeast, 'sink_4clcat_c',-0.2,'l');
RSmodule_yeast=changeRxnBounds(RSmodule_yeast, 'sink_5cu_c',-0.2,'l');
RSmodule_yeast=changeRxnBounds(RSmodule_yeast, 'sink_6-Benzylaminopurine-copper(II)_c',-0.2,'l');
RSmodule_yeast=changeRxnBounds(RSmodule_yeast, 'sink_Alanylhistidine-cu_c',-0.2,'l');
RSmodule_yeast=changeRxnBounds(RSmodule_yeast, 'sink_Cimetidine-copper(II)_c',-0.2,'l');
RSmodule_yeast=changeRxnBounds(RSmodule_yeast, 'sink_cat_c',-0.2,'l');
RSmodule_yeast=changeRxnBounds(RSmodule_yeast, 'sink_cuhy_c',-0.2,'l');
RSmodule_yeast=changeRxnBounds(RSmodule_yeast, 'sink_pgal_c',-0.2,'l');
RSmodule_yeast=changeRxnBounds(RSmodule_yeast, 'sink_purine_c',-0.2,'l');
RSmodule_yeast=changeRxnBounds(RSmodule_yeast, 'sink_2_mthio_et_c',-0.2,'l');
RSmodule_yeast=changeRxnBounds(RSmodule_yeast, 'sink_h2s_l',-0.2,'l');
RSmodule_yeast=changeRxnBounds(RSmodule_yeast, 'sink_thiopero_m',-0.2,'l');
RSmodule_yeast=changeRxnBounds(RSmodule_yeast, 'sink_s_r_m',-0.2,'l');
RSmodule_yeast=changeRxnBounds(RSmodule_yeast, 'EX_co3_e',-0.2,'l');
RSmodule_yeast=changeRxnBounds(RSmodule_yeast, 'EX_co3_r_e',-0.2,'l');
RSmodule_yeast=changeRxnBounds(RSmodule_yeast, 'EX_ura-adduct_e',-0.2,'l');
RSmodule_yeast=changeRxnBounds(RSmodule_yeast, 'EX_ade_adc_e',-0.2,'l'); 
RSmodule_yeast=changeRxnBounds(RSmodule_yeast, 'sink_sucr_c',-0.2,'l');
RSmodule_yeast=changeRxnBounds(RSmodule_yeast, 'sink_s3o6_c',-0.2,'l');
RSmodule_yeast=changeRxnBounds(RSmodule_yeast, 'sink_glc_D_n',-0.2,'l');
RSmodule_yeast=changeRxnBounds(RSmodule_yeast, 'sink_hocl_c',-0.2,'l'); 
RSmodule_yeast=changeRxnBounds(RSmodule_yeast, 'sink_hobr_c',-0.2,'l');
RSmodule_yeast=changeRxnBounds(RSmodule_yeast, 'sink_cl_rad_c',-0.2,'l');
RSmodule_yeast=changeRxnBounds(RSmodule_yeast, 'sink_o-2_c',-0.2,'l');
RSmodule_yeast=changeRxnBounds(RSmodule_yeast, 'sink_so3_ion_c',-0.2,'l');
RSmodule_yeast=changeRxnBounds(RSmodule_yeast, 'sink_gal_x',-0.2,'l');
RSmodule_yeast=changeRxnBounds(RSmodule_yeast, 'sink_oh_rad_x',-0.2,'l');
RSmodule_yeast=changeRxnBounds(RSmodule_yeast, 'sink_no2_rad_g',-0.2,'l');
RSmodule_yeast=changeRxnBounds(RSmodule_yeast, 'sink_o-2_c',-0.2,'l');
RSmodule_yeast=changeRxnBounds(RSmodule_yeast, 'EX_CE4633_e',-0.2,'l');

RSmodule_yeast = readCbModel('RSmodule_yeast_microgravity.mat');
yeast_model=readCbModel('Yeast_MG_Parent_HARV_model.mat');

%Integrate RS and Context Specific model
yeast_model_RS = mergeTwoModels(yeast_model,RSmodule_yeast);
RS_g5_ctrl_merged = mergeTwoModels(GIMME_Model_g5_ctrl, RSmodule_yeast);
RS_g5_MG_merged = mergeTwoModels(GIMME_Model_g5_MG,RSmodule_yeast);
RS_g25_ctrl_merged = mergeTwoModels (GIMME_Model_g25_ctrl,RSmodule_yeast);
RS_g25_MG_merged = mergeTwoModels(GIMME_Model_g25_MG,RSmodule_yeast);




%optimize the model
modelCellArray_RS = {RS_g5_ctrl_merged,RS_g5_MG_merged,RS_g25_ctrl_merged,RS_g25_MG_merged};
result_RS = FBAsoln_fn(modelCellArray_RS);

RS_g5_ctrl_merged = readCbModel('RS_g5_ctrl_merged.mat');
RS_g5_MG_merged = readCbModel('RS_g5_MG_merged.mat');
RS_g25_ctrl_merged = readCbModel('RS_g25_ctrl_merged.mat');
RS_g25_MG_merged = readCbModel('RS_g25_MG_merged.mat');

newNames = {'Ex_O2_modified','Ex_h2O_modified','h20t_modified','Ex_h_modified','O2t_modified'};
RS_integrated= renameAndSetBoundsByID(model,[1767,1768,1769,1770,1824], newNames);
RS_g5_ctrl= renameAndSetBoundsByID(RS_g5_ctrl_merged,[1254,1255,1256,1257,1311], newNames);
RS_g5_MG= renameAndSetBoundsByID(RS_g5_MG_merged,[1286,1287,1288,1289,1343], newNames);
RS_g25_ctrl= renameAndSetBoundsByID(RS_g25_ctrl_merged,[1248,1249,1250,1251,1305],newNames);
RS_g25_MG= renameAndSetBoundsByID(RS_g25_MG_merged,[1281,1282,1283,1284,1338],newNames);

modelCellArray_RS_1 = {RS_g5_ctrl,RS_g5_MG,RS_g25_ctrl,RS_g25_MG};
result_RS_1 = FBAsoln_fn(modelCellArray_RS);
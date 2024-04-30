clearvars;
model = readCbModel('RS_integrated_parent_yeastmodel.mat');
RS_g5_ctrl = readCbModel('RS_g5_ctrl.mat');
RS_g5_MG = readCbModel('RS_g5_MG.mat');
RS_g25_ctrl = readCbModel('RS_g25_ctrl.mat');
RS_g25_MG = readCbModel('RS_g25_MG.mat');
%Subsystem count
subsystem_count_yeast = subsys_count(model);
subsystem_count_g5_ctrl = subsys_count(RS_g5_ctrl);
subsystem_count_g5_MG = subsys_count(RS_g5_MG);
subsystem_count_g25_ctrl = subsys_count(RS_g25_ctrl);
subsystem_count_g25_MG = subsys_count(RS_g25_MG);

%Subsystem Enrichment Analysis
subsystem_enrichment_g5_ctrl = subsystemfn(RS_g5_ctrl);
subsystem_enrichment_g5_MG = subsystemfn(RS_g5_MG);
subsystem_enrichment_g25_ctrl = subsystemfn(RS_g25_ctrl);
subsystem_enrichment_g25_MG = subsystemfn(RS_g25_MG);

%subsystem identification
% Example usage:
data_1 = readtable('rxn_dysdata.xlsx','Sheet', 'g5_Down');
data_2 = readtable('rxn_dysdata.xlsx','Sheet', 'g5_Up');
Down_g5= data_1{:, 1};
Up_g5 =data_2{:, 1};
data_3 = readtable('rxn_dysdata.xlsx','Sheet', 'g25_Down');
data_4 = readtable('rxn_dysdata.xlsx','Sheet', 'g25_Up');
Down_g25= data_3{:, 1};
Up_g25 =data_4{:, 1};

subsystems_of_rxns = findSubsystemOfReactions(RS_g25_ctrl, Up_g25);

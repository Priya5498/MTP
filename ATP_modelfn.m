function ATP_Model = ATP_modelfn(model)
metlist = ['atp_c'];
met_list= cellstr (metlist);
GIMME_model = addDemandReaction(model, met_list);
ATP_Model = changeObjective(GIMME_model,'DM_atp_c');
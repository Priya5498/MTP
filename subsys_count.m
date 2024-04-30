function rxn_tab = subsys_count(model)
    c = categorical(model.subSystems);
    a1= categories (c);
    a2 = countcats(c);
    rxn_tab = table(a1,a2);
end
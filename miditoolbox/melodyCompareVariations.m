function melodyCompareVariations()
    materials = load('twinkle-variations.mat');
    n_mel = length(materials.twinkleMidi);
    mel_rep = cell(1, n_mel);
    for i = 1:n_mel
        mel_rep{i} = melodyBuildRepresentation(materials.twinkleMidi{i});
    end
    sim_pred = ones(n_mel);
    n_comp = nchoosek(n_mel, 2);
    comp_pred = ones(n_comp, 1);
    ind_comp = 0;
    for i = 1:n_mel-1
        for j = i+1:n_mel
            ind_comp = ind_comp + 1;
            sim_temp = melodyEditDistance(mel_rep{i}, mel_rep{j});
            sim_pred(i, j) = sim_temp;
            sim_pred(j, i) = sim_temp;
            comp_pred(ind_comp, 1) = sim_temp;
        end
    end
    mu = mean(comp_pred);
    sim_pred_disp = cell(n_mel+1);
    for i = 1:n_mel
        sim_pred_disp{1, i + 1} = materials.twinkleNames{i};
        sim_pred_disp{i + 1, 1} = materials.twinkleNames{i};
        for j = 1:n_mel
            sim_pred_disp{i + 1, j + 1} = sim_pred(i, j);
        end
    end
    disp('Scored Similarity:');
    disp(sim_pred_disp);
    disp(' ');
    disp(['Mean Similarity: ', num2str(mu)]);
end
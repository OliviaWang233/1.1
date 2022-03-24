function melodyModelResultsGlobal()
    materials = load('similarity-poll-materials.mat');
    results = load('similarity-poll-results.mat');
    n_mel = length(materials.songsMidi);
    sim_res = 1 - results.dist_mel ./ 6;
    sim_pred = ones(n_mel);
    n_comp = nchoosek(n_mel, 2);
    comp_res = ones(n_comp, 1);
    comp_pred = ones(n_comp, 1);
    ind_comp = 0;
    for i = 1:n_mel-1
        for j = i+1:n_mel
            ind_comp = ind_comp + 1;
            comp_res(ind_comp, 1) = sim_res(i, j);
            sim_temp = melodySimilarityGlobal(materials.songsMidi{i}, materials.songsMidi{j}, i, j);
            sim_pred(i, j) = sim_temp;
            sim_pred(j, i) = sim_temp;
            comp_pred(ind_comp, 1) = sim_temp;
        end
    end
    rho = corr(comp_res, comp_pred, 'type', 'Spearman');
    sim_res_disp = cell(n_mel+1);
    sim_pred_disp = cell(n_mel+1);
    for i = 1:n_mel
        sim_res_disp{1, i + 1} = ['Melody ', num2str(i)];
        sim_res_disp{i + 1, 1} = ['Melody ', num2str(i)];
        sim_pred_disp{1, i + 1} = ['Melody ', num2str(i)];
        sim_pred_disp{i + 1, 1} = ['Melody ', num2str(i)];
        for j = 1:n_mel
            sim_res_disp{i + 1, j + 1} = sim_res(i, j);
            sim_pred_disp{i + 1, j + 1} = sim_pred(i, j);
        end
    end
    disp('Rated Similarity:');
    disp(sim_res_disp);
    disp(' ');
    disp('Scored Similarity:');
    disp(sim_pred_disp);
    disp(' ');
    disp(['Correlation: ', num2str(rho)]);
end
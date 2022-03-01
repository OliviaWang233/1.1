function [dist_mel, data_raw] = melodyPollReadResults()
    materials = load('similarity-poll-materials.mat');
    n_poll = length(materials.songsSound);
    n_comp = nchoosek(n_poll, 2);
    data_raw = zeros(n_poll, 0);
    datapath = 'class-responses';
    directory = dir(datapath);
    ind = 0;
    for i = 1:length(directory)
        if length(directory(i).name) >= 4 && strcmp(directory(i).name(end-3:end), '.xls')
            ind = ind + 1;
            [nums_temp, text_temp] = xlsread(fullfile(datapath, directory(i).name));
            for j = 1:n_comp
                switch text_temp{j + 1, 2}
                    case 'Very Dissimilar'
                        data_raw(j, ind) = 6;
                    case 'Dissimilar'
                        data_raw(j, ind) = 5;
                    case 'Slightly Dissimilar'
                        data_raw(j, ind) = 4;
                    case 'Neither Similar Nor Dissimilar'
                        data_raw(j, ind) = 3;
                    case 'Slightly Similar'
                        data_raw(j, ind) = 2;
                    case 'Similar'
                        data_raw(j, ind) = 1;
                    case 'Very Similar'
                        data_raw(j, ind) = 0;
                    otherwise
                        disp('Invalid selection');
                        disp(directory(i).name);
                        disp(j);
                        return;
                end
            end
        end
    end
    dist_mel = zeros(n_poll);
    for i = 1:n_comp
        ind1 = materials.comparisonsInds(i, 1);
        ind2 = materials.comparisonsInds(i, 2);
        dist_bar = mean(data_raw(i, :));
        dist_mel(ind1, ind2) = dist_bar;
        dist_mel(ind2, ind1) = dist_bar;
    end
    csvwrite('similarity-poll-distance-ratings.csv', data_raw);
    csvwrite('similarity-poll-distance-matrix.csv', dist_mel);
    save('similarity-poll-results.mat', 'data_raw', 'dist_mel');
end
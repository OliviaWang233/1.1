function melodyPollMakeFiles(corpus, n_poll)
    pathname = uigetdir();
    randInds = randperm(length(corpus));
    randInds = randInds(1:n_poll);
    songsSound = cell(1, n_poll);
    fs = 8000;
    for i = 1:n_poll
        songsSound{i} = nmat2snd(corpus{randInds(i)}.N, 'fm', fs)';
        audiowrite(fullfile(pathname, ['similarity-poll-melody-', num2str(i), '.wav']), songsSound{i}, fs);
        
        pianoroll(corpus{randInds(i)}.N, 'y');
        ax = gca;
        set(gca, 'FontSize', 14);
        title(['Melody ', num2str(i)], 'FontSize', 36);
        xlabel('Time in Beats', 'FontSize', 24);
        ylabel('Pitch', 'FontSize', 24);
        saveas(gcf, ['similarity-poll-melody-', num2str(i), '.jpg']);
    end
    sil = zeros(fs, 1);
    beep = sin(2 * pi * 440 .* (0:fs/2-1) ./ fs)';
    n_comp = nchoosek(n_poll, 2);
    comparisonsSound = cell(1, n_comp);
    comparisonsInds = zeros(n_comp, 2);
    ind = 0;
    for i = 1:n_poll-1
        for j = i+1:n_poll
            ind = ind + 1;
            if rand < .5
                comparisonsSound{ind} = [sil; beep; sil; songsSound{i}; sil; beep; sil; beep; sil; songsSound{j}];
                comparisonsInds(ind, :) = [i, j];
            else
                comparisonsSound{ind} = [sil; beep; sil; songsSound{j}; sil; beep; sil; beep; sil; songsSound{i}];
                comparisonsInds(ind, :) = [j, i];
            end
        end
    end
    fullSound = zeros(0, 1);
    corpusInds = randInds;
    randInds = randperm(n_comp);
    for i = 1:n_comp
        num = audioread(fullfile('F:\OneDrive\Documents\spoken-numbers', [num2str(i), '.wav']));
        fullSound = [fullSound; sil; num; comparisonsSound{randInds(i)}];
    end
    audiowrite(fullfile(pathname, ['similarity-poll-comparisons.wav']), fullSound, fs);
    save('similarity-poll-materials.mat', 'songsSound', 'fullSound', 'comparisonsInds', 'corpusInds');
end


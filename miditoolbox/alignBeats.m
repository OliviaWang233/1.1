function alignBeats(midiFiles, midiFilenames)
    for i = 1:length(midiFiles)
        score_best = -Inf;
        for j = 1:8
            beatPeriod = j / 4;
            for k = 1:j
                beatPhase = (k - 1) / 4;
                score_temp = 0;
                count_temp = 0;
                for l = 2:size(midiFiles{i}, 1)-1
                    if mod(midiFiles{i}(l, 1) - beatPhase, beatPeriod) == 0
                        score_temp = score_temp + beatScore(midiFiles{i}, l);
                        count_temp = count_temp + 1;
                    end
                end
                score_temp = score_temp / count_temp;
                if score_temp > score_best || (score_temp == score_best && rand < 0.5)
                    period_best = beatPeriod;
                    phase_best = beatPhase;
                    score_best = score_temp;
                end
            end
        end
        disp(' ');
        disp(midiFilenames{i});
        disp(' ');
        if period_best == 1
            disp('Beat spacing correct');
        else
            disp('Beat spacing incorrect');
            disp(['Beats spaced ', num2str(period_best * 4), ' 16th-notes apart instead of 4 16th-notes apart']);
        end
        disp(' ');
        if phase_best == 0
            disp('Beat placement correct');
        else
            disp('Beat placement incorrect');
            disp(['Beats placed starting at 16th-note ', num2str(phase_best * 4 + 1), ' instead of 16th-note 1']);
        end
        disp(' ');
        disp(' ');
        disp('--------------------');
    end
end
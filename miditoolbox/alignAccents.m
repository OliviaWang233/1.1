function alignAccents(midiFiles, midiFilenames, meters)
    for i = 1:length(midiFiles)
        score_best = -Inf;
        for j = 2:3
            accentPeriod = j;
            for k = 1:j
                accentPhase = k - 1;
                score_temp = 0;
                for l = 2:size(midiFiles{i}, 1)-1
                    if mod(midiFiles{i}(l, 1) - accentPhase, accentPeriod) == 0
                        score_temp = score_temp + accentScore(midiFiles{i}, l);
                    end
                end
                if score_temp > score_best
                    period_best = accentPeriod;
                    phase_best = accentPhase;
                    score_best = score_temp;
                end
            end
        end
        disp(' ');
        disp(midiFilenames{i});
        disp(' ');
        if period_best == meters(i)
            disp('Accent spacing correct');
        else
            disp('Accent spacing incorrect');
            disp(['Accents spaced ', num2str(period_best), ' beats apart instead of ', num2str(meters(i)), ' beats apart']);
        end
        disp(' ');
        if phase_best == 0
            disp('Accent placement correct');
        else
            disp(['Accents placed starting at beat ', num2str(phase_best + 1), ' instead of beat 1']);
        end
        disp(' ');
        disp(' ');
        disp('--------------------');
    end
end
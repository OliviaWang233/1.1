% Computes one (or more) predictors of the expectedness ratings for the 200
% melodic patterns used by Cuddy and Lunney (1995).
%   * Input - CL_midi, a 1-by-200 cell array of the MIDI files of the 200
%             patterns
%   * Output - CL_predictors, a 200-by-1 vector of real-valued predictors
%              for the patterns
function CL_predictors = cuddyLunneyPredictors(CL_midi)
    % Determines number of patterns (should be 200)
    n_pattern = length(CL_midi);
    
    % Sets number of predictors
    n_predictor = 1;
    
    % Sets value of predictor(s) for each pattern. Set the value of
    % CL_predictors(i, j) inside the for loop to the desired value of the
    % jth predictor for the ith pattern based on its MIDI file
    for i = 1:n_pattern
        CL_predictors(i, 1) = 
    end
end
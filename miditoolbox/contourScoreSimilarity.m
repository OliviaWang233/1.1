%   Inputs - melody1_rep, an n-by-p matrix containing the p features
%            derived from the n notes of the first melody being compared
%
%            melody2_rep, an n-by-p matrix containing the p features
%            derived from the n notes of the second melody being compared
%
%   Output - score, a real number indicating the similarity of the two
%            melodies
%
function score = contourScoreSimilarity(melody1_rep, melody2_rep)
%   Do not alter
    n_note = size(melody1_rep, 1);
    n_feat = size(melody1_rep, 2);
    score = 0;
    
    for ind_note = 1:n_note
        
%       Alter this block of code to set the value of score_note--the
%       similarity score for the note under analysis--as you wish.
        score_note = 0;
        for ind_feat = 1:n_feat
            if melody1_rep(ind_note, ind_feat) == melody2_rep(ind_note, ind_feat)
                score_note = score_note + 1;
            end
        end
        score_note = score_note / n_feat;
        
%   Do not alter
        score = score + score_note;
    end
    score = score / n_note;
end
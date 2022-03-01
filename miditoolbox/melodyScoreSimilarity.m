% Inputs - features1, a vector containing the features of the note under
%          analysis from one of the two melodies being compared.
%
%          features2, a vector containing the features of the note under
%          analysis from the other of the melodies.
%
% Output - score, a value indicating the similarity between the two notes
%          being compared.
function score = melodyScoreSimilarity(features1, features2)
%   To change the scoring function, alter the code below.
    n_feat = length(features1);
    score = 0;
    for i = 1:n_feat
        if features1(i) == features2(i)
            score = score + 1;
        end
    end
    score = score / n_feat;
    
end
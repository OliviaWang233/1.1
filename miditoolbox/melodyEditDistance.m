function s = melodyEditDistance(melody1, melody2)
%   To change the score for insertions and deletions, reset the variable
%   below.
    insertDeleteScore = -0.5;
    
    m = size(melody1, 1);
    n = size(melody2, 1);
    D = zeros(m + 1, n + 1);
    for i = 2:(m + 1)
        for j = 2:(n + 1)
            sim = melodyScoreSimilarity(melody1(i - 1, :), melody2(j - 1, :));
            D(i, j) = max([D(i - 1, j) + insertDeleteScore, D(i, j - 1) + insertDeleteScore, D(i - 1, j - 1) + sim, 0]);
        end
    end
    s = D(m + 1, n + 1);
    s = s / max(m, n);
end
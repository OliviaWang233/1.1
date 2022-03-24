% Counts the number of times each pattern used by Cuddy and Lunney (1995)
% occurs in the entire Essen folksong corpus. Creates a 200-by-1 vector,
% CL_essenCounts containing these tallies.
CL_essenCounts = zeros(200, 1);
for i = 1:200
    for j = 1:length(essenCorpus)
        CL_essenCounts(i) = CL_essenCounts(i) +...
            cuddyLunneyCountOccurences(CL_implicativeInt(i), CL_realizedInt(i), essenCorpus{j});
    end
end
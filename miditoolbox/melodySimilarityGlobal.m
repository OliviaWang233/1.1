% Computes a score of the similarity of two melodies based on global, not
% note-by-note, features.
%
%   Inputs - melody1, an n-by-7 matrix of the MIDI file for the first 
%            melody
%          - melody2, an n-by-7 matrix of the MIDI file for the second
%            melody
%          - index1, the index (from 1 to 6) of the first melody
%          - index2, the index (from 1 to 6) of the second melody
%
%   Output - a real-valued score of the similarity of the two melodies
function score = melodySimilarityGlobal(melody1, melody2, index1, index2)
    % Set score to desired value based on a comparision of melody1 with
    % melody2 and/or index1 with index2
    
   
    %difference_mean_pitch = abs(mean(melody1(:,4)) - mean(melody2(:,4)));
    
    s1 = size(melody1,1);
    s2 = size(melody2,1);
    difference_density = abs((max(melody1(:,1))/s1) - (max(melody2(:,1))/s2));
    
    



    %difference_notesAmount = abs(size(melody1,1) - size(melody2,1));
    score = difference_density;
    

end
% Coounts all instances of a particular three-note pattern in one MIDI file.
% The pattern is specified by its first and second interval in semitones, a
% la Cuddy and Lunney (1995);
%   * Input - implicativeInt, the first interval of the target pattern in
%             signed semitones
%           - realizedInt, the second interval of the target pattern in
%             signed semitones
%           - an n-by-7 matrix of the MIDI file to be searched for the
%             pattern
%   * Output - count, the number of times the target pattern occurs in the
%              MIDI file
function count = cuddyLunneyCountOccurences(implicativeInt, realizedInt, midiFile)
    
end
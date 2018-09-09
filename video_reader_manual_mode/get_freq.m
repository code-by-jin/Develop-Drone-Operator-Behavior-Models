function freq = get_freq(all_seq, num_hidden, tran, emis)
freq = zeros(num_hidden, 1);

for i = 1:length(all_seq)
    estimatedStates = hmmviterbi(all_seq{i},tran,emis);
    for j = 1:length(estimatedStates)
        freq(estimatedStates(j)) = freq(estimatedStates(j)) + 1;
    end
end

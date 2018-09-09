clear;clc;
numHidden = 4;
num_observations = 15;
dir_to_search = './Manual + Supervisory'; 
txtpattern = fullfile(char(dir_to_search), '*.txt');    
dinfo = dir(txtpattern);
all_seq = cell(length(dinfo), 1);
for K = 1 : length(dinfo)
    thisfilename = fullfile(char(dir_to_search), dinfo(K).name);  %just the name
    fileID = fopen(thisfilename, 'r');  
    seq = (fscanf(fileID, '%d'))';
    all_seq{K} = seq;
end

Trans = cell(30, 1);
Emis = cell(30, 1);
Log_Liks = zeros(30, 1);

  
tran = generate_uniform_trans_probs([numHidden, numHidden]);
emis = generate_random_trans_probs([numHidden, num_observations]);
[transition, emission, log_likelihood] = hmmtrain(all_seq, tran, emis, 'Maxiterations', 10000, 'Verbose', true);

Frequences = zeros(numHidden, 1);

for i = 1:length(all_seq)
    estimatedStates = hmmviterbi(all_seq{i},transition,emission);
    for j = 1:length(estimatedStates)
        Frequences(estimatedStates(j)) = Frequences(estimatedStates(j)) + 1;
    end
end


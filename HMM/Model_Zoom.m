clear;clc;
numHidden_Supervisory = 3;
num_observations = 8;
dir_to_search = './Zoom'; 
txtpattern = fullfile(char(dir_to_search), '*.txt');    
dinfo = dir(txtpattern);
all_seq = cell(length(dinfo), 1);
for K = 1 : length(dinfo)
    thisfilename = fullfile(char(dir_to_search), dinfo(K).name);  %just the name
    fileID = fopen(thisfilename, 'r');  
    seq = (fscanf(fileID, '%d'))';
    all_seq{K} = seq;
end

for i = 1:length(all_seq)
    temp_list = cell2mat(all_seq(i));
    temp_list(temp_list==8) = 1;
    temp_list(temp_list==9) = 2;
    temp_list(temp_list==10) = 3;
    temp_list(temp_list==11) = 4;
    temp_list(temp_list==12) = 5;
    temp_list(temp_list==13) = 6;
    temp_list(temp_list==14) = 7;
    temp_list(temp_list==15) = 8;
    all_seq{i} = temp_list;
end

Trans = cell(30, 1);
Emis = cell(30, 1);
Log_Liks = zeros(30, 1);
for i=1:15
    tran = generate_random_trans_probs([numHidden_Supervisory, numHidden_Supervisory]);
    emis = generate_random_trans_probs([numHidden_Supervisory, num_observations]);
    [transition, emission, log_likelihood] = hmmtrain(all_seq, tran, emis, 'Maxiterations', 10000, 'Verbose', true);
    Log_Liks(i) = log_likelihood(end);
    Trans{i} = transition;
    Emis{i} = emission;
end

for i=16:30   
    tran = generate_uniform_trans_probs([numHidden_Supervisory, numHidden_Supervisory]);
    emis = generate_random_trans_probs([numHidden_Supervisory, num_observations]);
    [transition, emission, log_likelihood] = hmmtrain(all_seq, tran, emis, 'Maxiterations', 10000, 'Verbose', true);
    Log_Liks(i) = log_likelihood(end);
    Trans{i} = transition;
    Emis{i} = emission;
end
clear;clc;
dir_to_search = './Supervisory'; 
txtpattern = fullfile(char(dir_to_search), '*.txt');    
dinfo = dir(txtpattern);
all_seq = cell(length(dinfo), 1);
for K = 1 : length(dinfo)
    thisfilename = fullfile(char(dir_to_search), dinfo(K).name);  %just the name
    fileID = fopen(thisfilename, 'r');  
    seq = (fscanf(fileID, '%d'))';
    all_seq{K} = seq;
end
disp(all_seq)
[Trans, Emis, Log_Liks] = HMM_training (all_seq);
num_all_seq = sum(cellfun('prodofsize', all_seq));
titlename = 'Supervisory (random transition probs + random emission probs)';
plotBIC (Log_Liks, num_all_seq, titlename);

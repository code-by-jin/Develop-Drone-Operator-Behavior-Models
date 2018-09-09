clear;clc;
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

[Trans, Emis, Log_Liks] = HMM_training (all_seq);
num_all_seq = sum(cellfun('prodofsize', all_seq));
titlename = 'zooming  (uniform transition probs + random emission probs)';
plotBIC (Log_Liks, num_all_seq, titlename);
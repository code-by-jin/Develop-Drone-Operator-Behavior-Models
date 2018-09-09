clear;clc;
numHidden_Supervisory = 2;
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

Trans = zeros(8,8);

for i = 1:length(all_seq)
    seq = cell2mat(all_seq(i));
    for j = 1:length(seq)-1
        Trans(seq(j), seq(j+1)) = Trans(seq(j), seq(j+1)) + 1;
    end
end

Trans_sum = sum(Trans,2);
for i = 1:8
    Trans(:,i) = Trans(:,i)./Trans_sum;
end

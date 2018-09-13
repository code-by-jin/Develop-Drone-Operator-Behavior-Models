function data = read_data(path)
% Function to read data from given path.
%
%inputs:
% - path = path to find data
%
% output:
% - data = data for HMM model
% 
% written by: Jin Zhou, Duke University

    txtpattern = fullfile(char(path), '*.txt');    
    dinfo = dir(txtpattern);
    data = cell(length(dinfo), 1);
    for K = 1 : length(dinfo)
        thisfilename = fullfile(char(path), dinfo(K).name);  %just the name
        fileID = fopen(thisfilename, 'r');  
        seq = (fscanf(fileID, '%d'))';
        data{K} = seq;
    end
end


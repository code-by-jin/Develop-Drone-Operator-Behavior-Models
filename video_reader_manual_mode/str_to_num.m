clear;clc;
% This is for Manual, String to Num
dir_to_search = './manual_data'; 
txtpattern = fullfile(char(dir_to_search), '*.txt');
dinfo = dir(txtpattern);
for K = 1 : length(dinfo)
    thisfilename = fullfile(char(dir_to_search), dinfo(K).name);  %just the name
    thisdata = importdata(thisfilename); 
    thisdata = strrep(thisdata, 'Rise', '1');
    thisdata = strrep(thisdata, 'Descent', '2');
    thisdata = strrep(thisdata, 'Move Forward', '3');
    thisdata = strrep(thisdata, 'Move Backward', '4');
    thisdata = strrep(thisdata, 'Move Left', '5');
    thisdata = strrep(thisdata, 'Move Right', '6');
    thisdata = strrep(thisdata, 'Rotate Left', '7');
    thisdata = strrep(thisdata, 'Rotate Right', '8');  
    filePh = fopen(thisfilename, 'w');
    fprintf(filePh,'%s\n',thisdata{:});
    fclose(filePh);
end
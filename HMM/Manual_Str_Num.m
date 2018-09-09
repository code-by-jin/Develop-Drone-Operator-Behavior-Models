clear;clc;
% This is for Manual, String to Num
dir_to_search = './Manual'; 
txtpattern = fullfile(char(dir_to_search), '*.txt');
dinfo = dir(txtpattern);
for K = 1 : length(dinfo)
    thisfilename = fullfile(char(dir_to_search), dinfo(K).name);  %just the name
    thisdata = importdata(thisfilename); 
    thisdata = strrep(thisdata, 'Takeoff', '1');
    thisdata = strrep(thisdata, 'Land Here', '2');
    thisdata = strrep(thisdata, 'View Switching', '3');
    thisdata = strrep(thisdata, 'Rise', '4');
    thisdata = strrep(thisdata, 'Descent', '5');
    thisdata = strrep(thisdata, 'Move Forward', '6');
    thisdata = strrep(thisdata, 'Move Backward', '7');
    thisdata = strrep(thisdata, 'Move Left', '8');
    thisdata = strrep(thisdata, 'Move Right', '9');
    thisdata = strrep(thisdata, '6Left', '10');
    thisdata = strrep(thisdata, '6Right', '11');
    thisdata = strrep(thisdata, '7Left', '12');
    thisdata = strrep(thisdata, '7Right', '13');
    thisdata = strrep(thisdata, 'Rotate Left', '14');
    thisdata = strrep(thisdata, 'Rotate Right', '15');    
    filePh = fopen(thisfilename, 'w');
    fprintf(filePh,'%s\n',thisdata{:});
    fclose(filePh);
end

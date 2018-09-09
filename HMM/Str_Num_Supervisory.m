clear;clc;
dir_to_search = './Zoom'; 
txtpattern = fullfile(char(dir_to_search), '*.txt');
dinfo = dir(txtpattern);
for K = 1 : length(dinfo)
    thisfilename = fullfile(char(dir_to_search), dinfo(K).name);  %just the name
    thisdata = importdata(thisfilename); 
    thisdata = strrep(thisdata, '8', '1');
    thisdata = strrep(thisdata, '9', '2');
    thisdata = strrep(thisdata, '10', '3');
    thisdata = strrep(thisdata, '11', '4');
    thisdata = strrep(thisdata, '12', '5');
    thisdata = strrep(thisdata, '13', '6');
    thisdata = strrep(thisdata, '14', '7');
    thisdata = strrep(thisdata, '15', '8');  
    filePh = fopen(thisfilename, 'w');
    fprintf(filePh,'%s\n',thisdata{:});
    fclose(filePh);
end

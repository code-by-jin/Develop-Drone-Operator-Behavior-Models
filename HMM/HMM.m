clear;clc;
dir_name = ["Supervisory_zoom", "Manual_Supervisory_zoom"];

for i = 1 : 2
    dir_to_search = './' + dir_name(i); 
    disp(dir_to_search)
    txtpattern = fullfile(char(dir_to_search), '*.txt');
    dinfo = dir(txtpattern);
    thisdata = [];
    for K = 1 : length(dinfo)
        thisfilename = fullfile(char(dir_to_search), dinfo(K).name);  %just the name
        thisdata = vertcat(thisdata, importdata(thisfilename)); %load just this fil
    end
    unique(thisdata)
    dir_count = tabulate(thisdata);
    disp(dir_count);
end

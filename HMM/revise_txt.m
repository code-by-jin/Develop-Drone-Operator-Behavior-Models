% This is for revising the txt files.

dir_name = ["Manual", "Manual + Supervisory", "Supervisory"];

for i = 1 : 3
    dir_to_search = './' + dir_name(i); 
    txtpattern = fullfile(char(dir_to_search), '*.txt');
    dinfo = dir(txtpattern);
    for K = 1 : length(dinfo)
        thisfilename = fullfile(char(dir_to_search), dinfo(K).name);  %just the name
        thisdata = importdata(thisfilename); 
        thisdata = strrep(thisdata, 'Rotate Left ', 'Rotate Left');
        thisdata = strrep(thisdata, 'Rotate Left ', 'Rotate Left ');
        thisdata = strrep(thisdata, 'Rotate Right ', 'Rotate Right');
        thisdata = strrep(thisdata,'Move Backward Right ','Move Backward Right');
        thisdata = strrep(thisdata, 'Move ForwardRight ', 'Move ForwardRight');
        thisdata = strrep(thisdata, 'Move Forward Left ', 'Move Forward Left');
        thisdata = strrep(thisdata, 'Move Forward Right ', 'Move Forward Right');
        thisdata = strrep(thisdata, 'Move Left ', 'Move Left');
        thisdata = strrep(thisdata, 'Rise ', 'Rise');
        filePh = fopen(thisfilename, 'w');
        fprintf(filePh,'%s\n',thisdata{:});
        fclose(filePh);
    end
end
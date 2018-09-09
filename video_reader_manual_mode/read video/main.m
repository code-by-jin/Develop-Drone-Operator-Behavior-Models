close all; clear; clc;

[C1, C2] = get_joystick_centers('manual_mode_video/01_pass.mp4', 107);

dirName = 'manual_mode_video/';
fileExt = strcat(dirName, '*.mp4');  
files = dir(fullfile(fileExt));  
len = size(files,1);  
for i=1:len  
    fileName = strcat(dirName, files(i,1).name);   
    video_to_txt(fileName, C1, C2);
end
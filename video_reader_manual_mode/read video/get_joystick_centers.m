function [C1, C2] = get_joystick_centers(video_name, t)

vidobj = VideoReader(video_name);
vidobj.CurrentTime = t;
Original = readFrame(vidobj);
I1 = rgb2gray(Original);
[C1, ~] = imfindcircles(I1(1:300, 100:300),[25 35], 'ObjectPolarity','dark', 'Sensitivity',0.9);
[C2, ~] = imfindcircles(I1(1:300, 800:1100),[25 35], 'ObjectPolarity','dark', 'Sensitivity',0.9);


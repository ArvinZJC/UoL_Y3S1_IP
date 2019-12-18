% MATLAB script for Tasks 1 - 3 of Assessment 1

clear;
close all;
clc;

% Task 1

% Step 1: Load the input image
I = imread('Swan logo recognition\IMG_01.jpg');

%{
figure;
imshow(I);
title('Input image');
%}

% Step 2: Convert the input image to a greyscale image
Igrey = rgb2gray(I);

%{
figure;
imshow(Igrey);
title('Greyscale image');
%}

% Step 3: Resize the grayscale image using bilinear interpolation
Igrey_new = imresize(Igrey, 0.5, 'bilinear');

figure;
imshow(Igrey_new);
axis on
title('Task 1.1: Resized image');
% saveas(gcf, 'Resized image.png'); % save the specified image

% Step 4: Generate a histogram for the resized image
figure;
imhist(Igrey_new);
title('Task 1.2: Histogram');
% saveas(gcf, 'Histogram.png'); % save the specified image

% Step 5: Produce the binarized image
Igrey_bw = imbinarize(Igrey_new, 204 / 255);

figure;
imshow(Igrey_bw);
title('Task 1.3: Binary image');
% saveas(gcf, 'Binary image.png'); % save the specified image

%---------------------------------------------------------------
% Task 2

Igrey_sobel = edge(Igrey_new, 'sobel'); % Sobel edge detection
Igrey_canny = edge(Igrey_new, 'canny'); % Canny edge detection

figure;
imshow(Igrey_sobel);
title('Task 2-1: Edge detection using Sobel');
% saveas(gcf, 'Edge detection using Sobel.png'); % save the specified image

figure;
imshow(Igrey_canny);
title('Task 2-2: Edge detection using Canny');
% saveas(gcf, 'Edge detection using Canny.png'); % save the specified image

%---------------------------------------------------------------
% Task 3

% Step 1: Label the connected components
Igrey_label = bwlabel(Igrey_bw);

% Step 2: Get the areas (a statistical moment) of objects
stats = regionprops(uint8(Igrey_label), 'Area');

% Step 3: Segment the swan logo by filtering areas
disp([stats.Area]); % the output is not required but it helped whilst attempting the solution
Igrey_swan = ismember(Igrey_label, find([stats.Area] >= 11956 ...
    & [stats.Area] <= 29096)); % find the swan logo with set stats

figure;
imshow(Igrey_swan);
title('Task 3: Simple swan segmentation');
% saveas(gcf, 'Simple swan segementation.png'); % save the specified image
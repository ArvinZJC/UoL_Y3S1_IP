% MATLAB script for Task 4 of Assessment 1

clear;
close all;
clc;

% Task-4

% Step 1: Load the input RGB image and get the blue channel
I = imread('Swan logo recognition\IMG_11.jpg');
I_B = I(:, :, 3);

figure;
subplot(1, 2, 1);
imshow(rgb2gray(I));
title('Greyscale image using rgb2gray');
subplot(1, 2, 2);
imshow(I_B);
title('Blue channel of the input image');
% saveas(gcf, 'Comparison between rgb2gray and blue channel.png'); % save the specified image

% Step 2: Resize the image using bilinear interpolation
I_new = imresize(I_B, 0.5, 'bilinear');

%{
figure;
imshow(I_new);
axis on
title('Resized image');
%}

% Step 3: Adjust the contrast of the image
greyThreshold = graythresh(I_new);
I_adjust = imadjust(I_new, [greyThreshold 1], []);

figure;
imshow(I_adjust);
title('Contrast adjustment');
% saveas(gcf, 'Contrast adjustment.png'); % save the specified image

% Step 4: Apply the adaptive thresholding
levels = adaptthresh(I_adjust, 0.01, 'Statistic', 'gaussian'); % parameters are selected to have a better result
I_bw = imbinarize(I_adjust, levels);

%{
figure;
imshow(I_bw);
title('Binary image (Step 4)');
%}

% Step 5: Apply morphological operations to remove some unwanted objects
se = strel('diamond', 1); % define a structured element
I_bw = imerode(I_bw, se); % shrink objects and remove pixels on the boundaries
I_bw = imfill(I_bw, 'holes'); % fill holes
I_bw = bwareaopen(I_bw, 200); % remove small objects which can be considered as noise
I_bw = imclearborder(I_bw); % remove objects connected to the image border

figure;
imshow(I_bw);
title('Binary image (Step 5)');
% saveas(gcf, 'Binary image.png'); % save the specified image

% Step 6: Recognise and segment the swan logo
I_label = bwlabel(I_bw); % label the connected components
stats = regionprops(uint8(I_label), 'all'); % get all the moments of the labelled image
I_swan = ismember(I_label, find([stats.Circularity] > 0.11 ...
    & [stats.Circularity] < 0.18 ...
    & (([stats.Eccentricity] > 0.59 & [stats.Eccentricity] < 0.74) ...
        | ([stats.Eccentricity] > 0.80 & [stats.Eccentricity] < 0.96)) ...
    & [stats.Extent] > 0.25 ...
    & [stats.Extent] < 0.33 ...
    & [stats.Solidity] > 0.36 ...
    & [stats.Solidity] < 0.487));

figure;
imshow(I_swan);
title('Swan recognition and segmentation');
% saveas(gcf, 'Swan recognition and segmentation.png'); % save the specified image
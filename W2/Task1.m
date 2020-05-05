% MATLAB script for Task 1 of Week 2's workshop

clear;
close all;
clc;

colour_image = imread('.\Sample_Images\Lincoln.jpg');
gray_image = rgb2gray(colour_image);

disp(gray_image(94, 309));
subplot(1, 2, 1);
imshow(gray_image);

gray_image(416, 677) = 255; % replace a dark pixel with a bright pixel
subplot(1, 2, 2);
imshow(gray_image);
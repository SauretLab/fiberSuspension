close all
clear all
% Define the directory containing the PNG files
imageDir = '/Users/raaghavt/Desktop/UCSB/Summer/FiberClogging/scanningFolder'; % Change this to your directory
imageFiles = dir(fullfile(imageDir, '*.png'));

% Preallocate a list to hold the images
numFiles = length(imageFiles);
if numFiles == 0
    error('No PNG files found in the specified directory.');
end

% Read the first image to get its dimensions
firstImage = imread(fullfile(imageDir, imageFiles(1).name));
firstImageGray = rgb2gray(firstImage); % Convert to grayscale
[height, width] = size(firstImageGray); % Get height and width of grayscale image

% Initialize a matrix to hold the concatenated images
spatiotemporalDiagram = zeros(numFiles * height, width, 'uint8');

% Loop through each image, read it, convert to grayscale, and concatenate
for k = 1:numFiles
    % Read the image
    img = imread(fullfile(imageDir, imageFiles(k).name));
    
    % Convert the image to grayscale
    imgGray = rgb2gray(img);

    % Ensure the image has the same dimensions
    if size(imgGray, 2) ~= width || size(imgGray, 1) ~= height
        error('Image size mismatch at file %s', imageFiles(k).name);
    end
    
    % Concatenate the images vertically
    spatiotemporalDiagram((k-1)*height + 1:k*height, :) = imgGray;
end

% Tilt the diagram by 90 degrees (transpose)
spatiotemporalDiagramTilted = imrotate(spatiotemporalDiagram, 90);

% Display the resulting spatiotemporal diagram
imshow(spatiotemporalDiagramTilted);
title('Tilted Spatiotemporal Diagram');

% Add x-axis labels for each slice with ticks every 100 frames
numSlices = numFiles; % Number of slices corresponds to the number of images
xTickPositions = 1:100:numSlices; % Positions for every 100 frames
xTickLabels = arrayfun(@num2str, xTickPositions/4, 'UniformOutput', false);

% Ensure the x-tick positions do not exceed the width of the image
xTickPositions = xTickPositions(xTickPositions <= size(spatiotemporalDiagramTilted, 2));

% Set x-ticks and labels
xticks(xTickPositions);
xticklabels(xTickLabels);
xlabel('time (s)');

% Adjust axis properties
set(gca, 'YDir', 'normal'); % Set Y-axis to normal for image display
axis on; % Ensure the axis is turned on
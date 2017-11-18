function [ IMG ] = LoadImageComplex( FileName, DirName, Title )
%LOADIMAGE Loads an image.
%   Returns a bi-dimensional array of a tree-component vector of a
%given image. From the original Tuvia code. Input arguments must contain
%the ' limiting characters and not " .
cd(DirName);
IMG = imread(FileName); % read the B8 raw file.

%figure(1)
imagesc(imadjust(IMG, stretchlim(IMG))); colorbar % display the PAN image including colorbar.
title("LandSat8 - " + Title)
colormap(gray);
pansize = size(IMG); % show the size of the PAN image.

nrpix = pansize(1)*pansize(2)/1e6; % calculate the total number of pixels.
fprintf('%s (%s) = %.1f MegaPixels \n', Title, FileName, nrpix);

end


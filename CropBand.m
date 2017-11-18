function [ ] = CropBand( IMG, Title, pos )
%CROPBAND Summary of this function goes here
%   Detailed explanation goes here
fprintf("Cropping %s... ", Title);
AOI_IMG = imcrop(IMG, pos);
imagesc(imadjust(AOI_IMG, stretchlim(AOI_IMG))); colorbar
colormap(gray)
title(Title);
fprintf("Done. \n");
end


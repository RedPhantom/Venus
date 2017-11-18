function [ IMG ] = CropBand( IMG, Title, pos )
%CROPBAND Summary of this function goes here
%   Detailed explanation goes here
fprintf("Cropping %s... ", Title);
IMG = imcrop(IMG, pos);
fprintf("Done. \n");
end


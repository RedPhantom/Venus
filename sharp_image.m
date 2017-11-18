function [ image3 ] = sharp_image( image2 )
%SHARP_IMAGE Summary of this function goes here
%   Detailed explanation goes here
h = fspecial('unsharp', 0.03);
image3 = imfilter(image2, h);

end


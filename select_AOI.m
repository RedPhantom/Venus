function [ pos, AOI ] = select_AOI( image )
%SELECT_AOI Summary of this function goes here
%   Detailed explanation goes here
%msgbox('Select Area of Interest on the image.');
pos = round(getPosition(imrect));
AOI = imcrop(image,pos);
end


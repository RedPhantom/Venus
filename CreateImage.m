% venus_main

%% CLEAR MEMORY%%
close all
clc
clear

%% DEFINE WORKING ENVIRONMENT

datadir = 'E:\taasyeda\LandSat8_images\';
workdir = 'D:\Projects\venus\';

today = date;

n = 7; % the number of small images
file = sprintf('small%.0f.tif', n);

%% Read and prepare images

%read_landsat8_image % GETS Landsat8 Images. RETURNES RED, GRN, BLUE etc. (figures 1-7)
PAN = LoadImageComplex('LC81740382017052LGN00_B8.TIF',datadir,"PAN");cd(workdir);
%open the images for display
GRN = LoadImageComplex('LC81740382017052LGN00_B3.TIF',datadir,"GRN");cd(workdir);
figure(2);
RED = LoadImageComplex('LC81740382017052LGN00_B4.TIF',datadir,"RED");cd(workdir);
figure(3);
BLU = LoadImageComplex('LC81740382017052LGN00_B2.TIF',datadir,"BLU");cd(workdir);
figure(4);
NIR = LoadImageComplex('LC81740382017052LGN00_B5.TIF',datadir,"NIR");cd(workdir);
figure(5);
SWIRS = LoadImageComplex('LC81740382017052LGN00_B6.TIF',datadir,"SWIRS");cd(workdir);
figure(6);
SWIRL = LoadImageComplex('LC81740382017052LGN00_B7.TIF',datadir,"SWIRL");cd(workdir);

RGB = show_truecolor(RED, GRN, BLU);
figure(10);
imagesc(imadjust(RGB, stretchlim(RGB))); colorbar % Show the true-color RGB image.
title("True-Color RGB Image");

histogram_strech
RGB2 = show_truecolor(RED2, GRN2, BLU2);
figure(30);
imagesc(imadjust(RGB2,stretchlim(RGB2))); colorbar % Show the true-color RGB image.
title("Histogram-Stretched True-Color RGB Image");

%% Select Area of Interest
[pos, AOI_RGB2] = select_AOI(RGB2);

cd(workdir);

AOI_PAN = CropBandNew(PAN, "PAN", 2*pos);
AOI_RED = CropBandNew(RED, "RED", pos);
AOI_GRN = CropBandNew(GRN, "GRN", pos);
AOI_BLU = CropBandNew(BLU, "BLU", pos);
AOI_NIR = CropBandNew(NIR, "NIR", pos);
AOI_SWIRS = CropBandNew(SWIRS, "SWIRS", pos);
AOI_SWIRL = CropBandNew(SWIRL, "SWIRL", pos);

imwrite(AOI_PAN, ['PAN',file]);
imwrite(AOI_RED, ['RED',file]);
imwrite(AOI_GRN, ['GRN',file]);
imwrite(AOI_BLU, ['BLU',file]);
imwrite(AOI_NIR, ['NIR',file]);
imwrite(AOI_SWIRS, ['SWIRS',file]);
imwrite(AOI_SWIRL, ['SWIRL',file]);




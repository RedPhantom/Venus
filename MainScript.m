% venus_main

%% CLEAR MEMORY%%
close all
clc
clear

%% DEFINE WORKING ENVIRONMENT

datadir = 'E:\taasyeda\LandSat8_images\';
workdir = 'D:\Projects\venus\';

today = date;

%% Read and prepare images

%read_landsat8_image % GETS Landsat8 Images. RETURNES RED, GRN, BLUE etc. (figures 1-7)
PAN = LoadImageComplex('LC81740382017052LGN00_B8.TIF',datadir,"PAN");
%open the images for display
GRN = LoadImageComplex('LC81740382017052LGN00_B3.TIF',datadir,"GRN");
figure(2);
RED = LoadImageComplex('LC81740382017052LGN00_B4.TIF',datadir,"RED");
figure(3);
BLU = LoadImageComplex('LC81740382017052LGN00_B2.TIF',datadir,"BLU");
figure(4);
NIR = LoadImageComplex('LC81740382017052LGN00_B5.TIF',datadir,"NIR");
figure(5);
SWIRS = LoadImageComplex('LC81740382017052LGN00_B6.TIF',datadir,"SWIRS");
figure(6);
SWIRL = LoadImageComplex('LC81740382017052LGN00_B7.TIF',datadir,"SWIRL");

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

CropBand(PAN, "PAN", 2*pos);
CropBand(RED, "RED", pos);
CropBand(GRN, "GRN", pos);
CropBand(BLU, "BLU", pos);
CropBand(NIR, "NIR", pos);
CropBand(SWIRS, "SWIRS", pos);
CropBand(SWIRL, "SWIRL", pos);

imagesc(imadjust(AOI_RGB2, stretchlim(AOI_RGB2)));colorbar
title("AOI: Enhanced RGB");

%% Sharpen selected AOI

AOI_RGB3 = sharp_image(AOI_RGB2);
figure(60);
imagesc(imadjust(AOI_RGB3, stretchlim(AOI_RGB3)));colorbar
title("AOI: Enhanced & Sharpened RGN");

%% FalseColor 1

% NRG2 = show_truecolor(NIR2, RED2, GRN2);
% figure(100);
% imagesc(imadjust(NRG2, stretchlim(NRG2)));
% title("NRG False Color");
% 
% %% FlaseColor 2
% 
% SRG2 = show_truecolor(SWIRS2, RED2, GRN2);
% figure(101);
% imagesc(imadjust(SRG2, stretchlim(SRG2)));
% title("SRG False Color");
% 
% %% FalseColor 3
% 
% BSS2 = show_truecolor(SWIRS2, SWIRS2, SWIRL2);
% figure(102);
% imagesc(imadjust(BSS2, stretchlim(BSS2)));
% title("BSS2");
% title("NRG False Color");

%% Vegetation
NGS = show_truecolor(NIR2, GRN2, SWIRS2);
figure(103);
imagesc(imadjust(NGS, stretchlim(NGS)));
title("NGS False Color");


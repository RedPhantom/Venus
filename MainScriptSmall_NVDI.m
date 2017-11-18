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
cd(workdir);
%read_landsat8_image % GETS Landsat8 Images. RETURNES RED, GRN, BLUE etc. (figures 1-7)
PAN = LoadImageComplex(['PAN', file],datadir,"PAN");
%open the images for display
GRN = LoadImageComplex(['GRN', file],datadir,"GRN");
figure(2);
RED = LoadImageComplex(['RED', file],datadir,"RED");
figure(3);
BLU = LoadImageComplex(['BLU', file],datadir,"BLU");
figure(4);
NIR = LoadImageComplex(['NIR', file],datadir,"NIR");
figure(5);
SWIRS = LoadImageComplex(['SWIRS', file],datadir,"SWIRS");
figure(6);
SWIRL = LoadImageComplex(['SWIRL', file],datadir,"SWIRL");

RGB = show_truecolor(RED, GRN, BLU);
figure(10);
imagesc(imadjust(RGB, stretchlim(RGB))); colorbar % Show the true-color RGB image.
title("True-Color RGB Image");

histogram_strech
RGB2 = show_truecolor(RED2, GRN2, BLU2);
figure(30);
imagesc(imadjust(RGB2,stretchlim(RGB2))); colorbar % Show the true-color RGB image.
title("Histogram-Stretched True-Color RGB Image");

%% FalseColor 1

NRG2 = show_truecolor(NIR, RED, GRN);
figure(100);
imagesc(imadjust(NRG2, stretchlim(NRG2)));
title("NRG False Color");

%% FlaseColor 2

SRG2 = show_truecolor(SWIRS, RED, GRN);
figure(101);
imagesc(imadjust(SRG2, stretchlim(SRG2)));
title("SRG False Color");

%% FalseColor 3

BSS2 = show_truecolor(BLU, SWIRS, SWIRL);
figure(102);
imagesc(imadjust(BSS2, stretchlim(BSS2)));
title("BSS2");
title("BSS False Color");

%% NDVI

dRED = double(RED);
dNIR = double(NIR);
x=1:size(RED,2);
NVDI = (dNIR-dRED)./(dNIR+dRED);
figure(201)
imagesc(NVDI);colorbar
title("NDVI");
colormap(winter);
%load('NDVI_colormap.mat');
%colormap(figure(201), NVDImap);




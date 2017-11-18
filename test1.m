% venus_main

%% CLEAR MEMORY%%
close all
clc
clear

%% DEFINE WORKING ENVIRONMENT

datadir = 'E:\taasyeda\LandSat8_images\';
workdir = 'D:\Projects\venus\';

today = date;

LoadImageComplex('LC81740382017052LGN00_B8.TIF', datadir, "PAN");
LoadImageComplex('LC81740382017052LGN00_B2.TIF', datadir);
LoadImageComplex('LC81740382017052LGN00_B3.TIF', datadir);
LoadImageComplex('LC81740382017052LGN00_B4.TIF', datadir);
LoadImageComplex('LC81740382017052LGN00_B5.TIF', datadir);
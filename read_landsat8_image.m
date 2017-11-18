%read_landsat8_image

% opens window for each color channel.
%% Read Landsat8 Images

cd(datadir); % set datadir as current directory

%%% Read the PAN image

PAN = imread('LC81740382017052LGN00_B8.TIF'); % read the B8 raw file.

figure(1)
imagesc(imadjust(PAN, stretchlim(PAN))); colorbar % display the PAN image including colorbar.
title("LandSat8 RAW PAN Image")
colormap(gray);
pansize = size(PAN); % show the size of the PAN image.

nrpix_pan = pansize(1)*pansize(2)/1e6; % calculate the total number of pixels.
fprintf('nrpix_pan = %.1f MegaPixels \n', nrpix_pan);

%%% Read the Green channel image

GRN = imread('LC81740382017052LGN00_B3.TIF'); % read the B3 raw file.
figure(2)
imagesc(imadjust(GRN, stretchlim(GRN))); colorbar % display the GRN image including colorbar.
title("LandSat8 RAW Green Channel Image");
grnsize = size(GRN);
colormap(gray);
nrpix_grn = grnsize(1)*grnsize(2)/1e6; % calculate the total number of pixels.
fprintf('nrpix_grn = %.1f MegaPixels \n', nrpix_grn);

%% Check the PAN/GRN Size Ratio

pan2grn_ratio = pansize(2)/grnsize(2);
pan2grn_nrpix = pan2grn_ratio^2;
fprintf('pan2grn_ratio = %.1f, pab2grn_nrpix = %.1f \n', pan2grn_ratio, pan2grn_nrpix);

%% Read Landsat8 Images

%%% RED
RED = imread('LC81740382017052LGN00_B4.TIF'); % read the B4 raw file.
figure(3)
imagesc(imadjust(RED, stretchlim(RED))); colorbar % display the GRN image including colorbar.
title("LandSat8 RAW Red Channel Image");
redsize = size(RED);
colormap(gray);
nrpix_red = redsize(1)*redsize(2)/1e6; % calculate the total number of pixels.
fprintf('nrpix_red = %.1f MegaPixels \n', nrpix_red);

%%% BLU
BLU = imread('LC81740382017052LGN00_B2.TIF'); % read the B2 raw file.
figure(4)
imagesc(imadjust(BLU, stretchlim(BLU))); colorbar % display the image including colorbar.
title("LandSat8 RAW Blue Channel Image");
blusize = size(BLU);
colormap(gray);
nrpix_blu = blusize(1)*blusize(2)/1e6; % calculate the total number of pixels.
fprintf('nrpix_blu = %.1f MegaPixels \n', nrpix_blu);

%%% NIR
NIR = imread('LC81740382017052LGN00_B5.TIF'); % read the B5 raw file.
figure(5)
imagesc(imadjust(NIR, stretchlim(NIR))); colorbar % display the image including colorbar.
title("LandSat8 RAW Blue Channel Image");
nirsize = size(NIR);
colormap(gray);
nrpix_nir = nirsize(1)*nirsize(2)/1e6; % calculate the total number of pixels.
fprintf('nrpix_nir = %.1f MegaPixels \n', nrpix_nir);

%%% SWIRS
SWIRS = imread('LC81740382017052LGN00_B6.TIF'); % read the B6 raw file.
figure(6)
imagesc(imadjust(SWIRS, stretchlim(SWIRS))); colorbar % display the image including colorbar.
title("LandSat8 RAW SWIRS Channel Image");
swirssize = size(SWIRS);
colormap(gray);
nrpix_swirs = swirssize(1)*swirssize(2)/1e6; % calculate the total number of pixels.
fprintf('nrpix_swirs = %.1f MegaPixels \n', nrpix_swirs);

%%% SWIRL
SWIRL = imread('LC81740382017052LGN00_B7.TIF'); % read the B7 raw file.
figure(7)
imagesc(imadjust(SWIRL, stretchlim(SWIRL))); colorbar % display the image including colorbar.
title("LandSat8 RAW SWIRL Channel Image");
swirlsize = size(SWIRL);
colormap(gray);
nrpix_swirl = swirlsize(1)*swirlsize(2)/1e6; % calculate the total number of pixels.
fprintf('nrpix_swirl = %.1f MegaPixels \n', nrpix_swirl);

%% END OF SCRIPT

cd(workdir);
clc; clear; close all;
 
% Object
Img = imread('mariobros3.jpeg');
figure, imshow(Img);

Gray = rgb2gray(Img);
figure, imshow(Gray);

bw = im2bw(Gray,.90);
figure, imshow(bw);

bw = imcomplement(bw);
figure, imshow(bw);

bw = imfill(bw,'holes');
bw = bwareaopen(bw,100);
str = strel('disk',5);
bw = imerode(bw,str);
figure, imshow(bw);

% Background
Img2 = imread('bgshop3.jpg');
figure, imshow(Img2);

R = Img(:,:,1);
G = Img(:,:,2);
B = Img(:,:,3);
 
R2 = Img2(:,:,1);
G2 = Img2(:,:,2);
B2 = Img2(:,:,3);
 
R2(bw) = R(bw);
G2(bw) = G(bw);
B2(bw) = B(bw);
 
RGB = cat(3,R2,G2,B2);
figure, imshow(RGB);

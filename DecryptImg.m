close all; clear; clc;
load('C3.mat');
encrypted_img = imread('C0.png');
%% 解密
decrypted_img = DecryptColorImg(encrypted_img,xR_0, xG_0, xB_0, xR_1, xG_1, xB_1, xP_0, xP_1);
imwrite(decrypted_img, 'D3.png')
figure; % 创建一个新的图形窗口
imshow(decrypted_img); % 显示解密后的图片
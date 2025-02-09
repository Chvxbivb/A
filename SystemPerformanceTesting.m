close all; clear; clc;
ImgName = '4.2.03'; % 设置文件名
%% 读取明文图像
possibleExtensions = {'.jpg', '.tiff'};% 定义可能的扩展名列表
for i = 1:length(possibleExtensions)% 遍历扩展名列表，尝试读取文件
    fullFileName = fullfile('img', [ImgName, possibleExtensions{i}]);
    if exist(fullFileName, 'file')
        img = imread(fullFileName);
        disp(['读取文件: ', fullFileName]);
        break; % 找到文件并读取后退出循环
    end
end
if ~exist('img', 'var')
    error('找不到文件 %s 的任何有效扩展名', ImgName);
end
%% 秘钥预处理
load('InitialKey.mat');
[xR_0, xG_0, xB_0, xR_1, xG_1, xB_1, xP_0, xP_1] = InitialConditions(fullFileName,xR_0, xG_0, xB_0, xR_1, xG_1, xB_1, xP_0, xP_1);
%save('ProcessedKey.mat', 'xR_0', 'xG_0', 'xB_0', 'xR_1', 'xG_1', 'xB_1', 'xP_0', 'xP_1');
tic;
encrypted_img = EncryptColorImg(img,xR_0, xG_0, xB_0, xR_1, xG_1, xB_1, xP_0, xP_1);
%imwrite(encrypted_img, 'encrypted_img.PNG');
toc;
decrypted_img = DecryptColorImg(encrypted_img,xR_0, xG_0, xB_0, xR_1, xG_1, xB_1, xP_0, xP_1);
%imwrite(decrypted_img, 'D1.png')
figure; % 创建一个新的图形窗口
imshow(decrypted_img); % 显示解密后的图片
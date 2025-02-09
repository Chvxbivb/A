lose all;clear;clc;
%% 读取
folderPath = 'img';  % 设定文件夹路径
imageFiles = dir(fullfile(folderPath, '*.tiff')); % 获取文件夹中所有图像文件的路径
% 遍历所有图像文件进行批量处理
load('InitialKey.mat');
for k = 1:length(imageFiles)
    % 构建每个图像的完整文件路径
    
    filePath = fullfile(folderPath, imageFiles(k).name);
    img = imread(filePath);
    % 使用 fileparts 获取文件名和扩展名
    [path, originalFileName, ~] = fileparts(filePath);
    % 创建基于文件名的新目录名
    newFolderName = fullfile(originalFileName);
    if ~exist(newFolderName, 'dir')
      mkdir(newFolderName);
    end
    %% 秘钥
    [xR_0, xG_0, xB_0, xR_1, xG_1, xB_1, xP_0, xP_1] = InitialConditions(filePath,xR_0, xG_0, xB_0, xR_1, xG_1, xB_1, xP_0, xP_1);
    keyfileName = fullfile(newFolderName, 'ProcessedKey.mat');
    save(keyfileName, 'xR_0', 'xG_0', 'xB_0', 'xR_1', 'xG_1', 'xB_1', 'xP_0', 'xP_1');
    %% 密文图像
    tic;
    EncryptedImg = EncryptColorImg(img,xR_0, xG_0, xB_0, xR_1, xG_1, xB_1, xP_0, xP_1);
    toc;
% 创建加密图像的文件名（tiff 格式）
    newFileName = fullfile(newFolderName, 'encrypted_img.tiff');
    imwrite(EncryptedImg, newFileName);
    % 输出文件保存的路径
    disp(['Image saved as: ' newFileName]);
end

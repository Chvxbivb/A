function PSNR = CalculatePSNR(img1, img2)
    MSE = CalculateMSE(img1, img2);  % 调用前面定义的 CalculateMSE 函数
    MAX = 255;  % 假设图像为 8 位灰度图像
    PSNR = 10 * log10((MAX^2) / MSE);
end
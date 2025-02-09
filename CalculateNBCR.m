function NBCR = CalculateNBCR(C0, C1)
    % 对两个 uint8 类型的图像进行逐像素的异或操作，找出差异
    C = bitxor(C0, C1); 
    
% 提取每个通道
R = C(:,:,1);  % 红色通道
G = C(:,:,2);  % 绿色通道
B = C(:,:,3);  % 蓝色通道

% 对每个通道应用 bitget（逐元素）
R_bits = arrayfun(@(x) bitget(x, 1:8), R, 'UniformOutput', false);
G_bits = arrayfun(@(x) bitget(x, 1:8), G, 'UniformOutput', false);
B_bits = arrayfun(@(x) bitget(x, 1:8), B, 'UniformOutput', false);

R_b = sum(sum(cellfun(@sum, R_bits)));
G_b = sum(sum(cellfun(@sum, G_bits)));
C_b = sum(sum(cellfun(@sum, B_bits)));
    
    % 计算总的比特数
    L_s = numel(C0) * 8;  % numel(C0) 是图像的像素数量，乘以 8 得到总的比特数
    
    % 计算 NBCR（以百分比表示）
    NBCR = ((R_b + G_b + C_b) / L_s) * 100;
end
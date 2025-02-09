function [xR_0, xG_0, xB_0, xR_1, xG_1, xB_1, xP_0, xP_1] = KeyNoise(xR_0, xG_0, xB_0, xR_1, xG_1, xB_1, xP_0, xP_1)
% 将所有密钥存入一个数组
keys = [xR_0, xG_0, xB_0, xR_1, xG_1, xB_1, xP_0, xP_1];

% 随机选择一个位置（1到8）
keyIndex = randi([1, 8]);

% 在选定的位置对密钥进行改动
% 比如，这里我们随机翻转该 uint32 值中的某一位
bitToFlip = randi([0, 31]); % 随机选择要翻转的位，范围是 0 到 31
keys(keyIndex) = bitxor(keys(keyIndex), bitshift(uint32(1), bitToFlip));

% 将修改后的密钥重新分配回各个变量
[xR_0, xG_0, xB_0, xR_1, xG_1, xB_1, xP_0, xP_1] = deal(keys(1), keys(2), keys(3), keys(4), keys(5), keys(6), keys(7), keys(8));
end

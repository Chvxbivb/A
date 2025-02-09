function [xR_0, xG_0, xB_0, xR_1, xG_1, xB_1, xP_0, xP_1] = InitialConditions(original_img,xR_0, xG_0, xB_0, xR_1, xG_1, xB_1, xP_0, xP_1)
    % 读取图像文件
    fileID = fopen(original_img, 'rb');
    if fileID == -1
        error('Image file not found or unable to open.');
    end
    imageData = fread(fileID, '*uint8');
    fclose(fileID);

    % 计算图像的 SHA-256 哈希值
    md = java.security.MessageDigest.getInstance('SHA-256');
    md.update(imageData);
    hash = typecast(md.digest(), 'uint8');

    % 将 SHA-256 哈希值分为四个部分并转换为 uint64 进行异或操作
    h1 = typecast(hash(1:4), 'uint32');
    h2 = typecast(hash(5:8), 'uint32');
    h3 = typecast(hash(9:12), 'uint32');
    h4 = typecast(hash(13:16), 'uint32');
    h5 = typecast(hash(17:20), 'uint32');
    h6 = typecast(hash(21:24), 'uint32');
    h7 = typecast(hash(25:28), 'uint32');
    h8 = typecast(hash(29:32), 'uint32');

   

    xR_0 = bitxor(xR_0, h1);
    xG_0 = bitxor(xG_0, h2);
    xB_0 = bitxor(xB_0, h3);
    xR_1 = bitxor(xR_1, h4);
    xG_1 = bitxor(xG_1, h5);
    xB_1 = bitxor(xB_1, h6); 
    xP_0 = bitxor(xP_0, h7);
    xP_1 = bitxor(xP_1, h8);

end

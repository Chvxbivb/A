function [xR_0, xG_0, xB_0, xR_1, xG_1, xB_1, xP_0, xP_1] = KeyDiffusion(xR_0, xG_0, xB_0, xR_1, xG_1, xB_1, xP_0, xP_1)%秘钥扩散
xR_0 = bitxor(xR_0,xP_1);
xG_0 = bitxor(xG_0,xR_0);
xB_0 = bitxor(xB_0,xG_0);
xR_1 = bitxor(xR_1,xB_0);
xG_1 = bitxor(xG_1,xR_1);
xB_1 = bitxor(xB_1,xG_1);
xP_0 = bitxor(xP_0,xB_1);
xP_1 = bitxor(xP_1,xP_0);
end
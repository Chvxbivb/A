function [MSE, PSNR] = CalculateMSEandPSNR(img1, img2)
  [M, N, C] = size(img1);
  Diff = 0;
  for i = 1 : M
      for j = 1 : N
          for k = 1 : C
              Diff = Diff + (img1(i, j, k) - img2(i, j, k))^2;
          end
      end
  end
  MSE = Diff / (M * N * C);
  MAX = 255; %最大像素值
  PSNR = 10 * log10((MAX^2) / MSE);
end
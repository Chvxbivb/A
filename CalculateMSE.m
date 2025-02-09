function MSE = CalculateMSE(img1, img2)
  [M, N, C] = size(img1);
  Diff = 0;
  for i = 1 : M
      for j = 1 : N
          for k = 1 : C
              Diff = Diff + (double(img1(i, j, k)) - double(img2(i, j, k)))^2;
          end
      end
  end
  MSE = Diff/(M * N * C);
end

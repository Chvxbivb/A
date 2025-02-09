function [RowIndex, ColIndex, x] = shuffle(M, N, x0)
    [RowIndex, x] = generateIndices(x0, M/2);
    ColIndex = generateIndices(x, N/2);
end

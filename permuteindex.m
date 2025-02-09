function [rindex, cindex] = permuteindex(index, Perm, N)
            rindex = ceil(Perm(index)/N);
            cindex = mod(Perm(index)-1,N)+1;
end
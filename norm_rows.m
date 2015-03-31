function A = norm_rows(A)
    A = bsxfun(@times, A, 1 ./ (sqrt(sum(A.^2, 2))) );
end

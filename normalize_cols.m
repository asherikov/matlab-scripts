function A = normalize_cols(A)
    A = bsxfun(@times, A, 1 ./ (sqrt(sum(A.^2, 1))) );
end

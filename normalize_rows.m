function A = normalize_rows(A)
    A = bsxfun(@times, A, 1 ./ (sqrt(sum(A.^2, 2))) );
end

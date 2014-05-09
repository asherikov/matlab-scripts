function [out] = makediag_n(M, n)
    if ((n < 1) || isempty(M))
        out = [];
    else
        S = size(M);
        out = zeros(S*n);

        for i = 1:n;
            out(S(1)*(i-1)+1:S(1)*i,   S(2)*(i-1)+1:S(2)*i) = M;
        end
    end
end


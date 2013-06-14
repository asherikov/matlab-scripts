function [out] = makediag_n(M, n)
    if n < 1
        out = [];
    else
        [r, c] = size(M);
        out = M;

        for i=2:n;
            [ro, co] = size(out);

            out = [out, zeros(ro,c);
                   zeros(r,co), M];
        end
    end
end


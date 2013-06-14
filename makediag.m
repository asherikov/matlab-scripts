%%
% A replacement for blkdiag(), which is quite slow for some reason.
%
function [M] = makediag(varargin)
    M = [];
    for i=1:nargin;
        [r1, c1] = size(M);
        [r2, c2] = size(varargin{i});

        M = [M, zeros(r1,c2);
            zeros(r2,c1), varargin{i}];
    end
end


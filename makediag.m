%%
% A replacement for blkdiag(), which is quite slow for some reason.
%
function [M] = makediag(varargin)
    S = cellfun (@size, varargin, 'UniformOutput', false);
    S = [   0, 0; ...
            cumsum( cat(1, S{:}), 1 )   ];

    M = zeros(S(end,:));
    for i=1:nargin;
        indx = S(i, 1) + 1 : S(i+1, 1);
        indy = S(i, 2) + 1 : S(i+1, 2);

        M(indx, indy) = varargin{i};
    end
end


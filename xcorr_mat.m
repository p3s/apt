function [r, lags] = xcorr_mat(x, y)

sizeOfx = size(x);
sizeOfy = size(y);
r = zeros(sizeOfx(1), max([sizeOfx(2) sizeOfy(2)])*2-1);
lags = r;

for N = 1 : sizeOfx(1)
    [r(N,:), lags(N,:)] = xcorr(x(N,:),y);
end
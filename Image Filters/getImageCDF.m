%subfunction: compute the CDF for an image that started as uint8
 function cdf = getImageCDF(img)
 bins = 0:255;
 H = hist(img(:), bins);
 %Hmod = H + eps(sum(H));
 cdf = [0, cumsum(H)/sum(H)];
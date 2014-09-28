function S = histMatch (t, target)
 if size(target,2)>1
   %an image, replace the image with its cdf
   target = getImageCDF(target);
 end

%get the CDF for the input image
 tcdf = getImageCDF(t);

%compute the look-up curve
 LU = interp1(target,-1:255,tcdf);

%do the look-up for the pixels in T
 S = interp1(-1:255, LU, double(t(:)));
 S = uint8(reshape(S, size(t)));
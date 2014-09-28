clear all
clc
im1= imread('img.jpg'); 
im2= imread('img-hidden.jpg'); 
figure(1), imshow(im1); title('Original Image'); 
figure(2), imshow(im2); title('Image to be Hidden'); 
im1=double(im1);
im2=double(im2);
Hiddenimage=uint8(bitshift(im2,-4)); 
showhiddenimage=bitshift(Hiddenimage,4); 
figure(3),imshow(showhiddenimage);title('Image to be hidden (After Bitshifting)'); 
x = im1; 
for i=1:4
x=bitset(x,i,0); 
end 
y=uint8(x);
finalimg = imadd(y,Hiddenimage); 
figure(4),imshow(finalimg);title('Output image');
finimg=double(finalimg);
showfinimg=bitshift(finimg,4);
figure(5),imshow(showfinimg);title('After Retrieval');
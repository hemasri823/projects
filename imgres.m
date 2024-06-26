clc;
close all;
clear;
fusiontype='MinMin';
wavetype='coif5';


[filename1,pathname1]=uigetfile('*.*','select the 1st image');
filewithpath1=strcat(pathname1,filename1);
img1=imread(filewithpath1);

%Load image2
[filename2,pathname2]=uigetfile('*.*','select the 2nd image');
filewithpath2=strcat(pathname2,filename2);
img2=imread(filewithpath2);

[row, col]=size(img1(:,:,1)); 
    if ~ isequal(size(img1),size(img2))
        img2=imresize(img2,[row,col]);
    end

fusedimageR=imgfusion(img1(:,:,1),img2(:,:,1),fusiontype,wavetype);    
fusedimageG=imgfusion(img1(:,:,2),img2(:,:,2),fusiontype,wavetype); 
fusedimageB=imgfusion(img1(:,:,3),img2(:,:,3),fusiontype,wavetype); 
fusedimage=uint8(cat(3,fusedimageR,fusedimageG,fusedimageB));

imwrite(imresize(fusedimage,[row,col]),'fusedimage.jpg','Quality',100);

subplot(131)
imshow(img1)
title('Image1')

subplot(132)
imshow(img2)
title('Image2')

subplot(133)
imshow(fusedimage)
title('fused image')


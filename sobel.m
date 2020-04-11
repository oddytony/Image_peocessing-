clear all
clc
L = imread('lena.png');
Ldbl = double(L);

figure()
imshow(L)

%% EDGE DETECTION USING(Sobel Operator) %%

% mask application

Xmask= [-1 -2 -1 ;
         0  0  0 ;
         1  2  1];
Ymask= [-1  0  1 ;
        -2  0  2 ;
        -1  0  1];
z1mask=[ 0  1  2 ;
        -1  0  1 ;
        -2 -1  0];
z2mask=[-2 -1  0 ;
        -1  0  1 ;
         0  1  2 ];

%%Applying mask along x

[r,c] = size(L);
OUT = zeros(r-3,c-3);
for idx= 1:(r-3)
    for jdx = 1:(c-3)
        Lsquare = Ldbl(idx:(idx+2),jdx:(jdx+2));
        res= Xmask.*Lsquare;
        OUT(idx,jdx)=sum(sum(res));
    end
end
Gx = OUT;

figure() 
imshow(Gx)

%applying mask along y

for idx= 1:(r-3)
    for jdx = 1:(c-3)
        Lsquare = Ldbl(idx:(idx+2),jdx:(jdx+2));
        res= Ymask.*Lsquare;
        OUT(idx,jdx)=sum(sum(res));
    end
end
Gy = OUT;

figure() 
imshow(Gy)

%applying mask along z1

for idx= 1:(r-3)
    for jdx = 1:(c-3)
        Lsquare = Ldbl(idx:(idx+2),jdx:(jdx+2));
        res= z1mask.*Lsquare;
        OUT(idx,jdx)=sum(sum(res));
    end
end
Gz1 = OUT;

figure() 
imshow(Gz1)

%applying mask along z2

for idx= 1:(r-3)
    for jdx = 1:(c-3)
        Lsquare = Ldbl(idx:(idx+2),jdx:(jdx+2));
        res= z2mask.*Lsquare;
        OUT(idx,jdx)=sum(sum(res));
    end
end
Gz2 = OUT;

figure() 
imshow(Gz2)

%%normalizing results
mag=sqrt(Gx.^2 + Gy.^2);   % magnitude of image 

figure()
imshow(mag)

ort= atan(Gx/Gy);

figure()
imshow(ort)



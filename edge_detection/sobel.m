clear all
clc
L = imread('lena.png');
Ldbl = double(L);

figure()
imshow(L)

%% EDGE DETECTION USING(Sobel Operator) %%

% mask application

Ymask=  [-1 -2 -1 ;
         0  0  0 ;
         1  2  1];
     
tymask= [-1 -2 -3 -2 -1 ;
         0  0  0  0  0 ;
        -1 -2 -3 -2 -1 ];
    
Xmask= [-1  0  1 ;
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
        res= Ymask.*Lsquare;
        OUT(idx,jdx)=sum(sum(res));
    end
end
Gy = OUT;

figure() 
imshow((Gy),[])
title('edges along Y axis');

%applying mask along x

for idx= 1:(r-3)
    for jdx = 1:(c-3)
        Lsquare = Ldbl(idx:(idx+2),jdx:(jdx+2));
        res= Xmask.*Lsquare;
        OUT(idx,jdx)=sum(sum(res));
    end
end
Gx = OUT;

figure() 
imshow((Gx),[])
title('edges along x axis');


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
imshow((Gz1),[])
title('edges along z axis');


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
imshow((Gz2),[])
title('edges along z axis');


%%normalizing results
mag=sqrt(Gx.^2 + Gy.^2);   % magnitude of image 

figure()
imshow((mag),[]); % displays the grayscale image  based  the range of pixel values 
title('image magnitude');

ort= atan(Gy./Gx);

figure()
imshow((ort),[]);


meg=sqrt(Gz2.^2 + Gz1.^2);   % magnitude of image 
figure()
imshow((mag),[]); % displays the grayscale image  based  the range of pixel values 
title('image magnitude');


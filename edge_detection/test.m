 L = imread('lena.png');
    [Gmag, Gdir] = imgradient(L,'sobel');
    BW = edge(L);
    BW2 = edge(L,'sobel','vertical');
    BW23 = edge(L,'sobel','horizontal');
     BW4 = edge(L,'sobel');
    
    figure()
    imshow(BW2)
    title('filter along Y axis')
    
    figure
    imshow(BW23)
    title('filter along X axis')

    
    figure
    imshow(BW4)
    title('Image magnitud')

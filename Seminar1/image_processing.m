function image_processing(image,blur_factor)
    %Domen Kuhar
    %prvi del:
    slika = imread(image);
    kernel= ones(3,3)/9;
    blurred=imfilter(slika,kernel);
    minus=slika-blurred;
    highboost=slika+minus*blur_factor;
    %prezentacija:
    figure('Name','Highboost filtering','NumberTitle','off');
    subplot(2,2,1);
    imshow(slika);
    title('Starting image');
    subplot(2,2,2);
    imshow(blurred);
    title('Blurred image');
    subplot(2,2,3);
    imshow(minus);
    title('Subtracted image');
    subplot(2,2,4);
    imshow(highboost);
    title('Highboosted image');
    
    %drugi del:
    Lmaska1=[0 1 0; 1 -4 1; 0 1 0];
    Lmaska2=[1 1 1; 1 -8 1; 1 1 1];
    
    secondderivative1=conv2(im2double(slika), Lmaska1, 'same');
    secondderivative2=conv2(im2double(slika), Lmaska2, 'same');
    
    Lsharp1=im2double(slika)-secondderivative1;
    Lsharp2=im2double(slika)-secondderivative2;
    
    figure('Name','Second-order derivative sharpening','NumberTitle','off');
    
    %prezentacija
    subplot(3,1,1);
    imshow(slika);
    title('Starting image');
    subplot(3,1,2);
    imshow(Lsharp1);
    title('Sharpened using first matrix');
    subplot(3,1,3);
    imshow(Lsharp2);
    title('Sharpened using second matrix');
    
end
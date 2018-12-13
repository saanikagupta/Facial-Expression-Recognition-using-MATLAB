function p = predict(image)
    if(size(image,3)==3)
        p = rgb2gray(image);
    end
    %p=imresize(p,[48,48]);
    p=imresize(p,[227,227]);
    p=cat(3,p,p,p);
end


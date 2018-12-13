load('model_data')
camera = webcam;
while true
    I=camera.snapshot();
    Im = preprocess(I);
    Im=predict(Im);
    str=classify(myNet,Im);
    imshow(I);
    label = char(str(1));
    disp(label);
    %title(label);
end
clear camera

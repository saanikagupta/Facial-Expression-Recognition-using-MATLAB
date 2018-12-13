function q = preprocess(img)

FaceDetect = vision.CascadeObjectDetector; 
FaceDetect.MergeThreshold = 7 ;
BB = step(FaceDetect, img);
q=img;
%for i = 1 : size(BB,1)     
 % rectangle('Position', BB(i,:), 'LineWidth', 3, 'LineStyle', '-', 'EdgeColor', 'r'); 
%end 
for i = 1 : size(BB, 1) 
  q = imcrop(img, BB(i, :));
end

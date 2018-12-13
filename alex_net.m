%% Load a pre-trained, deep, convolutional network
alex=alexnet;
layers = alex.Layers
%% Modify the network to use five categries
layers(23)=fullyConnectedLayer(7);
layers(25)=classificationLayer;
%% Set up our training data
allImages = imageDatastore('emotions', 'IncludeSubfolders', true, 'LabelSource', 'foldernames');
[trainingImages, testImages] = splitEachLabel(allImages, 0.8, 'randomize');
%% Re-train the Network
opts = trainingOptions('sgdm', 'InitialLearnRate', 0.001, 'MaxEpochs', 20, 'MiniBatchSize', 64);
myNet = trainNetwork(trainingImages, layers, opts);
%% Measure network accuracy
predictedLabels = classify(myNet, testImages); 
accuracy = mean(predictedLabels == testImages.Labels)

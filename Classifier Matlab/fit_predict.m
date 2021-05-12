function [test_accuracy_fit] = fit_predict(data_test , label_test , FITMDL)

w = FITMDL.Beta;
b = FITMDL.Bias;

%% change label 0 to -1 for easier predictions
label_test(label_test==0) = -1; 

%% dimension of the testing samples
[r, c] = size(data_test);

%% accuracy 
predictions = label_test'.*(data_test * w + b);
crtPredict = sum(sum(predictions > 0));
test_accuracy_fit = crtPredict / r;

end

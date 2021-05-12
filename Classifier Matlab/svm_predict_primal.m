function test_accuracy = svm_predict_primal(data_test , label_test , svm_model)

w = svm_model.w;
b = svm_model.b;

%% change label 0 to -1 for easier predictions
label_test(label_test==0) = -1; 

%% dimension of the testing samples
[r, c] = size(data_test);

%% accuracy 
predictions = label_test'.*(data_test * w + b);
crtPredict = sum(sum(predictions > 0));
test_accuracy = crtPredict / r;

end
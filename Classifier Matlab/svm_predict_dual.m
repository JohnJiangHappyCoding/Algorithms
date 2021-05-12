function test_accuracy_d = svm_predict_dual(data_test , label_test, svm_model_d)

w_d = svm_model_d.w;
b_d = svm_model_d.b;

%% change label 0 to -1 
label_test(label_test==0) = -1; 

%% dimension of the testing samples
[r, c] = size(data_test);

%% accuracy 
predictions = label_test'.*(data_test * w_d' +b_d);
crtPredict = sum(sum(predictions > 0 ));
test_accuracy_d = crtPredict / r;

end

